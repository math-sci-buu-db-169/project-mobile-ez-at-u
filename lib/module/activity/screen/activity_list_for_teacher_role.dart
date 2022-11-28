import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/activity_list_teacher_screen.dart';
import 'package:ez_at_u/module/activity/screen/item_activity_for_teacher_role.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_at_u/customs/size/size.dart';
class ActivityListForTeacher extends StatelessWidget {
  const ActivityListForTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ActivityBloc()..add(ApproveActivityTeacherScreenInfoEvent()),
      child: const ActivityListForTeacherSTF(),
    );
  }
}


class ActivityListForTeacherSTF extends StatefulWidget {
  const ActivityListForTeacherSTF({Key? key}) : super(key: key);

  @override
  State<ActivityListForTeacherSTF> createState() => _ActivityListForTeacherSTFState();
}

class _ActivityListForTeacherSTFState extends State<ActivityListForTeacherSTF> with ProgressDialog {
  ActivityListTeacherScreen? _approveActivityScreenApi;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state){
      if (state is ActivityLoading) {
        showProgressDialog(context);
      }
      if (state is ActivityEndLoading) {
        hideProgressDialog(context);
      }
      if (state is ActivityError) {
        dialogOneLineOneBtn(context, '${state.message}\n ', "OK",
            onClickBtn: () {
              Navigator.of(context).pop();
            });
        if (kDebugMode) {
          print(state.message);
        }
      }
    },
    builder: (context, state) {
    if (state is ApproveActivityScreenInfoSuccessState) {
    _approveActivityScreenApi = state.response;

    return ActivityListForTeacherPage(
    context,
        _approveActivityScreenApi
    );
    } else {
    return Container();
    }
    },
    buildWhen: (context, state) {
    return state is ApproveActivityScreenInfoSuccessState;
    },
    );
  }
}


ActivityListForTeacherPage(
    BuildContext context, ActivityListTeacherScreen? approveActivityScreenApi
    ){
  String? titleaprroveactivity = approveActivityScreenApi?.body?.screeninfo?.titleteacheractivity;
  List<Activitylist> activityList = approveActivityScreenApi?.body?.activitylist??[];
  Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
  Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: appBarBackgroundColor,
      elevation: 5,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: appBarforegroundColor,
        ),
      ),
      title: Text(
        // "กิจกรรมที่รอรับการยืนยัน",
        titleaprroveactivity??"กิจกรรม",
        style: TextStyle(
          color: appBarforegroundColor,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SingleChildScrollView(
              child: Center(
                child:
                Column(
                    children: List.generate(
                        int.parse(
                            "${activityList.length}"),
                            (index) => ItemActivityForTeacherRole(
                          data: activityList[index],
                          title: approveActivityScreenApi?.body?.screeninfo,
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //       return ApproveActivityScreen(
                            //           appBarBackgroundColor: appBarBackgroundColor,
                            //           appBarForegroundColor: appBarforegroundColor,
                            //           activityScreenText: screenstatusActivityResponse?.body?.screeninfo,
                            //           alertText: screenstatusActivityResponse?.body?.alertmessage,
                            //           buttonText: screenstatusActivityResponse?.body?.errorbutton,
                            //           data: screenstatusActivityResponse
                            //               ?.body?.activity?[index]);
                            //     })).then((value) =>
                            // {context.read<HomeBloc>().add(HomeScreenInfoEvent())});
                          },
                        )))

                // Column(
                //   children: [
                //     // buildListActivity(context, screenStatusActivityResponse),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         width: 100,
                //         height: 100,
                //         color: Colors.red,),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         width: 100,
                //         height: 100,
                //         color: Colors.green,),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         width: 100,
                //         height: 100,
                //         color: Colors.blue,),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Container(
                //         width: 100,
                //         height: 100,
                //         color: Colors.black,),
                //     ),
                //   ],
                // ),

              ),
            ),
          ),
        ),
      ),
    ),
  );
}