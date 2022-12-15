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
  final int id;
  final String type;
  const EditEducationResumeScreen({
    Key? key, required this.id, required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetEditScreenEducationResumeEvent(eduId: id, type: type)),
        // child: const GenerativeWidget());
        child:  EditEducationResumePage(id: id, type: type,));
  }
}

class EditEducationResumePage extends StatefulWidget {
  final int id;
final String type;
  const EditEducationResumePage({
    Key? key, required this.id, required this.type,
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
  late int orderChoose;
  late String typeStatus;
  late String typeShow;
  GetEducationResumeResponse? isGetEducationResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    typeStatus   = 'bd' ;
    typeShow = '' ;
    orderChoose = 0 ;
    getUserLanguage();
    _isSessionUnauthorized();
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
  TextEditingController typeController = TextEditingController();
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
          setState(() {

            typeShow =isGetEducationResumeResponse?.body?.data?.type??'';
          });
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
          String? textDetailTh =isGetEducationResumeResponse?.body?.screeninfo?.detailTh;
          String? textDetailEn =isGetEducationResumeResponse?.body?.screeninfo?.detailEn;
          String? placeOfStudyTh = isGetEducationResumeResponse?.body?.data?.placeofstudyTh;
          String? placeOfStudyEn = isGetEducationResumeResponse?.body?.data?.placeofstudyEn;
          String? detailTh = isGetEducationResumeResponse?.body?.data?.detailTh;
          String? detailEn = isGetEducationResumeResponse?.body?.data?.detailEn;
          String? startDate = isGetEducationResumeResponse?.body?.data?.startdate;
          String? endDate = isGetEducationResumeResponse?.body?.data?.enddate;
          String? type = isGetEducationResumeResponse?.body?.data?.type;

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
                          startDateController.text = result;
                          if (kDebugMode) {
                            print(startDateController.text);
                          }
                        },
                      ),

                      CustomDatePickerForTeacher(
                        textOnTopOfDatePicker: '$textEndDateTh / $textEndDateEn  *',
                        hintLabel:'$textEndDateTh / $textEndDateEn  *',
                        callbackFromCustomDatePicker: (String result) {
                          endDateController.text = result;
                          if (kDebugMode) {
                            print(endDateController.text);
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
                                    typeShow,
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
                              (isGetEducationResumeResponse?.body?.type?.length??0)
                              , (index) {

                            return  PopupMenuItem(
                              value: index,
                              child: Text(isGetEducationResumeResponse?.body?.type?[index].typeEn ??'',style: TextStyle(fontSize:12,color: Theme.of(context).appBarTheme.foregroundColor),),
                            );

                          }
                          );
                        },
                        onSelected: (value) {
                          var isSearchStatus = 'bd';

                          setState(() {

                            typeStatus = isGetEducationResumeResponse?.body?.type?[value].typeid?? "bd";
                            typeController.text  = isGetEducationResumeResponse?.body?.type?[value].typeid?? "bd";
                            typeShow = lengthPopupMenuItem[value] ;
                          }
                          );

                        },

                      ),


                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: placeOfStudyControllerTH,
                        onChanged: (valuePlaceOfStudyControllerTH) {
                          setState(() {
                            placeOfStudyControllerTH.text = valuePlaceOfStudyControllerTH;
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
                            placeOfStudyControllerEN.text = valuePlaceOfStudyControllerEN;
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
                            print( detailControllerTH.text);
                          }
                        },
                        hintLabel: textDetailTh,
                        initialvalue:  detailTh,
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

                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: floatingSetThemePDF(
              context: context,
              setState,
              textSave ?? 'Save',
              id:widget.id,
              orderChoose:orderChoose,
              startDate: (startDateController.text == ''
                  ? startDate
                  : startDateController.text) ??
                  '',
              endDate:  (endDateController.text == ''
                  ? endDate
                  : endDateController.text) ??
                  '',
              type:  (typeController.text == ''
                  ? type
                  : typeController.text) ??
                  '',
              placeOfStudy: (placeOfStudyControllerTH.text == ''
                  ? placeOfStudyTh
                  : placeOfStudyControllerTH.text) ??
                  '',
              placeOfStudyEN: (placeOfStudyControllerEN.text == ''
                  ? placeOfStudyEn
                  : placeOfStudyControllerEN.text) ??
                  '',
              detailTH: (detailControllerTH.text == ''
                  ?detailTh
                  : detailControllerTH.text) ??
                  '',
              detailEN: (detailControllerTH.text == ''
                  ? detailEn
                  : detailControllerTH.text) ??
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
  required int id,
  required int orderChoose,
  required String startDate,
  required String endDate,
  required String type,
  required String placeOfStudy,
  required String placeOfStudyEN,
  required String detailTH,
  required String detailEN,
}) {return FloatingActionButton.extended(
    backgroundColor:
        Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      context.read<ResumeBloc>().add(SentEditEducationResumeEvent(
          id:id,
          orderChoose:orderChoose,
          startDate:startDate,
          endDate:endDate,
          type:type,
          placeOfStudy:placeOfStudy,
          placeOfStudyEN:placeOfStudyEN,
          detailTH:detailTH,
          detailEN:detailEN,
          ));
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
