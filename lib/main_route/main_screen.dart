import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../customs/pin/pin_lock_app_screen.dart';
import 'main_route_bloc/main_route_bloc.dart';
import 'main_route_bloc_model/refresh_token_response.dart';
import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../utils/shared_preferences.dart';
import '../customs/button/button_style.dart';
import '../customs/color/color_const.dart';
import '../module/home/screen/home_screen/home_screen.dart';
import '../module/login/screen/login_screen/login_screen.dart';

class MainRouteScreen extends StatelessWidget {
  const MainRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainRouteBloc()..add(IsMainRouteEvent()),
        // child: const GenerativeWidget());
        child: const MainRoutePage());
  }
}

class MainRoutePage extends StatefulWidget {
  const MainRoutePage({Key? key}) : super(key: key);

  @override
  State<MainRoutePage> createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoutePage> with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;
  @override
  void initState() {
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
  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticate(
      localizedReason: 'Please authenticate',
      // biometricOnly: true,
    );
    if (didAuthenticate) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

    }
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
  void _setValueAndGoHome({required String refreshToken, required String token}) async {
    // final prefs = await SharedPreferences.getInstance();
    await setUserKey(globalKey: token);
    await setUserRefreshKey(refreshKey: refreshToken);
    // if (loginSubmitResponse?.body?.language=="TH") {
    //   await setUserLanguage( 'EN');
    // } else {
    //   await setUserLanguage( 'TH');
    // }
    // valueLanguage = prefs.getString('userChangeLanguage') ?? '';
    setState(
      () {},
    );
  }

  RefreshTokenResponse? _checkRefreshTokenMessage;
  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<MainRouteBloc, MainRouteState>(
      listener: (context, state) {
        if (state is MainRouteLoading) {
          showProgressDialog(context);
        }
        if (state is MainRouteEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MainRouteError) {
          if(state.message.toString() == 'Unauthorized'){

            dialogSessionExpiredOneBtn(context, textSessionExpired , textSubSessionExpired, _buttonOk, onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
            });
          }else{
            dialogOneLineOneBtn(context, '${state.message}\n ', _buttonOk  , onClickBtn: () {
              Navigator.of(context).pop();
            });
          }

          // show dialog error
          if (kDebugMode) {
            print(state.message);
          }

        }
      },
      builder: (context, state) {
        if (state is MainRouteLogin) {
          // Navigator.push(
          //     context,MaterialPageRoute(
          //     builder: (context) => const LoginScreen(
          //     )
          // )
          // );
          return const LoginScreen();
        }
        else if (state is RefreshTokenSuccessState) {
          // String isToken = state.token ?? "";
          // String isRefreshToken = state.refreshToken ?? "";
          // _setValueAndGoHome(token: isToken, refreshToken: isRefreshToken);

          return _isHiddenPin == true?
           PinLockAppScreen(isHiddenBio:_isHiddenBio,pinValueString:_pinValueString,optionLockApp:true)
              : const HomeScreen(
          ) ;

          // Navigator.push(
          //     context,MaterialPageRoute(
          //     builder: (context) => const HomeScreen(
          //     )
          // )
          // );
        }
        else if (state is CheckTokenExpiredState) {
          // String isToken = state.token ?? "";
          // String isRefreshToken = state.refreshToken ?? "";
          // _setValueAndGoHome(token: isToken, refreshToken: isRefreshToken);

          return _isHiddenPin == true?
           PinLockAppScreen(isHiddenBio:_isHiddenBio,pinValueString:_pinValueString,optionLockApp:true)
              : const HomeScreen(
          ) ;

          // Navigator.push(
          //     context,MaterialPageRoute(
          //     builder: (context) => const HomeScreen(
          //     )
          // )
          // );
        } else if (state is TokenExpiredState) {
          _checkRefreshTokenMessage = state.checkrefreshtokenmessage;
          return Scaffold(
              body: Container(
            color: Colors.white,
            child:
                Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),
                            Text(_checkRefreshTokenMessage?.head?.message ?? "Session expired please login again",
                                textAlign: TextAlign.center),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              style: styleButtonDialog,
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
                              },
                              child: Text(
                                _buttonOk,
                                style: const TextStyle(color: tcButtonTextBlack),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
          ));
        } else {}
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is MainRouteLogin || state is RefreshTokenSuccessState || state is TokenExpiredState|| state is CheckTokenExpiredState;
      },
    );
  }
}
