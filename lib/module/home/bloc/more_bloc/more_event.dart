part of 'more_bloc.dart';

abstract class MoreEvent {}

class MoreScreenInfoEvent extends MoreEvent {}

class MoreContactUsEvent extends MoreEvent {}

class MoreFAQEvent extends MoreEvent {}

class MorePDPAEvent extends MoreEvent {}

class MoreBoardDetailStudentEvent extends MoreEvent {
  final String? studentCode;
  MoreBoardDetailStudentEvent({required this.studentCode});
}

class MoreBoardListStudentEvent extends MoreEvent {
  final String gen;
  MoreBoardListStudentEvent({required this.gen});
}

class MoreBoardListGenStudentEvent extends MoreEvent {}

class MoreBoardTeacherEvent extends MoreEvent {}

class ChangeAvatarRequest extends MoreEvent {}

class SubmitChangeAvatarRequest extends MoreEvent {
  final String base64Image;
  final String userid;
  SubmitChangeAvatarRequest({required this.base64Image, required this.userid});
}
