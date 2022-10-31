import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_confirm_register.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_custom.dart';
import '../../../../customs/text_link/text_link_otp_custom.dart';
import '../../../../module/login/bloc/register_bloc/register_bloc.dart';
import '../../../../module/login/model/response/screen_register_response.dart';
import '../../../../module/login/widget/count_time_otp_widget.dart';

Widget confirmRegisterPageWidget(
    BuildContext context, ScreenRegisterResponse? screenRegisterResponse, TextEditingController confirmOTPController,
    {required String valueUserRegister,
    required String valueEmailRegister,
    required String valuePhoneRegister,
    required String valueNameRegister,
    required String valueLastNameRegister,
    required String valuePasswordRegister,
    required String valueConfirmPasswordRegister,
    required CustomTimerController controller,
    required String? refValue}) {
  String textRef = screenRegisterResponse?.body?.screeninfo?.textref ?? '-';
  String ref = refValue ?? '-';
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
          screenRegisterResponse?.body?.screeninfo?.titleconregis ?? confirmRegisterTitleConfirmRegister,
          style: const TextStyle(
            color: Colors.black,
            fontSize: sizeTitle24,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        screenRegisterResponse?.body?.screeninfo?.textotpwillsent ?? confirmRegisterTextOTPWilSent,
                        style: const TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                        child: Text(valueEmailRegister,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: tcOTPSent,
                                decorationColor: tcOTPSent,
                                fontWeight: FontWeight.w500,
                                fontSize: sizeTextBig20)),
                      ),
                      Text(
                        '$textRef : $ref ',
                        style: const TextStyle(
                          fontSize: sizeTextSmaller14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        screenRegisterResponse?.body?.screeninfo?.textpleaseconfirm ?? confirmRegisterTextPleaseConfirm,
                        style: const TextStyle(
                          fontSize: sizeTextBig20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ]),
                  ),
                  TextFieldCustom(
                    maxLengthOTP: 6,
                    textEditingController: confirmOTPController,
                    onChanged: (valueConfirmRegisterOTP) {
                      confirmOTPController.text = valueConfirmRegisterOTP;
                    },
                    hintLabel: screenRegisterResponse?.body?.screeninfo?.edtotp ?? confirmRegisterEdtOTP,
                    textInputType: TextInputType.number,
                    initialvalue: confirmOTPController.text,
                    iconsFile : Icons.lock_clock_rounded,
                  ),
                  CountTimeOTPWidget(
                    sendOTP: TextSendOTPCustom(
                      textlabel:
                          screenRegisterResponse?.body?.screeninfo?.textsentotpagain ?? confirmRegisterTextSentOTPAgain,
                      textcolor: tcOTPSent,
                      sizetext: sizeTextSmall16,
                      onTap: () {
                        BlocProvider.of<RegisterBloc>(context).add(ReSentOTPConfirmRegisterEvent(
                          userID: valueUserRegister,
                          phone: valuePhoneRegister,
                          email: valueEmailRegister,
                          name: valueNameRegister,
                          lastName: valueLastNameRegister,
                          password: valuePasswordRegister,
                          confirmPassword: valueConfirmPasswordRegister,
                        ));
                      },
                    ),
                    controller: controller,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: ButtonCustom(
                      label: screenRegisterResponse?.body?.screeninfo?.btnconfirm ?? confirmRegisterBtnConfirm,
                      colortext: tcButtonTextBlack,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<RegisterBloc>(context)
                            // ..isFetching = true
                            .add(SubmitConfirmRegisterEvent(
                                //     email: valueEmailRegister,
                                // userID: valueUserRegister,
                                // otp: confirmOTPController.text
                                userID: valueUserRegister,
                                phone: valuePhoneRegister,
                                email: valueEmailRegister,
                                name: valueNameRegister,
                                lastName: valueLastNameRegister,
                                password: valuePasswordRegister,
                                confirmPassword: valueConfirmPasswordRegister,
                                oTP: confirmOTPController.text,
                                refOTP: ref));
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
            )),
      ),
    ),
  );
}
