import 'package:ez_at_u/check_token/token_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customs/button/button_style.dart';
import '../customs/color/color_const.dart';
import '../customs/dialog/dialog_widget.dart';
import '../customs/message/text_button.dart';
import '../customs/message/text_error.dart';
import '../customs/progress_dialog.dart';
import '../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../module/login/screen/login_screen/login_screen.dart';
import '../utils/shared_preferences.dart';

class CheckTokenScreen extends StatelessWidget {
  const CheckTokenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TokenBloc()..add(IsTokenEvent()),
        // child: const GenerativeWidget());
        child: const CheckTokenExpired());
  }
}

class CheckTokenExpired extends StatefulWidget {
  const CheckTokenExpired({Key? key}) : super(key: key);

  @override
  State<CheckTokenExpired> createState() => _CheckTokenExpiredState();
}

class _CheckTokenExpiredState extends State<CheckTokenExpired> with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String token;
  late String refToken;

  @override
  void initState() {
    valueLanguage = "TH";
    getUserToken();
    _isSessionUnauthorized();
    super.initState();
  }



  getUserToken() async {
    prefs = await SharedPreferences.getInstance();
     token = await getUserKey() ?? "";
    if (kDebugMode) {
      print(" token : $token");
    }  refToken = await getUserRefKey() ?? "";
    if (kDebugMode) {
      print(" refToken : $refToken");
    }
    setState(() {

    });
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
  // void _setValueAndGoHome({required String refreshToken, required String token}) async {
  //   // await setUserKey(globalKey: token);
  //   // await setUserRefreshKey(refreshKey: refreshToken);
  //   await setUserKeyAndRefreshKey(
  //       globalKey: token,
  //       refreshKey: refreshToken
  //
  //   );
  //   setState(
  //         () {},
  //   );
  // }

  RefreshTokenResponse? _checkRefreshTokenMessage;
  @override
  Widget build(BuildContext context) {
    // String _token;
    // String isRefreshToken;
    return BlocConsumer<TokenBloc, TokenState>(
      listener: (context, state) {
        if (state is CheckTokenLoading) {
          showProgressDialog(context);
        }
        if (state is CheckTokenEndLoading) {
          hideProgressDialog(context);
        } if (state is CheckTokenLogin) {
          cleanDelete();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
        }
        if (state is CheckTokenError) {
          if(state.message.toString() == 'Unauthorized'){
            if (kDebugMode) {
              print("+++++++++++++++CheckTokenError+++++++++++++++++++++++++");
            }
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
        if (state is CheckTokenLogin) {
          // Navigator.push(
          //     context,MaterialPageRoute(
          //     builder: (context) => const LoginScreen(
          //     )
          // )
          // );
          return const LoginScreen();
        }
        else if (state is CheckTokenSuccessState) {
          getUserToken();
          // String isToken = state.token ?? "";
          // String isRefreshToken = state.refreshToken ?? "";
          // _setValueAndGoHome(token: isToken, refreshToken: isRefreshToken);

          return  RunTokenPage( isToken:token,isRefToken:refToken
          ) ;

          // Navigator.push(
          //     context,MaterialPageRoute(
          //     builder: (context) => const HomeScreen(
          //     )
          // )
          // );
        }
        else if (state is TokenExpiredState) {

          getUserToken();
          // String isToken = state.token ?? "";
          // String isRefreshToken = state.refreshToken ?? "";
          // _setValueAndGoHome(token: isToken, refreshToken: isRefreshToken);

          return   RunTokenPage( isToken:token,isRefToken:refToken
          ) ;

          // Navigator.push(
          //     context,MaterialPageRoute(
          //     builder: (context) => const HomeScreen(
          //     )
          // )
          // );
        }
        // else if (state is TokenExpiredState) {
        //   _checkRefreshTokenMessage = state.checkrefreshtokenmessage;
        //   return Scaffold(
        //       body: Container(
        //         color: Colors.white,
        //         child:
        //         Dialog(
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(16),
        //             ),
        //             child: SingleChildScrollView(
        //               child: Padding(
        //                 padding: const EdgeInsets.all(16),
        //                 child: Column(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     const SizedBox(height: 10),
        //                     Text(_checkRefreshTokenMessage?.head?.message ?? "Session expired please login again",
        //                         textAlign: TextAlign.center),
        //                     const SizedBox(height: 15),
        //                     ElevatedButton(
        //                       style: styleButtonDialog,
        //                       onPressed: () {
        //                         Navigator.push(
        //                             context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
        //                       },
        //                       child: Text(
        //                         _buttonOk,
        //                         style: const TextStyle(color: Colors.cyanAccent,)
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             )),
        //       ));
        // }
        else {
        return Scaffold(
            body: Container(
              color: Colors.yellowAccent,
            ));
        }
      },
      buildWhen: (context, state) {
        return state is CheckTokenLogin || state is CheckTokenSuccessState || state is TokenExpiredState;
      },
    );
  }
}
class RunTokenPage extends StatefulWidget {
  final  String isToken;
  final  String isRefToken;
  const RunTokenPage({Key? key, required this.isToken, required this.isRefToken}) : super(key: key);

  @override
  State<RunTokenPage> createState() => _RunTokenPageState(

  );
}

class _RunTokenPageState extends State<RunTokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Text(widget.isToken,style: TextStyle(
                   color: Colors.purpleAccent,fontSize: 20
                 ),),
                 Text(widget.isRefToken,style: TextStyle(
                     color: Colors.yellowAccent,fontSize: 20
                 ),),
                IconButton(

                    onPressed: () {
                      context
                          .read<TokenBloc>()
                          .add(IsTokenEvent());
                    },

                    icon: Icon(Icons.send

                    )
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

