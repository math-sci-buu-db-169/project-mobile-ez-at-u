import 'package:ez_at_u/customs/button/button_custom.dart';
import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/datepicker/custom_date_picker_for_edit.dart';
import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/customs/text_file/build_textformfiled_unlimit_custom.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit_delete_activity_by_teacher_screen.dart';
import 'package:ez_at_u/module/activity/screen/activity_name_by_teacher_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../customs/message/text_add_edit_activity.dart';

class EditActivityByTeacherScreen extends StatelessWidget {
  final dynamic data;
  const EditActivityByTeacherScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc()..add(getScreenAddEditDeleteActivityByTeacherEvent()),
      child: EditActivityByTeacherPage(data: data,),
    );
  }
}

class EditActivityByTeacherPage extends StatefulWidget {
  final dynamic data;
  const EditActivityByTeacherPage({Key? key, required this.data}) : super(key: key);

  @override
  State<EditActivityByTeacherPage> createState() => _EditActivityByTeacherPageState();
}

class _EditActivityByTeacherPageState extends State<EditActivityByTeacherPage> with ProgressDialog {
  TextEditingController activityNameByTeacher = TextEditingController();
  TextEditingController objectives = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController fDate = TextEditingController();
  AddEditDeleteActivityByTeacherScreen? _addEditDeleteActivityByTeacherScreenApi;
  @override
  void initState() {
    activityNameByTeacher.text = widget.data.activitynameresponse;
    objectives.text = widget.data.objectivesresponse;
    venue.text = widget.data.venueresponse;
    sDate.text = widget.data.startdatebyteacherresponse;
    fDate.text = widget.data.finishdatebyteacherresponse;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<ActivityBloc>().add(AddActivityScreenInfoEvent());
    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state) {
        if (state is SubmitAddEditActivityByTeacherLoadingState) {
          showProgressDialog(context);
        }
        if (state is SubmitAddEditActivityByTeacherEndLoadingState) {
          hideProgressDialog(context);
        }
        if (state is SubmitAddEditDeleteByTeacherActivityState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ActivityNameListByTeacherScreen()));
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
        if (state is getScreenAddEditDeleteActivityByTeacherSuccessState) {
          _addEditDeleteActivityByTeacherScreenApi = state.response;
          int activityNameIdValue = widget.data.activitynameidresponse;
          String activityNameValue = "${widget.data.activitynameresponse}";
          String objectivesValue = "${widget.data.objectivesresponse}";
          String venueValue = "${widget.data.venueresponse}";
          String sDateValue= "${widget.data.startdatebyteacherresponse}";
          String fDateValue = "${widget.data.finishdatebyteacherresponse}";
          return buildEditActivityByTeacherBody(
            context,
            _addEditDeleteActivityByTeacherScreenApi,
            activityNameByTeacher,
            objectives,
              venue,
            sDate,
            fDate,
              activityNameIdValue,
              activityNameValue,
              objectivesValue,
              venueValue,
              sDateValue,
              fDateValue

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
        return state is getScreenAddEditDeleteActivityByTeacherSuccessState;
      },
    );
  }
}

buildEditActivityByTeacherBody(
  BuildContext context,
    AddEditDeleteActivityByTeacherScreen? addEditDeleteActivityScreenByTeacherApi,
  TextEditingController activityNameByTeacher,
  TextEditingController objectives,
  TextEditingController venue,
  TextEditingController sDate,
  TextEditingController fDate,
    int activityNameIdValue,
    String activityNameValue,
    String objectivesValue,
    String venueValue,
    String sDateValue,
    String fDateValue
) {
  Color? appBarBackgroundColor =
      Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
  Color? appBarforegroundColor =
      Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: appBarBackgroundColor,
      elevation: 0,
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
        addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.titleeditactivity ??
            activityTitleEditAct,
        style: TextStyle(
          color: appBarforegroundColor,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea(
      // height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    BuildTextformfieldUnlimitCustom(
                      initialvalue: activityNameValue,
                      textEditingController: activityNameByTeacher,
                      onChanged: (value) {
                        activityNameByTeacher.text = value;
                        if (kDebugMode) {
                          print(activityNameByTeacher.text);
                        }
                      },
                      hintLabel: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textactivityname ??
                          activityEdtActName,
                      textInputType: TextInputType.text,
                      // iconsFile : Icons.person_rounded,
                      iconsFile: FontAwesomeIcons.solidPenToSquare,
                    ),
                    BuildTextformfieldUnlimitCustom(
                      initialvalue: objectivesValue,
                      textEditingController: objectives,
                      onChanged: (value) {
                        objectives.text = value;
                        if (kDebugMode) {
                          print(objectives.text);
                        }
                      },
                      hintLabel: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textobjectives ??
                          activityEdtActName,
                      textInputType: TextInputType.text,
                      // iconsFile : Icons.person_rounded,
                      iconsFile: FontAwesomeIcons.bullseye,
                    ),
                    BuildTextformfieldUnlimitCustom(
                      initialvalue: venueValue,
                      textEditingController: venue,
                      onChanged: (value) {
                      venue.text = value;
                        if (kDebugMode) {
                          print(objectives.text);
                        }
                      },
                      hintLabel: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textvenue ??
                          activityEdtActName,
                      textInputType: TextInputType.text,
                      // iconsFile : Icons.person_rounded,
                      iconsFile: FontAwesomeIcons.locationDot,
                    ),
                    customDatePickerForEdit(
                      textOnTopOfDatePicker: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textstartdate??activityEdtStartDate,
                      hintLabel: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textstartdate??activityEdtStartDate,
                      dateValue: sDateValue,
                      callbackFromCustomDatePickerForEdit: (String result) {
                        sDate.text = result;
                        if (kDebugMode) {
                          print(sDate.text);
                        }
                      },
                    ),
                    customDatePickerForEdit(
                      textOnTopOfDatePicker: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textfinishdate??activityEdtFinishDate,
                      hintLabel: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textfinishdate??activityEdtFinishDate,
                      dateValue: fDateValue,
                      callbackFromCustomDatePickerForEdit: (String result) {
                        fDate.text = result;
                        if (kDebugMode) {
                          print(fDate.text);
                        }
                      },
                    ),
                    // CustomTimePicker(
                    //   hintLabel: addActivityScreenApi?.body?.screeninfo?.edttime??activityEdtTime,
                    //   callbackFromCustomTimePicker: (String result) {
                    //     fDate.text = result;
                    //     if (kDebugMode) {
                    //       print(fDate.text);
                    //     }
                    //   },
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ButtonCustom(
                    label: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.buttonsave ??
                        activityBtnConfirm,
                    colortext: tcButtonTextBlack,
                    colorbutton: tcButtonTextWhite,
                    sizetext: sizeTextBig20,
                    colorborder: tcButtonTextBoarder,
                    sizeborder: 10,
                    onPressed: () {
                      if (activityNameByTeacher.text.isNotEmpty &&
                          objectives.text.isNotEmpty &&
                          sDate.text.isNotEmpty &&
                          fDate.text.isNotEmpty) {
                        context.read<ActivityBloc>().add(SubmitAddEditDeleteActivityByTeacherEvent(
                            id: activityNameIdValue,
                            activityNameByTeacher: activityNameByTeacher.text,
                            objectives: objectives.text,
                            venue: (venue.text.isEmpty)?"-":venue.text,
                            sDate: sDate.text,
                            fDate: fDate.text,
                            isDelete: "false"
                        ));
                      }else {
                        dialogOneLineOneBtn(
                            context,
                            // addEditDeleteActivityScreenByTeacherApi
                            //     ?.body?.alertmessage?.alertfillallactivity ??
                            alertFillAllActivity??alertFillAllActivity,
                            // addEditDeleteActivityScreenByTeacherApi?.body?.errorbutton?.buttonok ??
                            buttonOK??
                                buttonOK, onClickBtn: () {
                          Navigator.of(context).pop();
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: ButtonCustom(
                      colortext: tcButtonTextWhite,
                      colorbutton: tcButtonTextRed,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextRedBoarder,
                      sizeborder: 10,
                      label: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.buttondelete?? "Delete",
                      onPressed: () {
                        dialogOneLineTwoBtnWarning(
                            context,
                            // alertText?.alertdeleteactivity ?? "",
                            // buttonText?.buttonyes ?? "",
                            // buttonText?.buttonno ?? "",
                            addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.warningdeletetext?? "Do you want to delete this activity?",
                            addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.buttondelete?? "Delete",
                            addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.buttoncancel?? "Cancel",
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
                                        SubmitAddEditDeleteActivityByTeacherEvent(
                                            id: activityNameIdValue,
                                            activityNameByTeacher: activityNameByTeacher.text,
                                            objectives: objectives.text,
                                            venue: venue.text,
                                            sDate: sDate.text,
                                            fDate: fDate.text,
                                            isDelete: "true"
                                        ));
                                  }
                              }
                            });
                      },
                    )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    ),
  );
}
