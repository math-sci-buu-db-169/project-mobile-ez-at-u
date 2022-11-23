import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit_activity_screen_api.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit.dart';
import 'package:ez_at_u/module/activity/model/response/delete.dart';
import 'package:ez_at_u/module/activity/repository/activity_repository.dart';

import '../../../main_route/main_route_bloc/main_route_bloc.dart';
import '../../../main_route/main_route_bloc_model/CheckTokenExpiredRespomse.dart';
import '../../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../../utils/shared_preferences.dart';

part 'activity_event.dart';

part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState>
    with ActivityRepository {
  ActivityBloc() : super(ActivityInitial()) {
    MoreEventInitial() async {

      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(responseCheckTokenExpiredResponse.data);
        print("checkTokenExpiredResponse ============================ false");
        print(checkTokenExpiredResponse.body?.expiremessage);
        print(checkTokenExpiredResponse.head?.timeexpire);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {

          }
          else{

            print("checkTokenExpiredResponse ============================ true");
            Response responseRefreshTokenResponse = await getRefreshToken(
                refreshToken: isMainRouteRefresh.toString());
            if (responseRefreshTokenResponse.statusCode == 200) {
              RefreshTokenResponse refreshTokenResponse =
              RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
              if (refreshTokenResponse.head?.status == 200) {
                await setUserKey(globalKey: refreshTokenResponse.body?.token?? "");
                await setUserRefreshKey(refreshKey: refreshTokenResponse.body?.refreshtoken?? "");
              }
              // else if (refreshTokenResponse.head?.status == 400) {
              //   emit(TokenExpiredState(message: responseRefreshTokenResponse.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
              // }
              else {
                emit(ActivityError(message:refreshTokenResponse.head?.message ?? ""));
              }
            }  else {
              emit(ActivityError(message: responseRefreshTokenResponse.statusMessage ?? ""));
            }
          }

        }
        else {
          emit(ActivityError(message:checkTokenExpiredResponse.head?.message ?? ""));
        }
      }  else {
        emit(ActivityError(message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    };

    on<AddActivityScreenInfoEvent>((event, emit) async {
      try {
        emit(ActivityLoading());
        // await MoreEventInitial();
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
        // await MoreEventInitial();
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
        // await MoreEventInitial();
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
        // await MoreEventInitial();
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
  }
}

