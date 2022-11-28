import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import '../../home/screen/more_screen/faq_screen.dart';

loginPageWidget(BuildContext context, ScreenLoginResponse? screenLoginResponse, TextEditingController userController,
    TextEditingController passwordController,
    {required Null Function() onClickBtnLanguageView}) {
  void isHandleClickBtnLanguageView() {
    onClickBtnLanguageView();
  }

  String phimg =
      '';
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            icon:  Icon(
                              FontAwesomeIcons.earthAsia,
                              color: Theme.of(context).iconTheme.color,
                              size: 18,),
                            label: Text(screenLoginResponse?.body?.screeninfo?.btnChangeLang ?? loginBtnChangeLanguage,
                                style:  TextStyle(
                                    color: Theme.of(context).bottomAppBarColor, fontWeight: FontWeight.w600, fontSize: 14)),
                            onPressed: () {isHandleClickBtnLanguageView();},
                          ),
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.question ),
                            color: Colors.orangeAccent,
                            onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  const FaqScreen( module :'login'),
                              ),
                            );},
                          ),
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
                      iconsFile : Icons.person_rounded,
                    ),
                    TextFieldPasswordCustom(
                      textEditingController: passwordController,
                      onChanged: (valuePassword) {
                        passwordController.text = valuePassword;
                      },
                      hintLabel: screenLoginResponse?.body?.screeninfo?.edtPass ?? loginEdtPassword,
                      textInputType: TextInputType.text,
                      initialvalue: passwordController.text,
                      iconsFile : Icons.lock,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextLinkToScreenCustom(
                          linklabel: screenLoginResponse?.body?.screeninfo?.btnForgotPass ?? loginBtnForgotPassword,
                          linktextcolor: Theme.of(context).bottomAppBarColor,
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
                        colortext:  tcButtonTextColor,
                        // colorbutton:  Theme.of(context).scaffoldBackgroundColor,
                        colorbutton:  Theme.of(context).buttonColor,
                        sizetext: sizeTextBig20,
                        colorborder: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
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
                          style:  TextStyle(
                              fontSize: sizeTextSmall16, color: Theme.of(context).bottomAppBarColor, fontWeight: FontWeight.w300),
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
