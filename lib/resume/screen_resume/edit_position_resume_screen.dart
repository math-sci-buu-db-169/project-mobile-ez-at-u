import 'package:ez_at_u/resume/model/response/pre_view_resume_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import '../examples/content_design_resume.dart';
import '../examples/content_design_resume_edit.dart';
import '../model/response/get_about_me_resume_response.dart';
import '../model/response/get_position_resume_response.dart';
import '../model/response/get_user_infomartion_resume_response.dart';

class EditPositionsResumeScreen extends StatelessWidget {
  final int id;
  const EditPositionsResumeScreen({
    Key? key, required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetEditScreenPositionsResumeEvent(positionID: id)),
        // child: const GenerativeWidget());
        child:  EditPositionsResumePage(id:id));
  }
}

class EditPositionsResumePage extends StatefulWidget {
  final int id;
  const EditPositionsResumePage({
    Key? key, required this.id,
  }) : super(key: key);

  @override
  State<EditPositionsResumePage> createState() => _EditPositionsResumePageState();
}

class _EditPositionsResumePageState extends State<EditPositionsResumePage>
    with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;

  late int searchStatus;
  late int isSearchStatus;
  GetPositionResumeResponse? isGetPositionResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    getUserLanguage();
    _isSessionUnauthorized();
    searchStatus = 0;
    isSearchStatus = 0;
    context.read<ResumeBloc>().add(GetEditScreenPositionsResumeEvent(positionID: widget.id));
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

  TextEditingController positionControllerTH = TextEditingController();
  TextEditingController positionControllerEN = TextEditingController();
  TextEditingController officeControllerEN = TextEditingController();
  TextEditingController officeControllerTH = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenPositionResumeSuccessState) {
          isGetPositionResumeResponse =
              state.isGetPositionResumeResponse;
          setState(() {        searchStatus = isGetPositionResumeResponse?.body?.data?.orderchoose??0 ;});
        }
        if (state is SentEditPositionResumeSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ContentDesignResumeEditScreen()));
        }
        if (state is ResumeLoading) {
          showProgressDialog(context);
        }
        if (state is ResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ResumeError) {
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
          } else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
                onClickBtn: () {
              Navigator.of(context).pop();
            });
          }

          // show dialog error
          if (kDebugMode) {
            print(state.errorMessage);
          }
        }
      },
      builder: (context, state) {
        if (state is GetEditScreenPositionResumeSuccessState) {
          isGetPositionResumeResponse =
              state.isGetPositionResumeResponse;
          String? textPositionTh =
              '${isGetPositionResumeResponse?.body?.screeninfo?.positionTh} *';
          String? textPositionEn =
              '${isGetPositionResumeResponse?.body?.screeninfo?.positionEn} *';
          String? textOfficeTh =
              '${isGetPositionResumeResponse?.body?.screeninfo?.officeTh} *';
          String? textOfficeEn =
              '${isGetPositionResumeResponse?.body?.screeninfo?.officeEn} *';
          String? textEditInfo=
              isGetPositionResumeResponse?.body?.screeninfo?.editinfomations;
          String? textSave =
              isGetPositionResumeResponse?.body?.screeninfo?.save;
          String? positionTh = isGetPositionResumeResponse?.body?.data?.positionTh;
          String? positionEn = isGetPositionResumeResponse?.body?.data?.positionEn;
          String? officeTh = isGetPositionResumeResponse?.body?.data?.officeTh;
          String? officeEn = isGetPositionResumeResponse?.body?.data?.officeEn;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
              title: Text(textEditInfo ??
                      '',
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: sizeTitle24,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  )),
            ),
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
                        textEditingController: officeControllerTH,
                        onChanged: (valueOfficeControllerTH) {
                          setState(() {
                            officeControllerTH.text = valueOfficeControllerTH;
                          });
                          if (kDebugMode) {
                            print(officeControllerTH.text);
                          }
                        },
                        hintLabel: textOfficeTh,
                        initialvalue: officeTh,
                        textInputType: TextInputType.text,
                      ),

                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: officeControllerEN,
                        onChanged: (valueOfficeControllerEN) {
                          setState(() {
                            officeControllerEN.text = valueOfficeControllerEN;
                          });

                          if (kDebugMode) {
                            print(officeControllerEN.text);
                          }
                        },
                        hintLabel: textOfficeEn,
                        initialvalue: officeEn,
                        textInputType: TextInputType.text,
                      ),PopupMenuButton(
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
                                            : "การแสดงอันดับที่ $isSearchStatus"
                                            : "การแสดงอันดับที่ $searchStatus",
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
                          return List.generate(10,
                                  (index) {
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

                            width: widget.id >0 ? null:MediaQuery.of(context).size.width-50,
                            child: ButtonIconsCustomLimit(
                              label:  widget.id >0 ?
                              isGetPositionResumeResponse?.body?.screeninfo?.editinfomations??"แก้ไขข้อมูล" :
                              isGetPositionResumeResponse?.body?.screeninfo?.save??"บันทึก",
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
                                context.read<ResumeBloc>().add(SentEditPositionsResumeEvent(
                                  edit: true,
                                  positionsId:widget.id,
                                  orderChoose: searchStatus,
                                  positionControllerTH:(positionControllerTH.text == ''
                                      ? positionTh
                                      : positionControllerTH.text) ??
                                      '',
                                  positionControllerEN: (positionControllerEN.text == ''
                                      ? positionEn
                                      : positionControllerEN.text) ??
                                      '',
                                  officeControllerTH:  (officeControllerTH.text == ''
                                      ? officeTh
                                      : officeControllerTH.text) ??
                                      '',
                                  officeControllerEN:  (officeControllerEN.text == ''
                                      ? officeEn
                                      : officeControllerEN.text) ??
                                      '',
                                ));
                              },
                            ),
                          )
                          ,
                          if(widget.id >0)
                            Container(
                              child: ButtonIconsCustomLimit(
                                label: isGetPositionResumeResponse?.body?.screeninfo?.deleteor??" Delete/ลบ",
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
                                  context.read<ResumeBloc>().add(SentEditPositionsResumeEvent(
                                    edit: false,
                                    positionsId:widget.id,
                                    orderChoose: searchStatus,
                                      positionControllerTH:(positionControllerTH.text == ''
                                          ? positionTh
                                          : positionControllerTH.text) ??
                                          '',
                                      positionControllerEN: (positionControllerEN.text == ''
                                          ? positionEn
                                          : positionControllerEN.text) ??
                                          '',
                                      officeControllerTH:  (officeControllerTH.text == ''
                                          ? officeTh
                                          : officeControllerTH.text) ??
                                          '',
                                      officeControllerEN:  (officeControllerEN.text == ''
                                          ? officeEn
                                          : officeControllerEN.text) ??
                                          '',
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
        return state is GetEditScreenPositionResumeSuccessState;
      },
    );
  }
}
