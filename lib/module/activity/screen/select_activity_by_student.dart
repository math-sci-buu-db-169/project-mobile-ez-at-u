import 'package:ez_at_u/customs/button/button_custom.dart';
import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/dialog/dialog_widget.dart';
import 'package:ez_at_u/customs/dropdown/custom_dropdown_for_approver.dart';
import 'package:ez_at_u/customs/dropdown/custom_dropdown_select_activity_name_by_student.dart';
import 'package:ez_at_u/customs/progress_dialog.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/customs/text_file/build_textformfiled_unlimit_custom.dart';
import 'package:ez_at_u/module/activity/bloc/activity_bloc.dart';
import 'package:ez_at_u/module/activity/model/response/add_edit_activity_screen_api.dart';
import 'package:ez_at_u/module/activity/model/response/select_activity_by_student_screen.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../customs/message/text_add_edit_activity.dart';

class SelectActivityByStudentScreen extends StatelessWidget {
  const SelectActivityByStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc()..add(SelectActivityByStudentScreenInfoEvent()),
      child: const SelectActivityByStudentPage(),
    );
  }
}

class SelectActivityByStudentPage extends StatefulWidget {
  const SelectActivityByStudentPage({Key? key}) : super(key: key);

  @override
  State<SelectActivityByStudentPage> createState() =>
      _SelectActivityByStudentPageState();
}

class _SelectActivityByStudentPageState
    extends State<SelectActivityByStudentPage> with ProgressDialog {
  TextEditingController activityNameId = TextEditingController();
  SelectActivityByStudentScreenApi? _selectActivityByStudentScreenApi;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<ActivityBloc>().add(AddActivityScreenInfoEvent());
    return BlocConsumer<ActivityBloc, ActivityState>(
      listener: (context, state) {
        if (state is SubmitSelectActivityByStudentLoadingState) {
          showProgressDialog(context);
        }
        if (state is SubmitSelectActivityByStudentEndLoadingState) {
          hideProgressDialog(context);
        }
        if (state is SubmitSelectActivityByStudentErrorState) {
          dialogOneLineOneBtn(context, '${state.message}\n ', "OK",
              onClickBtn: () {
            Navigator.of(context).pop();
          });
          if (kDebugMode) {
            print(state.message);
          }
        }
        if (state is SubmitSelectActivityByStudentState) {
          // print("TEST SubmitAddEditActivityState");
          // print(state.responseAddEdit.toJson());
          // print("TEST SubmitAddEditActivityState");
          // context.read<ActivityBloc>().add(ActivityEvent());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        if (state is selectActivityByStudentScreenInfoSuccessState) {
          _selectActivityByStudentScreenApi = state.response;

          return buildAddActivityBody(
            context,
            _selectActivityByStudentScreenApi,
            activityNameId,
          );
        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is selectActivityByStudentScreenInfoSuccessState;
      },
    );
  }
}

buildAddActivityBody(
  BuildContext context,
  SelectActivityByStudentScreenApi? selectActivityScreenByStudentApi,
  TextEditingController activityNameId,
) {
  var activityNameArray = selectActivityScreenByStudentApi?.body?.activitynamelist ?? [];
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
        selectActivityScreenByStudentApi?.body?.screeninfo?.titleselectactivity ??
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
            CustomDropdownSelectActivityNameByStudent(
              iconsFile: FontAwesomeIcons.envelopeOpenText,
              width: MediaQuery.of(context).size.width,
              dropdownList: activityNameArray,
              // hint: addActivityScreenApi?.body?.screeninfo?.edtapprover ??
              hint: selectActivityScreenByStudentApi?.body?.screeninfo?.textactivityname ??
                  textActivityName,
                callbackFromCustomDropdownActivityNameId:(String result){
                  activityNameId.text = result;
                  if (kDebugMode) {
                    print("activityNameId");
                    print(activityNameId.text);
                  }
                }
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: ButtonCustom(
                label: selectActivityScreenByStudentApi?.body?.screeninfo?.buttonselectactivity ??
                    activityBtnConfirm,
                colortext: tcButtonTextBlack,
                colorbutton: tcButtonTextWhite,
                sizetext: sizeTextBig20,
                colorborder: tcButtonTextBoarder,
                sizeborder: 10,
                onPressed: (){
                  context.read<ActivityBloc>().add(
                              SubmitSelectActivityByStudentEvent(
                                  activityNameId: int.parse(activityNameId.text)));
                }
                // {
                //   if (teacherId.text.isNotEmpty &&
                //       activityNameId.text.isNotEmpty) {
                //     context.read<ActivityBloc>().add(
                //         SubmitSelectActivityByStudentEvent(
                //             teacherId: teacherId.text,
                //             activityNameId: int.parse(activityNameId.text)));
                //   } else {
                //     dialogOneLineOneBtn(
                //         context,
                //         // addActivityScreenApi
                //                 // ?.body?.alertmessage?.alertfillallactivity ??
                //                 "hc กรอกให้ครย" ??
                //             alertFillAllActivity,
                //         // addActivityScreenApi?.body?.errorbutton?.buttonok ??
                //         "hc OK" ??
                //             buttonOK, onClickBtn: () {
                //       Navigator.of(context).pop();
                //     });
                //   }
                // },
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
