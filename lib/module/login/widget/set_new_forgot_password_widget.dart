import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_forgot_password.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_custom.dart';
import '../../../../customs/text_file/text_field_password_custom.dart';
import '../../../../customs/text_link/text_link_otp_custom.dart';
import '../../../../module/login/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../../../../module/login/model/response/screen_forgot_password_response.dart';
import '../../../../module/login/widget/count_time_otp_widget.dart';

setNewForgotPasswordPageWidget(
    BuildContext context,
    ScreenForgotPasswordResponse? screenForgotPasswordResponse,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    TextEditingController codeController,
    {required String valueEmailForgotPassword,
    required String valueUserIDForgotPassword,
    required CustomTimerController controller,
    required refValue}) {
  String textRef = screenForgotPasswordResponse?.body?.screeninfo?.textref ?? forgotPasswordSetNewTextPleaseConfirm;
  String ref = refValue ?? '-';
  // String confirmPasswordValue = "";
  // String codeValue = " ";
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
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back,
            size: sizeTitle24,
            color:  Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        title: Text(
          screenForgotPasswordResponse?.body?.screeninfo?.titlesetnewpass ?? forgotPasswordSetNewTitleSetNewPassword,
          style:  TextStyle(
            color: Theme.of(context).appBarTheme.foregroundColor,
            fontSize: sizeTitle24,
          ),
        ),
      ),
      body: SafeArea(
// height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(children: [
                  Text(
                    screenForgotPasswordResponse?.body?.screeninfo?.textotpwillsent ??
                        forgotPasswordSetNewTextOTPWillSent,
                    style:  TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).appBarTheme.foregroundColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                    child: Center(
                      child: Text(valueEmailForgotPassword,
                          style:  TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                              decorationColor: tcOTPSent,
                              fontWeight: FontWeight.w500,
                              fontSize: sizeTextBig20)),
                    ),
                  ),
                  Text(
                    '$textRef : $ref',
                    style:  TextStyle(
                      fontSize: sizeTextSmaller14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                  Text(
                    screenForgotPasswordResponse?.body?.screeninfo?.texpleaseconfirm ??
                        forgotPasswordSetNewTextPleaseConfirm,
                    style:  TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
              TextFieldCustom(
                maxLengthOTP: 6,
                textEditingController: codeController,
                onChanged: (value) {
                  codeController.text = value;
                },
                hintLabel: screenForgotPasswordResponse?.body?.screeninfo?.otp ?? forgotPasswordSetNewOTP,
                textInputType: TextInputType.number,
                initialvalue: codeController.text,
                iconsFile : Icons.lock_clock_rounded,
              ),
              TextFieldPasswordCustom(
                textEditingController: passwordController,
                onChanged: (value) {
                  passwordController.text = value;
                },
                hintLabel: screenForgotPasswordResponse?.body?.screeninfo?.edtpass ?? forgotPasswordSetNewEdtPassword,
                textInputType: TextInputType.text,
                initialvalue: passwordController.text,
                iconsFile : Icons.lock_reset_rounded,
              ),
              TextFieldPasswordCustom(
                textEditingController: confirmPasswordController,
                onChanged: (value) {
                  confirmPasswordController.text = value;
                },
                hintLabel:
                    screenForgotPasswordResponse?.body?.screeninfo?.edtcpass ?? forgotPasswordSetNewEdtConfirmPassword,
                textInputType: TextInputType.text,
                initialvalue: confirmPasswordController.text,
                iconsFile : Icons.security_rounded,
              ),

              CountTimeOTPWidget(
                sendOTP: TextSendOTPCustom(
                  textlabel: screenForgotPasswordResponse?.body?.screeninfo?.btnsentotpagain ??
                      forgotPasswordSetNewBtnSentOTPAgain,
                  textcolor:Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                  sizetext: sizeTextSmall16,
                  onTap: () {
                    context.read<ForgotPasswordBloc>().add(ReSentOTPSetNewForgotPasswordEvent(
                        userID: valueUserIDForgotPassword, email: valueEmailForgotPassword));
                  },
                ),
                controller: controller,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: ButtonCustom(
                  label: screenForgotPasswordResponse?.body?.screeninfo?.btnconfirm ?? forgotPasswordSetNewBtnConfirm,
                  colortext:  tcButtonTextColor,
                  // colorbutton:  Theme.of(context).scaffoldBackgroundColor,
                  colorbutton:  Theme.of(context).buttonColor,
                  sizetext: sizeTextBig20,
                  colorborder: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                  sizeborder: 10,
                  onPressed: () {
                    context.read<ForgotPasswordBloc>().add(SubmitSetNewForgotPasswordEvent(
                        newPassword: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                        otp: codeController.text,
                        refValueText: refValue,
                        email: valueEmailForgotPassword,
                        userID: valueUserIDForgotPassword));
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
