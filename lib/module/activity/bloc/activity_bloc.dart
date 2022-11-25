import 'package:ez_at_u/module/activity/model/response/approve_activity_teacher_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit_activity_screen_api.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit.dart';
import 'package:ez_at_u/module/activity/model/response/delete.dart';
import 'package:ez_at_u/module/activity/repository/activity_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main_route/main_route_bloc/main_route_bloc.dart';
import '../../../main_route/main_route_bloc_model/check_token_expired_response.dart';
import '../../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../../utils/shared_preferences.dart';

part 'activity_event.dart';

part 'activity_state.dart';
late SharedPreferences prefs;
class ActivityBloc extends Bloc<ActivityEvent, ActivityState>
    with ActivityRepository {
  ActivityBloc() : super(ActivityInitial()) {
    getRefActivityEventInitial(event, emit) async {

      prefs = await SharedPreferences.getInstance();
      isMainRouteRefresh =  prefs.getString('refreshKey');
      isMainRouteKey =  prefs.getString('UserKey');
      Response response = await getRefreshToken(
          refreshToken: isMainRouteRefresh.toString());
      if (response.statusCode == 200) {
        RefreshTokenResponse refreshTokenResponse =
        RefreshTokenResponse.fromJson(response.data);
        if (refreshTokenResponse.head?.status == 200) {
          await setUserKeyAndRefreshKey(
            globalKey: refreshTokenResponse.body?.token ?? "",
            refreshKey: refreshTokenResponse.body?.refreshtoken ?? "",
            isRole: refreshTokenResponse.body?.role ??"TC",
            userLanguage: refreshTokenResponse.body?.language ??"TH",
          );
        }
        else if (refreshTokenResponse.head?.status == 400) {
          emit(TokenExpiredState(message: response.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
        }
        else {
          emit(ActivityError(
              message: refreshTokenResponse.head?.message ?? ""));
        }
      }  else {
        emit(ActivityError(message: response.statusMessage ?? ""));
      }
    }


    checkActivityEventInitial(event, emit) async {
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(
            responseCheckTokenExpiredResponse.data);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {
            print(
                "CheckActivity 1  false============checkActivity======CheckTokenExpired========== ${checkTokenExpiredResponse
                    .head?.timeexpire}");
            print(checkTokenExpiredResponse.body?.expiremessage);
            print(checkTokenExpiredResponse.body?.timenow);
            print(checkTokenExpiredResponse.body?.timeexpir);
            // emit(ActivityEndLoading());
          }
          else {

            print("CheckActivity  2 == checkTokenExpiredResponse.head?.timeexpire == true");
            await getRefActivityEventInitial(event, emit);
          }
        }
        else if (checkTokenExpiredResponse.head?.status == 401) {
          print("CheckActivity 3 == checkTokenExpiredResponse.head?.status == 401");
          await getRefActivityEventInitial(event, emit);
        }
        else {
          emit(ActivityError(
              message: checkTokenExpiredResponse.head?.message ?? ""));
        }
      }

      else if (responseCheckTokenExpiredResponse.statusCode == 401) {

        print("CheckActivity 4 == checkTokenExpiredResponse.head?.status == 401");
        await getRefActivityEventInitial(event, emit);
      }
      else {
        emit(ActivityError(
            message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }


    on<AddActivityScreenInfoEvent>((event, emit) async {
      try {
        emit(ActivityLoading());
        print("CheckActivity 5 == AddActivityScreenInfoEvent");
        await  checkActivityEventInitial(event, emit) ;
        Response response = await getScreenActivity();
        emit(ActivityEndLoading());
        if (response.statusCode == 200) {
          AddEditActivityScreenApi screenActivityResponse =
              AddEditActivityScreenApi.fromJson(response.data);
          if (screenActivityResponse.head?.status == 200) {
            emit(ActivityScreenInfoSuccessState(
                response: screenActivityResponse));
          } else {
            emit(ActivityError(
                message: screenActivityResponse.head?.message ?? ""));
          }
        } else {
          emit(ActivityError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<EditActivityScreenInfoEvent>((event, emit) async {
      try {
        emit(EditActivityLoading());
        print("CheckActivity 6 == EditActivityScreenInfoEvent");
        await  checkActivityEventInitial(event, emit) ;
        Response responseEditActivityScreen = await getScreenActivity();
        emit(EditActivityEndLoading());
        if (responseEditActivityScreen.statusCode == 200) {
          AddEditActivityScreenApi screenActivityResponse =
              AddEditActivityScreenApi.fromJson(responseEditActivityScreen.data);
          if (screenActivityResponse.head?.status == 200) {
            emit(EditActivityScreenInfoSuccessState(
                response: screenActivityResponse));
          } else {
            emit(EditActivityError(
                message: screenActivityResponse.head?.message ?? ""));
          }
        } else {
          emit(EditActivityError(message: responseEditActivityScreen.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<OnClickEditActivityScreenInfoEvent>((event, emit) async {

      // await MoreEventInitial();
      emit(OnClickEditActivityScreenInfoState(data : event.data));
    });
    on<SubmitAddEditActivityEvent>((event, emit) async {
      try {
        emit(SubmitAddEditActivityLoadingState());
        print("CheckActivity 7 == SubmitAddEditActivityEvent");
        await  checkActivityEventInitial(event, emit) ;
        Response responseAddEditSubmit = await submitAddEditActivity(
            event.id,
            event.activityName,
            event.year,
            event.term,
            event.sDate,
            event.fDate,
            event.totalTimeHours,
            event.totalTimeMinutes,
            event.venue,
            event.approver,
            event.detail);
        print("ทดสอบ edit หน้า bloc");
        print(responseAddEditSubmit.statusCode);
        emit(SubmitAddEditActivityEndLoadingState());
        if (responseAddEditSubmit.statusCode == 200) {
          AddEditResponse addEditResponse =
          AddEditResponse.fromJson(responseAddEditSubmit.data);
          if (addEditResponse.head?.status == 200) {
            emit(SubmitAddEditActivityState(responseAddEdit: addEditResponse));
          } else {
            emit(SubmitAddEditActivityError(message: addEditResponse.head?.message ?? ""));
          }
        } else {
          emit(SubmitAddEditActivityError(
              message: responseAddEditSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(SubmitAddEditActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<SubmitDeleteActivityEvent>((event, emit) async {
      try {
        emit(ActivityDetailLoading());
        print("CheckActivity 8  == SubmitDeleteActivityEvent");
        await  checkActivityEventInitial(event, emit) ;
        Response responseDeleteSubmit = await submitDeleteActivity(
          event.id,
        );
        emit(ActivityDetailEndLoading());

        if (responseDeleteSubmit.statusCode == 200) {
          try {
            DeleteResponse deleteResponse =
                DeleteResponse.fromJson(responseDeleteSubmit.data);

            if (kDebugMode) {
              print("deleteResponse.head?.status is ${deleteResponse.head?.status}");
            }

            if (deleteResponse.head?.status == 200) {
              emit(SubmitDeleteActivityState(responseDelete: deleteResponse));
            } else {
              if (kDebugMode) {
                print("ActivityError  + 1");
              }
              emit(ActivityError(message: deleteResponse.head?.message ?? ""));
            }
          } catch (e) {
            emit(ActivityError(message: e.toString()));
          }
        } else {
          emit(ActivityError(message: responseDeleteSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<ApproveActivityTeacherScreenInfoEvent>((event, emit) async {
      try {
        emit(ActivityLoading());
        print("CheckActivity 9 == AddActivityScreenInfoEvent");
        await  checkActivityEventInitial(event, emit) ;
        print("เข้ามั้ยนะ");
        Response response = await getScreenApproveActivityTeacher();
        emit(ActivityEndLoading());
        if (response.statusCode == 200) {
          ApproveActivityTeacherScreen screenApproveActivityResponse =
          ApproveActivityTeacherScreen.fromJson(response.data);
          if (screenApproveActivityResponse.head?.status == 200) {
            print("เข้า success");
            emit(ApproveActivityScreenInfoSuccessState(
                response: screenApproveActivityResponse));
            print("เข้า success หลัง");
          } else {
            print("เข้า error");
            emit(ActivityError(
                message: screenApproveActivityResponse.head?.message ?? ""));
          }
        } else {
          print("เข้า error");
          emit(ActivityError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ActivityError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}

