import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/message/text_button.dart';
import 'package:ez_at_u/customs/message/text_error.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/activity_list_teacher_screen.dart';
import 'package:ez_at_u/module/activity/screen/item_activity_for_teacher_role.dart';
import 'package:ez_at_u/module/login/screen/login_screen/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preferences.dart';
class ActivityListForTeacher extends StatelessWidget {
  const ActivityListForTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ActivityBloc()..add(ActivityListTeacherScreenInfoEvent(filterstatus: '', studentid: null, studentname: '', activityname: '')),
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
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  final TextEditingController searchActivityController = TextEditingController();
  late String statusActivity ="";

  @override
  void initState() {
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';

    textSessionExpired = _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

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
        if (state.message.toString() == 'Unauthorized') {
          dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
            cleanDelete();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
          });
        }
        else {
          dialogOneLineOneBtn(context, '${state.message}\n ', _buttonOk, onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
      }
      if (state is ActivityListTeacherScreenSearchInfoSuccessState) {
        _approveActivityScreenApi = state.response;

        return ActivityListForTeacherPage(
            context,
            _approveActivityScreenApi,searchActivityController, statusActivity
        );
      }
    },
    builder: (context, state) {
    if (state is ActivityListTeacherScreenInfoSuccessState) {
    _approveActivityScreenApi = state.response;

    return ActivityListForTeacherPage(
    context,
        _approveActivityScreenApi,searchActivityController,
      statusActivity,
    );
    } else
    if (state is ActivityListTeacherScreenSearchInfoSuccessState) {
      _approveActivityScreenApi = state.response;

      return ActivityListForTeacherPage(
          context,
          _approveActivityScreenApi,searchActivityController,
          statusActivity,
      );
    }
    else
    {
    return Container();
    }
    },
    buildWhen: (context, state) {
    return state is ActivityListTeacherScreenInfoSuccessState||state is ActivityListTeacherScreenSearchInfoSuccessState;
    },
    );
  }
}


ActivityListForTeacherPage(
    BuildContext context, ActivityListTeacherScreen? approveActivityScreenApi,
    TextEditingController searchActivityController, String statusActivity
    ){
  String? titleaprroveactivity = approveActivityScreenApi?.body?.screeninfo?.titleteacheractivity;
  List<Activitylist> activityList = approveActivityScreenApi?.body?.activitylist??[];
  Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
  Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
  String? showActivityStatusValue;
  return WillPopScope(
    onWillPop: () async { return false; },
    child: Scaffold(
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
        actions: [
          IconButton(
              onPressed: () {
                PopupMenuButton<String>(
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                              showActivityStatusValue??'',
                              style:  TextStyle(fontSize:18 ,color: appBarforegroundColor,),
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            )),
                        Icon(Icons.keyboard_arrow_down, color: appBarforegroundColor,)
                      ]),
                  itemBuilder: (context) {
                    return List.generate(approveActivityScreenApi?.body?.optionsStatus?.length??0,
                            (index) {
                          return PopupMenuItem(
                            textStyle: TextStyle(fontSize: 18, color: appBarforegroundColor),
                            // value: approveActivityScreenApi?.body?.optionsStatus[index].value,
                            child:
                            Column(
                              children: [
                                // Text(widget.attentionArray[index].attenname ?? ''),
                              ],
                            ),
                          );
                        });
                  },
                  onSelected: (value) {
                    // setState(() {
                    //   userAttentionValue = value;
                    //   showAttentionValue = widget.attentionArray[int.parse(value)-1].attenname;
                    //   widget.callbackFromAttentionDataTab(userAttentionValue??"-");
                    //   print(widget.attentionArray.length);
                    // });
                  },
                );
              },

              icon:  FaIcon(FontAwesomeIcons.filter,
                size: 20,
                color: Theme.of(context).bottomAppBarColor ,
              )
          ),
        ],
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
                      Column(children: [
                        TextFormField(
                          style:  TextStyle(
                            fontSize: sizeText18,
                            color:  Theme.of(context).scaffoldBackgroundColor, // height: 2.0,
                          ),
                          cursorColor: Theme.of(context).appBarTheme.foregroundColor,
                          keyboardType: TextInputType.text,
                          // controller: textEditingController,
                          initialValue: searchActivityController.text,
                          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
                          onChanged: (value) {
                            searchActivityController.text = value;

                          },
                          obscureText: false,
                        ),
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
                      ],)


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
    ),
  );
}