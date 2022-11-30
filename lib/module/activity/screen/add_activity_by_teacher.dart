import 'package:ez_at_u/customs/button/button_custom.dart';
import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/datepicker/custom_date_picker.dart';
import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/customs/text_file/build_textformfiled_unlimit_custom.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit_delete_activity_by_teacher_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../customs/message/text_add_edit_activity.dart';

class AddActivityByTeacherScreen extends StatelessWidget {
  const AddActivityByTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc()..add(getScreenAddEditDeleteActivityByTeacherEvent()),
      child: const AddActivityByTeacherPage(),
    );
  }
}

class AddActivityByTeacherPage extends StatefulWidget {
  const AddActivityByTeacherPage({Key? key}) : super(key: key);

  @override
  State<AddActivityByTeacherPage> createState() => _AddActivityByTeacherPageState();
}

class _AddActivityByTeacherPageState extends State<AddActivityByTeacherPage> with ProgressDialog {
  TextEditingController activityNameByTeacher = TextEditingController();
  TextEditingController objectives = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController fDate = TextEditingController();
  AddEditDeleteActivityByTeacherScreen? _addEditDeleteActivityByTeacherScreenApi;
  DateTime date = DateTime.now();
  late String? dateFormated;
  @override
  void initState() {
    dateFormated = DateFormat('d/M/y').format(date);
    sDate.text = dateFormated.toString();
    fDate.text = dateFormated.toString();
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

          return buildAddActivityByTeacherBody(
            context,
            _addEditDeleteActivityByTeacherScreenApi,
            activityNameByTeacher,
            objectives,
            sDate,
            fDate,

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

buildAddActivityByTeacherBody(
  BuildContext context,
    AddEditDeleteActivityByTeacherScreen? addEditDeleteActivityScreenByTeacherApi,
  TextEditingController activityNameByTeacher,
  TextEditingController objectives,
  TextEditingController sDate,
  TextEditingController fDate,
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
        addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.titleaddactivity ??
            activityTitleAddAct,
        style: TextStyle(
          color: appBarforegroundColor,
          fontSize: sizeTitle24,
        ),
      ),
    ),
    body: SafeArea(
      // height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            BuildTextformfieldUnlimitCustom(
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
            CustomDatePicker(
              hintLabel: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textstartdate ??
                  activityEdtStartDate,
              callbackFromCustomDatePicker: (String result) {
                sDate.text = result;
                if (kDebugMode) {
                  print(sDate.text);
                }
              },
            ),
            CustomDatePicker(
              hintLabel:
                  addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.textfinishdate ??
                      activityEdtFinishDate,
              callbackFromCustomDatePicker: (String result) {
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
            Center(
              child: ButtonCustom(
                label: addEditDeleteActivityScreenByTeacherApi?.body?.screeninfo?.buttonadd ??
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
                        id: 0,
                        activityNameByTeacher: activityNameByTeacher.text,
                        objectives: objectives.text,
                        sDate: sDate.text,
                        fDate: fDate.text,

                    ));
                  }
                  // else {
                  //   dialogOneLineOneBtn(
                  //       context,
                  //       addEditDeleteActivityScreenByTeacherApi
                  //               ?.body?.alertmessage?.alertfillallactivity ??
                  //           alertFillAllActivity,
                  //       addEditDeleteActivityScreenByTeacherApi?.body?.errorbutton?.buttonok ??
                  //           buttonOK, onClickBtn: () {
                  //     Navigator.of(context).pop();
                  //   });
                  // }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    ),
  );
}
