import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/login/bloc/register_bloc/register_bloc.dart';
import '../../../../module/login/model/response/screen_register_response.dart';
import '../../../../module/login/model/response/submit_register_response.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../module/login/screen/register_screen/register_confirm_screen.dart';
import '../../../../module/login/widget/register_widget.dart';
import '../../../../utils/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterBloc()..add(ScreenInfoRegisterEvent()), child: const RegisterPage());
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with ProgressDialog {
  late String userLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;

  ScreenRegisterResponse? _screenRegisterResponse;
  SubmitRegisterResponse? responseRegisterSubmit;
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void initState() {
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired = userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // context.read<RegisterBloc>().add(RegisterScreenInfoEvent());

    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showProgressDialog(context);
        }
        if (state is RegisterEndLoading) {
          hideProgressDialog(context);
        }
        if (state is RegisterError) {
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
        if (state is SubmitRegisterState) {
          var isUserIDRegister = state.userID;
          var isEmailRegister = state.email;
          var isPhoneRegister = state.phone;
          var isNameRegister = state.name;
          var isLastNameRegister = state.lastName;
          var isPasswordRegister = state.password;
          var isConfirmPasswordRegister = state.confirmPassword;
          responseRegisterSubmit = state.responseRegisterSubmit;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterConfirmScreen(
                  isUserIDRegister: isUserIDRegister,
                  isEmailRegister: isEmailRegister,
                  isPhoneRegister: isPhoneRegister,
                  isNameRegister: isNameRegister,
                  isLastNameRegister: isLastNameRegister,
                  isPasswordRegister: isPasswordRegister,
                  isConfirmPasswordRegister: isConfirmPasswordRegister,
                  refValue: responseRegisterSubmit?.body?.refvalue),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoRegisterSuccessState) {
          _screenRegisterResponse = state.responseRegisterScreen;
          return registerPageWidget(
            context,
            _screenRegisterResponse,
            userController,
            phoneController,
            emailController,
            nameController,
            lastnameController,
            passwordController,
            confirmPasswordController,
          );
        }
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoRegisterSuccessState;
      },
    );
  }
}
