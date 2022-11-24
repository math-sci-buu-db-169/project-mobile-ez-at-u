import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_at_u/customs/size/size.dart';
class ActivityListForTeacher extends StatelessWidget {
  const ActivityListForTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ActivityBloc()..add(ActivityListForTeacherScreenInfoEvent()),
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
  @override
  Widget build(BuildContext context) {
    return ActivityListForTeacherPage(context);
  }
}


ActivityListForTeacherPage(
    BuildContext context
    ){
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
        "กิจกรรมที่รอรับการยืนยัน",
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
                child: Column(
                  children: [
                    // buildListActivity(context, screenStatusActivityResponse),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.black,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}