part of 'resume_bloc.dart';

// @immutable
abstract class ResumeState {}

class ResumeInitial extends ResumeState {}
class ResumeInitialState  extends ResumeState {}
class ChangPhotoResumeSuccess extends ResumeState {

  final File avatarImage;
  final String base64img;
  ChangPhotoResumeSuccess({required this.avatarImage,required this.base64img});
}
class ResumeError extends  ResumeState {
  String message;
  ResumeError({required this.message});
}

class  ResumeLoading extends  ResumeState {}

class  ResumeEndLoading extends  ResumeState {}