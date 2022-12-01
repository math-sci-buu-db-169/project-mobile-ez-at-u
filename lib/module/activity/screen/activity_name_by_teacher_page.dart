import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/activity_name_list_by_teacher.dart';
import 'package:ez_at_u/module/activity/screen/edit_activity_by_teacher.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../customs/message/text_add_edit_activity.dart';

class ActivityNameListByTeacherScreen extends StatelessWidget {
  const ActivityNameListByTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc()..add(getDataActivityNameListByTeacherEvent()),
      child: const ActivityNameListByTeacherPage(),
    );
  }
}

class ActivityNameListByTeacherPage extends StatefulWidget {
  const ActivityNameListByTeacherPage({Key? key}) : super(key: key);

  @override
  State<ActivityNameListByTeacherPage> createState() => _ActivityNameListByTeacherPageState();
}

class _ActivityNameListByTeacherPageState extends State<ActivityNameListByTeacherPage> with ProgressDialog {
  ActivityNameListByTeacher? _activityNameListByTeacherScreenApi;
  late String? dateFormated;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<ActivityBloc>().add(AddActivityScreenInfoEvent());
    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state) {
        if (state is SubmitAddEditDeleteByTeacherActivityState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        if (state is SubmitAddEditDeleteActivityByTeacherError) {
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK",
              onClickBtn: () {
                Navigator.of(context).pop();
              });
          if (kDebugMode) {
            print(state.message);
          }
        }
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
        if (state is getDataActivityNameListByTeacherSuccessState) {
          _activityNameListByTeacherScreenApi = state.response;

          return buildActivityNameListByTeacherBody(
            context,
            _activityNameListByTeacherScreenApi,

          );
        } else {
          return Container(
            color: Theme.of(context).primaryColor == Colors.black?Colors.black.withOpacity(0.5):tcWhite,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: circleprogresscolor,
            ),
          );
        }
      },
      buildWhen: (context, state) {
        return state is getDataActivityNameListByTeacherSuccessState;
      },
    );
  }
}

buildActivityNameListByTeacherBody(
    BuildContext context,
    ActivityNameListByTeacher? addEditDeleteActivityScreenByTeacherApi,
    ) {
  Color? appBarBackgroundColor =
      Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
  Color? appBarforegroundColor =
      Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: appBarBackgroundColor,
      elevation: 2,
      leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
        },
        icon: Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: appBarforegroundColor,
        ),
      ),
      title: Text(
        addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.titlelistactivityname ??
            activityTitleAddAct,
        style: TextStyle(
          color: appBarforegroundColor,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea(
      // height: MediaQuery.of(context).size.height,
      child: buildListActivityNameByTeacher(context, addEditDeleteActivityScreenByTeacherApi)
    ),
  );
}

buildListActivityNameByTeacher(BuildContext context, ActivityNameListByTeacher? addEditDeleteActivityScreenByTeacherApi){
  List<dynamic>? listFromApi = addEditDeleteActivityScreenByTeacherApi?.body?.activitynamelistteacher;
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
            children: List.generate(int.parse(
                "${addEditDeleteActivityScreenByTeacherApi?.body?.activitynamelistteacher?.length}"),
                    (index) => ActivityNameCard(data: listFromApi?[index],onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> EditActivityByTeacherScreen(data: listFromApi?[index],)));}))
    ),
  );
}

class ActivityNameCard extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  const ActivityNameCard({Key? key, required this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).splashColor), 
                borderRadius: BorderRadius.circular(10)
            ),
            elevation: 5,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Theme.of(context).splashColor,width: 10)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,5,10),
                  child: Text(data?.activitynameresponse,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                )
            )

          ),
        ),
      ),
    );
  }
}
