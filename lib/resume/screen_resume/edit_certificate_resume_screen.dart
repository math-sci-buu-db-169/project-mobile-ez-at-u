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
import '../examples/content_design_resume_edit.dart';
import '../model/response/get_certificate_resume_response.dart';

class EditCertificateResumeScreen extends StatelessWidget {
  final int  id;
  const EditCertificateResumeScreen({
    Key? key, required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        ResumeBloc()..add(GetEditScreenCertificateResumeEvent(id: id)),
        // child: const GenerativeWidget());
        child:  EditCertificateResumePage(id:id));
  }
}

class EditCertificateResumePage extends StatefulWidget {
  final int  id;
  const EditCertificateResumePage({
    Key? key, required this.id,
  }) : super(key: key);

  @override
  State<EditCertificateResumePage> createState() => _EditCertificateResumePageState();
}

class _EditCertificateResumePageState extends State<EditCertificateResumePage>
    with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late int orderChoose;
  late int isSearchStatus;
  GetCertificateResumeResponse? isGetCertificateResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    orderChoose   = 0 ;
    isSearchStatus   = 0 ;
    getUserLanguage();
    _isSessionUnauthorized();
    context.read<ResumeBloc>().add(GetEditScreenCertificateResumeEvent(id: widget.id));
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

  TextEditingController titleControllerTH = TextEditingController();
  TextEditingController titleControllerEN = TextEditingController();
  TextEditingController detailControllerTH = TextEditingController();
  TextEditingController detailControllerEN = TextEditingController();
  List<String> lengthPopupMenuItem =["High School Certificate","Bachelor Degrees","Master Degrees","Doctor Degrees","Honorary Doctorate Degree"];


  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenCertificateResumeSuccessState) {
          isGetCertificateResumeResponse =
              state.isGetCertificateResumeResponse;
          setState(() {

            orderChoose = isGetCertificateResumeResponse?.body?.data?.orderchoose??0 ;
          });
        }
        if (state is SentEditCertificateResumeSuccessState) {
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
        if (state is GetEditScreenCertificateResumeSuccessState) {
          isGetCertificateResumeResponse =
              state.isGetCertificateResumeResponse;
          String? textTitleTh =
              '${isGetCertificateResumeResponse?.body?.screeninfo?.titleTh} *';
          String? textTitleEn =
              '${isGetCertificateResumeResponse?.body?.screeninfo?.titleEn} *';
          String? textDetailTh =
              '${isGetCertificateResumeResponse?.body?.screeninfo?.descriptionTh} *';
          String? textDetailEn =
              '${isGetCertificateResumeResponse?.body?.screeninfo?.descriptionEn} *';
          String? textEditInfo=
              isGetCertificateResumeResponse?.body?.screeninfo?.editinfomations;
          String? textSave =
              isGetCertificateResumeResponse?.body?.screeninfo?.save;
          String? titleTh = isGetCertificateResumeResponse?.body?.data?.title;
          String? titleEn = isGetCertificateResumeResponse?.body?.data?.titleen;
          String? detailTh = isGetCertificateResumeResponse?.body?.data?.description;
          String? detailEn = isGetCertificateResumeResponse?.body?.data?.descriptionen;

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
                    size: 20,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  ),
                ),
                title: Text(textEditInfo ??
                    '',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color:
                        Theme.of(context).appBarTheme.foregroundColor))),
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
                        textEditingController: titleControllerTH,
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            titleControllerTH.text = valueNameControllerTH;
                          });
                          if (kDebugMode) {
                            print(titleControllerTH.text);
                          }
                        },
                        hintLabel: textTitleTh,
                        initialvalue: titleTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: titleControllerEN,
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            titleControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(titleControllerEN.text);
                          }
                        },
                        hintLabel: textTitleEn,
                        initialvalue: titleEn,
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
                                padding: EdgeInsets.only(right: 5,left: 5,top: 20,bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Theme.of(context).primaryColor == Colors.black
                                      ? Color(0xFF1F222A)
                                      : Colors.transparent.withOpacity(0.03),
                                ),
                                child: Padding(padding: EdgeInsets.only(left: 10,right: 10),child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      orderChoose == 0?
                                      isSearchStatus == 0?
                                      "โปรดเลือกลำดับการแสดง":
                                      "การแสดงอันดับที่  $isSearchStatus"
                                          :"การแสดงอันดับที่  $orderChoose",
                                      style: TextStyle(
                                        // decoration: TextDecoration.underline,
                                          decorationThickness: 2,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).appBarTheme.foregroundColor),
                                    ), Text(
                                      'เลือก',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).appBarTheme.foregroundColor),
                                    ),

                                  ],
                                ),)
                            ),

                          ),
                        ),
                        itemBuilder: (context) {
                          return List.generate(
                              (lengthPopupMenuItem.length)
                              , (index) {

                            return  PopupMenuItem(
                              value: index + 1,
                              child: Text("${index + 1}" ??'Settings',style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                            );

                          }
                          );
                        },
                        onSelected: (value) {
                          isSearchStatus = value ;
                          orderChoose = value ;
                          setState(() {
                            isSearchStatus = value ;
                            orderChoose = value ;
                          }
                          );

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
                              isGetCertificateResumeResponse?.body?.screeninfo?.editinfomations??"แก้ไขข้อมูล" :
                              isGetCertificateResumeResponse?.body?.screeninfo?.save??"บันทึก",

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
                                context.read<ResumeBloc>().add(SentEditCertificateResumeEvent(
                                  edit: true,
                                  id:widget.id,
                                  orderChoose: orderChoose,
                                  titleTH :(titleControllerTH.text == ''
                                      ? titleTh
                                      : titleControllerTH.text) ??
                                      '',
                                  titleEN : (titleControllerEN.text == ''
                                      ? titleEn
                                      : titleControllerEN.text) ??
                                      '' ,
                                  detailTH :(detailControllerTH.text == ''
                                      ? detailTh
                                      : detailControllerTH.text) ??
                                      '' ,
                                  detailEN : (detailControllerEN.text == ''
                                      ? detailEn
                                      : detailControllerEN.text) ??
                                      '' ,
                                ));
                              },
                            ),
                          )
                          ,
                          if(widget.id >0)
                          Container(
                            child: ButtonIconsCustomLimit(
                              label:  isGetCertificateResumeResponse?.body?.screeninfo?.deleteor??"Delete/ลบ",
                              // label: "ดูทั้งหมด",
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
                                context.read<ResumeBloc>().add(SentEditCertificateResumeEvent(
                                  edit: false,
                                  id:widget.id,
                                  orderChoose: orderChoose,
                                  titleTH :(titleControllerTH.text == ''
                                      ? titleTh
                                      : titleControllerTH.text) ??
                                      '',
                                  titleEN : (titleControllerEN.text == ''
                                      ? titleEn
                                      : titleControllerEN.text) ??
                                      '' ,
                                  detailTH :(detailControllerTH.text == ''
                                      ? detailTh
                                      : detailControllerTH.text) ??
                                      '' ,
                                  detailEN : (detailControllerEN.text == ''
                                      ? detailEn
                                      : detailControllerEN.text) ??
                                      '' ,
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
        return state is GetEditScreenCertificateResumeSuccessState;
      },
    );
  }
}