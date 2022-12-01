part of 'activity_bloc.dart';

// @immutable
abstract class ActivityState {
  const ActivityState();
}
class ActivityInitial extends ActivityState {}
class ActivityLoading extends ActivityState {}
class ActivityDetailLoading extends ActivityState {}
class ActivityDetailEndLoading extends ActivityState {}
class ActivityEndLoading extends ActivityState {}
class ActivityError extends ActivityState {
  String message;

  ActivityError({required this.message});
}
class EditActivityLoading extends ActivityState {}
class OnClickEditActivityScreenInfoState extends ActivityState {
  dynamic data;

  OnClickEditActivityScreenInfoState({required this.data});
}
class EditActivityDetailLoading extends ActivityState {}
class EditActivityDetailEndLoading extends ActivityState {}
class EditActivityEndLoading extends ActivityState {}
class EditActivityError extends ActivityState {
  String message;

  EditActivityError({required this.message});
}
class ActivityScreenInfoSuccessState extends ActivityState {
  AddEditActivityScreenApi response;

  ActivityScreenInfoSuccessState({required this.response});
}
class EditActivityScreenInfoSuccessState extends ActivityState {
  AddEditActivityScreenApi response;

  EditActivityScreenInfoSuccessState({required this.response});
}
class SubmitAddEditActivityState extends ActivityState {
  AddEditResponse responseAddEdit;

  SubmitAddEditActivityState({required this.responseAddEdit});
}
class SubmitEditActivityState extends ActivityState {
  AddEditResponse responseAddEdit;

  SubmitEditActivityState({required this.responseAddEdit});
}
class SubmitAddEditActivityLoadingState extends ActivityState {}
class SubmitAddEditActivityEndLoadingState extends ActivityState {}
class SubmitAddEditActivityError extends ActivityState {
  String message;
  SubmitAddEditActivityError({required this.message});
}
class SubmitDeleteActivityState extends ActivityState {
  DeleteResponse responseDelete;

  SubmitDeleteActivityState({required this.responseDelete});
}
class DefaultState extends ActivityState {}
class RefreshTokenSuccessState extends ActivityState{
  String? token;
  String? refreshToken;
  RefreshTokenSuccessState({
    required this.token,
    required this.refreshToken,
  });
}
class TokenExpiredState extends ActivityState{
  String message;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({
    required this.message,
    required this.checkrefreshtokenmessage,
  });}
class ActivityListTeacherScreenInfoSuccessState extends ActivityState {
  ActivityListTeacherScreen response;

  ActivityListTeacherScreenInfoSuccessState({required this.response});
}
class ActivityListTeacherScreenSearchInfoSuccessState extends ActivityState {
  ActivityListTeacherScreen response;

  ActivityListTeacherScreenSearchInfoSuccessState({required this.response});
}
class getScreenAddEditDeleteActivityByTeacherSuccessState extends ActivityState {
  AddEditDeleteActivityByTeacherScreen response;

  getScreenAddEditDeleteActivityByTeacherSuccessState({required this.response});
}
class SubmitAddEditDeleteByTeacherActivityState extends ActivityState {
  AddEditResponse responseAddEditDeleteByTeacher;

  SubmitAddEditDeleteByTeacherActivityState({required this.responseAddEditDeleteByTeacher});
}
class SubmitAddEditActivityByTeacherLoadingState extends ActivityState {}
class SubmitAddEditActivityByTeacherEndLoadingState extends ActivityState {}
class SubmitAddEditDeleteActivityByTeacherError extends ActivityState {
  String message;
  SubmitAddEditDeleteActivityByTeacherError({required this.message});
}
class getDataActivityListByTeacherSuccessState extends ActivityState {
  AddEditDeleteActivityByTeacherScreen response;

  getScreenAddEditDeleteActivityByTeacherSuccessState({required this.response});
}