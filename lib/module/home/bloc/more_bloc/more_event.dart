part of 'more_bloc.dart';

abstract class MoreEvent {}

class MoreScreenInfoEvent extends MoreEvent {}

class MoreContactUsEvent extends MoreEvent {}

class MoreFAQEvent extends MoreEvent {
  final String module;

  MoreFAQEvent({required this.module,});
}

class MorePDPAEvent extends MoreEvent {}

class MoreBoardDetailStudentEvent extends MoreEvent {
  final String? studentCode;
  MoreBoardDetailStudentEvent({required this.studentCode});
}

class MoreBoardListStudentEvent extends MoreEvent {
  final String gen;
  final String studentID;
  final String studentName;
  final String studentLastname;
  MoreBoardListStudentEvent( {required this.gen, required  this.studentID, required   this.studentName, required   this.studentLastname,});
}class MoreBoardListStudentSearchEvent extends MoreEvent {
  final String gen;
  final String studentID;
  final String studentName;
  final String studentLastname;
  MoreBoardListStudentSearchEvent( {required this.gen, required  this.studentID, required   this.studentName, required   this.studentLastname,});
}

class MoreBoardListGenStudentEvent extends MoreEvent {
  final String gen;
  final String genname;
  MoreBoardListGenStudentEvent({required this.gen, required this.genname});
}
class MoreBoardListGenStudentSearchEvent extends MoreEvent {
  final String gen;
  final String genname;
  MoreBoardListGenStudentSearchEvent({required this.gen, required this.genname});
}

class MoreBoardTeacherEvent extends MoreEvent {}

class ChangeAvatarRequest extends MoreEvent {}

class SubmitChangeAvatarRequest extends MoreEvent {
  final String base64Image;
  final String userid;
  SubmitChangeAvatarRequest({required this.base64Image, required this.userid});
}
