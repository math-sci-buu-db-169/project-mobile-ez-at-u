import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../module/login/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../../../../module/login/model/response/screen_forgot_password_response.dart';
import '../../../../module/login/model/response/submit_forgot_password_response.dart';
import '../../../../module/login/screen/forgot_password_screen/set_new_forgot_password_screen.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../module/login/widget/forgot_password_widget.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/progress_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgotPasswordBloc()..add(ScreenInfoForgotPasswordEvent()),
        child: const ForgotPasswordPage());
  }
}

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> with ProgressDialog {
  ScreenForgotPasswordResponse? _screenForgotPasswordResponse;
  SubmitForgotPasswordResponse? _responseSubmitForgotPassword;
  TextEditingController userIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String valueLanguage;
  @override
  void initState() {
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired = valueLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = valueLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = valueLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          showProgressDialog(context);
        }
        if (state is ForgotPasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ForgotPasswordError) {
          if (state.message.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
            });
          } else {
            dialogOneLineOneBtn(context, '${state.message}\n ', _buttonOk, onClickBtn: () {
              Navigator.of(context).pop();
            });
          }
        }
        if (state is SubmitForgotPasswordSuccessState) {
          var valueEmailForgotPassword = state.emailForgotPassword;
          var valueUserIDForgotPassword = state.userIDForgotPassword;
          _responseSubmitForgotPassword = state.responseSubmitForgotPassword;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SetNewForgotPasswordScreen(
                        valueEmailForgotPassword: valueEmailForgotPassword,
                        valueUserIDForgotPassword: valueUserIDForgotPassword,
                        refValue: _responseSubmitForgotPassword?.body?.refvalue,
                      )));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoForgotPasswordSuccessState) {
          _screenForgotPasswordResponse = state.responseForgotPassword;
          return forgotPasswordPageWidget(context, _screenForgotPasswordResponse, emailController, userIDController);
        } else {
          return Scaffold(
              body: Container(
            color: Colors.white,
          ));
        }
      },
      buildWhen: (context, state) {
        return state is ScreenInfoForgotPasswordSuccessState;
      },
    );
  }
}
