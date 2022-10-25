import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/login/bloc/register_bloc/register_bloc.dart';
import '../../../../module/login/model/response/re_send_otp_confirm_register_response.dart';
import '../../../../module/login/model/response/screen_register_response.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../module/login/widget/confirm_register_widget.dart';
import '../../../../utils/shared_preferences.dart';

class RegisterConfirmScreen extends StatefulWidget {
  final String isUserIDRegister;
  final String isEmailRegister;
  final String isPhoneRegister;
  final String isNameRegister;
  final String isLastNameRegister;
  final String isPasswordRegister;
  final String isConfirmPasswordRegister;
  final String? refValue;
  const RegisterConfirmScreen({
    Key? key,
    required this.isUserIDRegister,
    required this.isEmailRegister,
    required this.isPhoneRegister,
    required this.isNameRegister,
    required this.isLastNameRegister,
    required this.isPasswordRegister,
    required this.isConfirmPasswordRegister,
    required this.refValue,
  }) : super(key: key);

  @override
  State<RegisterConfirmScreen> createState() => _RegisterConfirmScreenState();
}

class _RegisterConfirmScreenState extends State<RegisterConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc()..add(ScreenInfoConfirmRegisterEvent()),
        child: RegisterConfirmPage(
          isUserIDRegister: widget.isUserIDRegister,
          isPhoneRegister: widget.isPhoneRegister,
          isEmailRegister: widget.isEmailRegister,
          isNameRegister: widget.isNameRegister,
          isPasswordRegister: widget.isPasswordRegister,
          isLastNameRegister: widget.isLastNameRegister,
          isConfirmPasswordRegister: widget.isConfirmPasswordRegister,
          refValue: widget.refValue,
        ));
  }
}

class RegisterConfirmPage extends StatefulWidget {
  final String isUserIDRegister;
  final String isEmailRegister;
  final String isPhoneRegister;
  final String isNameRegister;
  final String isLastNameRegister;
  final String isPasswordRegister;
  final String isConfirmPasswordRegister;
  final String? refValue;

  const RegisterConfirmPage({
    Key? key,
    required this.isUserIDRegister,
    required this.isEmailRegister,
    required this.isPhoneRegister,
    required this.isNameRegister,
    required this.isLastNameRegister,
    required this.isPasswordRegister,
    required this.isConfirmPasswordRegister,
    required this.refValue,
  }) : super(key: key);

  @override
  State<RegisterConfirmPage> createState() => _RegisterConfirmPageState();
}

class _RegisterConfirmPageState extends State<RegisterConfirmPage> with ProgressDialog {
  final CustomTimerController _controller = CustomTimerController();
  late String userLanguage;
  late String? _refValue;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
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

  @override
  void initState() {
    _refValue = widget.refValue;
    _isSessionUnauthorized();
    super.initState();
    // context.read<RegisterBloc>().add(ScreenInfoConfirmRegisterEvent(userLanguage: userLanguage));
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired = userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  ScreenRegisterResponse? _screenRegisterResponse;
  ReSendOtpConfirmRegisterResponse? _reSendOtpConfirmRegisterResponse;

  TextEditingController confirmOTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is ConfirmRegisterLoading) {
          showProgressDialog(context);
        }
        if (state is ConfirmRegisterEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ConfirmRegisterError) {
          // show dialog error
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
        if (state is ReSentOTPConfirmRegisterState) {
          resetTimer();
          _reSendOtpConfirmRegisterResponse = state.responseReSentOTPConfirmRegister;
          refValueOtp(valueOtp: _reSendOtpConfirmRegisterResponse?.body?.refvalue);
          startTimer();
          // dialogOneLineOneBtn(context, "${_reSendOtpConfirmRegisterResponse?.head?.message}" '\n ', "OK",
          //     onClickBtn: () {
          //   Navigator.of(context).pop();
          // });
        }
        if (state is SubmitConfirmRegisterState) {
          // show dialog error
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())
              // ,
              // (Route<dynamic> route) => false
              );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoConfirmRegisterSuccessState) {
          startTimer();
          _screenRegisterResponse = state.responseConfirmRegisterScreen;
          return confirmRegisterPageWidget(
            context,
            _screenRegisterResponse,
            confirmOTPController,
            valueUserRegister: widget.isUserIDRegister,
            valueEmailRegister: widget.isEmailRegister,
            valuePhoneRegister: widget.isPhoneRegister,
            valueNameRegister: widget.isNameRegister,
            valueLastNameRegister: widget.isLastNameRegister,
            valuePasswordRegister: widget.isPasswordRegister,
            valueConfirmPasswordRegister: widget.isConfirmPasswordRegister,
            controller: _controller,
            refValue: _refValue,
          );
        }
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoConfirmRegisterSuccessState;
      },
    );
  }
}
