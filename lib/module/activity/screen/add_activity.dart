import 'package:ez_at_u/customs/button/button_custom.dart';
import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/datepicker/custom_date_picker.dart';
import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/dropdown/custom_dropdown.dart';
import 'package:ez_at_u/customs/dropdown/custom_dropdown_for_approver.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/customs/text_file/build_textformfiled_unlimit_custom.dart';
import 'package:ez_at_u/customs/text_file/text_field_custom.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit_activity_screen_api.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../customs/message/text_add_edit_activity.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ActivityBloc()..add(AddActivityScreenInfoEvent()),
      child: const AddActivityPage(),
    );
  }
}

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> with ProgressDialog {
  TextEditingController activityName = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController sDate = TextEditingController();
  TextEditingController fDate = TextEditingController();
  TextEditingController totalTimeHours = TextEditingController();
  TextEditingController totalTimeMinutes = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController approver = TextEditingController();
  TextEditingController detail = TextEditingController();
  AddEditActivityScreenApi? _addActivityScreenApi;
  DateTime date = DateTime.now();
  late String? dateFormated;
  @override
  void initState(){
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
        if (state is SubmitAddEditActivityLoadingState) {
          showProgressDialog(context);
        }
        if (state is SubmitAddEditActivityEndLoadingState) {
          hideProgressDialog(context);
        }
        if (state is SubmitAddEditActivityError) {
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK",
              onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is SubmitAddEditActivityState) {
          // print("TEST SubmitAddEditActivityState");
          // print(state.responseAddEdit.toJson());
          // print("TEST SubmitAddEditActivityState");
          // context.read<ActivityBloc>().add(ActivityEvent());
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
        }
      },
      builder: (context, state) {
        if (state is ActivityScreenInfoSuccessState) {
          _addActivityScreenApi = state.response;

          return buildAddActivityBody(
            context,
            _addActivityScreenApi,
            activityName,
            year,
            term,
            sDate,
            fDate,
            totalTimeHours,
            totalTimeMinutes,
            venue,
            approver,
            detail,
          );
        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is ActivityScreenInfoSuccessState;
      },
    );
  }
}

buildAddActivityBody(
  BuildContext context,
  AddEditActivityScreenApi? addActivityScreenApi,
  TextEditingController activityName,
  TextEditingController year,
  TextEditingController term,
  TextEditingController sDate,
  TextEditingController fDate,
  TextEditingController totalTimeHours,
  TextEditingController totalTimeMinutes,
  TextEditingController venue,
  TextEditingController approver,
  TextEditingController detail,
) {
  // print(addActivityScreenApi?.head?.status);
  // print(addActivityScreenApi?.body?.screeninfo?.titleaddact);
  List<String>? yearList = addActivityScreenApi?.body?.yearlist;
  List<String>? termList = addActivityScreenApi?.body?.termlist;
  // List<String>? approverList = addActivityScreenApi?.body?.approverlist;
  var approverArray = addActivityScreenApi?.body?.approverlist ?? [];
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: sizeTitle24,
          color: Colors.black,
        ),
      ),
      title: Text(
        addActivityScreenApi?.body?.screeninfo?.titleaddact??activityTitleAddAct,
        style: const TextStyle(
          color: Colors.black,
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
            TextFieldCustom(
              textEditingController: activityName,
              onChanged: (value) {
                activityName.text = value;
                if (kDebugMode) {
                  print(activityName.text);
                }
              },
              hintLabel:
                  addActivityScreenApi?.body?.screeninfo?.edtactname??activityEdtActName,
              textInputType: TextInputType.text,
              iconsFile : Icons.person_rounded,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customDropdown(
                  dropdownList: yearList ?? <String>[],
                  hint: addActivityScreenApi?.body?.screeninfo?.edtyear??activityEdtYear,
                  width: MediaQuery.of(context).size.width * 0.4,
                  callbackFromCustomDropdown: (String result) {
                    year.text = result;
                    if (kDebugMode) {
                      print(year.text);
                    }
                  },
                ),
                customDropdown(
                  dropdownList: termList ?? <String>[],
                  hint: addActivityScreenApi?.body?.screeninfo?.edtterm??activityEdtTerm,
                  width: MediaQuery.of(context).size.width * 0.4,
                  callbackFromCustomDropdown: (String result) {
                    term.text = result;
                    if (kDebugMode) {
                      print(term.text);
                    }
                  },
                ),
              ],
            ),
            CustomDatePicker(
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edtstartdate??activityEdtStartDate,
              callbackFromCustomDatePicker: (String result) {
                sDate.text = result;
                if (kDebugMode) {
                  print(sDate.text);
                }
              },
            ),
            CustomDatePicker(
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edtfinishdate??activityEdtFinishDate,
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
            TextFieldCustom(
              textEditingController: totalTimeHours,
              onChanged: (value) {
                if (value.length == 1) {
                  totalTimeHours.text = "0$value";
                }else{
                  totalTimeHours.text = value;
                }
                // totalTimeHours.text = value;
                if (kDebugMode) {
                  print("Hours == ${totalTimeHours.text}");
                }
              },
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edttimehours??activityEdtTimeHours,
              textInputType: TextInputType.number,
              iconsFile : Icons.person_rounded,
            ),
            TextFieldCustom(
              textEditingController: totalTimeMinutes,
              onChanged: (value) {
                if (value.length == 1) {
                  totalTimeMinutes.text = "0$value";
                }else{
                  totalTimeMinutes.text = value;
                }
                // totalTimeMinutes.text = value;
                if (kDebugMode) {
                  print("Minutes == ${totalTimeMinutes.text}");
                }
              },
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edttimeminutes??activityEdtTimeMinutes,
              textInputType: TextInputType.number,
              iconsFile : Icons.person_rounded,
            ),
            TextFieldCustom(
              textEditingController: venue,
              onChanged: (value) {
                venue.text = value;
                if (kDebugMode) {
                  print(venue.text);
                }
              },
              hintLabel:
                  addActivityScreenApi?.body?.screeninfo?.edtvenue??activityEdtVenue,
              textInputType: TextInputType.text,
              iconsFile : Icons.person_rounded,
            ),
            CustomDropdownApprover(
              width: MediaQuery.of(context).size.width,
              dropdownList: approverArray,
              hint: addActivityScreenApi?.body?.screeninfo?.edtapprover??activityEdtApprover,
              callbackFromCustomDropdown: (String result) {
                approver.text = result;
                if (kDebugMode) {
                  print(approver.text);
                }
              },
            ),
            BuildTextformfieldUnlimitCustom(
              textEditingController: detail,
              onChanged: (value) {
                detail.text = value;
                if (kDebugMode) {
                  print(detail.text);
                }
              },
              hintLabel:
                  addActivityScreenApi?.body?.screeninfo?.edtdetail??activityEdtDetail,
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: ButtonCustom(
                label: addActivityScreenApi?.body?.screeninfo?.btnconfirm??activityBtnConfirm,
                colortext: tcButtonTextBlack,
                colorbutton: tcButtonTextWhite,
                sizetext: sizeTextBig20,
                colorborder: tcButtonTextBoarder,
                sizeborder: 10,
                onPressed: () {
                  if (year.text.isNotEmpty &&
                      totalTimeHours.text.isNotEmpty &&
                      totalTimeMinutes.text.isNotEmpty &&
                      approver.text.isNotEmpty &&
                      // fDate.text.isNotEmpty &&
                      venue.text.isNotEmpty &&
                      detail.text.isNotEmpty &&
                      // sDate.text.isNotEmpty &&
                      activityName.text.isNotEmpty &&
                      term.text.isNotEmpty) {
                    context.read<ActivityBloc>().add(SubmitAddEditActivityEvent(
                        id: 0,
                        year: year.text,
                        totalTimeHours: totalTimeHours.text,
                        totalTimeMinutes: totalTimeMinutes.text,
                        approver: approver.text,
                        fDate: fDate.text,
                        venue: venue.text,
                        detail: detail.text,
                        sDate: sDate.text,
                        activityName: activityName.text,
                        term: term.text));
                  } else {
                    dialogOneLineOneBtn(
                        context, addActivityScreenApi?.body?.alertmessage?.alertfillallactivity??alertFillAllActivity, addActivityScreenApi?.body?.errorbutton?.buttonok??buttonOK,
                        onClickBtn: () {
                      Navigator.of(context).pop();
                    });
                  }
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
