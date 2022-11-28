part of 'activity_bloc.dart';

// @immutable
abstract class ActivityEvent {}

class AddActivityScreenInfoEvent extends ActivityEvent {}
class EditActivityScreenInfoEvent extends ActivityEvent {}
class OnClickEditActivityScreenInfoEvent extends ActivityEvent {
  dynamic data;
  OnClickEditActivityScreenInfoEvent({required this.data,});
}
class SubmitAddEditActivityEvent extends ActivityEvent {
  int id;
  String activityName;
  String year;
  String term;
  String sDate;
  String fDate;
  String totalTimeHours;
  String totalTimeMinutes;
  String venue;
  String approver;
  String detail;
  SubmitAddEditActivityEvent({
    required this.id,
    required this.activityName,
    required this.year,
    required this.term,
    required this.sDate,
    required this.fDate,
    required this.totalTimeHours,
    required this.totalTimeMinutes,
    required this.venue,
    required this.approver,
    required this.detail,
});
}
class SubmitDeleteActivityEvent extends ActivityEvent {
  int id;
  SubmitDeleteActivityEvent({
    required this.id,
});
}
class SubmitApproveActivityTeacherEvent extends ActivityEvent {
  int activityid;
  String status;

  SubmitApproveActivityTeacherEvent({
    required this.activityid,
    required this.status
  });
}
class ActivityListTeacherScreenInfoEvent extends ActivityEvent {
  String filterstatus;
  int? studentid;
  String studentname;
  String activityname;

  ActivityListTeacherScreenInfoEvent({
    required this.filterstatus,
    required this.studentid,
    required this.studentname,
    required this.activityname

  });
}
class ActivityListTeacherSearchScreenInfoEvent extends ActivityEvent {
  String filterstatus;
  int? studentid;
  String studentname;
  String activityname;

  ActivityListTeacherSearchScreenInfoEvent({
    required this.filterstatus,
    required this.studentid,
    required this.studentname,
    required this.activityname

  });
}
