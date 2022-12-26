
import 'package:ez_at_u/resume/model/response/pre_view_resume_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../utils/shared_preferences.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import '../components/components_resume.dart';
import '../examples/content_design_resume.dart';
class EditResumeScreen extends StatelessWidget {
  final PreViewResumeResponse isResumeData;
  const EditResumeScreen({Key? key, required this.isResumeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ResumeBloc(),
        // child: const GenerativeWidget());
        child:  EditResumePage(isResumeData:isResumeData));
  }
}

class EditResumePage extends StatefulWidget {
  final PreViewResumeResponse isResumeData;
  const EditResumePage({Key? key, required this.isResumeData}) : super(key: key);

  @override
  State<EditResumePage> createState() => _EditResumePageState();
}

class _EditResumePageState extends State<EditResumePage> with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;
  var isPreViewResumeResponse ;
  @override
  void initState() {
     isPreViewResumeResponse = widget.isResumeData;
    valueLanguage = "TH";
    getUserLanguage();
    _isSessionUnauthorized();
    _isSessionPin();
    // localAuth(context);
    super.initState();
  }
  Future<void> _isSessionPin() async {
    prefs = await SharedPreferences.getInstance();
    String pinStringToBool = prefs.getString('pinStatus') ?? 'false';
    String bioStringToBool = prefs.getString('bioStatus') ?? 'false';
    _isHiddenPin = pinStringToBool == 'true'? true:false;
    _isHiddenBio = bioStringToBool == 'true'? true:false;
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
    textSessionExpired = valueLanguage =='EN'? textUnauthorizedEN:textUnauthorizedTH;
    textSubSessionExpired = valueLanguage =='EN'? textSubUnauthorizedEN:textSubUnauthorizedTH;
    _buttonOk = valueLanguage =='EN'? buttonOkEN:buttonOkTH;
    setState(() {

    });

  }
  TextEditingController aboutMeTH = TextEditingController();
  TextEditingController aboutMeEN = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
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
        return Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(child: Text('kkkk'),),
                      buildDetailResumeCustomNotIconsReadOnly(
                          context: context,
                          detail:
                          "         ${isPreViewResumeResponse.body?.data?.aboutme ?? "About me"}",
                          appBarForeGroundColor: Theme.of(context).appBarTheme.foregroundColor??Colors.black)
                          ,
                      BuildTextFormFieldUnLimitCustomNotIcons(
                        textEditingController: aboutMeTH,
                        maxLength: 255,
                        onChanged: (value) {
                          aboutMeTH.text = value;
                          if (kDebugMode) {
                            print(aboutMeTH.text);
                          }
                        },
                        hintLabel:
                        "   ${isPreViewResumeResponse.body?.data?.aboutme ?? "รายละเอียดเกี่ยวกับฉัน"}",
                        initialvalue: isPreViewResumeResponse
                            .body?.data?.aboutme ??
                            "รายละเอียดเกี่ยวกับฉัน",
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIcons(
                        textEditingController: aboutMeEN,
                        maxLength: 255,
                        onChanged: (value) {
                          aboutMeTH.text = value;
                          if (kDebugMode) {
                            print(aboutMeTH.text);
                          }
                        },
                        hintLabel:
                        "   ${isPreViewResumeResponse.body?.data?.aboutme ?? "รายละเอียดเกี่ยวกับฉัน"}",
                        initialvalue: isPreViewResumeResponse
                            .body?.data?.aboutme ??
                            "รายละเอียดเกี่ยวกับฉัน",
                        textInputType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
      // buildWhen: (context, state) {
      //   return state is MainRouteLogin || state is RefreshTokenSuccessState || state is TokenExpiredState|| state is CheckTokenExpiredState;
      // },
    );
  }
}
