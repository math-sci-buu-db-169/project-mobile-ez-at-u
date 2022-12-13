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
  const EditPositionsResumeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetEditScreenPositionsResumeEvent()),
        // child: const GenerativeWidget());
        child: const EditPositionsResumePage());
  }
}

class EditPositionsResumePage extends StatefulWidget {
  const EditPositionsResumePage({
    Key? key,
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
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;
  GetPositionResumeResponse? isGetPositionResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    getUserLanguage();
    _isSessionUnauthorized();
    _isSessionPin();
    // localAuth(context);
    context.read<ResumeBloc>().add(GetEditScreenPositionsResumeEvent());
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

  TextEditingController positionControllerTH = TextEditingController();
  TextEditingController positionControllerEN = TextEditingController();
  TextEditingController officeControllerTH = TextEditingController();
  TextEditingController officeControllerEN = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenPositionResumeSuccessState) {
          isGetPositionResumeResponse =
              state.isGetPositionResumeResponse;
          setState(() {});
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
          String? positionTh = isGetPositionResumeResponse?.body?.data?.position;
          String? positionEn = isGetPositionResumeResponse?.body?.data?.positionen;
          String? officeTh = isGetPositionResumeResponse?.body?.data?.office;
          String? officeEn = isGetPositionResumeResponse?.body?.data?.officeen;

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
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            officeControllerTH.text = valueNameControllerTH;
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
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            officeControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(officeControllerEN.text);
                          }
                        },
                        hintLabel: textOfficeEn,
                        initialvalue: officeEn,
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
              positionControllerTH: (positionControllerTH.text == ''
                      ? positionTh
                      : positionControllerTH.text) ??
                  '',
              positionControllerEN: (positionControllerEN.text == ''
                      ? positionEn
                      : positionControllerEN.text) ??
                  '',
              officeControllerTH: (officeControllerTH.text == ''
                      ? officeTh
                      : positionControllerTH.text) ??
                  '',
              officeControllerEN: (officeControllerEN.text == ''
                      ? officeEn
                      : officeControllerEN.text) ??
                  '',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
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

floatingSetThemePDF(
  setState,
  String pdf, {
  required BuildContext context,
  required String positionControllerTH,
  required String positionControllerEN,
  required String officeControllerTH,
  required String officeControllerEN,
}) {return FloatingActionButton.extended(
    backgroundColor:
        Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      context.read<ResumeBloc>().add(SentEditPositionsResumeEvent(
          positionControllerTH: positionControllerTH,
          positionControllerEN: positionControllerEN,
          officeControllerTH: '',
          officeControllerEN: ''));
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
