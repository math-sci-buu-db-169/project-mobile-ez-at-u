import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../utils/shared_preferences.dart';
import '../../customs/button/button_custom.dart';
import '../../customs/color/color_const.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import 'content_design_resume_edit.dart';
import '../model/response/get_skill_language_resume_response.dart';

class EditSkillLanguageResumeScreen extends StatelessWidget {
  final int id;
  final int count;
  const EditSkillLanguageResumeScreen({
    Key? key,
    required this.id,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ResumeBloc()..add(GetEditScreenSkillLanguageResumeEvent(id: id)),
        // child: const GenerativeWidget());
        child: EditSkillLanguageResumePage(
          id: id,
          count: count,
        ));
  }
}

class EditSkillLanguageResumePage extends StatefulWidget {
  final int id;
  final int count;
  const EditSkillLanguageResumePage({
    Key? key,
    required this.id,
    required this.count,
  }) : super(key: key);

  @override
  State<EditSkillLanguageResumePage> createState() => _EditSkillLanguageResumePageState();
}

class _EditSkillLanguageResumePageState extends State<EditSkillLanguageResumePage> with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late int searchStatus;
  late int isSearchStatus;
  GetSkillLanguageResumeResponse? isGetSkillLanguageResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    searchStatus = 0;
    isSearchStatus = 0;
    getUserLanguage();
    widgetPointerValue = 50;
    _isSessionUnauthorized();
    context.read<ResumeBloc>().add(GetEditScreenSkillLanguageResumeEvent(id: widget.id));
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

  late double widgetPointerValue;
  TextEditingController languageControllerTH = TextEditingController();
  TextEditingController languageControllerEN = TextEditingController();
  TextEditingController detailControllerTH = TextEditingController();
  TextEditingController detailControllerEN = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenSkillLanguageResumeSuccessState) {
          isGetSkillLanguageResumeResponse = state.isGetSkillLanguageResumeResponse;
          setState(() {
            widgetPointerValue = double.parse(isGetSkillLanguageResumeResponse?.body?.data?.value ?? '50');
            searchStatus = isGetSkillLanguageResumeResponse?.body?.data?.orderchoose ?? 0;
          });
        }
        if (state is SentEditSkillLanguageResumeSuccessState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const ContentDesignResumeEditScreen()));
        }
        if (state is SkillLanguagePreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is SkillLanguagePreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is SkillLanguageResumeError) {
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
        if (state is GetEditScreenSkillLanguageResumeSuccessState) {
          isGetSkillLanguageResumeResponse = state.isGetSkillLanguageResumeResponse;
          String? textlanguageTh = '${isGetSkillLanguageResumeResponse?.body?.screeninfo?.languageTh} *';
          String? textlanguageEn = '${isGetSkillLanguageResumeResponse?.body?.screeninfo?.languageEn} *';
          String? textDetailTh = '${isGetSkillLanguageResumeResponse?.body?.screeninfo?.descriptionTh} *';
          String? textDetailEn = '${isGetSkillLanguageResumeResponse?.body?.screeninfo?.descriptionEn} *';
          String? textEditInfo = isGetSkillLanguageResumeResponse?.body?.screeninfo?.editinfomations;
          String? textSave = isGetSkillLanguageResumeResponse?.body?.screeninfo?.save;
          String? languageTh = isGetSkillLanguageResumeResponse?.body?.data?.language;
          String? languageEn = isGetSkillLanguageResumeResponse?.body?.data?.languageen;
          String? detailTh = isGetSkillLanguageResumeResponse?.body?.data?.detail;
          String? detailEn = isGetSkillLanguageResumeResponse?.body?.data?.detailen;

          String? textValueTh = '${isGetSkillLanguageResumeResponse?.body?.screeninfo?.levelTh} *';
          String? textValueEn = '${isGetSkillLanguageResumeResponse?.body?.screeninfo?.languageEn} *';
          String? textValue = '${isGetSkillLanguageResumeResponse?.body?.screeninfo?.level} *';
          if (kDebugMode) {
            print("id: widget.id");
            print("id: ${widget.id}");
          }
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    dialogOneLineTwoBtnWarning(
                        context,
                        "${isGetSkillLanguageResumeResponse?.body?.alertmessage?.alertsavedataTh ?? "คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่?"}\n${isGetSkillLanguageResumeResponse?.body?.alertmessage?.alertsavedataEn ?? "Do you want to save this information?"}",
                        isGetSkillLanguageResumeResponse?.body?.errorbutton?.buttonyes ?? "yes ",
                        isGetSkillLanguageResumeResponse?.body?.errorbutton?.buttonno ?? "No", onClickBtn: (String result) {
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
                            if (((languageControllerTH.text == '' ? languageTh : languageControllerTH.text) ?? '') == '' ||
                                ((languageControllerEN.text == '' ? languageEn : languageControllerEN.text) ?? '') == '' ||
                                ((detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '') == '' ||
                                ((detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '') == '') {
                              dialogOneLineOneBtn(
                                  context,
                                  '${isGetSkillLanguageResumeResponse?.body?.alertmessage?.completefieldsTh ?? "กรุณากรอกให้ครบทุกช่อง"}\n'
                                  '${isGetSkillLanguageResumeResponse?.body?.alertmessage?.completefieldsEn ?? "Please complete all fields."} ',
                                  _buttonOk, onClickBtn: () {
                                Navigator.of(context).pop();
                              });
                            } else {
                              context.read<ResumeBloc>().add(SentEditSkillLanguageResumeEvent(
                                    edit: true,
                                    id: widget.id,
                                    orderChoose: searchStatus,
                                    languageTH: (languageControllerTH.text == '' ? languageTh : languageControllerTH.text) ?? '',
                                    languageEN: (languageControllerEN.text == '' ? languageEn : languageControllerEN.text) ?? '',
                                    detailTH: (detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '',
                                    detailEN: (detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '',
                                    valueLanguage: widgetPointerValue.toStringAsFixed(0),
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
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: languageControllerTH,
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            languageControllerTH.text = valueNameControllerTH;
                          });
                          if (kDebugMode) {
                            print(languageControllerTH.text);
                          }
                        },
                        hintLabel: textlanguageTh,
                        initialvalue: languageTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: languageControllerEN,
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            languageControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(languageControllerEN.text);
                          }
                        },
                        hintLabel: textlanguageEn,
                        initialvalue: languageEn,
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
                                padding: const EdgeInsets.only(right: 5, left: 5, top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color:
                                      Theme.of(context).primaryColor == Colors.black ? const Color(0xFF1F222A) : Colors.transparent.withOpacity(0.03),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        searchStatus == 0
                                            ? isSearchStatus == 0
                                                ? "โปรดเลือกลำดับการแสดง"
                                                : "การแสดงอันดับที่ $isSearchStatus"
                                            : "การแสดงอันดับที่ $searchStatus",
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
                          return List.generate(widget.count + 3, (index) {
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
                        height: 10,
                      ),
                      SfLinearGauge(
                        axisTrackStyle: const LinearAxisTrackStyle(thickness: 10),
                        markerPointers: [
                          LinearShapePointer(
                              value: widgetPointerValue,
                              shapeType: LinearShapePointerType.invertedTriangle,
                              position: LinearElementPosition.cross,
                              onChanged: (value) {
                                setState(() {
                                  widgetPointerValue = value;
                                });
                              },
                              color: widgetPointerValueColor(widgetPointerValue)),
                          LinearWidgetPointer(
                            value: widgetPointerValue,
                            onChanged: (value) {
                              setState(() {
                                widgetPointerValue = value;
                              });
                            },
                            position: LinearElementPosition.outside,
                            child: SizedBox(
                              width: 55,
                              height: 45,
                              child: Center(
                                child: Text(
                                  widgetPointerValue.toStringAsFixed(0),
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: widgetPointerValueColor(widgetPointerValue)),
                                ),
                              ),
                            ),
                          ),
                        ],
                        ranges: [
                          LinearGaugeRange(
                              endValue: widgetPointerValue, color: widgetPointerValueColor(widgetPointerValue), position: LinearElementPosition.cross)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(textValue,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Theme.of(context).appBarTheme.foregroundColor)),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: widget.id > 0 ? null : MediaQuery.of(context).size.width - 50,
                            child: ButtonIconsCustomLimit(
                              label: widget.id > 0
                                  ? isGetSkillLanguageResumeResponse?.body?.screeninfo?.editinfomations ?? "แก้ไขข้อมูล"
                                  : isGetSkillLanguageResumeResponse?.body?.screeninfo?.save ?? "บันทึก",
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
                                if (((languageControllerTH.text == '' ? languageTh : languageControllerTH.text) ?? '') == '' ||
                                    ((languageControllerEN.text == '' ? languageEn : languageControllerEN.text) ?? '') == '' ||
                                    ((detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '') == '' ||
                                    ((detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '') == '') {
                                  dialogOneLineOneBtn(
                                      context,
                                      '${isGetSkillLanguageResumeResponse?.body?.alertmessage?.completefieldsTh ?? "กรุณากรอกให้ครบทุกช่อง"}\n'
                                      '${isGetSkillLanguageResumeResponse?.body?.alertmessage?.completefieldsEn ?? "Please complete all fields."} ',
                                      _buttonOk, onClickBtn: () {
                                    Navigator.of(context).pop();
                                  });
                                } else {
                                  context.read<ResumeBloc>().add(SentEditSkillLanguageResumeEvent(
                                        edit: true,
                                        id: widget.id,
                                        orderChoose: searchStatus,
                                        languageTH: (languageControllerTH.text == '' ? languageTh : languageControllerTH.text) ?? '',
                                        languageEN: (languageControllerEN.text == '' ? languageEn : languageControllerEN.text) ?? '',
                                        detailTH: (detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '',
                                        detailEN: (detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '',
                                        valueLanguage: widgetPointerValue.toStringAsFixed(0),
                                      ));
                                }
                              },
                            ),
                          ),
                          if (widget.id > 0)
                            ButtonIconsCustomLimit(
                              label: isGetSkillLanguageResumeResponse?.body?.screeninfo?.deleteor ?? " Delete/ลบ",
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
                                    "${isGetSkillLanguageResumeResponse?.body?.alertmessage?.alertdeletedataTh ?? "คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่?"}\n${isGetSkillLanguageResumeResponse?.body?.alertmessage?.alertdeletedataEn ?? "Do you want to delete this information?"}",
                                    isGetSkillLanguageResumeResponse?.body?.errorbutton?.buttonyes ?? "yes ",
                                    isGetSkillLanguageResumeResponse?.body?.errorbutton?.buttonno ?? "No", onClickBtn: (String result) {
                                  Navigator.of(context).pop();
                                  switch (result) {
                                    case 'Cancel':
                                      {
                                        //"No"
                                        print('Cancel');
                                        break;
                                      }
                                    case 'OK':
                                      {
                                        //"Yes"
                                        context.read<ResumeBloc>().add(SentEditSkillLanguageResumeEvent(
                                              edit: false,
                                              id: widget.id,
                                              orderChoose: searchStatus,
                                              languageTH: (languageControllerTH.text == '' ? languageTh : languageControllerTH.text) ?? '',
                                              languageEN: (languageControllerEN.text == '' ? languageEn : languageControllerEN.text) ?? '',
                                              detailTH: (detailControllerTH.text == '' ? detailTh : detailControllerTH.text) ?? '',
                                              detailEN: (detailControllerEN.text == '' ? detailEn : detailControllerEN.text) ?? '',
                                              valueLanguage: widgetPointerValue.toStringAsFixed(0),
                                            ));
                                      }
                                  }
                                });
                              },
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
        return state is GetEditScreenSkillLanguageResumeSuccessState;
      },
    );
  }
}
