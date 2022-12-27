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
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import '../examples/content_design_resume_edit.dart';
import '../model/response/get_education_resume_response.dart';

class EditEducationResumeScreen extends StatelessWidget {
  final int id;
  final String type;
  final int count;
  const EditEducationResumeScreen({
    Key? key,
    required this.id,
    required this.type,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ResumeBloc()
          ..add(GetEditScreenEducationResumeEvent(eduId: id, type: type)),
        // child: const GenerativeWidget());
        child: EditEducationResumePage(
          id: id,
          type: type,
          count: count,
        ));
  }
}

class EditEducationResumePage extends StatefulWidget {
  final int id;
  final int count;
  final String type;
  const EditEducationResumePage({
    Key? key,
    required this.id,
    required this.type,
    required this.count,
  }) : super(key: key);

  @override
  State<EditEducationResumePage> createState() =>
      _EditEducationResumePageState();
}

class _EditEducationResumePageState extends State<EditEducationResumePage>
    with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String typeid;
  late String typeShow;
  late int orderChoose;
  late int isOrderChoose;
  GetEducationResumeResponse? isGetEducationResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    typeid = widget.type;
    orderChoose = 0;
    isOrderChoose = 0;
    typeShow = '';
    getUserLanguage();
    _isSessionUnauthorized();
    startDateController.text = DateFormat('M/y').format(DateTime.now());
    endDateController.text = DateFormat('M/y').format(DateTime.now());
    // endDateController.text = DateFormat('M/y').format( DateTime.now().add(const Duration(days: 1)));
    // context.read<ResumeBloc>().add(GetEditScreenEducationResumeEvent(eduId:widget.id, type:widget.type));
    super.initState();
  }

  getUserLanguage() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired =
        valueLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
        valueLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = valueLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  TextEditingController placeOfStudyControllerTH = TextEditingController();
  TextEditingController placeOfStudyControllerEN = TextEditingController();
  TextEditingController detailControllerTH = TextEditingController();
  TextEditingController detailControllerEN = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  // List<String> lengthPopupMenuItem =["High School Certificate","Bachelor Degrees","Master Degrees","Doctor Degrees","Honorary Doctorate Degree"];

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenEducationResumeSuccessState) {
          isGetEducationResumeResponse = state.isGetEducationResumeResponse;
          setState(() {
            orderChoose =
                isGetEducationResumeResponse?.body?.data?.orderchoose ?? 0;
            typeShow =
                "${isGetEducationResumeResponse?.body?.data?.typeTh ?? ''} \n${isGetEducationResumeResponse?.body?.data?.typeEn ?? ''}";
          });
        }
        if (state is SentEditEducationResumeSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const ContentDesignResumeEditScreen()));
        }
        if (state is EducationPreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is EducationPreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is EducationResumeError) {
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
          } else if (state.errorMessage.toUpperCase().toString() ==
                  'S401EXP01' ||
              state.errorMessage.toUpperCase().toString() == 'T401NOT01') {
            dialogSessionExpiredOneBtn(
                context, textSessionExpired, textSubSessionExpired, _buttonOk,
                onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()));
            });
          } else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
                onClickBtn: () {
              Navigator.of(context).pop();
            });
          }
        }
      },
      builder: (context, state) {
        if (state is GetEditScreenEducationResumeSuccessState) {
          isGetEducationResumeResponse = state.isGetEducationResumeResponse;
          String? textPlaceOfStudyTh =
              '${isGetEducationResumeResponse?.body?.screeninfo?.placeofstudyTh} *';
          String? textEditInfo =
              isGetEducationResumeResponse?.body?.screeninfo?.editinfomations;
          String? textSave =
              isGetEducationResumeResponse?.body?.screeninfo?.save;
          String? textPlaceOfStudyEn =
              '${isGetEducationResumeResponse?.body?.screeninfo?.placeofstudyEn} *';
          String? textStartDateTh =
              isGetEducationResumeResponse?.body?.screeninfo?.startdateTh;
          String? textStartDateEn =
              isGetEducationResumeResponse?.body?.screeninfo?.startdateEn;
          String? textEndDateTh =
              isGetEducationResumeResponse?.body?.screeninfo?.enddateTh;
          String? textEndDateEn =
              isGetEducationResumeResponse?.body?.screeninfo?.enddateEn;
          String? textDetailTh =
              isGetEducationResumeResponse?.body?.screeninfo?.detailTh;
          String? textDetailEn =
              isGetEducationResumeResponse?.body?.screeninfo?.detailEn;
          String? placeOfStudyTh =
              isGetEducationResumeResponse?.body?.data?.placeofstudyTh;
          String? placeOfStudyEn =
              isGetEducationResumeResponse?.body?.data?.placeofstudyEn;
          String? detailTh = isGetEducationResumeResponse?.body?.data?.detailTh;
          String? detailEn = isGetEducationResumeResponse?.body?.data?.detailEn;
          String? startDate =
              isGetEducationResumeResponse?.body?.data?.startdate;
          String? endDate = isGetEducationResumeResponse?.body?.data?.enddate;
          // String? typeid = isGetEducationResumeResponse?.body?.data?.typeid;
          String? typeTh =
              isGetEducationResumeResponse?.body?.data?.typeTh ?? '';
          String? typeEn =
              isGetEducationResumeResponse?.body?.data?.typeEn ?? '';

          return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);

                    dialogOneLineTwoBtnWarning(
                        context,
                        "${isGetEducationResumeResponse?.body?.alertmessage?.alertsavedataTh ?? "คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่?"}\n${isGetEducationResumeResponse?.body?.alertmessage?.alertsavedataEn ?? "Do you want to save this information?"}",
                        isGetEducationResumeResponse
                                ?.body?.errorbutton?.buttonyes ??
                            "yes ",
                        isGetEducationResumeResponse
                                ?.body?.errorbutton?.buttonno ??
                            "No",
                        onClickBtn: (String result) {
                      Navigator.of(context).pop();
                      switch (result) {
                        case 'Cancel':
                          {
                            //"No"

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ContentDesignResumeEditScreen()));
                            print('Cancel');
                            break;
                          }
                        case 'OK':
                          {
                            //"Yes"
                            context
                                .read<ResumeBloc>()
                                .add(SentEditEducationResumeEvent(
                                  edit: true,
                                  id: widget.id,
                                  orderChoose: orderChoose,
                                  startDate: (endDateController.text == ''
                                          ? endDate
                                          : endDateController.text) ??
                                      '',
                                  endDate: (endDateController.text == ''
                                          ? endDate
                                          : endDateController.text) ??
                                      '',
                                  type: typeid ?? widget.type,
                                  placeOfStudy:
                                      (placeOfStudyControllerTH.text == ''
                                              ? placeOfStudyTh
                                              : placeOfStudyControllerTH
                                                  .text) ??
                                          '',
                                  placeOfStudyEN:
                                      (placeOfStudyControllerEN.text == ''
                                              ? placeOfStudyEn
                                              : placeOfStudyControllerEN
                                                  .text) ??
                                          '',
                                  detailTH: (detailControllerTH.text == ''
                                          ? detailTh
                                          : detailControllerTH.text) ??
                                      '',
                                  detailEN: (detailControllerTH.text == ''
                                          ? detailEn
                                          : detailControllerTH.text) ??
                                      '',
                                ));
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
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).appBarTheme.foregroundColor))),
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
                        textOnTopOfDatePicker:
                            '$textStartDateTh / $textStartDateEn  *',
                        hintLabel: '$textStartDateTh / $textStartDateEn  *',
                        callbackFromCustomDatePicker: (String result) {
                          startDateController.text = result;
                          if (kDebugMode) {
                            print(startDateController.text);
                          }
                        },
                      ),
                      CustomDatePickerForResumeMMYY(
                        textOnTopOfDatePicker:
                            '$textEndDateTh / $textEndDateEn  *',
                        hintLabel: '$textEndDateTh / $textEndDateEn  *',
                        callbackFromCustomDatePicker: (String result) {
                          endDateController.text = result;
                          if (kDebugMode) {
                            print(endDateController.text);
                          }
                        },
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: placeOfStudyControllerTH,
                        onChanged: (valuePlaceOfStudyControllerTH) {
                          setState(() {
                            placeOfStudyControllerTH.text =
                                valuePlaceOfStudyControllerTH;
                          });
                          if (kDebugMode) {
                            print(placeOfStudyControllerTH.text);
                          }
                        },
                        hintLabel: textPlaceOfStudyTh,
                        initialvalue: placeOfStudyTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: placeOfStudyControllerEN,
                        onChanged: (valuePlaceOfStudyControllerEN) {
                          setState(() {
                            placeOfStudyControllerEN.text =
                                valuePlaceOfStudyControllerEN;
                          });

                          if (kDebugMode) {
                            print(placeOfStudyControllerEN.text);
                          }
                        },
                        hintLabel: textPlaceOfStudyEn,
                        initialvalue: placeOfStudyEn,
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
                                padding: EdgeInsets.only(
                                    right: 5, left: 5, top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Theme.of(context).primaryColor ==
                                          Colors.black
                                      ? Color(0xFF1F222A)
                                      : Colors.transparent.withOpacity(0.03),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        typeShow,
                                        style: TextStyle(
                                            // decoration: TextDecoration.underline,
                                            decorationThickness: 2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .appBarTheme
                                                .foregroundColor),
                                      ),
                                      Text(
                                        'เลือก',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationThickness: 2,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .appBarTheme
                                                .foregroundColor),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        itemBuilder: (context) {
                          return List.generate(
                              (isGetEducationResumeResponse
                                      ?.body?.type?.length ??
                                  0), (index) {
                            return PopupMenuItem(
                              value: index,
                              child: Text(
                                "${isGetEducationResumeResponse?.body?.type?[index].typeTh ?? ''} \n${isGetEducationResumeResponse?.body?.type?[index].typeEn ?? ''}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor),
                              ),
                            );
                          });
                        },
                        onSelected: (value) {
                          setState(() {
                            typeid = isGetEducationResumeResponse
                                    ?.body?.type?[value].typeid ??
                                "bd";
                            typeShow =
                                "${isGetEducationResumeResponse?.body?.type?[value].typeTh ?? ''}"
                                "\n${isGetEducationResumeResponse?.body?.type?[value].typeEn ?? ''}";
                          });
                        },
                      ),
                      PopupMenuButton(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                padding: EdgeInsets.only(
                                    right: 5, left: 5, top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Theme.of(context).primaryColor ==
                                          Colors.black
                                      ? Color(0xFF1F222A)
                                      : Colors.transparent.withOpacity(0.03),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        orderChoose == 0
                                            ? isOrderChoose == 0
                                                ? "โปรดเลือกลำดับการแสดง"
                                                : "การแสดงอันดับที่  $isOrderChoose"
                                            : "การแสดงอันดับที่  $orderChoose",
                                        style: TextStyle(
                                            // decoration: TextDecoration.underline,
                                            decorationThickness: 2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .appBarTheme
                                                .foregroundColor),
                                      ),
                                      Text(
                                        'เลือก',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationThickness: 2,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .appBarTheme
                                                .foregroundColor),
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
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor),
                              ),
                            );
                          });
                        },
                        onSelected: (value) {
                          isOrderChoose = value;
                          orderChoose = value;
                          setState(() {
                            isOrderChoose = value;
                            orderChoose = value;
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
                            width: widget.id > 0
                                ? null
                                : MediaQuery.of(context).size.width - 50,
                            child: ButtonIconsCustomLimit(
                              label: widget.id > 0
                                  ? isGetEducationResumeResponse
                                          ?.body?.screeninfo?.editinfomations ??
                                      "แก้ไขข้อมูล"
                                  : isGetEducationResumeResponse
                                          ?.body?.screeninfo?.save ??
                                      "บันทึก",
                              buttonIcons: Icon(
                                FontAwesomeIcons.paperPlane,
                                color: Theme.of(context).iconTheme.color,
                                size: 20.0,
                              ),
                              colortext: Theme.of(context).bottomAppBarColor,
                              colorbutton:
                                  Theme.of(context).scaffoldBackgroundColor,
                              sizetext: 14,
                              colorborder: Theme.of(context)
                                  .bottomAppBarColor
                                  .withOpacity(0.65),
                              sizeborder: 3,
                              onPressed: () {
                                context
                                    .read<ResumeBloc>()
                                    .add(SentEditEducationResumeEvent(
                                      edit: true,
                                      id: widget.id,
                                      orderChoose: orderChoose,
                                      startDate: (endDateController.text == ''
                                              ? endDate
                                              : endDateController.text) ??
                                          '',
                                      endDate: (endDateController.text == ''
                                              ? endDate
                                              : endDateController.text) ??
                                          '',
                                      type: typeid ?? widget.type,
                                      placeOfStudy:
                                          (placeOfStudyControllerTH.text == ''
                                                  ? placeOfStudyTh
                                                  : placeOfStudyControllerTH
                                                      .text) ??
                                              '',
                                      placeOfStudyEN:
                                          (placeOfStudyControllerEN.text == ''
                                                  ? placeOfStudyEn
                                                  : placeOfStudyControllerEN
                                                      .text) ??
                                              '',
                                      detailTH: (detailControllerTH.text == ''
                                              ? detailTh
                                              : detailControllerTH.text) ??
                                          '',
                                      detailEN: (detailControllerTH.text == ''
                                              ? detailEn
                                              : detailControllerTH.text) ??
                                          '',
                                    ));
                              },
                            ),
                          ),
                          if (widget.id > 0)
                            Container(
                              child: ButtonIconsCustomLimit(
                                label: isGetEducationResumeResponse
                                        ?.body?.screeninfo?.deleteor ??
                                    "Delete/ลบ",
                                // label: "ดูทั้งหมด",
                                buttonIcons: Icon(
                                  FontAwesomeIcons.trashCan,
                                  color: bcButtonDelete.withOpacity(0.8),
                                  size: 20.0,
                                ),
                                colortext: bcButtonDelete.withOpacity(0.8),
                                colorbutton:
                                    Theme.of(context).scaffoldBackgroundColor,
                                sizetext: 14,
                                colorborder: bcButtonDelete.withOpacity(0.8),
                                sizeborder: 3,
                                onPressed: () {
                                  dialogOneLineTwoBtnWarning(
                                      context,
                                      "${isGetEducationResumeResponse?.body?.alertmessage?.alertdeletedataTh ?? "คุณต้องการลบข้อมูลนี้ใช่หรือไม่?"}\n${isGetEducationResumeResponse?.body?.alertmessage?.alertdeletedataEn ?? "Do you want to delete this information?"}",
                                      isGetEducationResumeResponse
                                              ?.body?.errorbutton?.buttonyes ??
                                          "yes ",
                                      isGetEducationResumeResponse
                                              ?.body?.errorbutton?.buttonno ??
                                          "No", onClickBtn: (String result) {
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
                                          context
                                              .read<ResumeBloc>()
                                              .add(SentEditEducationResumeEvent(
                                                edit: false,
                                                id: widget.id,
                                                orderChoose: orderChoose,
                                                startDate:
                                                    (endDateController.text ==
                                                                ''
                                                            ? endDate
                                                            : endDateController
                                                                .text) ??
                                                        '',
                                                endDate:
                                                    (endDateController.text ==
                                                                ''
                                                            ? endDate
                                                            : endDateController
                                                                .text) ??
                                                        '',
                                                type: typeid,
                                                placeOfStudy:
                                                    (placeOfStudyControllerTH
                                                                    .text ==
                                                                ''
                                                            ? placeOfStudyTh
                                                            : placeOfStudyControllerTH
                                                                .text) ??
                                                        '',
                                                placeOfStudyEN:
                                                    (placeOfStudyControllerEN
                                                                    .text ==
                                                                ''
                                                            ? placeOfStudyEn
                                                            : placeOfStudyControllerEN
                                                                .text) ??
                                                        '',
                                                detailTH:
                                                    (detailControllerTH.text ==
                                                                ''
                                                            ? detailTh
                                                            : detailControllerTH
                                                                .text) ??
                                                        '',
                                                detailEN:
                                                    (detailControllerTH.text ==
                                                                ''
                                                            ? detailEn
                                                            : detailControllerTH
                                                                .text) ??
                                                        '',
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
          );
        }
        return Container();
      },
      buildWhen: (context, state) {
        return state is GetEditScreenEducationResumeSuccessState;
      },
    );
  }
}
