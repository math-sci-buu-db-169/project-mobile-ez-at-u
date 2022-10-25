import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_login.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_custom.dart';
import '../../../../customs/text_file/text_field_password_custom.dart';
import '../../../../customs/text_link/text_link_to_screen_custom.dart';
import '../../../../module/login/bloc/login_bloc/login_bloc.dart';
import '../../../../module/login/model/response/screen_login_response.dart';
import '../../../../module/login/screen/forgot_password_screen/forgot_password_screen.dart';
import '../../../../module/login/screen/register_screen/pdpa_register_screen.dart';

loginPageWidget(BuildContext context, ScreenLoginResponse? screenLoginResponse, TextEditingController userController,
    TextEditingController passwordController,
    {required Null Function() onClickBtnLanguageView}) {
  void isHandleClickBtnLanguageView() {
    onClickBtnLanguageView();
  }

  String phimg =
      'iVBORw0KGgoAAAANSUhEUgAAA6YAAACjCAYAAACZpwPFAAAAYmVYSWZNTQAqAAAACAAEAQAABAAAAAEAAAAAAQEABAAAAAEAAAAAh2kABAAAAAEAAAA+ARIAAwAAAAEAAAAAAAAAAAABkggABAAAAAEAAAAAAAAAAAABARIAAwAAAAEAAAAAAAAAAChvwCoAAAABc1JHQgCuzhzpAAAABHNCSVQICAgIfAhkiAAAIABJREFUeJzt3XtUU2e+P/63p/56nGrREGpVPNZDwGKrpWrEjoKtOBq8tJWRTvA6zgLF0B77U6mg1Bl7kQJeZuwZuVhYpz/rJfTo6HKUgk6hBeqpiNh0bLVF8nN6vNQ2MV5nOs7M1+8fmSCXJPvZyc4Feb/WYrWSZ+/9JNkJ+7Of5/l8ety5c+cOiIiIiIiIiALkXwLdASIiIiIiIureGJgSERERERFRQDEwJSIiIiIiooBiYEpEREREREQBxcCUiIiIiIiIAoqBKREREREREQUUA1MiIiIiIiIKKAamREREREREFFAMTImIiIiIiCigGJgSERERERFRQDEwJSIiIiIiooBiYEpEREREREQBxcCUiIiIiIiIAoqBKREREREREQUUA1MiIiIiIiIKKAamREREREREFFAMTImIiIiIiCigGJgSERERERFRQDEwJSIiIiIiooBiYEpEREREREQBxcCUiIiIiIiIAoqBKREREREREQUUA1MiIiIiIiIKKAamREREREREFFAMTImIiIiIiCigGJgSERF1E0ajERkZGRg7dix69OjR+hMaGorExETk5OTAZDIFuptERNQN9bhz586dQHeCiIiIfMcRkNpsNqH2er0eW7duhVqt9nHPiIiI7BiYEpFiKioqcPDgQRw/fhyNjY2tv1epVIiNjcWYMWOQmpqKiIgIr45jtVpx7NgxnDp1CgAwfvx4xMXFebVPontVRkYGioqKZG+nUqlQU1ODmJgYH/SKiIioPQamROS1iooKLFu2DC0tLULt16xZgxUrVng0GlNQUICsrKxOv9doNHj77bcxffp02fskuld5GpQ6aLVaVFZWcuSUuqfbl4ErB4Fbp4G/fA384wZw9aPO7XqGAn2eAO4fBNw/EAj5MfDQbL93163v9wLX/we4fQm4fRG4+Tnw9yud2/V7BrjvQeBHw4Dew4HQmcD9D/u9u9Q9MTAl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IiIiIj8YM2aMy8fKy8uRkpKCiooKjB071qM6p0REXRnLxRARERH5gclkwpNPPun1fnQ6HSorK9v9rtuXiyGiLo8jpkRERER+EBMTA71eH+huEBEFJQamRERERH6ydetWt6VgiIi6KwamRERERH6iVqtx/Phx5OfnQ6VStXtMpVKhuLiYgSsRdUtcY0pEREQUICaTCTdu3ACA1jqmUutFO64xNZvN0Gg0ksfiJR8RBTPWMSUiIiIKkJiYmHb/NplMkttUVVXBbDYjIiICAHDkyBGf9I2IyJ8YmBIREREFCcfoqRSREVIioq6Ea0yJiIiI7nEd17MSEQUbBqZEREREQcKxzlRpU6dO9cl+iYiUwsCUiIiIKIj4otbpSy+9pPg+iYiUxMCUiIiIKIisXr1a0am3BoPBZyOxRERKYWBKREREFERiYmJQU1OjSHC6Zs0aFBYWKtArIiLfYh1TIiIioiBktVqxZ88e7Nu3Dw0NDbDZbELb6XQ6jBkzBqmpqa0lZYiIgh0DUyIiIiIiIgooTuUlIiIiIiKigGJgSkRERERERAHFwJSIiIiIiIgCioEpERERERERBRQDUyIiIiIiIgooBqZEREREREQUUAxMiYiIiIiIKKAYmBIREREREVFAMTAlIiIiIiKigGJgSkRERERERAHFwJSIiIiIiIgCioEpERERERERBRQDUyIiIiIiIgooBqZEREREREQUUAxMiYiIiIiIKKAYmBIREREREVFAMTAlIiIiIiKigGJgSkRERERERAHFwJSIiIiIiIgCioEpERERERERBRQDUyIiIiIiIgooBqZEREREREQUUAxMiYiIiIiIKKAYmBIREREREVFAMTAlIiIiIiKigGJgSkRERERERAHFwJSIiIiIiIgCioEpERERERERBdT/BfyrskXRtJNvAAAAAElFTkSuQmCC';
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () => {isHandleClickBtnLanguageView()},
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.language,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  Text(screenLoginResponse?.body?.screeninfo?.btnChangeLang ?? loginBtnChangeLanguage,
                                      style: const TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14)),
                                ],
                              )),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Center(
                          child: screenLoginResponse?.body?.screeninfo?.imgLogo != null
                              // ? CircleAvatar(
                              //     radius: 80.0,
                              //     backgroundImage: NetworkImage(screenLoginResponse?.body?.screeninfo?.imgLogo??
                              //         'https://drive.google.com/file/d/1zI5FjX-wm0TnCMXdKHIGWSI-6wW5qtZV/view?usp=sharing'),
                              //   )
                              // : const CircleAvatar(
                              //     radius: 100,
                              //     backgroundImage: AssetImage(
                              //       'assets/logo/EZ@U.png',
                              //     ),
                              //   )
                              ? Image(
                                  height: 100,
                                  image: MemoryImage(base64Decode(base64.normalize(
                                      screenLoginResponse?.body?.screeninfo?.imgLogo ?? base64.normalize(phimg)))))
                              : const Image(
                                  height: 100,
                                  image: AssetImage(
                                    'assets/logo/logo.png',
                                  ))),
                    ),
                    Center(
                        child: screenLoginResponse?.body?.screeninfo?.imgSubLogo != null
                            // ? CircleAvatar(
                            //     radius: 80.0,
                            //     backgroundImage: NetworkImage(screenLoginResponse?.body?.screeninfo?.imgLogo??
                            //         'https://drive.google.com/file/d/1zI5FjX-wm0TnCMXdKHIGWSI-6wW5qtZV/view?usp=sharing'),
                            //   )
                            // : const CircleAvatar(
                            //     radius: 100,
                            //     backgroundImage: AssetImage(
                            //       'assets/logo/EZ@U.png',
                            //     ),
                            //   )
                            ? Image(
                                height: 100,
                                image: MemoryImage(base64Decode(base64.normalize(
                                    screenLoginResponse?.body?.screeninfo?.imgSubLogo ?? base64.normalize(phimg)))))
                            : const Image(
                                height: 100,
                                image: AssetImage(
                                  'assets/logo/subLogo.png',
                                ))),

                    TextFieldCustom(
                      textEditingController: userController,
                      onChanged: (valueUserID) {
                        userController.text = valueUserID;
                      },
                      hintLabel: screenLoginResponse?.body?.screeninfo?.edtID ?? loginEdtID,
                      textInputType: TextInputType.text,
                      initialvalue: userController.text,
                    ),
                    TextFieldPasswordCustom(
                      textEditingController: passwordController,
                      onChanged: (valuePassword) {
                        passwordController.text = valuePassword;
                      },
                      hintLabel: screenLoginResponse?.body?.screeninfo?.edtPass ?? loginEdtPassword,
                      textInputType: TextInputType.text,
                      initialvalue: passwordController.text,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextLinkToScreenCustom(
                          linklabel: screenLoginResponse?.body?.screeninfo?.btnForgotPass ?? loginBtnForgotPassword,
                          linktextcolor: tcForgot,
                          sizetext: sizeTextSmaller14,
                          onTap: () async {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    Center(
                      child: ButtonCustom(
                        onPressed: () {
                          context
                              .read<LoginBloc>()
                              .add(LoginSubmitEvent(userID: userController.text, password: passwordController.text));
                        },
                        label: screenLoginResponse?.body?.screeninfo?.btnLogin ?? loginBtnLogin,
                        colortext: tcButtonTextBlack,
                        colorbutton: tcButtonTextWhite,
                        sizetext: sizeTextBig20,
                        colorborder: tcButtonTextBoarder,
                        sizeborder: 10,
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          screenLoginResponse?.body?.screeninfo?.textReg ?? loginTextRegister,
                          style: const TextStyle(
                              fontSize: sizeTextSmall16, color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextLinkToScreenCustom(
                            linklabel: screenLoginResponse?.body?.screeninfo?.btnReg ?? loginBtnRegister,
                            linktextcolor: tcRegiter,
                            sizetext: sizeTextSmall16,
                            onTap: () async {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const ConditionPDPAScreen()));
                            }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              ),
            )),
      ),
    ),
  );
}
