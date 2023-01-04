import 'package:ez_at_u/customs/button/button_custom.dart';
import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/message/text_activity.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/screen/edit_activity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/size/size.dart';
import '../../../customs/message/text_button.dart';
import '../../../customs/message/text_error.dart';
import '../../../utils/shared_preferences.dart';
import '../../login/screen/login_screen/login_screen.dart';

class ActivityDetailScreen extends StatelessWidget {
  final dynamic activityScreenText;
  final dynamic data;
  final dynamic buttonText;
  final dynamic alertText;
  final Color appBarBackgroundColor;
  final Color appBarForegroundColor;

  const ActivityDetailScreen(
      {Key? key,
      this.activityScreenText,
      this.data,
      this.buttonText,
      this.alertText,
        required this.appBarBackgroundColor,
        required this.appBarForegroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc(),
      child: ActivityDetailPage(
          appBarBackgroundColor: appBarBackgroundColor,
          appBarForegroundColor: appBarForegroundColor,
          activityScreenText: activityScreenText,
          data: data,
          buttonText: buttonText,
          alertText: alertText),
    );
  }
}

class ActivityDetailPage extends StatefulWidget {
  final dynamic activityScreenText;
  final dynamic data;
  final dynamic buttonText;
  final dynamic alertText;
  final Color appBarBackgroundColor;
  final Color appBarForegroundColor;

  const ActivityDetailPage(
      {Key? key,
      required this.activityScreenText,
      required this.data,
      required this.buttonText,
      required this.alertText,
        required this.appBarBackgroundColor,
        required this.appBarForegroundColor})
      : super(key: key);

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage>
    with ProgressDialog {
  dynamic activityScreenText;
  dynamic data;
  dynamic buttonText;
  dynamic alertText;
  bool showButton = false;
  late SharedPreferences prefs;
  late String _userLanguage= 'TH';
  late Color appBarBackgroundColor;
  late Color appBarForegroundColor;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  //---------------------------------API----------------------------------------//
  @override
  void initState() {

    _isSessionUnauthorized();
    activityScreenText = widget.activityScreenText;
    data = widget.data;
    buttonText = widget.buttonText;
    alertText = widget.alertText;
    appBarBackgroundColor = widget.appBarBackgroundColor;
    appBarForegroundColor = widget.appBarForegroundColor;
    _isSessionExpired();
    if (kDebugMode) {
      print('เรียก initState');
    }
    // getActivityDetailApi();
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

  Future<void> _isSessionExpired() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    if (kDebugMode) {
      print(prefs.getString('userLanguage') ?? 'TH');
    }
    // textSessionExpired = _userLanguage =='EN'? textUnauthorizedEN:textUnauthorizedTH;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state) {
        // if (state is ActivityDetailLoading) {
        //   showProgressDialog(context);
        // }
        // if (state is ActivityDetailEndLoading) {
        //   hideProgressDialog(context);
        // }
        // if (state is OnClickEditActivityScreenInfoState) {
        //   // showProgressDialog(context);
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) {
        //         return EditActivityScreen(data: data);
        //       }));
        // }
        if (state is EditActivityDetailLoading) {
          showProgressDialog(context);
        }
        if (state is EditActivityDetailEndLoading) {
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
        if (state is SubmitDeleteActivityByStudentState) {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is ActivityInitial) {
          return buildContextActivity(context, data, showButton,
              activityScreenText, buttonText, alertText, _userLanguage, appBarBackgroundColor, appBarForegroundColor);
        } else {
          return Scaffold(
              body: Container(
            color: Colors.white,
          ));
        }
      },
      buildWhen: (context, state) {
        return state is ActivityInitial || state is DefaultState;
      },
    );
  }
}

buildTableRow(BuildContext context,
    {required String textLeftTable, required String textRightTableDetail}) {
  return TableRow(children: [
    Text(
      '   $textLeftTable',
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    const Text(
      ':',
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
    ),
    Text(
      textRightTableDetail,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFF333333)),
    )
  ]);
}

////////////////////////////////////////////////////////////////////////////////
_buildListEmpty() {
  return const TableRow(children: [
    SizedBox(),
    SizedBox(),
    SizedBox(
      height: 30,
    ),
  ]);
}

buildContextActivity(
  BuildContext context,
  data,
  bool showButton,
  activityScreenText,
  buttonText,
  alertText,
  isUserLanguage,
    appBarBackgroundColor,
    appBarForegroundColor
) {
  // print('${data.status}');
  var myIcon = const Icon(
    Icons.question_mark,
    color: Colors.black,
  );
  String activityHeadStatus = '';
  if (data.status == "Unapproved!") {
    if (kDebugMode) {
      print('เข้า Unapproved!');
    }
    activityHeadStatus = activityScreenText.titleunapproved ??
        (isUserLanguage == 'EN'
            ? statusActivityTitleUnapprovedEN
            : statusActivityTitleUnapprovedTH);
    myIcon = const Icon(
      Icons.alarm,
      color: Colors.black,
    );
    showButton = true;
  } else if (data.status == "Approved!") {
    if (kDebugMode) {
      print('เข้า Approved!');
    }
    activityHeadStatus = activityScreenText.titleapproved ??
        (isUserLanguage == 'EN'
            ? statusActivityTitleApprovedEN
            : statusActivityTitleApprovedTH);
    myIcon = const Icon(
      Icons.check_circle,
      color: Colors.black,
    );
    showButton = false;
  } else if (data.status == "Rejected!") {
    if (kDebugMode) {
      print('เข้า Rejected');
    }
    activityHeadStatus = activityScreenText.titlerejected ??
        (isUserLanguage == 'EN'
            ? statusActivityTitleRejectedEN
            : statusActivityTitleRejectedTH);
    myIcon = const Icon(
      Icons.cancel,
      color: Colors.black,
    );
    showButton = false;
  }
  String name = data.teachername ?? '-';
  String lastname = data.teacherlastname ?? '-';
  return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // setState(() {
            //   // print(id);
            //   // print(data['venue']);
            // });
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: sizeTitle24,
            color: appBarForegroundColor,
          ),
        ),
        title: Center(
          child: Text(
            // 'ทดสอบ',
            // '${data.status}',
            activityHeadStatus,
            style: TextStyle(
              color: appBarForegroundColor,
              fontSize: 22,
            ),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            // height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: HexColor(data.color ?? '#e6e8e6'),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 5, right: 5, bottom: 20),
                        child: Table(
                          border: TableBorder.symmetric(
                              outside: const BorderSide(
                                  width: 2, color: Colors.transparent)),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FractionColumnWidth(0.35),
                            1: FractionColumnWidth(0.05),
                            2: FractionColumnWidth(0.60),
                          },
                          // defaultVerticalAlignment:
                          // TableCellVerticalAlignment.middle,
                          children: [
                            buildTableRow(context,
                                textLeftTable:
                                    activityScreenText.textactivity ??
                                        statusActivityTextActivity,
                                textRightTableDetail: data.name ?? '-'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable:
                                    activityScreenText.textstartdate ??
                                        statusActivityTextStartDate,
                                textRightTableDetail: data.startdate ?? '-'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable:
                                    activityScreenText.textfinishdate ??
                                        statusActivityTextFinishDate,
                                textRightTableDetail: data.finishdate ?? '-'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable: activityScreenText.edtapprover ??
                                    statusActivityEdtApprover,
                                textRightTableDetail: '$name  $lastname'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable: activityScreenText.textvenue ??
                                    statusActivityTextVenue,
                                textRightTableDetail: data.venue ?? '-'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable: activityScreenText.textobjectives ??
                                    statusActivityTextDetail,
                                textRightTableDetail: data.objectives ?? '-')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myIcon,
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          activityHeadStatus,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // showButton
              //     ? Padding(
              //         padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              //         child: Container(
              //           decoration: BoxDecoration(
              //             color: Colors.transparent,
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               SizedBox(
              //                   width: MediaQuery.of(context).size.width * 0.35,
              //                   child: ButtonCustom(
              //                     onPressed: () {
              //                       // context.read<ActivityBloc>().add(OnClickEditActivityScreenInfoEvent(data: data));
              //                       // context.read<ActivityBloc>().add(EditActivityScreenInfoEvent(data: data));
              //                       Navigator.pushReplacement(context,
              //                           MaterialPageRoute(builder: (context) {
              //                         return EditActivityScreen(data: data);
              //                       }));
              //                     },
              //                     label: '${activityScreenText.buttonleft}',
              //                     colortext: tcButtonTextBlack,
              //                     colorbutton: tcButtonTextWhite,
              //                     sizetext: sizeTextSmaller14,
              //                     colorborder: tcButtonTextBoarder,
              //                     sizeborder: 1.0,
              //                   )),
              //               const SizedBox(
              //                 width: 50,
              //               ),
              //               SizedBox(
              //                   width: MediaQuery.of(context).size.width * 0.35,
              //                   child: ButtonCustom(
              //                     colortext: tcButtonTextWhite,
              //                     colorbutton: tcButtonTextRed,
              //                     sizetext: sizeTextSmaller14,
              //                     colorborder: tcButtonTextRedBoarder,
              //                     sizeborder: 10,
              //                     label: '${activityScreenText.buttonright}',
              //                     onPressed: () {
              //                       dialogOneLineTwoBtnWarning(
              //                           context,
              //                           alertText?.alertdeleteactivity ?? "",
              //                           buttonText?.buttonyes ?? "",
              //                           buttonText?.buttonno ?? "",
              //                           onClickBtn: (String result) {
              //                         Navigator.of(context).pop();
              //                         switch (result) {
              //                           case 'Cancel':
              //                             {
              //                               break;
              //                             }
              //                           case 'OK':
              //                             {
              //                               context.read<ActivityBloc>().add(
              //                                   SubmitDeleteActivityByStudentEvent(
              //                                       id: int.parse(data.id)));
              //                               if (kDebugMode) {
              //                                 print('id คือ ${data.id}');
              //                               }
              //                             }
              //                         }
              //                       });
              //                     },
              //                   )),
              //             ],
              //           ),
              //         ),
              //       )
              //     : const Text(''),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ButtonCustom(
                    colortext: tcButtonTextWhite,
                    colorbutton: tcButtonTextRed,
                    sizetext: sizeTextSmaller14,
                    colorborder: tcButtonTextRedBoarder,
                    sizeborder: 10,
                    label: '${activityScreenText.buttonright}',
                    onPressed: () {
                      dialogOneLineTwoBtnWarning(
                          context,
                          alertText?.alertdeleteactivity ?? "",
                          buttonText?.buttonyes ?? "",
                          buttonText?.buttonno ?? "",
                          onClickBtn: (String result) {
                            Navigator.of(context).pop();
                            switch (result) {
                              case 'Cancel':
                                {
                                  break;
                                }
                              case 'OK':
                                {
                                  context.read<ActivityBloc>().add(
                                      SubmitDeleteActivityByStudentEvent(
                                          activityId: int.parse(data.activityid)));
                                  if (kDebugMode) {
                                    print('activity id คือ ${data.activityid}');
                                  }
                                }
                            }
                          });
                    },
                  )),
            ]),
          ),
        ),
      ));
}
