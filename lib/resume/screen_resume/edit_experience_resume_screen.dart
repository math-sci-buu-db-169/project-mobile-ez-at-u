import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../utils/shared_preferences.dart';
import '../../customs/button/button_custom.dart';
import '../../customs/color/color_const.dart';
import '../../customs/datepicker/custom_date_picker_for_resume.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import 'content_design_resume_edit.dart';
import '../model/response/get_experience_resume_response.dart';

class EditExperienceResumeScreen extends StatelessWidget {
  final int id;
  final int count;
  const EditExperienceResumeScreen({
    Key? key,
    required this.id,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ResumeBloc()..add(GetEditScreenExperienceResumeEvent(id: id)),
        // child: const GenerativeWidget());
        child: EditExperienceResumePage(
          id: id,
          count: count,
        ));
  }
}

class EditExperienceResumePage extends StatefulWidget {
  final int id;
  final int count;
  const EditExperienceResumePage({
    Key? key,
    required this.id,
    required this.count,
  }) : super(key: key);

  @override
  State<EditExperienceResumePage> createState() => _EditExperienceResumePageState();
}

class _EditExperienceResumePageState extends State<EditExperienceResumePage> with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late int searchStatus;
  late int isSearchStatus;
  late String typeStatus;
  GetExperienceResumeResponse? isGetExperienceResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    searchStatus = 0;
    isSearchStatus = 0;
    typeStatus = '';
    getUserLanguage();
    _isSessionUnauthorized();
    startDateController.text = DateFormat('M/y').format(DateTime.now());
    endDateController.text = DateFormat('M/y').format(DateTime.now());
    context.read<ResumeBloc>().add(GetEditScreenExperienceResumeEvent(id: widget.id));
    super.initState();
  }

  getUserLanguage() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired = valueLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = valueLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = valueLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  TextEditingController positionControllerTH = TextEditingController();
  TextEditingController positionControllerEN = TextEditingController();
  TextEditingController detailControllerTH = TextEditingController();
  TextEditingController detailControllerEN = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  // List<String> lengthPopupMenuItem =["High School Certificate","Bachelor Degrees","Master Degrees","Doctor Degrees","Honorary Doctorate Degree"];

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenExperienceResumeSuccessState) {
          isGetExperienceResumeResponse = state.isGetExperienceResumeResponse;
          setState(() {
            searchStatus = isGetExperienceResumeResponse?.body?.data?.orderchoose ?? 0;
          });
        }
        if (state is SentEditExperienceResumeSuccessState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const ContentDesignResumeEditScreen()));
        }
        if (state is ExperiencePreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is ExperiencePreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ExperienceResumeError) {
          if (state.errorMessage.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
            });
          } else if (state.errorMessage.toUpperCase().toString() == 'S401EXP01' || state.errorMessage.toUpperCase().toString() == 'T401NOT01') {
            dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
            });
          } else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk, onClickBtn: () {
              Navigator.of(context).pop();
            });
          }
        }
      },
      builder: (context, state) {
        if (state is GetEditScreenExperienceResumeSuccessState) {
          isGetExperienceResumeResponse = state.isGetExperienceResumeResponse;
          String? textPositionTh = '${isGetExperienceResumeResponse?.body?.screeninfo?.positionTh} *';
          String? textPositionEn = '${isGetExperienceResumeResponse?.body?.screeninfo?.positionEn} *';
          String? textDetailTh = '${isGetExperienceResumeResponse?.body?.screeninfo?.descriptionTh} *';
          String? textDetailEn = '${isGetExperienceResumeResponse?.body?.screeninfo?.descriptionEn} *';
          String? textEditInfo = isGetExperienceResumeResponse?.body?.screeninfo?.editinfomations;
          String? textSave = isGetExperienceResumeResponse?.body?.screeninfo?.save;
          String? textStartDateTh = isGetExperienceResumeResponse?.body?.screeninfo?.startdateTh;
          String? textStartDateEn = isGetExperienceResumeResponse?.body?.screeninfo?.startdateEn;
          String? textEndDateTh = isGetExperienceResumeResponse?.body?.screeninfo?.enddateTh;
          String? textEndDateEn = isGetExperienceResumeResponse?.body?.screeninfo?.enddateEn;
          String? positionTh = isGetExperienceResumeResponse?.body?.data?.positionTh;
          String? positionEn = isGetExperienceResumeResponse?.body?.data?.positionEn;
          String? detailTh = isGetExperienceResumeResponse?.body?.data?.detailTh;
          String? detailEn = isGetExperienceResumeResponse?.body?.data?.detailEn;
          String? startDate = isGetExperienceResumeResponse?.body?.data?.startdate;
          String? endDate = isGetExperienceResumeResponse?.body?.data?.enddate;

          isSearchStatus = isGetExperienceResumeResponse?.body?.data?.orderchoose ?? 0;
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    dialogOneLineTwoBtnWarning(
                        context,
                        "${isGetExperienceResumeResponse?.body?.alertmessage?.alertsavedataTh ?? "คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่?"}\n${isGetExperienceResumeResponse?.body?.alertmessage?.alertsavedataEn ?? "Do you want to save this information?"}",
                        isGetExperienceResumeResponse?.body?.errorbutton?.buttonyes ?? "yes ",
                        isGetExperienceResumeResponse?.body?.errorbutton?.buttonno ?? "No", onClickBtn: (String result) {
                      Navigator.of(context).pop();
                      switch (result) {
                        case 'Cancel':
                          {
                            //"No"

                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (BuildContext context) => const ContentDesignResumeEditScreen()));
                            print('Cancel');
                            break;
                          }
                        case 'OK':
                          {
                            //"Yes"
                            if (((positionControllerTH.text == '' ? positionTh : positionControllerTH.text) ?? '') == '' ||
                                ((positionControllerEN.text == '' ? positionEn : positionControllerEN.text) ?? '') == '' ||
                                ((detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '') == '' ||
                                ((detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '') == '' ||
                                ((startDateController.text == '' ? startDate : startDateController.text) ?? '') == '' ||
                                ((endDateController.text == '' ? endDate : endDateController.text) ?? '') == '') {
                              dialogOneLineOneBtn(
                                  context,
                                  '${isGetExperienceResumeResponse?.body?.alertmessage?.completefieldsTh ?? "กรุณากรอกให้ครบทุกช่อง"}\n'
                                  '${isGetExperienceResumeResponse?.body?.alertmessage?.completefieldsEn ?? "Please complete all fields."} ',
                                  _buttonOk, onClickBtn: () {
                                Navigator.of(context).pop();
                              });
                            } else {
                              context.read<ResumeBloc>().add(SentEditExperienceResumeEvent(
                                    edit: true,
                                    id: widget.id,
                                    orderChoose: searchStatus,
                                    positionTH: (positionControllerTH.text == '' ? positionTh : positionControllerTH.text) ?? '',
                                    positionEN: (positionControllerEN.text == '' ? positionEn : positionControllerEN.text) ?? '',
                                    detailTH: (detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '',
                                    detailEN: (detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '',
                                    startDate: (startDateController.text == '' ? startDate : startDateController.text) ?? '',
                                    endDate: (endDateController.text == '' ? endDate : endDateController.text) ?? '',
                                  ));
                            }
                          }
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
                ),
                title: Text(textEditInfo ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Theme.of(context).appBarTheme.foregroundColor))),
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDatePickerForResumeMMYY(
                        textOnTopOfDatePicker: '$textStartDateTh / $textStartDateEn  *',
                        hintLabel: '$textStartDateTh / $textStartDateEn  *',
                        callbackFromCustomDatePicker: (String result) {
                          startDateController.text = result;
                          if (kDebugMode) {
                            print(startDateController.text);
                          }
                        },
                      ),
                      CustomDatePickerForResumeMMYY(
                        textOnTopOfDatePicker: '$textEndDateTh / $textEndDateEn  *',
                        hintLabel: '$textEndDateTh / $textEndDateEn  *',
                        callbackFromCustomDatePicker: (String result) {
                          endDateController.text = result;
                          if (kDebugMode) {
                            print(endDateController.text);
                          }
                        },
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: positionControllerTH,
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            positionControllerTH.text = valueNameControllerTH;
                          });
                          if (kDebugMode) {
                            print(positionControllerTH.text);
                          }
                        },
                        hintLabel: textPositionTh,
                        initialvalue: positionTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: positionControllerEN,
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            positionControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(positionControllerEN.text);
                          }
                        },
                        hintLabel: textPositionEn,
                        initialvalue: positionEn,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: detailControllerTH,
                        onChanged: (valueDetailControllerTH) {
                          setState(() {
                            detailControllerTH.text = valueDetailControllerTH;
                          });
                          if (kDebugMode) {
                            print(detailControllerTH.text);
                          }
                        },
                        hintLabel: textDetailTh,
                        initialvalue: detailTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: detailControllerEN,
                        onChanged: (valueDetailControllerEN) {
                          setState(() {
                            detailControllerEN.text = valueDetailControllerEN;
                          });

                          if (kDebugMode) {
                            print(detailControllerEN.text);
                          }
                        },
                        hintLabel: textDetailEn,
                        initialvalue: detailEn,
                        textInputType: TextInputType.text,
                      ),
                      PopupMenuButton(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                padding: EdgeInsets.only(right: 5, left: 5, top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Theme.of(context).primaryColor == Colors.black ? Color(0xFF1F222A) : Colors.transparent.withOpacity(0.03),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        searchStatus == 0
                                            ? isSearchStatus == 0
                                                ? "โปรดเลือกลำดับการแสดง"
                                                : "การแสดงอันดับที่  $isSearchStatus"
                                            : "การแสดงอันดับที่  $searchStatus",
                                        style: TextStyle(
                                            // decoration: TextDecoration.underline,
                                            decorationThickness: 2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).appBarTheme.foregroundColor),
                                      ),
                                      Text(
                                        'เลือก',
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            decorationThickness: 2,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).appBarTheme.foregroundColor),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        itemBuilder: (context) {
                          return List.generate(widget.count, (index) {
                            return PopupMenuItem(
                              value: index + 1,
                              child: Text(
                                "${index + 1}" ?? 'Settings',
                                style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),
                              ),
                            );
                          });
                        },
                        onSelected: (value) {
                          isSearchStatus = value;
                          searchStatus = value;
                          setState(() {
                            isSearchStatus = value;
                            searchStatus = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: widget.id > 0 ? null : MediaQuery.of(context).size.width - 50,
                            child: ButtonIconsCustomLimit(
                              label: widget.id > 0
                                  ? isGetExperienceResumeResponse?.body?.screeninfo?.editinfomations ?? "แก้ไขข้อมูล"
                                  : isGetExperienceResumeResponse?.body?.screeninfo?.save ?? "บันทึก",
                              buttonIcons: Icon(
                                FontAwesomeIcons.paperPlane,
                                color: Theme.of(context).iconTheme.color,
                                size: 20.0,
                              ),
                              colortext: Theme.of(context).bottomAppBarColor,
                              colorbutton: Theme.of(context).scaffoldBackgroundColor,
                              sizetext: 14,
                              colorborder: Theme.of(context).bottomAppBarColor.withOpacity(0.65),
                              sizeborder: 3,
                              onPressed: () {
                                //"Yes"
                                if (((positionControllerTH.text == '' ? positionTh : positionControllerTH.text) ?? '') == '' ||
                                    ((positionControllerEN.text == '' ? positionEn : positionControllerEN.text) ?? '') == '' ||
                                    ((detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '') == '' ||
                                    ((detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '') == '' ||
                                    ((startDateController.text == '' ? startDate : startDateController.text) ?? '') == '' ||
                                    ((endDateController.text == '' ? endDate : endDateController.text) ?? '') == '') {
                                  dialogOneLineOneBtn(
                                      context,
                                      '${isGetExperienceResumeResponse?.body?.alertmessage?.completefieldsTh ?? "กรุณากรอกให้ครบทุกช่อง"}\n'
                                      '${isGetExperienceResumeResponse?.body?.alertmessage?.completefieldsEn ?? "Please complete all fields."} ',
                                      _buttonOk, onClickBtn: () {
                                    Navigator.of(context).pop();
                                  });
                                } else {
                                  context.read<ResumeBloc>().add(SentEditExperienceResumeEvent(
                                        edit: true,
                                        id: widget.id,
                                        orderChoose: searchStatus,
                                        positionTH: (positionControllerTH.text == '' ? positionTh : positionControllerTH.text) ?? '',
                                        positionEN: (positionControllerEN.text == '' ? positionEn : positionControllerEN.text) ?? '',
                                        detailTH: (detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '',
                                        detailEN: (detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '',
                                        startDate: (startDateController.text == '' ? startDate : startDateController.text) ?? '',
                                        endDate: (endDateController.text == '' ? endDate : endDateController.text) ?? '',
                                      ));
                                }
                              },
                            ),
                          ),
                          if (widget.id > 0)
                            Container(
                              child: ButtonIconsCustomLimit(
                                label: isGetExperienceResumeResponse?.body?.screeninfo?.deleteor ?? " Delete/ลบ",
                                buttonIcons: Icon(
                                  FontAwesomeIcons.trashCan,
                                  color: bcButtonDelete.withOpacity(0.8),
                                  size: 20.0,
                                ),
                                colortext: bcButtonDelete.withOpacity(0.8),
                                colorbutton: Theme.of(context).scaffoldBackgroundColor,
                                sizetext: 14,
                                colorborder: bcButtonDelete.withOpacity(0.8),
                                sizeborder: 3,
                                onPressed: () {
                                  dialogOneLineTwoBtnWarning(
                                      context,
                                      "${isGetExperienceResumeResponse?.body?.alertmessage?.alertdeletedataTh ?? "คุณต้องการลบข้อมูลนี้ใช่หรือไม่?"}\n${isGetExperienceResumeResponse?.body?.alertmessage?.alertdeletedataEn ?? "Do you want to delete this information?"}",
                                      isGetExperienceResumeResponse?.body?.errorbutton?.buttonyes ?? "yes ",
                                      isGetExperienceResumeResponse?.body?.errorbutton?.buttonno ?? "No", onClickBtn: (String result) {
                                    Navigator.of(context).pop();
                                    switch (result) {
                                      case 'Cancel':
                                        {
                                          //"No"
                                          //
                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (BuildContext context) => const ContentDesignResumeEditScreen()));
                                          print('Cancel');
                                          break;
                                        }
                                      case 'OK':
                                        {
                                          //"Yes"
                                          context.read<ResumeBloc>().add(SentEditExperienceResumeEvent(
                                                edit: false,
                                                id: widget.id,
                                                orderChoose: searchStatus,
                                                positionTH: (positionControllerTH.text == '' ? positionTh : positionControllerTH.text) ?? '',
                                                positionEN: (positionControllerEN.text == '' ? positionEn : positionControllerEN.text) ?? '',
                                                detailTH: (detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '',
                                                detailEN: (detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '',
                                                startDate: (startDateController.text == '' ? startDate : startDateController.text) ?? '',
                                                endDate: (endDateController.text == '' ? endDate : endDateController.text) ?? '',
                                              ));
                                        }
                                    }
                                  });
                                },
                              ),
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // floatingActionButton: floatingSetThemePDF(
            //   context: context,
            //   setState,
            //   textSave ?? 'Save',
            //   id: widget.id,
            //   orderChoose: searchStatus,
            //   positionControllerTH: (positionControllerTH.text == ''
            //           ? positionTh
            //           : positionControllerTH.text) ??
            //       '',
            //   positionControllerEN: (positionControllerEN.text == ''
            //           ? positionEn
            //           : positionControllerEN.text) ??
            //       '',
            //   detailControllerTH: (detailControllerTH.text == ''
            //           ? detailTh
            //           : detailControllerTH.text) ??
            //       '',
            //   detailControllerEN: (detailControllerEN.text == ''
            //           ? detailEn
            //           : detailControllerEN.text) ??
            //       '',
            //   startDateController:  (startDateController.text == ''
            //       ? startDate
            //       : startDateController.text) ??
            //       '',
            //   endDateController:  (endDateController.text == ''
            //       ? endDate
            //       : endDateController.text) ??
            //       '',
            // ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,
          );
        }
        return Container();
      },
      buildWhen: (context, state) {
        return state is GetEditScreenExperienceResumeSuccessState;
      },
    );
  }
}

// floatingSetThemePDF(
//   setState,
//   String pdf, {
//   required BuildContext context,
//       required int id ,
//       required int orderChoose ,
//       required String positionControllerTH ,
//       required String positionControllerEN ,
//       required String detailControllerTH ,
//       required String detailControllerEN ,
//       required String startDateController ,
//       required String endDateController ,
//
//     }) {return FloatingActionButton.extended(
//     backgroundColor:
//         Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
//     foregroundColor: Colors.black,
//     onPressed: () {
//       context.read<ResumeBloc>().add(SentEditExperienceResumeEvent(
//           id: id,
//           orderChoose: orderChoose,
//         positionTH :positionControllerTH ,
//         positionEN : positionControllerEN ,
//         detailTH :detailControllerTH ,
//         detailEN :detailControllerEN ,
//         startDate :startDateController ,
//         endDate:endDateController ,
//
//
//
//       ));
//       // Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //         builder: (context) => const ContentDesignResumeScreen()));
//     },
//     icon: Icon(
//       FontAwesomeIcons.barsStaggered,
//       color: Theme.of(context).iconTheme.color,
//       size: 20.0,
//     ),
//     label: Text('   ${pdf ?? 'PDF'}',
//         style: TextStyle(
//           fontSize: sizeTextSmaller14,
//           color: Theme.of(context).iconTheme.color,
//         )),
//   );
// }
