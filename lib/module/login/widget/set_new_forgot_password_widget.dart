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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: sizeTitle24,
            color: Colors.black,
          ),
        ),
        title: Text(
          screenForgotPasswordResponse?.body?.screeninfo?.titlesetnewpass ?? forgotPasswordSetNewTitleSetNewPassword,
          style: const TextStyle(
            color: Colors.black,
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
                    style: const TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                    child: Center(
                      child: Text(valueEmailForgotPassword,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: tcOTPSent,
                              decorationColor: tcOTPSent,
                              fontWeight: FontWeight.w500,
                              fontSize: sizeTextBig20)),
                    ),
                  ),
                  Text(
                    '$textRef : $ref',
                    style: const TextStyle(
                      fontSize: sizeTextSmaller14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    screenForgotPasswordResponse?.body?.screeninfo?.texpleaseconfirm ??
                        forgotPasswordSetNewTextPleaseConfirm,
                    style: const TextStyle(
                      fontSize: sizeTextBig20,
                      fontWeight: FontWeight.w600,
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
              ),
              TextFieldPasswordCustom(
                textEditingController: passwordController,
                onChanged: (value) {
                  passwordController.text = value;
                },
                hintLabel: screenForgotPasswordResponse?.body?.screeninfo?.edtpass ?? forgotPasswordSetNewEdtPassword,
                textInputType: TextInputType.text,
                initialvalue: passwordController.text,
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
              ),

              CountTimeOTPWidget(
                sendOTP: TextSendOTPCustom(
                  textlabel: screenForgotPasswordResponse?.body?.screeninfo?.btnsentotpagain ??
                      forgotPasswordSetNewBtnSentOTPAgain,
                  textcolor: tcOTPSent,
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
                  colortext: tcButtonTextBlack,
                  colorbutton: tcButtonTextWhite,
                  sizetext: sizeTextBig20,
                  colorborder: tcButtonTextBoarder,
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
