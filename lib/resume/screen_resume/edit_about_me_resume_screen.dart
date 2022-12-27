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
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import '../components/components_resume.dart';
import '../examples/content_design_resume_edit.dart';
import '../model/response/get_about_me_resume_response.dart';

class EditAboutMeResumeScreen extends StatelessWidget {
  const EditAboutMeResumeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetEditScreenAboutMeResumeEvent()),
        // child: const GenerativeWidget());
        child: const EditAboutMeResumePage());
  }
}

class EditAboutMeResumePage extends StatefulWidget {
  const EditAboutMeResumePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditAboutMeResumePage> createState() => _EditAboutMeResumePageState();
}

class _EditAboutMeResumePageState extends State<EditAboutMeResumePage>
    with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;
  GetAboutMeResumeResponse? isGetAboutMeResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
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

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenAboutMeResumeSuccessState) {
          isGetAboutMeResumeResponse =
              state.isGetAboutMeResumeResponse;
          setState(() {});
        }
        if (state is SentEditAboutMeResumeSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ContentDesignResumeEditScreen()));
        }
        if (state is AboutMePreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is AboutMePreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is AboutMeResumeError) {
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
        if (state is GetEditScreenAboutMeResumeSuccessState) {
          isGetAboutMeResumeResponse =
              state.isGetAboutMeResumeResponse;
          String? textAboutMeTh =
              '${isGetAboutMeResumeResponse?.body?.screeninfo?.aboutmeTh} *';
          String? textEditInfo=
              isGetAboutMeResumeResponse?.body?.screeninfo?.editinfomations;
          String? textSave =
              isGetAboutMeResumeResponse?.body?.screeninfo?.save;
          String? textAboutMeEn =
              '${isGetAboutMeResumeResponse?.body?.screeninfo?.aboutmeEn} *';
          String? aboutMeTh = isGetAboutMeResumeResponse?.body?.data?.details;
          String? aboutMeEn = isGetAboutMeResumeResponse?.body?.data?.detailsen;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  context.read<ResumeBloc>().add(SentEditAboutMeResumeEvent(
                    aboutMeControllerTH: (aboutMeControllerTH.text == ''
                        ? aboutMeTh
                        : aboutMeControllerTH.text) ??
                        '',
                    aboutMeControllerEN: (aboutMeControllerEN.text == ''
                        ? aboutMeEn
                        : aboutMeControllerEN.text) ??
                        '',));
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
                        maxLength:256,
                        textEditingController: aboutMeControllerTH,
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            aboutMeControllerTH.text = valueNameControllerTH;
                          });
                          if (kDebugMode) {
                            print(aboutMeControllerTH.text);
                          }
                        },
                        hintLabel: textAboutMeTh,
                        initialvalue: aboutMeTh,
                        textInputType: TextInputType.text,
                      ),

                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        maxLength:256,
                        textEditingController: aboutMeControllerEN,
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            aboutMeControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(aboutMeControllerEN.text);
                          }
                        },
                        hintLabel: textAboutMeEn,
                        initialvalue: aboutMeEn,
                        textInputType: TextInputType.text,
                      ),

                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: floatingButtonSave(
              context: context,
              setState,
              textSave ?? 'Save',
              pop: false,
              onPressed: () {
                context.read<ResumeBloc>().add(SentEditAboutMeResumeEvent(
                    aboutMeControllerTH: (aboutMeControllerTH.text == ''
                        ? aboutMeTh
                        : aboutMeControllerTH.text) ??
                        '',
                    aboutMeControllerEN: (aboutMeControllerEN.text == ''
                        ? aboutMeEn
                        : aboutMeControllerEN.text) ??
                        '',));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const ContentDesignResumeScreen()));
              },
            ),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        }
        return Container();
      },
      buildWhen: (context, state) {
        return state is GetEditScreenAboutMeResumeSuccessState;
      },
    );
  }
}
