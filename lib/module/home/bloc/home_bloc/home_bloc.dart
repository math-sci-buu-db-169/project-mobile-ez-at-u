import 'package:dio/dio.dart';
import 'package:ez_u/module/activity/model/response/screen_status_activity_response.dart';
import 'package:ez_u/module/home/model/response/home_response/alert_no_activity_response.dart';
import 'package:ez_u/module/home/model/response/home_response/submit_delete_account_response.dart';
import 'package:ez_u/module/home/model/response/home_response/submit_logout_response.dart';
import 'package:ez_u/module/profile/model/response/api_profile_response.dart';
import 'package:ez_u/utils/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_u/module/home/model/response/home_response/alert_logout_response.dart';
import 'package:ez_u/module/home/model/response/home_response/change_language_response.dart';
import 'package:ez_u/module/home/model/response/home_response/screen_home_response.dart';
import 'package:ez_u/module/home/repository/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

late SharedPreferences prefs;

class HomeBloc extends Bloc<HomeEvent, HomeState> with HomeRepository {
  HomeBloc() : super(HomeInitial()) {
    on<HomeScreenInfoEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        Response responseHome = await getScreenHome();

        if (responseHome.statusCode == 200) {
          ScreenHomeResponse screenHomeResponse = ScreenHomeResponse.fromJson(responseHome.data);
          if (screenHomeResponse.head?.status == 200) {
            await setButton(
                buttonOkAPI: screenHomeResponse.body?.errorbutton?.buttonok,
                buttonConfirmAPI: screenHomeResponse.body?.errorbutton?.buttonconfirm,
                buttonYesAPI: screenHomeResponse.body?.errorbutton?.buttonyes,
                buttonNoAPI: screenHomeResponse.body?.errorbutton?.buttonno,
                buttonCancelAPI: screenHomeResponse.body?.errorbutton?.buttoncancel);
            Response responseProfile = await getApiProfile();
            if (responseProfile.statusCode == 200) {
              ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(responseProfile.data);
              if (apiProfileResponse.head?.status == 200) {
                prefs = await SharedPreferences.getInstance();
                await setUserLanguage(apiProfileResponse.body?.profileGeneralInfo?.langeuage ?? 'TH');
                Response responseActivity = await getApiActivity();
                if (responseActivity.statusCode == 200) {
                  ScreenStatusActivityResponse apiStatusActivityResponse =
                      ScreenStatusActivityResponse.fromJson(responseActivity.data);
                  if (apiStatusActivityResponse.head?.status == 200) {
                    if (apiStatusActivityResponse.body?.activity?.length.toInt() != 0) {
                      emit(HomeEndLoading());
                      emit(ScreenInfoHomeSuccessState(
                          responseScreenInfoHome: screenHomeResponse,
                          responseProfile: apiProfileResponse,
                          responseActivity: apiStatusActivityResponse));
                    } else if (apiStatusActivityResponse.body?.activity?.length.toInt() == 0) {
                      Response responseAlertNoActivityResponse = await getApiNoActivity();
                      if (responseAlertNoActivityResponse.statusCode == 200) {
                        AlertNoActivityResponse alertNoActivityResponse =
                            AlertNoActivityResponse.fromJson(responseAlertNoActivityResponse.data);
                        if (alertNoActivityResponse.head?.status == 200) {
                          emit(HomeEndLoading());
                          emit(ScreenInfoHomeNoActivitySuccessState(
                              responseScreenInfoHome: screenHomeResponse,
                              responseProfile: apiProfileResponse,
                              responseNoActivity: alertNoActivityResponse));
                        } else {
                          emit(HomeError(message: alertNoActivityResponse.head?.message ?? ""));
                        }
                      } else {
                        emit(HomeError(message: responseAlertNoActivityResponse.statusMessage ?? ""));
                      }
                    } else {
                      emit(HomeError(message: apiStatusActivityResponse.head?.message ?? ""));
                    }
                  } else {
                    emit(HomeError(message: apiStatusActivityResponse.head?.message ?? ""));
                  }
                } else {
                  emit(HomeError(message: responseActivity.statusMessage ?? ""));
                }
              } else {
                emit(HomeError(message: apiProfileResponse.head?.message ?? ""));
              }
            } else {
              emit(HomeError(message: responseHome.statusMessage ?? ""));
            }
          } else {
            emit(HomeError(message: screenHomeResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<OnClickChangeLanguageHomeEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        Response responseChangeLanguage = await getChangeLanguageHome(userLanguage: event.userLanguage);
        emit(HomeEndLoading());
        if (responseChangeLanguage.statusCode == 200) {
          ChangeLanguageResponse changeLanguageResponse = ChangeLanguageResponse.fromJson(responseChangeLanguage.data);
          if (changeLanguageResponse.head?.status == 200) {
            emit(OnClickChangeLanguageHomeSuccessState(userLanguage: event.userLanguage));
          } else {
            emit(HomeError(message: changeLanguageResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseChangeLanguage.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<OnClickConfirmLogoutHomeEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      String? refreshToken = prefs.getString('refreshKey');
      try {
        emit(HomeLoading());
        Response responseLogoutHome = await getLogout(refreshToken: refreshToken);
        emit(HomeEndLoading());
        if (responseLogoutHome.statusCode == 200) {
          SubmitLogoutResponse submitLogoutResponse = SubmitLogoutResponse.fromJson(responseLogoutHome.data);
          if (submitLogoutResponse.head?.status == 200) {
            emit(HomeLogoutState(responseSubmitLogoutResponse: submitLogoutResponse));
          } else {
            emit(HomeError(message: submitLogoutResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseLogoutHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<OnClickConfirmDeleteAccountHomeEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        Response responseDeleteAccountHome = await getDeleteAccount(password: event.password);
        emit(HomeEndLoading());
        if (responseDeleteAccountHome.statusCode == 200) {
          SubmitDeleteAccountResponse submitDeleteAccountResponse =
              SubmitDeleteAccountResponse.fromJson(responseDeleteAccountHome.data);
          if (submitDeleteAccountResponse.head?.status == 200) {
            emit(OnClickConfirmDeleteAccountState());
          } else {
            emit(HomeError(message: submitDeleteAccountResponse.head?.message ?? ""));
          }
        } else {
          emit(HomeError(message: responseDeleteAccountHome.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(HomeError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
