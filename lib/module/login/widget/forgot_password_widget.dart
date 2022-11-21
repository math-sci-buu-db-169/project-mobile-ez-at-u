import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_forgot_password.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_custom.dart';
import '../../../../module/login/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../../../../module/login/model/response/screen_forgot_password_response.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';

forgotPasswordPageWidget(BuildContext context, ScreenForgotPasswordResponse? screenForgotPasswordResponse,
    TextEditingController emailController, TextEditingController userIDController) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false);
            },
            icon:  Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Theme.of(context).bottomAppBarColor,
            ),
          ),
          title: Text(
            screenForgotPasswordResponse?.body?.screeninfo?.titleforgot ?? forgotPasswordTitleForgotPassword,
            style:  TextStyle(
              color: Theme.of(context).bottomAppBarColor,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
// height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextFieldCustom(
                  textEditingController: userIDController,
                  onChanged: (valueUserID) {
                    userIDController.text = valueUserID;
                  },
                  hintLabel:
                      screenForgotPasswordResponse?.body?.screeninfo?.edtIDforgot ?? forgotPasswordEdtIDForgotPassword,
                  textInputType: TextInputType.text,
                  initialvalue: userIDController.text,
                  iconsFile : Icons.person_rounded,
                ),
                TextFieldCustom(
                  textEditingController: emailController,
                  onChanged: (valueEmail) {
                    emailController.text = valueEmail;
                  },
                  hintLabel: screenForgotPasswordResponse?.body?.screeninfo?.edtemailforgot ??
                      forgotPasswordEdtEmailForgotPassword,
                  textInputType: TextInputType.text,
                  initialvalue: emailController.text,
                  iconsFile : Icons.email,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: ButtonCustom(
                      label: screenForgotPasswordResponse?.body?.screeninfo?.btnforgotnext ??
                          forgotPasswordBtnForgotPasswordNext,
                      colortext:  Theme.of(context).bottomAppBarColor,
                      colorbutton:  Theme.of(context).scaffoldBackgroundColor,
                      sizetext: sizeTextBig20,
                      colorborder: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                      sizeborder: 10,
                      onPressed: () {
                        context.read<ForgotPasswordBloc>().add(SubmitForgotPasswordEvent(
                              userID: userIDController.text,
                              email: emailController.text,
                            ));
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        )),
  );
}
