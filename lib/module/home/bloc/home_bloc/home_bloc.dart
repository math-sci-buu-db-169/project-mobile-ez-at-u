import 'package:dio/dio.dart';
import 'package:ez_at_u/module/activity/model/response/activity_list_teacher_screen.dart';
import 'package:ez_at_u/module/activity/model/response/screen_status_activity_response.dart';
import 'package:ez_at_u/module/home/model/response/home_response/alert_no_activity_response.dart';
import 'package:ez_at_u/module/home/model/response/home_response/get_user_role_response.dart';
import 'package:ez_at_u/module/home/model/response/home_response/no_activity_teacher_response.dart';
import 'package:ez_at_u/module/home/model/response/home_response/submit_delete_account_response.dart';
import 'package:ez_at_u/module/home/model/response/home_response/submit_logout_response.dart';
import 'package:ez_at_u/module/profile/model/response/api_profile_response.dart';
import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:ez_at_u/utils/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_at_u/module/home/model/response/home_response/alert_logout_response.dart';
import 'package:ez_at_u/module/home/model/response/home_response/change_language_response.dart';
import 'package:ez_at_u/module/home/model/response/home_response/screen_home_response.dart';
import 'package:ez_at_u/module/home/repository/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../main_route/main_route_model/check_token_expired_response.dart';
import '../../../../main_route/main_route_model/refresh_token_response.dart';
import '../../../login/model/response/log_sessions/log_sessions_response.dart';
import '../../model/response/home_response/setting_screen_response.dart';

part 'home_event.dart';
part 'home_state.dart';

late SharedPreferences prefs;
late String? isMainRouteRefresh;
late String? isMainRouteKey;

class HomeBloc extends Bloc<HomeEvent, HomeState> with HomeRepository {
  HomeBloc() : super(HomeInitial()) {
    getRefHomeEventInitial(event, emit) async {
      prefs = await SharedPreferences.getInstance();
      isMainRouteRefresh = prefs.getString('refreshKey');
      isMainRouteKey = prefs.getString('UserKey');
      Response response =
          await getRefreshToken(refreshToken: isMainRouteRefresh.toString());
      if (response.statusCode == 200) {
        RefreshTokenResponse refreshTokenResponse =
            RefreshTokenResponse.fromJson(response.data);
        if (refreshTokenResponse.head?.status == 200) {
          await setUserKeyAndRefreshKey(
            globalKey: refreshTokenResponse.body?.token ?? "",
            refreshKey: refreshTokenResponse.body?.refreshtoken ?? "",
            isRole: refreshTokenResponse.body?.role ?? "TC",
            userLanguage: refreshTokenResponse.body?.language ?? "TH",
          );
        } else if (refreshTokenResponse.head?.status == 400) {
          emit(TokenExpiredState(
              message: response.statusMessage ?? "",
              checkrefreshtokenmessage: refreshTokenResponse));
        } else {
          emit(HomeError(errorMessage: refreshTokenResponse.head?.message ?? ""));
        }
      } else {
        emit(HomeError(errorMessage: response.statusMessage ?? ""));
      }
    }

    checkHomeEventInitial(event, emit) async {
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
            CheckTokenExpiredResponse.fromJson(
                responseCheckTokenExpiredResponse.data);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {
            print(
                "CheckHome 1  false============checkHome======CheckTokenExpired========== ${checkTokenExpiredResponse.head?.timeexpire}");
            print(checkTokenExpiredResponse.body?.expiremessage);
            print(checkTokenExpiredResponse.body?.timenow);
            print(checkTokenExpiredResponse.body?.timeexpir);
            // emit(HomeEndLoading());
          } else {
            print(
                "CheckHome  2 == checkTokenExpiredResponse.head?.timeexpire == true");
            await getRefHomeEventInitial(event, emit);
          }
        } else if (checkTokenExpiredResponse.head?.status == 401) {
          print("CheckHome 3 == checkTokenExpiredResponse.head?.status == 401");
          await getRefHomeEventInitial(event, emit);
        } else {
          emit(HomeError(
              errorMessage: checkTokenExpiredResponse.head?.message ?? ""));
        }
      } else if (responseCheckTokenExpiredResponse.statusCode == 401) {
        print("CheckHome 4 == checkTokenExpiredResponse.head?.status == 401");
        await getRefHomeEventInitial(event, emit);
        // print(
        //     "checkTokenExpiredResponse ============checkMainRouteEventInitial=======RefreshTokenResponse 401 ========= responseCheckTokenExpiredResponse.statusCode ");
        //
        // Response responseRefreshTokenResponse = await getRefreshToken(
        //     refreshToken: isMainRouteRefresh.toString());
        // // emit(HomeEndLoading());
        // if (responseRefreshTokenResponse.statusCode == 200) {
        //   RefreshTokenResponse refreshTokenResponse =
        //   RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
        //   if (refreshTokenResponse.head?.status == 200) {
        //     await setUserKeyAndRefreshKey(
        //         globalKey: refreshTokenResponse.body?.token ?? "",
        //         refreshKey: refreshTokenResponse.body?.refreshtoken ?? ""
        //
        //     );
        //   }
        //   else if (refreshTokenResponse.head?.status == 401) {
        //     emit(TokenExpiredState(
        //         message: responseRefreshTokenResponse.statusMessage ?? "",
        //         checkrefreshtokenmessage: refreshTokenResponse));
        //   }
        //   else {
        //     emit(MainRouteError(
        //         message: refreshTokenResponse.head?.message ?? ""));
        //   }
        // } else {
        //   emit(MainRouteError(
        //       message: responseRefreshTokenResponse.statusMessage ?? ""));
        // }
      } else {
        emit(HomeError(
            errorMessage: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }

    on<HomeScreenAlertMessageEvent>((event, emit) async {
      try {
        print("CheckHome 6 == HomeScreenInfoEvent");
        await checkHomeEventInitial(event, emit);
        print("here 1  == getScreenHome");

        emit(HomeScreenAlertMessageSuccessState());
      } on DioError catch (e) {
        emit(HomeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<HomeScreenInfoEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        print("CheckHome 6 == HomeScreenInfoEvent");
        await checkHomeEventInitial(event, emit);
        print("here 1  == getScreenHome");
        Response responseHome = await getScreenHome();

        print("here out 1  == getScreenHome");
        if (responseHome.statusCode == 200) {

          print("here 1  == getScreenHome 200");
          ScreenHomeResponse screenHomeResponse =
              ScreenHomeResponse.fromJson(responseHome.data);
          if (screenHomeResponse.head?.status == 200) {
            await setButton(
                buttonOkAPI: screenHomeResponse.body?.errorbutton?.buttonok,
                buttonConfirmAPI:
                    screenHomeResponse.body?.errorbutton?.buttonconfirm,
                buttonYesAPI: screenHomeResponse.body?.errorbutton?.buttonyes,
                buttonNoAPI: screenHomeResponse.body?.errorbutton?.buttonno,
                buttonCancelAPI:
                    screenHomeResponse.body?.errorbutton?.buttoncancel);

            print("here 2  == getApiProfile");
            await checkHomeEventInitial(event, emit);
            Response responseProfile = await getApiProfile();
            print("here out 2  == getApiProfile");
            if (responseProfile.statusCode == 200) {
              print("here out 2  == statusCode 200");
              ApiProfileResponse apiProfileResponse =
                  ApiProfileResponse.fromJson(responseProfile.data);
              if (apiProfileResponse.head?.status == 200) {
                print("here 2  == status 200");
                // if (apiProfileResponse.body?.profileGeneralInfo?.role == 'ST') {
                  prefs = await SharedPreferences.getInstance();
                  await setUserLanguage(
                      apiProfileResponse.body?.profileGeneralInfo?.langeuage ??
                          'TH');
                  await setMyNameUser(
                      apiProfileResponse.body?.profileGeneralInfo?.name ?? '');
                // } else {
                  ///------------------------
                  print("here 2.5  == getApiProfileTeacher");
                await checkHomeEventInitial(event, emit);
                  Response responseProfileTeacher = await profileTeacherScreen();
                  print("here out 2.5  == getApiProfileTeacher");
                  if (responseProfileTeacher.statusCode == 200) {
                    print("here out 2.5  == statusCode 200");
                    ProfileTeacherScreenApi responseProfileTeacherApi =
                    ProfileTeacherScreenApi.fromJson(
                        responseProfileTeacher.data);
                    if (responseProfileTeacherApi.head?.status == 200) {
                      print("here 2.5  == status 200");
                      prefs = await SharedPreferences.getInstance();
                      await setUserLanguage(
                          responseProfileTeacherApi.body?.profileGeneralTH
                              ?.language ??
                              'TH');
                      await setMyNameUser(
                          responseProfileTeacherApi.body?.profileGeneralTH
                              ?.name ?? '');
                    }
                      ///-------------------------
                // }
                    print("here 3  == getUserRole");
                    await checkHomeEventInitial(event, emit);
                    Response responseGetUserRole = await getUserRole();
                    print("here out 3  == getUserRole");
                    if (responseGetUserRole.statusCode == 200){
                  print("here 2  == getUserRole 200");
                  GetUserRoleResponse getUserRoleResponse =
                  GetUserRoleResponse.fromJson(responseGetUserRole.data);
                  if (getUserRoleResponse.head?.status == 200) {

                    if (getUserRoleResponse.body?.userrole == "ST"){
                      await checkHomeEventInitial(event, emit);
                      Response responseActivityStudent = await getApiActivityStudent();
                      if (responseActivityStudent.statusCode == 200) {
                        ScreenStatusActivityStudentResponse apiStatusActivityStudentResponse =
                        ScreenStatusActivityStudentResponse.fromJson(
                            responseActivityStudent.data);
                        if (apiStatusActivityStudentResponse.head?.status == 200) {

                          if (apiStatusActivityStudentResponse.body?.activity?.length.toInt() != 0) {
                            emit(HomeEndLoading());
                            emit(ScreenInfoHomeSuccessState(
                                responseScreenInfoHome: screenHomeResponse,
                                responseProfile: apiProfileResponse,
                                responseProfileTeacher: responseProfileTeacherApi,
                                responseActivityStudent: apiStatusActivityStudentResponse));
                          }
                          else if (apiStatusActivityStudentResponse.body?.activity?.length.toInt() == 0) {
                            Response responseAlertNoActivityStudentResponse =
                            await getApiNoActivityStudent();
                            if (responseAlertNoActivityStudentResponse.statusCode == 200) {
                              AlertNoActivityStudentResponse alertNoActivityStudentResponse =
                              AlertNoActivityStudentResponse.fromJson(
                                  responseAlertNoActivityStudentResponse.data);
                              if (alertNoActivityStudentResponse.head?.status == 200) {
                                emit(HomeEndLoading());
                                emit(ScreenInfoHomeNoActivityStudentAndTeacherSuccessState(
                                    responseScreenInfoHome: screenHomeResponse,
                                    responseProfile: apiProfileResponse,
                                    responseProfileTeacher: responseProfileTeacherApi,
                                    responseNoActivityStudent: alertNoActivityStudentResponse));
                              } else {
                                emit(HomeError(
                                    errorMessage:
                                    alertNoActivityStudentResponse.head?.message ?? ""));
                              }
                            } else {
                              emit(HomeError(
                                  errorMessage:
                                  responseAlertNoActivityStudentResponse.statusMessage ??
                                      ""));
                            }
                          }
                          else {
                            emit(HomeError(
                                errorMessage:
                                apiStatusActivityStudentResponse.head?.message ?? ""));
                          }
                        } else {
                          emit(HomeError(
                              errorMessage:
                              apiStatusActivityStudentResponse.head?.message ?? ""));
                        }
                      } else {
                        emit(
                            HomeError(errorMessage: responseActivityStudent.statusMessage ?? ""));
                      }
                    } else if (getUserRoleResponse.body?.userrole == "TC"){
                      //--

                      await checkHomeEventInitial(event, emit);
                      Response responseActivityTeacher = await getScreenActivityListTeacher();
                      if (responseActivityTeacher.statusCode == 200) {
                        ActivityListTeacherScreen apiActivityTeacherResponse =
                        ActivityListTeacherScreen.fromJson(
                            responseActivityTeacher.data);
                        if (apiActivityTeacherResponse.head?.status == 200) {

                          if (apiActivityTeacherResponse.body?.activitylist?.length.toInt() != 0) {
                            emit(HomeEndLoading());
                            emit(ScreenInfoHomeSuccessState(
                                responseScreenInfoHome: screenHomeResponse,
                                responseProfile: apiProfileResponse,
                                responseProfileTeacher: responseProfileTeacherApi,
                                responseActivityTeacher: apiActivityTeacherResponse));
                          }
                          else if (apiActivityTeacherResponse.body?.activitylist?.length.toInt() == 0) {
                            Response responseNoActivityTeacherResponse =
                            await getApiNoActivityTeacher();
                            if (responseNoActivityTeacherResponse.statusCode == 200) {
                              NoActivityTeacherResponse alertNoActivityTeacherResponse =
                              NoActivityTeacherResponse.fromJson(
                                  responseNoActivityTeacherResponse.data);
                              if (alertNoActivityTeacherResponse.head?.status == 200) {
                                emit(HomeEndLoading());
                                emit(ScreenInfoHomeNoActivityStudentAndTeacherSuccessState(
                                    responseScreenInfoHome: screenHomeResponse,
                                    responseProfile: apiProfileResponse,
                                    responseProfileTeacher: responseProfileTeacherApi,
                                    responseNoActivityTeacher: alertNoActivityTeacherResponse));
                              } else {
                                emit(HomeError(
                                    errorMessage:
                                    alertNoActivityTeacherResponse.head?.message ?? ""));
                              }
                            } else {
                              emit(HomeError(
                                  errorMessage:
                                  responseNoActivityTeacherResponse.statusMessage ??
                                      ""));
                            }
                          }
                          else {
                            emit(HomeError(
                                errorMessage:
                                apiActivityTeacherResponse.head?.message ?? ""));
                          }
                        } else {
                          emit(HomeError(
                              errorMessage:
                              apiActivityTeacherResponse.head?.message ?? ""));
                        }
                      } else {
                        emit(
                            HomeError(errorMessage: responseActivityTeacher.statusMessage ?? ""));
                      }
                      //--
                    }
                  }
                    } else {
                      emit(
                          HomeError(errorMessage: responseProfileTeacherApi.head?.message ?? ""));
                    }
                }
              } else {
                emit(
                    HomeError(errorMessage: apiProfileResponse.head?.message ?? ""));
              }
            } else {
              emit(HomeError(errorMessage: responseHome.statusMessage ?? ""));
            }
          }
          else {
            emit(HomeError(errorMessage: screenHomeResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(errorMessage: responseHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<OnClickChangeLanguageHomeEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        print("CheckHome 6 == OnClickChangeLanguageHomeEvent");
        await checkHomeEventInitial(event, emit);
        Response responseChangeLanguage =
            await getChangeLanguageHome(userLanguage: event.userLanguage);
        emit(HomeEndLoading());
        if (responseChangeLanguage.statusCode == 200) {
          ChangeLanguageResponse changeLanguageResponse =
              ChangeLanguageResponse.fromJson(responseChangeLanguage.data);
          if (changeLanguageResponse.head?.status == 200) {
            emit(OnClickChangeLanguageHomeSuccessState(
                userLanguage: event.userLanguage));
          } else {
            emit(
                HomeError(errorMessage: changeLanguageResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(errorMessage: responseChangeLanguage.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<OnClickConfirmLogoutHomeEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        print("CheckHome 7 == OnClickConfirmLogoutHomeEvent");
        await checkHomeEventInitial(event, emit);
        prefs = await SharedPreferences.getInstance();
        String? refreshToken = prefs.getString('refreshKey');
        Response responseLogoutHome = await getLogout(refreshToken: refreshToken);
        emit(HomeEndLoading());
        if (responseLogoutHome.statusCode == 200) {
          SubmitLogoutResponse submitLogoutResponse =
              SubmitLogoutResponse.fromJson(responseLogoutHome.data);
          if (submitLogoutResponse.head?.status == 200) {
            Response responseSendSubmitLogSessions =
                await sendSubmitLogSessions(option: true);

            if (responseSendSubmitLogSessions.statusCode == 200) {
              LogSessionsResponse logSessionsResponse =
                  LogSessionsResponse.fromJson(
                      responseSendSubmitLogSessions.data);
              if (logSessionsResponse.head?.status == 200) {
                cleanIsLogSessions();
              }
            }
            emit(HomeLogoutState(
                responseSubmitLogoutResponse: submitLogoutResponse));
          } else {
            emit(HomeError(errorMessage: submitLogoutResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(errorMessage: responseLogoutHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<OnClickConfirmDeleteAccountHomeEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        print("CheckHome 8 == OnClickConfirmDeleteAccountHomeEvent");
        await checkHomeEventInitial(event, emit);
        Response responseDeleteAccountHome = await getDeleteAccount(password: event.password);
        emit(HomeEndLoading());
        if (responseDeleteAccountHome.statusCode == 200) {
          SubmitDeleteAccountResponse submitDeleteAccountResponse =
              SubmitDeleteAccountResponse.fromJson(responseDeleteAccountHome.data);
          if (submitDeleteAccountResponse.head?.status == 200) {
            emit(OnClickConfirmDeleteAccountState());
          } else {
            emit(HomeError(
                errorMessage: submitDeleteAccountResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(
              errorMessage: responseDeleteAccountHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<HomeScreenSettingInfoEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        print("CheckHome 9 == HomeSettingScreenInfoEvent");
        await checkHomeEventInitial(event, emit);
        Response responseHome = await getSettingScreen();

        if (responseHome.statusCode == 200) {
          SettingScreenResponse settingScreenResponse =
          SettingScreenResponse.fromJson(responseHome.data);
          if (settingScreenResponse.head?.status == 200) {
            await setButton(
                buttonOkAPI: settingScreenResponse.body?.errorbutton?.buttonok,
                buttonConfirmAPI:
                settingScreenResponse.body?.errorbutton?.buttonconfirm,
                buttonYesAPI: settingScreenResponse.body?.errorbutton
                    ?.buttonyes,
                buttonNoAPI: settingScreenResponse.body?.errorbutton?.buttonno,
                buttonCancelAPI:
                settingScreenResponse.body?.errorbutton?.buttoncancel);
            emit(HomeEndLoading());
            emit(ScreenInfoHomeSettingSuccessState(settingScreenResponse: settingScreenResponse,));



          }
          else {
            emit(HomeError(errorMessage: settingScreenResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(errorMessage: responseHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
  }
}
