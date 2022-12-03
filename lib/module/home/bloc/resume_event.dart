part of 'resume_bloc.dart';

// @immutable
abstract class ResumeEvent {}
class ChangePhotoRequest extends ResumeEvent {}
class ResumeInnitEvent extends ResumeEvent {}