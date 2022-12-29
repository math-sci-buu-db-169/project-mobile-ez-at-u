import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/message/text_add_edit_activity.dart';
import 'package:ez_at_u/customs/message/text_button.dart';
import 'package:ez_at_u/customs/message/text_error.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/activity_list_teacher_screen.dart';
import 'package:ez_at_u/module/activity/screen/approve_activity_screen.dart';
import 'package:ez_at_u/module/activity/screen/item_activity_for_teacher_role.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:ez_at_u/module/login/screen/login_screen/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../customs/text_file/text_field_search_activity.dart';
import '../../../utils/shared_preferences.dart';

class ActivityListForTeacher extends StatelessWidget {
  const ActivityListForTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc()
        ..add(ActivityListTeacherScreenInfoEvent(
            filterstatus: '',
            studentid: null,
            studentname: '',
            activityname: '')),
      child: const ActivityListForTeacherSTF(),
    );
  }
}

class ActivityListForTeacherSTF extends StatefulWidget {
  const ActivityListForTeacherSTF({Key? key}) : super(key: key);

  @override
  State<ActivityListForTeacherSTF> createState() =>
      _ActivityListForTeacherSTFState();
}

class _ActivityListForTeacherSTFState extends State<ActivityListForTeacherSTF>
    with ProgressDialog {
  ActivityListTeacherScreen? _approveActivityScreenApi;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  final TextEditingController searchActivityController =
      TextEditingController();
  late String statusActivity = "";

  @override
  void initState() {
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
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
    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state) {
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
        if (state is ActivityListTeacherScreenSearchInfoSuccessState) {
          _approveActivityScreenApi = state.response;

          ActivityListForTeacherPage(
            approveActivityScreenApi: _approveActivityScreenApi,
            searchActivityController: searchActivityController,
            statusActivity: statusActivity,
          );
        }
      },
      builder: (context, state) {
        if (state is ActivityListTeacherScreenInfoSuccessState) {
          _approveActivityScreenApi = state.response;

          return ActivityListForTeacherPage(
            approveActivityScreenApi: _approveActivityScreenApi,
            searchActivityController: searchActivityController,
            statusActivity: statusActivity,
          );
        } else if (state is ActivityListTeacherScreenSearchInfoSuccessState) {
          _approveActivityScreenApi = state.response;

          return ActivityListForTeacherPage(
            approveActivityScreenApi: _approveActivityScreenApi,
            searchActivityController: searchActivityController,
            statusActivity: statusActivity,
          );
        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is ActivityListTeacherScreenInfoSuccessState ||
            state is ActivityListTeacherScreenSearchInfoSuccessState;
      },
    );
  }
}

class ActivityListForTeacherPage extends StatefulWidget {
  final ActivityListTeacherScreen? approveActivityScreenApi;
  final TextEditingController searchActivityController;
  final String statusActivity;
  const ActivityListForTeacherPage(
      {Key? key,
      this.approveActivityScreenApi,
      required this.searchActivityController,
      required this.statusActivity})
      : super(key: key);

  @override
  State<ActivityListForTeacherPage> createState() =>
      _ActivityListForTeacherPageState();
}

class _ActivityListForTeacherPageState
    extends State<ActivityListForTeacherPage> {
  late String searchStatus ='';
  late int optionSearch = 0;
  @override
  Widget build(BuildContext context) {
    String? titleaprroveactivity =
        widget.approveActivityScreenApi?.body?.screeninfo?.titleteacheractivity;
    List<Activitylist> activityList =
        widget.approveActivityScreenApi?.body?.activitylist ?? [];
    Color? appBarBackgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
    Color? appBarForegroundColor =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
    String? showActivityStatusValue;
    int lengthPopupMenuItem = widget.approveActivityScreenApi?.body?.optionsStatus?.length ?? 1 ;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          elevation: 5,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
            },
            icon: Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: appBarForegroundColor,
            ),
          ),
          title: Text(
            // "กิจกรรมที่รอรับการยืนยัน",
            titleaprroveactivity ?? textActivityName,
            style: TextStyle(
              color: appBarForegroundColor,
              fontSize: sizeTitle24,
            ),
          ),
          actions: [
            PopupMenuButton(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      FontAwesomeIcons.filter,
                      size: 20,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                ),
                itemBuilder: (context) {
                  return List.generate(
                      (lengthPopupMenuItem)
                          , (index) {

                        return  PopupMenuItem(
                          value: widget.approveActivityScreenApi?.body?.optionsStatus?[index].value,
                          child: Text(widget.approveActivityScreenApi?.body?.optionsStatus?[index].status ??'Settings',style: TextStyle(color: appBarForegroundColor),),
                        );

                  }
                  );
                },
        onSelected: (value) {
                    searchStatus ='';
                  setState(() {
          switch(int.parse(value)){
            case 0 :{
              searchStatus = '';
            }break;
            case 1 :{
              searchStatus = 'U';
            }break;
            case 2 :{
              searchStatus = 'A';
            }break;
            case 3 :{
              searchStatus = 'R';
            }break;

            default :{
              searchStatus = '';
            }break;

          }
          context.read<ActivityBloc>().add(ActivityListTeacherSearchScreenInfoEvent(filterstatus: searchStatus,
            studentid: null,
            studentname: '',
            activityname: '',));

        }



        );},

    ),

          ],
        ),
        body: SafeArea(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  TextFieldSearchActivityCustom(
                    activityListTeacherScreen: widget.approveActivityScreenApi,
                    searchActivityController: widget.searchActivityController,
                    callbackFromOptionSearch: (int optionSearchResult) {
                      // setOptionSearchNiSit(optionSearchResult);
                      optionSearch = optionSearchResult;
                    },
                    onChanged: (valuePassword) {
                      widget.searchActivityController.text = valuePassword;
                      print(valuePassword);
                      switch(optionSearch) {
                        case 0: {
                          context.read<ActivityBloc>().add(ActivityListTeacherSearchScreenInfoEvent(filterstatus: searchStatus,
                            studentid: null,
                            studentname: widget.searchActivityController.text,
                            activityname: '',));
                        }
                        break;
                        case 1: {
                          context.read<ActivityBloc>().add(ActivityListTeacherSearchScreenInfoEvent(filterstatus: searchStatus,
                            studentid: null,
                            studentname:'' ,
                            activityname: widget.searchActivityController.text,));
                        }
                        break;
                        default: {
                          context.read<ActivityBloc>().add(ActivityListTeacherSearchScreenInfoEvent(filterstatus: searchStatus,
                            studentid:null,
                            studentname:  widget.searchActivityController.text,
                            activityname: '',));
                        }
                        break;
                      }

                    },
                    // hintLabel: 'ชื่อรุ่นมหาลัย',
                    textInputType: TextInputType.text,
                    initialvalue: widget.searchActivityController.text,
                    iconsFile : Icons.search,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                          children: List.generate(
                              int.parse("${activityList.length}"),
                                  (index) => ItemActivityForTeacherRole(
                                data: activityList[index],
                                title: widget.approveActivityScreenApi?.body
                                    ?.screeninfo,
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return
                                          ApproveActivityScreen(
                                            appBarBackgroundColor: appBarBackgroundColor,
                                            appBarForegroundColor: appBarForegroundColor,
                                            activityScreenText: widget.approveActivityScreenApi?.body?.screeninfo,
                                            // alertText: widget.approveActivityScreenApi?.body?.alertmessage,
                                            // buttonText: widget.approveActivityScreenApi?.body?.errorbutton,
                                            data: widget.approveActivityScreenApi
                                                ?.body?.activitylist?[index]);
                                      })).then((value) =>
                                  {context.read<ActivityBloc>().add(ActivityListTeacherScreenInfoEvent(
                                      filterstatus: '',
                                      studentid: null,
                                      studentname: '',
                                      activityname: ''))});
                                },
                              ))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
