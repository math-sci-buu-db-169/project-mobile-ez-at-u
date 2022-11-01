import 'package:ez_at_u/customs/button/button_custom.dart';
import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/datepicker/custom_date_picker_for_edit.dart';
import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/dropdown/custom_dropdown_for_approver_edit.dart';
import 'package:ez_at_u/customs/dropdown/custom_dropdown_for_edit.dart';
import 'package:ez_at_u/customs/message/text_add_edit_activity.dart';
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

class EditActivityScreen extends StatelessWidget {
  final dynamic data;

  const EditActivityScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ActivityBloc()..add(EditActivityScreenInfoEvent()),
        // ..add(AddEditActivityScreenInfoEvent())
      child: EditActivityPage(
        data: data,
      ),
    );
  }
}

class EditActivityPage extends StatefulWidget {
  final dynamic data;

  const EditActivityPage({Key? key, required this.data}) : super(key: key);

  @override
  State<EditActivityPage> createState() => _EditActivityPageState();
}

class _EditActivityPageState extends State<EditActivityPage>
    with ProgressDialog {
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
  @override
  void initState(){
    activityName.text = widget.data.name;
    year.text = widget.data.year;
    term.text = widget.data.term;
    sDate.text = widget.data.startdate;
    fDate.text = widget.data.finishdate;
    totalTimeHours.text = widget.data.timehours;
    totalTimeMinutes.text = widget.data.timeminutes;
    venue.text = widget.data.venue;
    approver.text = widget.data.approvercode;
    detail.text = widget.data.detail;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    context.read<ActivityBloc>().add(EditActivityScreenInfoEvent());

    return BlocConsumer<ActivityBloc, ActivityState>(
        listener: (context, state) {
      if (state is EditActivityLoading) {
        showProgressDialog(context);
      }
      if (state is EditActivityLoading) {
        hideProgressDialog(context);
      }
      if (state is EditActivityError) {
        dialogOneLineOneBtn(context, '${state.message}\n ', "OK",
            onClickBtn: () {
          Navigator.of(context).pop();
        });
        if (kDebugMode) {
          print(state.message);
        }
      }
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      }
    }, builder: (context, state) {
      if (state is EditActivityScreenInfoSuccessState) {
        _addActivityScreenApi = state.response;
        if (kDebugMode) {
          print(_addActivityScreenApi?.head?.status);
        }
        if (kDebugMode) {
          print(_addActivityScreenApi?.body?.screeninfo?.titleeditact);
        }
        List<String>? yearList = _addActivityScreenApi?.body?.yearlist;
        List<String>? termList = _addActivityScreenApi?.body?.termlist;
        List<Approverlist>? approverList = _addActivityScreenApi?.body?.approverlist;
        String nameValue = "${widget.data.name}";
        String yearValue = "${widget.data.year}";
        String termValue = "${widget.data.term}";
        String sDateValue = "${widget.data.startdate}";
        String fDateValue = "${widget.data.finishdate}";
        String timeHoursValue = "${widget.data.timehours}";
        String timeMinutesValue = "${widget.data.timeminutes}";
        String venueValue = "${widget.data.venue}";
        String approverValue = "${widget.data.approvername} ${widget.data.approverlastname} ";
        String detailValue = "${widget.data.detail}";
        int idValue = int.parse(widget.data.id);
        return buildEditActivityBody(
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
            nameValue,
            yearValue,
            termValue,
            sDateValue,
            fDateValue,
            timeHoursValue,
            timeMinutesValue,
            venueValue,
            approverValue,
            detailValue,
            idValue,
            yearList,
            termList,
            approverList);
      } else {
        return Container(color: Colors.white,);
        // return Container(color: Colors.white,);
      }

    },buildWhen: (context, state){
      return state is EditActivityScreenInfoSuccessState;
    },
    );
  }
}

buildEditActivityBody(
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
  String nameValue,
  String yearValue,
  String termValue,
  String sDateValue,
  String fDateValue,
  String timeHoursValue,
  String timeMinutesValue,
  String venueValue,
  String approverValue,
  String detailValue,
  int idValue,
  List<String>? yearList,
  List<String>? termList,
  List<Approverlist>? approverList,
) {
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
        addActivityScreenApi?.body?.screeninfo?.titleeditact??activityTitleEditAct,
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
            BuildTextformfieldUnlimitCustom(
              initialvalue: nameValue,
              textEditingController: activityName
                // ..text = nameValue
              ,
              onChanged: (value) {
                activityName.text = value;
                if (kDebugMode) {
                  print(activityName.text);
                }
              },
              hintLabel:
                  addActivityScreenApi?.body?.screeninfo?.edtactname??activityEdtActName,
              textInputType: TextInputType.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customDropdownForEdit(
                  dropdownList: yearList ?? <String>[],
                  hint: 'Year',
                  width: MediaQuery.of(context).size.width * 0.4,
                  dropdownValue: yearValue,
                  callbackFromCustomDropdownForEdit: (String result) {
                    year.text = result;
                  },
                ),
                customDropdownForEdit(
                    dropdownList: termList ?? <String>[],
                    hint: 'Term',
                    width: MediaQuery.of(context).size.width * 0.4,
                    dropdownValue: termValue,
                    callbackFromCustomDropdownForEdit: (String result) {
                      term.text = result;
                    }),
              ],
            ),
            customDatePickerForEdit(
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edtstartdate??activityEdtStartDate,
              dateValue: sDateValue,
              callbackFromCustomDatePickerForEdit: (String result) {
                sDate.text = result;
                if (kDebugMode) {
                  print(sDate.text);
                }
              },
            ),
            customDatePickerForEdit(
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edtfinishdate??activityEdtFinishDate,
              dateValue: fDateValue,
              callbackFromCustomDatePickerForEdit: (String result) {
                fDate.text = result;
                if (kDebugMode) {
                  print(fDate.text);
                }
              },
            ),
            TextFieldCustom(
              initialvalue: timeHoursValue,
              textEditingController: totalTimeHours
                // ..text=timeValue
              ,
              onChanged: (value) {
                if (value.length == 1) {
                  totalTimeHours.text = "0$value";
                }else{
                  totalTimeHours.text = value;
                }
                if (kDebugMode) {
                  print("Edit Hours == ${totalTimeHours.text}");
                }
              },
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edttimehours??activityEdtTimeHours,
              textInputType: TextInputType.number,
              iconsFile : Icons.person_rounded,
            ),
            TextFieldCustom(
              initialvalue: timeMinutesValue,
              textEditingController: totalTimeMinutes
                // ..text=timeValue
              ,
              onChanged: (value) {
                if (value.length == 1) {
                  totalTimeMinutes.text = "0$value";
                }else{
                  totalTimeMinutes.text = value;
                }
                if (kDebugMode) {
                  print("Edit minutes == ${totalTimeMinutes.text}");
                }
              },
              hintLabel: addActivityScreenApi?.body?.screeninfo?.edttimehours??activityEdtTimeMinutes,
              textInputType: TextInputType.number,
              iconsFile : Icons.person_rounded,
            ),
            BuildTextformfieldUnlimitCustom(
              initialvalue: venueValue,
              textEditingController: venue
                // ..text=venueValue
              ,
              onChanged: (value) {
                venue.text = value;
                if (kDebugMode) {
                  print(venue.text);
                }
              },
              hintLabel:
                  addActivityScreenApi?.body?.screeninfo?.edtvenue??activityEdtVenue,
              textInputType: TextInputType.text,
            ),
            customDropdownForApproverEdit(
              width: MediaQuery.of(context).size.width,
              dropdownList: approverList ?? <String>[],
              hint: addActivityScreenApi?.body?.screeninfo?.edtapprover??activityEdtApprover,
              dropdownValue: approverValue,
              callbackFromCustomDropdownForEdit: (String result) {
                approver.text = result;
                if (kDebugMode) {
                  print(approver.text);
                }
              },
            ),
            BuildTextformfieldUnlimitCustom(
              initialvalue: detailValue,
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
                      fDate.text.isNotEmpty &&
                      venue.text.isNotEmpty &&
                      detail.text.isNotEmpty &&
                      sDate.text.isNotEmpty &&
                      activityName.text.isNotEmpty &&
                      term.text.isNotEmpty) {
                    context.read<ActivityBloc>().add(SubmitAddEditActivityEvent(
                        id: idValue,
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
