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
import 'package:shared_preferences/shared_preferences.dart';

import '../../../customs/message/text_add_edit_activity.dart';
import '../../../customs/message/text_button.dart';
import '../../../customs/message/text_error.dart';
import '../../../utils/shared_preferences.dart';
import '../../login/screen/login_screen/login_screen.dart';

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
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  @override
  void initState() {

    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired =
    _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
    _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
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
          dialogOneLineOneBtn(context, '${state.errorMessage}\n ', "OK",
              onClickBtn: () {
                Navigator.of(context).pop();
              });
          if (kDebugMode) {
            print(state.errorMessage);
          }
        }
        if (state is ActivityLoading) {
          showProgressDialog(context);
        }
        if (state is ActivityEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ActivityError) {
          if (state.errorMessage.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(
                context, textSessionExpired, textSubSessionExpired, _buttonOk,
                onClickBtn: () {
                  cleanDelete();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginScreen()));
                });
          } else if (state.errorMessage.toUpperCase().toString() == 'S401EXP01'||state.errorMessage.toUpperCase().toString() == 'T401NOT01') {
            dialogSessionExpiredOneBtn(
                context, textSessionExpired, textSubSessionExpired, _buttonOk,
                onClickBtn: () {
                  cleanDelete();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginScreen()));
                });
          }else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
                onClickBtn: () {
                  Navigator.of(context).pop();
                });
          }
        }

        if (state is TokenExpiredState) {
          dialogSessionExpiredOneBtn(
              context, textSessionExpired, textSubSessionExpired, _buttonOk,
              onClickBtn: () {
                cleanDelete();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen()));
              });
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
          fontWeight: FontWeight.w200
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
                    (index) => ActivityNameCard(data: listFromApi?[index],
                        sequence: (int.parse(
                            "${addEditDeleteActivityScreenByTeacherApi?.
                            body?.
                            activitynamelistteacher?.
                            length}") - index).toString(),
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> EditActivityByTeacherScreen(data: listFromApi?[index],)));}))
    ),
  );
}

class ActivityNameCard extends StatelessWidget {
  final dynamic data;
  final String sequence;
  final GestureTapCallback? onTap;
  const ActivityNameCard({Key? key, required this.data, required this.sequence, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).splashColor, width: 0),
                borderRadius: BorderRadius.circular(10)
            ),
            elevation: 5,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                // height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  // border: Border(
                  //   right: BorderSide(color: Theme.of(context).splashColor,width: 20)
                  // )
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
                      shape: BoxShape.circle
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(sequence,style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Theme.of(context).appBarTheme.foregroundColor),),
                        // Text('9999',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Theme.of(context).appBarTheme.foregroundColor),),
                      ],
                    ),
                  ),
                ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5,5,5,5),
                        child: Text(
                          data?.activitynameresponse,style:
                        TextStyle(color: Theme.of(context).appBarTheme.foregroundColor,
                            fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                )
            )

          ),
        ),
      ),
    );
  }
}
