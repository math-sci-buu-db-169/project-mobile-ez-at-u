import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/login/model/response/screen_login_response.dart';
import '../../../../module/login/bloc/login_bloc/login_bloc.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../module/home/screen/home_screen/home_screen.dart';
import '../../../../module/login/model/response/submit_login_response.dart';
import '../../../../module/login/widget/login_widget.dart';
import '../../../../utils/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc()..add(LoginScreenInfoEvent(userLanguage: "TH")),
        // child: const GenerativeWidget());
        child: const LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ProgressDialog {
  ScreenLoginResponse? _screenLoginResponse;
  SubmitLoginResponse? _loginSubmitResponse;
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool statusLoginSubmit;
  bool isDefaultLanguage = true;
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  @override
  void initState() {
    valueLanguage = "TH";
    setUserLanguage(valueLanguage);
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

  void _toggleLanguageView() async {
    isDefaultLanguage = !isDefaultLanguage;
    valueLanguage = isDefaultLanguage ? "TH" : "EN";
    setUserLanguage(valueLanguage);
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
    setState(
      () {
        context.read<LoginBloc>().add(OnClickLanguageEvent(userLanguage: valueLanguage));
      },
    );
  }

  void _setValueAndGoHome({SubmitLoginResponse? loginSubmitResponse}) async {
    prefs = await SharedPreferences.getInstance();
    await setUserKey(globalKey: loginSubmitResponse?.body?.token);
    await setUserRefreshKey(refreshKey: loginSubmitResponse?.body?.refreshtoken);
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showProgressDialog(context);
        }
        if (state is LoginEndLoading) {
          hideProgressDialog(context);
        }
        if (state is LoginError) {
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
        if (state is SubmitLoginState) {
          _loginSubmitResponse = state.responseSubmitLoginScreen;
          _setValueAndGoHome(loginSubmitResponse: _loginSubmitResponse);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoLoginSuccessState) {
          _screenLoginResponse = state.responseScreenInfoLogin;
          return loginPageWidget(context, _screenLoginResponse, userController, passwordController,
              onClickBtnLanguageView: () {
            _toggleLanguageView();
          });
        } else if (state is OnClickLanguageLoginScreenInfoSuccessState) {
          _screenLoginResponse = state.responseLanguageLoginscreen;
          return loginPageWidget(context, _screenLoginResponse, userController, passwordController,
              onClickBtnLanguageView: () {
            _toggleLanguageView();
          });
        }

        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoLoginSuccessState || state is OnClickLanguageLoginScreenInfoSuccessState;
      },
    );
  }
}
