import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/login/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../../../../module/login/model/response/re_send_otp_forgot_password_response.dart';
import '../../../../module/login/model/response/screen_forgot_password_response.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../module/login/widget/set_new_forgot_password_widget.dart';
import '../../../../utils/shared_preferences.dart';

class SetNewForgotPasswordScreen extends StatefulWidget {
  final String valueEmailForgotPassword;
  final String valueUserIDForgotPassword;
  final String? refValue;
  const SetNewForgotPasswordScreen(
      {Key? key,
      required this.valueEmailForgotPassword,
      required this.valueUserIDForgotPassword,
      required this.refValue})
      : super(key: key);

  @override
  State<SetNewForgotPasswordScreen> createState() => _SetNewForgotPasswordScreenState();
}

class _SetNewForgotPasswordScreenState extends State<SetNewForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgotPasswordBloc()..add(ScreenInfoForgotPasswordEvent()),
        child: SetNewForgotPasswordPage(
          valueEmailForgotPassword: widget.valueEmailForgotPassword,
          valueUserIDForgotPassword: widget.valueUserIDForgotPassword,
          refValue: widget.refValue,
        ));
  }
}

class SetNewForgotPasswordPage extends StatefulWidget with ProgressDialog {
  final String valueEmailForgotPassword;
  final String valueUserIDForgotPassword;
  final String? refValue;

  SetNewForgotPasswordPage({
    Key? key,
    required this.valueEmailForgotPassword,
    required this.valueUserIDForgotPassword,
    required this.refValue,
  }) : super(key: key);

  @override
  State<SetNewForgotPasswordPage> createState() => _SetNewForgotPasswordPageState();
}

class _SetNewForgotPasswordPageState extends State<SetNewForgotPasswordPage> with ProgressDialog {
  final CustomTimerController _controller = CustomTimerController();
  ScreenForgotPasswordResponse? _screenSetNewForgotPasswordResponse;
  ReSendOtpForgotPasswordResponse? _reSendOtpForgotPasswordResponse;
  late String? _refValue;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String valueLanguage;
  @override
  void initState() {
    _refValue = widget.refValue;
    context.read<ForgotPasswordBloc>().add(ScreenInfoSetNewForgotPasswordEvent());
    _isSessionUnauthorized();
    super.initState();
  }

  resetTimer() {
    _controller.reset();
  }

  startTimer() {
    _controller.start();
  }

  refValueOtp({String? valueOtp}) {
    // _refValue = valueOtp;
    setState(() {
      _refValue = valueOtp;
    });
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
        if (state is SetNewForgotPasswordLoading) {
          showProgressDialog(context);
        }
        if (state is SetNewForgotPasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is SetNewForgotPasswordError) {
          // show dialog error
          dialogOneLineOneBtn(context, '${state.message}\n  ', "OK", onClickBtn: () {
            Navigator.of(context).pop();
          });
        }
        if (state is ReSentOTPSetNewForgotPasswordError) {
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
        if (state is ReSentOTPSetNewForgotPasswordSuccessState) {
          resetTimer();
          _reSendOtpForgotPasswordResponse = state.responseReSendOtpForgotPasswordResponse;
          refValueOtp(valueOtp: _reSendOtpForgotPasswordResponse?.body?.refvalue);
          startTimer();
          // dialogOneLineOneBtn(context, "${_reSendOtpForgotPasswordResponse?.head?.message}" '\n ', "OK",
          //     onClickBtn: () {
          //   Navigator.of(context).pop();
          // });
        }
        if (state is SubmitSetNewForgotPasswordSuccessState) {
          cleanDelete();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoSetNewForgotPasswordSuccessState) {
          startTimer();
          _screenSetNewForgotPasswordResponse = state.responseSetNewForgotPassword;
          return setNewForgotPasswordPageWidget(
            context,
            _screenSetNewForgotPasswordResponse,
            passwordController,
            confirmPasswordController,
            codeController,
            valueEmailForgotPassword: widget.valueEmailForgotPassword,
            valueUserIDForgotPassword: widget.valueUserIDForgotPassword,
            controller: _controller,
            refValue: _refValue,
          );
        } else {
          return Scaffold(
              body: Container(
            color: Colors.white,
          ));
        }
      },
      buildWhen: (context, state) {
        return state is ScreenInfoSetNewForgotPasswordSuccessState;
      },
    );
  }
}
