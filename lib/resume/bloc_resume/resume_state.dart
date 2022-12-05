part of 'resume_bloc.dart';

// @immutable
abstract class ResumeState {}

class ResumeInitial extends ResumeState {}
class ResumeInitialState  extends ResumeState {}
// class ChangPhotoResumeSuccess extends ResumeState {
//
//   final File avatarImage;
//   final String base64img;
//   ChangPhotoResumeSuccess({required this.avatarImage,required this.base64img});
// }
class ResumeError extends  ResumeState {
  String errorMessage;
  ResumeError({required this.errorMessage});
}

class  ResumeLoading extends  ResumeState {}

class  ResumeEndLoading extends  ResumeState {}
class PreviewResumeError extends  ResumeState {
  String errorMessage;
  PreviewResumeError({required this.errorMessage});
}

class  PreviewResumeLoading extends  ResumeState {}

class  PreviewResumeEndLoading extends  ResumeState {}

class PreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  PreviewResumeSuccessState({required this.isPreViewResumeResponse});
}

class ChangeLanguagePreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  ChangeLanguagePreviewResumeSuccessState({required this.isPreViewResumeResponse});
}

class ChooseImageUpLoadResumeSuccess extends ResumeState {
  final File avatarImage;
  final String base64img;
  ChooseImageUpLoadResumeSuccess({required this.avatarImage,required this.base64img});
}
