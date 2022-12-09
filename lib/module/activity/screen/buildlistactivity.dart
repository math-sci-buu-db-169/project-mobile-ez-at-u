import 'package:ez_at_u/module/activity/model/response/activity_list_teacher_screen.dart';
import 'package:ez_at_u/module/activity/screen/activitydetailscreen.dart';
import 'package:ez_at_u/module/activity/screen/approve_activity_screen.dart';
import 'package:ez_at_u/module/activity/screen/itemactivity.dart';
import 'package:ez_at_u/module/home/bloc/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/response/screen_status_activity_response.dart';
import 'approve_activity_from_home_page_screen.dart';

buildListActivity(BuildContext context,
    ScreenStatusActivityStudentResponse? screenstatusActivityStudentResponse,
    ActivityListTeacherScreen? screenstatusActivityTeacherResponse,
    String role
    ) {
  String? userRole = role;
  Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
  Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child:
    (userRole == "ST") ?
    Column(
        children: List.generate(
            int.parse(
                "${screenstatusActivityStudentResponse?.body?.activity?.length}"),
            (index) => ItemActivityStudent(
                  data: screenstatusActivityStudentResponse?.body?.activity?[index],
                  title: screenstatusActivityStudentResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ActivityDetailScreen(
                          appBarBackgroundColor: appBarBackgroundColor,
                          appBarForegroundColor: appBarforegroundColor,
                          activityScreenText: screenstatusActivityStudentResponse?.body?.screeninfo,
                          alertText: screenstatusActivityStudentResponse?.body?.alertmessage,
                          buttonText: screenstatusActivityStudentResponse?.body?.errorbutton,
                          data: screenstatusActivityStudentResponse
                              ?.body?.activity?[index]);
                    })).then((value) =>
                        {context.read<HomeBloc>().add(HomeScreenInfoEvent())});
                  },
                )))
    // Student role
    :
    (userRole == "TC") ?
    Column(
        children: List.generate(
            int.parse(
                "${screenstatusActivityTeacherResponse?.body?.activitylist?.length}"),
                (index) => ItemActivityTeacher(
              data: screenstatusActivityTeacherResponse?.body?.activitylist?[index],
              title: screenstatusActivityTeacherResponse?.body?.screeninfo,
              onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ApproveActivityFromHomePageScreen(
                          appBarBackgroundColor: appBarBackgroundColor,
                          appBarForegroundColor: appBarforegroundColor,
                          activityScreenText: screenstatusActivityTeacherResponse?.body?.screeninfo,
                          // alertText: screenstatusActivityTeacherResponse?.body?.alertmessage,
                          // buttonText: screenstatusActivityTeacherResponse?.body?.errorbutton,
                          data: screenstatusActivityTeacherResponse
                              ?.body?.activitylist?[index]);
                    })).then((value) =>
                        {context.read<HomeBloc>().add(HomeScreenInfoEvent())});
                  },
            )))
        :
        Container()
    // Teacher role
  );
}
