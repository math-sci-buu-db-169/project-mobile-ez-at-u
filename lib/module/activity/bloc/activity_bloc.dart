import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_u/module/activity/model/response/add_edit_activity_screen_api.dart';
import 'package:ez_u/module/activity/model/response/add_edit.dart';
import 'package:ez_u/module/activity/model/response/delete.dart';
import 'package:ez_u/module/activity/repository/activity_repository.dart';

part 'activity_event.dart';

part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState>
    with ActivityRepository {
  ActivityBloc() : super(ActivityInitial()) {
    on<AddActivityScreenInfoEvent>((event, emit) async {
      try {
        emit(ActivityLoading());
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
      emit(OnClickEditActivityScreenInfoState(data : event.data));
    });
    on<SubmitAddEditActivityEvent>((event, emit) async {
      try {
        emit(SubmitAddEditActivityLoadingState());
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

