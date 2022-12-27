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
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import '../examples/content_design_resume_edit.dart';
import '../model/response/get_skill_language_resume_response.dart';
import '../model/response/get_skill_resume_response.dart';

class EditSkillResumeScreen extends StatelessWidget {
  final int id;
  final int count;
  const EditSkillResumeScreen({
    Key? key,
    required this.id,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        ResumeBloc()..add(GetEditScreenSkillResumeEvent(id: id)),
        // child: const GenerativeWidget());
        child: EditSkillResumePage(id: id,count: count,));
  }
}

class EditSkillResumePage extends StatefulWidget {
  final int id;
  final int count;
  const EditSkillResumePage({
    Key? key,
    required this.id,
    required this.count,
  }) : super(key: key);

  @override
  State<EditSkillResumePage> createState() =>
      _EditSkillResumePageState();
}

class _EditSkillResumePageState
    extends State<EditSkillResumePage> with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late int searchStatus;
  late int isSearchStatus;
  GetSkillResumeResponse? isGetSkillResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    searchStatus = 0;
    isSearchStatus = 0;
    getUserLanguage();
    widgetPointerValue = 50;
    _isSessionUnauthorized();
    context.read<ResumeBloc>().add(GetEditScreenSkillResumeEvent(id: widget.id));
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

  late double widgetPointerValue ;
  TextEditingController skillControllerTH = TextEditingController();
  TextEditingController skillControllerEN = TextEditingController();
  TextEditingController detailControllerTH = TextEditingController();
  TextEditingController detailControllerEN = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenSkillResumeSuccessState) {
          isGetSkillResumeResponse =
              state.isGetSkillResumeResponse;
          setState(() {
            widgetPointerValue = double.parse(isGetSkillResumeResponse?.body?.data?.value??'50') ;

            searchStatus = isGetSkillResumeResponse?.body?.data?.orderchoose??0 ;
          });
        }
        if (state is SentEditSkillResumeSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                  const ContentDesignResumeEditScreen()));
        }
        if (state is SkillPreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is SkillPreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is SkillResumeError) {
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
      },
      builder: (context, state) {
        if (state is GetEditScreenSkillResumeSuccessState) {
          isGetSkillResumeResponse =
              state.isGetSkillResumeResponse;
          String? textskillTh =
              '${isGetSkillResumeResponse?.body?.screeninfo?.skillTh} *';
          String? textskillEn =
              '${isGetSkillResumeResponse?.body?.screeninfo?.skillEn} *';
          String? textDetailTh =
              '${isGetSkillResumeResponse?.body?.screeninfo?.descriptionTh} *';
          String? textDetailEn =
              '${isGetSkillResumeResponse?.body?.screeninfo?.descriptionEn} *';
          String? textEditInfo = isGetSkillResumeResponse
              ?.body?.screeninfo?.editinfomations;
          String? textSave =
              isGetSkillResumeResponse?.body?.screeninfo?.save;
          String? skillTh =
              isGetSkillResumeResponse?.body?.data?.skill;
          String? skillEn =
              isGetSkillResumeResponse?.body?.data?.skillen;
          String? detailTh =
              isGetSkillResumeResponse?.body?.data?.detail;
          String? detailEn =
              isGetSkillResumeResponse?.body?.data?.detailen;

          String? textValueTh =
              '${isGetSkillResumeResponse?.body?.screeninfo?.levelTh} *';
          String? textValueEn =
              '${isGetSkillResumeResponse?.body?.screeninfo?.skillEn} *';
          String? textValue =
              '${isGetSkillResumeResponse?.body?.screeninfo?.level} *';
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);

                    context.read<ResumeBloc>().add(SentEditSkillResumeEvent(
                      edit: true,
                      id:widget.id,
                      orderChoose: searchStatus,
                      skillTH:  (skillControllerTH.text == ''
                          ? skillTh
                          : skillControllerTH.text) ??
                          '',
                      skillEN:  (skillControllerEN.text == ''
                          ? skillEn
                          : skillControllerEN.text) ??
                          '',
                      detailTH:  (detailControllerTH.text == ''
                          ? detailTh
                          : detailControllerTH.text) ??
                          '',
                      detailEN: (detailControllerEN.text == ''
                          ? detailEn
                          : detailControllerEN.text) ??
                          '',
                      valueSkill:widgetPointerValue.toStringAsFixed(0),
                    ));
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
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: skillControllerTH,
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            skillControllerTH.text = valueNameControllerTH;
                          });
                          if (kDebugMode) {
                            print(skillControllerTH.text);
                          }
                        },
                        hintLabel: textskillTh,
                        initialvalue: skillTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: skillControllerEN,
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            skillControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(skillControllerEN.text);
                          }
                        },
                        hintLabel: textskillEn,
                        initialvalue: skillEn,
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
                          return List.generate(widget.count+3,
                                  (index) {
                                return PopupMenuItem(
                                  value: index + 1,
                                  child: Text(
                                    "${index + 1}" ,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
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
                      SizedBox(height: 10,),
                      SfLinearGauge(
                        axisTrackStyle: LinearAxisTrackStyle(
                            thickness: 10
                        ),
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
                              color:widgetPointerValueColor(widgetPointerValue),
                          ),
                          LinearWidgetPointer(
                            value: widgetPointerValue,
                            onChanged: (value) {
                              setState(() {
                                widgetPointerValue = value;
                              });
                            },
                            child: Container(
                              width: 55,
                              height: 45,
                              child: Center(
                                child: Text(
                                  widgetPointerValue.toStringAsFixed(0),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: widgetPointerValueColor(widgetPointerValue)
                                  ),
                                ),
                              ),
                            ),
                            position: LinearElementPosition.outside,
                          ),
                        ],
                        ranges: [
                          LinearGaugeRange(
                              endValue: widgetPointerValue,
                              color: widgetPointerValueColor(widgetPointerValue),
                              position: LinearElementPosition.cross)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(textValue,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).appBarTheme.foregroundColor)),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Container(

                            width: widget.id >0 ? null:MediaQuery.of(context).size.width-50,
                            child: ButtonIconsCustomLimit(
                              label:  widget.id >0 ?
                              isGetSkillResumeResponse?.body?.screeninfo?.editinfomations??"แก้ไขข้อมูล" :
                              isGetSkillResumeResponse?.body?.screeninfo?.save??"บันทึก",
                              buttonIcons: Icon(
                                FontAwesomeIcons.paperPlane,
                                color: Theme.of(context).iconTheme.color,
                                size: 20.0,
                              ),
                              colortext: Theme.of(context).bottomAppBarColor,
                              colorbutton:
                              Theme.of(context).scaffoldBackgroundColor,
                              sizetext: 14,
                              colorborder: Theme.of(context).bottomAppBarColor.withOpacity(0.65),
                              sizeborder: 3,
                              onPressed: () {
                                context.read<ResumeBloc>().add(SentEditSkillResumeEvent(
                                  edit: true,
                                  id:widget.id,
                                  orderChoose: searchStatus,
                                  skillTH:  (skillControllerTH.text == ''
                                      ? skillTh
                                      : skillControllerTH.text) ??
                                      '',
                                  skillEN:  (skillControllerEN.text == ''
                                      ? skillEn
                                      : skillControllerEN.text) ??
                                      '',
                                  detailTH:  (detailControllerTH.text == ''
                                      ? detailTh
                                      : detailControllerTH.text) ??
                                      '',
                                  detailEN: (detailControllerEN.text == ''
                                      ? detailEn
                                      : detailControllerEN.text) ??
                                      '',
                                  valueSkill:widgetPointerValue.toStringAsFixed(0),
                                ));
                              },
                            ),
                          )
                          ,
                          if(widget.id >0)
                            Container(
                              child: ButtonIconsCustomLimit(
                                label: isGetSkillResumeResponse?.body?.screeninfo?.deleteor??" Delete/ลบ",
                                buttonIcons: Icon(
                                  FontAwesomeIcons.trashCan,
                                  color:bcButtonDelete.withOpacity(0.8),
                                  size: 20.0,
                                ),
                                colortext:bcButtonDelete.withOpacity(0.8),
                                colorbutton:
                                Theme.of(context).scaffoldBackgroundColor,
                                sizetext: 14,
                                colorborder:bcButtonDelete.withOpacity(0.8),
                                sizeborder: 3,
                                onPressed: () {
                                  context.read<ResumeBloc>().add(SentEditSkillResumeEvent(
                                    edit: false,
                                    id:widget.id,
                                    orderChoose: searchStatus,
                                    skillTH:  (skillControllerTH.text == ''
                                        ? skillTh
                                        : skillControllerTH.text) ??
                                        '',
                                    skillEN:  (skillControllerEN.text == ''
                                        ? skillEn
                                        : skillControllerEN.text) ??
                                        '',
                                    detailTH:  (detailControllerTH.text == ''
                                        ? detailTh
                                        : detailControllerTH.text) ??
                                        '',
                                    detailEN: (detailControllerEN.text == ''
                                        ? detailEn
                                        : detailControllerEN.text) ??
                                        '',
                                    valueSkill:widgetPointerValue.toStringAsFixed(0),
                                  ));
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
        return state is GetEditScreenSkillResumeSuccessState;
      },
    );
  }
}
