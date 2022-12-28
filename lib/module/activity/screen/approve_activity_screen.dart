import 'package:ez_at_u/customs/button/button_custom.dart';
import 'package:ez_at_u/customs/message/text_activity.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/screen/activity_list_for_teacher_role.dart';
import 'package:ez_at_u/module/activity/screen/edit_activity.dart';
import 'package:ez_at_u/module/activity/screen/item_activity_for_teacher_role.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/size/size.dart';

class ApproveActivityScreen extends StatelessWidget {
  final dynamic activityScreenText;
  final dynamic data;
  final dynamic buttonText;
  final dynamic alertText;
  final Color appBarBackgroundColor;
  final Color appBarForegroundColor;
  const ApproveActivityScreen(
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
      child: ApproveActivityPage(
          appBarBackgroundColor: appBarBackgroundColor,
          appBarForegroundColor: appBarForegroundColor,
          activityScreenText: activityScreenText,
          data: data,
          buttonText: buttonText,
          alertText: alertText),
    );
  }
}

class ApproveActivityPage extends StatefulWidget {
  final dynamic activityScreenText;
  final dynamic data;
  final dynamic buttonText;
  final dynamic alertText;
  final Color appBarBackgroundColor;
  final Color appBarForegroundColor;

  const ApproveActivityPage(
      {Key? key,
      required this.activityScreenText,
      required this.data,
      required this.buttonText,
      required this.alertText,
        required this.appBarBackgroundColor,
        required this.appBarForegroundColor})
      : super(key: key);

  @override
  State<ApproveActivityPage> createState() => _ApproveActivityPageState();
}

class _ApproveActivityPageState extends State<ApproveActivityPage>
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

  //---------------------------------API----------------------------------------//
  @override
  void initState() {
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
          // show dialog error
          if (kDebugMode) {
            print(state.message);
          }
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
  if (data.status == "Unapproved!") {
    if (kDebugMode) {
      print('เข้า Unapproved!');
    }
    showButton = true;
  } else if (data.status == "Approved!") {
    if (kDebugMode) {
      print('เข้า Approved!');
    }
    showButton = false;
  } else if (data.status == "Rejected!") {
    if (kDebugMode) {
      print('เข้า Rejected');
    }
    showButton = false;
  }
  String name = data.stdname ?? '-';
  String lastname = data.stdlastname ?? '-';
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
          child:
          Text(
            activityScreenText.titleteacheractivity,
            // 'ยืนยันกิจกรรม',
            // '${data.status}',
            // activityHeadStatus,
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
                                textRightTableDetail: data.acname ?? '-'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable:
                                    activityScreenText.startdate ??
                                        statusActivityTextStartDate,
                                textRightTableDetail: data.startdate ?? '-'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable:
                                    activityScreenText.finishdate ??
                                        statusActivityTextFinishDate,
                                textRightTableDetail: data.finishdate ?? '-'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable: activityScreenText.student ??
                                    statusActivityEdtApprover,
                                textRightTableDetail: '$name  $lastname'),
                            _buildListEmpty(),
                            buildTableRow(context,
                                textLeftTable: activityScreenText.venue ??
                                    statusActivityTextVenue,
                                textRightTableDetail: data.venue ?? '-'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

        Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                          child: SizedBox(
                              width: double.infinity,
                              child: ButtonCustom(
                                onPressed: () {
                                  context.read<ActivityBloc>().add(SubmitApproveActivityByTeacherEvent(activityid: data.acid, status: 'A'));
                                  // context.read<ActivityBloc>().add(EditActivityScreenInfoEvent(data: data));
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ActivityListForTeacher();
                                  }));
                                },
                                // label: '${activityScreenText.buttonleft}',
                                label: activityScreenText.buttonapprove,
                                colortext: tcButtonTextBlack,
                                colorbutton: Color(0xFFC5FEAC),
                                sizetext: sizeTextSmaller14,
                                colorborder: Color(0xFFC5FEAC),
                                sizeborder: 10.0,
                              )),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                          child: SizedBox(
                              width: double.infinity,
                              child: ButtonCustom(
                                onPressed: () {
                                  context.read<ActivityBloc>().add(SubmitApproveActivityByTeacherEvent(activityid: data.acid, status: 'R'));
                                  // context.read<ActivityBloc>().add(EditActivityScreenInfoEvent(data: data));
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                        return ActivityListForTeacher();
                                      }));
                                },
                                // label: '${activityScreenText.buttonleft}',
                                label: activityScreenText.buttondisapprove,
                                colortext: tcButtonTextBlack,
                                colorbutton: Color(0xFFF3F6F4),
                                sizetext: sizeTextSmaller14,
                                colorborder: Color(0xFFF3F6F4),
                                sizeborder: 10.0,
                              )),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                        //   child: SizedBox(
                        //       width: double.infinity,
                        //       child: ButtonCustom(
                        //         onPressed: () {
                        //           // context.read<ActivityBloc>().add(OnClickEditActivityScreenInfoEvent(data: data));
                        //           // context.read<ActivityBloc>().add(EditActivityScreenInfoEvent(data: data));
                        //           Navigator.pushReplacement(context,
                        //               MaterialPageRoute(builder: (context) {
                        //                 return EditActivityScreen(data: data);
                        //               }));
                        //         },
                        //         // label: '${activityScreenText.buttonleft}',
                        //         label: 'REJECT',
                        //         colortext: tcButtonTextBlack,
                        //         colorbutton: Color(0xFFF1F5F2),
                        //         sizetext: sizeTextSmaller14,
                        //         colorborder: Color(0xFFF1F5F2),
                        //         sizeborder: 10.0,
                        //       )),
                        // ),
                        // const SizedBox(
                        //   width: 50,
                        // ),
                      ],
                    ),
                  ),
                )


              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.transparent,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         myIcon,
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(top: 8.0),
              //           child: Text(
              //             "ยืนยันกิจกรรม",
              //             style: const TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
              //                                   SubmitDeleteActivityEvent(
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
            ]),
          ),
        ),
      ));
}
