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
  String errorMessage;

  ActivityError({required this.errorMessage});
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
  String errorMessage;

  EditActivityError({required this.errorMessage});
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
  String errorMessage;
  SubmitAddEditActivityError({required this.errorMessage});
}
class SubmitDeleteActivityByStudentState extends ActivityState {
  DefaultSubmitResponse responseDelete;

  SubmitDeleteActivityByStudentState({required this.responseDelete});
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
  String errorMessage;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({
    required this.errorMessage,
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
  String errorMessage;
  SubmitAddEditDeleteActivityByTeacherError({required this.errorMessage});
}
class getDataActivityNameListByTeacherSuccessState extends ActivityState {
  ActivityNameListByTeacher response;

  getDataActivityNameListByTeacherSuccessState({required this.response});
}
class SubmitApproveActivityByTeacherLoadingState extends ActivityState {}
class SubmitApproveActivityByTeacherEndLoadingState extends ActivityState {}
class SubmitApproveActivityByTeacherState extends ActivityState {
  ApproveActivitySubmit responseApproveActivitySubmitByTeacher;

  SubmitApproveActivityByTeacherState({required this.responseApproveActivitySubmitByTeacher});
}
class SubmitApproveActivityByTeacherErrorState extends ActivityState {
  String errorMessage;
  SubmitApproveActivityByTeacherErrorState({required this.errorMessage});
}
class selectActivityByStudentScreenInfoSuccessState extends ActivityState {
  SelectActivityByStudentScreenApi response;

  selectActivityByStudentScreenInfoSuccessState({required this.response});
}
class SubmitSelectActivityByStudentState extends ActivityState {
  SelectActivityByStudentSubmit responseSelectActivityByStudentSubmit;

  SubmitSelectActivityByStudentState({required this.responseSelectActivityByStudentSubmit});
}
class SubmitSelectActivityByStudentLoadingState extends ActivityState {}
class SubmitSelectActivityByStudentEndLoadingState extends ActivityState {}
class SubmitSelectActivityByStudentErrorState extends ActivityState {
  String errorMessage;
  SubmitSelectActivityByStudentErrorState({required this.errorMessage});
}
class selectActivityByStudentFilterDateScreenInfoSuccessState extends ActivityState {
  SelectActivityByStudentScreenApi response;

  selectActivityByStudentFilterDateScreenInfoSuccessState({required this.response});
}