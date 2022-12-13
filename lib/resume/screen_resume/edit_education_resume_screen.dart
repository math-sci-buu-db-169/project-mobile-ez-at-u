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
import '../../customs/color/color_const.dart';
import '../../customs/datepicker/custom_date_picker_for_teacher.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import '../examples/content_design_resume.dart';
import '../examples/content_design_resume_edit.dart';
import '../model/response/get_about_me_resume_response.dart';
import '../model/response/get_education_resume_response.dart';
import '../model/response/get_user_infomartion_resume_response.dart';

class EditEducationResumeScreen extends StatelessWidget {
  const EditEducationResumeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetEditScreenEducationResumeEvent()),
        // child: const GenerativeWidget());
        child: const EditEducationResumePage());
  }
}

class EditEducationResumePage extends StatefulWidget {
  const EditEducationResumePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditEducationResumePage> createState() => _EditEducationResumePageState();
}

class _EditEducationResumePageState extends State<EditEducationResumePage>
    with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;
  late String searchStatus;
  late String typeStatus;
  GetEducationResumeResponse? isGetEducationResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    searchStatus   = 'bd' ;
    typeStatus = '' ;
    getUserLanguage();
    _isSessionUnauthorized();
    _isSessionPin();
    // localAuth(context);
    context.read<ResumeBloc>().add(GetEditScreenAboutMeResumeEvent());
    super.initState();
  }

  Future<void> _isSessionPin() async {
    prefs = await SharedPreferences.getInstance();
    String pinStringToBool = prefs.getString('pinStatus') ?? 'false';
    String bioStringToBool = prefs.getString('bioStatus') ?? 'false';
    _isHiddenPin = pinStringToBool == 'true' ? true : false;
    _isHiddenBio = bioStringToBool == 'true' ? true : false;
    _pinValueString = prefs.getString('pinValue') ?? '...';

    setState(() {});
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

  TextEditingController aboutMeControllerTH = TextEditingController();
  TextEditingController aboutMeControllerEN = TextEditingController();
  TextEditingController fDate = TextEditingController();
  TextEditingController sDate = TextEditingController();
   List<String> lengthPopupMenuItem =["High School Certificate","Bachelor Degrees","Master Degrees","Doctor Degrees","Honorary Doctorate Degree"];

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenEducationResumeSuccessState) {
          isGetEducationResumeResponse =
              state.isGetEducationResumeResponse;
          setState(() {});
        }
        if (state is SentEditAboutMeResumeSuccessState) {
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
        if (state is GetEditScreenEducationResumeSuccessState) {
          isGetEducationResumeResponse =
              state.isGetEducationResumeResponse;
          String? textPlaceOfStudyTh =
              '${isGetEducationResumeResponse?.body?.screeninfo?.placeofstudyTh} *';
          String? textEditInfo=
              isGetEducationResumeResponse?.body?.screeninfo?.editinfomations;
          String? textSave =
              isGetEducationResumeResponse?.body?.screeninfo?.save;
          String? textPlaceOfStudyEn =
              '${isGetEducationResumeResponse?.body?.screeninfo?.placeofstudyEn} *';
          String? textStartDateTh =isGetEducationResumeResponse?.body?.screeninfo?.startdateTh;
          String? textStartDateEn =isGetEducationResumeResponse?.body?.screeninfo?.startdateEn;
          String? textEndDateTh =isGetEducationResumeResponse?.body?.screeninfo?.enddateTh;
          String? textEndDateEn =isGetEducationResumeResponse?.body?.screeninfo?.enddateEn;
          String? placeOfStudyTh = isGetEducationResumeResponse?.body?.data?.hsc?.detail;
          String? placeOfStudyEn = isGetEducationResumeResponse?.body?.data?.hsc?.detailen;

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

                      CustomDatePickerForTeacher(
                        textOnTopOfDatePicker: '$textStartDateTh / $textStartDateEn  *',
                        hintLabel:'$textStartDateTh / $textStartDateEn  *',
                        callbackFromCustomDatePicker: (String result) {
                          sDate.text = result;
                          if (kDebugMode) {
                            print(sDate.text);
                          }
                        },
                      ),

                      CustomDatePickerForTeacher(
                        textOnTopOfDatePicker: '$textEndDateTh / $textEndDateEn  *',
                        hintLabel:'$textEndDateTh / $textEndDateEn  *',
                        callbackFromCustomDatePicker: (String result) {
                          fDate.text = result;
                          if (kDebugMode) {
                            print(fDate.text);
                          }
                        },
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
                                    typeStatus,
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
                              value: index,
                              child: Text(lengthPopupMenuItem[index] ??'Settings',style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                            );

                          }
                          );
                        },
                        onSelected: (value) {
                          var isSearchStatus = 'bd';

                            // switch(int.parse(value)){
                            switch(value){
                              case 0 :{
                                isSearchStatus = 'hsc';
                              }break;
                              case 1 :{
                                isSearchStatus = 'bd';
                              }break;
                              case 2 :{
                                isSearchStatus = 'md';
                              }break;
                              case 3 :{
                                isSearchStatus = 'dd';
                              }break;

                              case 4 :{
                                isSearchStatus = 'hdd';
                              }break;

                              default :{
                                isSearchStatus = '';
                              }break;

                            }

                          setState(() {

                            searchStatus = isSearchStatus;
                            typeStatus = lengthPopupMenuItem[value] ;
                          }
                          );

                        },

                      ),


                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: aboutMeControllerTH,
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            aboutMeControllerTH.text = valueNameControllerTH;
                          });
                          if (kDebugMode) {
                            print(aboutMeControllerTH.text);
                          }
                        },
                        hintLabel: textPlaceOfStudyTh,
                        initialvalue: placeOfStudyTh,
                        textInputType: TextInputType.text,
                      ),

                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: aboutMeControllerEN,
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            aboutMeControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(aboutMeControllerEN.text);
                          }
                        },
                        hintLabel: textPlaceOfStudyEn,
                        initialvalue: placeOfStudyEn,
                        textInputType: TextInputType.text,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: floatingSetThemePDF(
              context: context,
              setState,
              textSave ?? 'Save',
              aboutMeControllerTH: (aboutMeControllerTH.text == ''
                      ? placeOfStudyTh
                      : aboutMeControllerTH.text) ??
                  '',
              aboutMeControllerEN: (aboutMeControllerEN.text == ''
                      ? placeOfStudyEn
                      : aboutMeControllerEN.text) ??
                  '',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
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

floatingSetThemePDF(
  setState,
  String pdf, {
  required BuildContext context,
  required String aboutMeControllerTH,
  required String aboutMeControllerEN,
}) {return FloatingActionButton.extended(
    backgroundColor:
        Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      context.read<ResumeBloc>().add(SentEditAboutMeResumeEvent(
          aboutMeControllerTH: aboutMeControllerTH,
          aboutMeControllerEN: aboutMeControllerEN));
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => const ContentDesignResumeScreen()));
    },
    icon: Icon(
      FontAwesomeIcons.barsStaggered,
      color: Theme.of(context).iconTheme.color,
      size: 20.0,
    ),
    label: Text('   ${pdf ?? 'PDF'}',
        style: TextStyle(
          fontSize: sizeTextSmaller14,
          color: Theme.of(context).iconTheme.color,
        )),
  );
}
