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
import '../model/response/get_user_infomartion_resume_response.dart';

class EditUserInfoResumeScreen extends StatelessWidget {
  const EditUserInfoResumeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetEditScreenUserInfoResumeEvent()),
        // child: const GenerativeWidget());
        child: const EditUserInfoResumePage());
  }
}

class EditUserInfoResumePage extends StatefulWidget {
  const EditUserInfoResumePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditUserInfoResumePage> createState() => _EditUserInfoResumePageState();
}

class _EditUserInfoResumePageState extends State<EditUserInfoResumePage>
    with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;
  GetUserInformationResumeResponse? isGetUserInformationResumeResponse;
  @override
  void initState() {
    valueLanguage = "TH";
    getUserLanguage();
    _isSessionUnauthorized();
    _isSessionPin();
    // localAuth(context);
    context.read<ResumeBloc>().add(GetEditScreenUserInfoResumeEvent());
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

  TextEditingController nameControllerTH = TextEditingController();
  TextEditingController lastNameControllerTH = TextEditingController();
  TextEditingController prefixControllerTH = TextEditingController();
  TextEditingController nameControllerEN = TextEditingController();
  TextEditingController lastNameControllerEN = TextEditingController();
  TextEditingController prefixControllerEN = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenUserInfoResumeSuccessState) {
          isGetUserInformationResumeResponse =
              state.isGetUserInformationResumeResponse;
          print("isGetUserInformationResumeResponse?.body?.data?.name ");
          print(isGetUserInformationResumeResponse?.body?.data?.name);
          setState(() {});
        }
        if (state is SentEditUserInfoResumeSuccessState) {
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
        if (state is GetEditScreenUserInfoResumeSuccessState) {
          isGetUserInformationResumeResponse =
              state.isGetUserInformationResumeResponse;
          String? textNameTh =
              '${isGetUserInformationResumeResponse?.body?.screeninfo?.textnameTh} *';
          String? textSave =
              isGetUserInformationResumeResponse?.body?.screeninfo?.save;
          String? textNameEn =
              '${isGetUserInformationResumeResponse?.body?.screeninfo?.textnameEn} *';
          String? textLastNameTh =
              '${isGetUserInformationResumeResponse?.body?.screeninfo?.textlastnameTh} *';
          String? textLastNameEn =
              '${isGetUserInformationResumeResponse?.body?.screeninfo?.textlastnameEn} *';
          Color? appBarBackgroundColor =
              Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
          Color? appBarforegroundColor =
              Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
          String? nameTh = isGetUserInformationResumeResponse?.body?.data?.name;
          String? nameEn =
              isGetUserInformationResumeResponse?.body?.data?.nameen;
          String? lastNameTh =
              isGetUserInformationResumeResponse?.body?.data?.lastname;
          String? lastNameEn =
              isGetUserInformationResumeResponse?.body?.data?.lastnameen;
          String? prefixTH =
              isGetUserInformationResumeResponse?.body?.data?.prefix;
          String? prefixEn =
              isGetUserInformationResumeResponse?.body?.data?.prefixen;
          // nameControllerTH.text = nameTh??'';
          // nameControllerEN.text = nameEn??'';
          // lastNameControllerTH.text = lastNameTh??'';
          // lastNameControllerEN.text = lastNameEn??'';
          // prefixControllerTH.text = prefixTH??'';
          // prefixControllerEN.text = prefixEn??'';
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
              title: Text(
                  isGetUserInformationResumeResponse
                          ?.body?.screeninfo?.editinfomations ??
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
                        textEditingController: nameControllerTH,
                        onChanged: (valueNameControllerTH) {
                          setState(() {
                            nameControllerTH.text = valueNameControllerTH;
                          });
                          if (kDebugMode) {
                            print(nameControllerTH.text);
                          }
                        },
                        hintLabel: textNameTh,
                        initialvalue: nameTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: lastNameControllerTH,
                        onChanged: (valueLastNameControllerTH) {
                          setState(() {
                            lastNameControllerTH.text =
                                valueLastNameControllerTH;
                          });

                          if (kDebugMode) {
                            print(lastNameControllerTH.text);
                          }
                        },
                        hintLabel: textLastNameTh,
                        initialvalue: lastNameTh,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: nameControllerEN,
                        onChanged: (valueNameControllerEN) {
                          setState(() {
                            nameControllerEN.text = valueNameControllerEN;
                          });

                          if (kDebugMode) {
                            print(nameControllerEN.text);
                          }
                        },
                        hintLabel: textNameEn,
                        initialvalue: nameEn,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: lastNameControllerEN,
                        onChanged: (valueLastNameControllerEN) {
                          setState(() {
                            lastNameControllerEN.text =
                                valueLastNameControllerEN;
                          });
                          if (kDebugMode) {
                            print(lastNameControllerEN.text);
                          }
                        },
                        hintLabel: textLastNameEn,
                        initialvalue: lastNameEn,
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
              nameControllerTH: (nameControllerTH.text == ''
                      ? nameTh
                      : nameControllerTH.text) ??
                  '',
              lastNameControllerTH: (lastNameControllerTH.text == ''
                      ? lastNameTh
                      : lastNameControllerTH.text) ??
                  '',
              prefixControllerTH: (prefixControllerTH.text == ''
                      ? prefixTH
                      : prefixControllerTH.text) ??
                  '',
              nameControllerEN: (nameControllerEN.text == ''
                      ? nameEn
                      : nameControllerEN.text) ??
                  '',
              lastNameControllerEN: (lastNameControllerEN.text == ''
                      ? lastNameEn
                      : lastNameControllerEN.text) ??
                  '',
              prefixControllerEN: (prefixControllerEN.text == ''
                      ? prefixEn
                      : prefixControllerEN.text) ??
                  '',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        }
        return Container();
      },
      buildWhen: (context, state) {
        return state is GetEditScreenUserInfoResumeSuccessState;
      },
    );
  }
}

floatingSetThemePDF(
  setState,
  String pdf, {
  required BuildContext context,
  required String nameControllerTH,
  required String lastNameControllerTH,
  required String prefixControllerTH,
  required String nameControllerEN,
  required String lastNameControllerEN,
  required String prefixControllerEN,
}) {
  print(
      " prefix: $prefixControllerTH ,name: $nameControllerTH,lastName: $lastNameControllerTH,prefixEN: $prefixControllerEN,nameEN: $nameControllerEN,lastNameEN: $lastNameControllerEN");
  return FloatingActionButton.extended(
    backgroundColor:
        Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      context.read<ResumeBloc>().add(SentEditUserInfoResumeEvent(
          prefix: prefixControllerTH,
          name: nameControllerTH,
          lastName: lastNameControllerTH,
          prefixEN: prefixControllerEN,
          nameEN: nameControllerEN,
          lastNameEN: lastNameControllerEN));
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
