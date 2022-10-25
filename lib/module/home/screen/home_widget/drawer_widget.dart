import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../customs/button/button_icon_text.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_home.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_password_custom.dart';
import '../../../../module/home/bloc/home_bloc/home_bloc.dart';
import '../../../../module/home/model/response/home_response/screen_home_response.dart';
import '../../../../module/home/screen/home_widget/change_language_widget.dart';
import '../../../../module/home/screen/home_widget/general_img_info_drawer_widget.dart';
import '../../../../module/home/screen/home_widget/general_info_drawer_widget.dart';
import '../../../../module/home/screen/more_screen/pdpa_screen.dart';
import '../../../../module/login/screen/change_password_screen/change_password_screen.dart';
import '../../../../module/profile/model/response/api_profile_response.dart';

drawerHome(
    BuildContext context,
    void Function() toggleLanguageView,
    isHidden,
    ScreenHomeResponse? screenHomeResponse,
    ApiProfileResponse? screenProfileResponse,
    TextEditingController otpCodeController,
    TextEditingController passwordController,
    {required String versionApp}) {
  String name = screenProfileResponse?.body?.profileGeneralInfo?.name ?? '-';
  String lName = screenProfileResponse?.body?.profileGeneralInfo?.lastname ?? '-';
  String textAlertDeleteAccount = screenHomeResponse?.body?.alertmessage?.alertdeleteaccount ?? alertDeleteAccount;
  String textAlertDeleteAccountPassword = screenHomeResponse?.body?.alertmessage?.alertdeleteaccountpassword ?? alertDeleteAccount;
  String textAlertDeleteAccountPDPA = screenHomeResponse?.body?.alertmessage?.alertdeleteaccountpdpa ?? alertDeleteAccount;
  String textAlertLogout = screenHomeResponse?.body?.alertmessage?.alertlogout ?? alertLogout;
  String textEmailSupport = screenHomeResponse?.body?.alertmessage?.emailsupport ?? emailSupport;
  String textPhoneSupport = screenHomeResponse?.body?.alertmessage?.phonesupport ?? phoneSupport;
  String textPassword = screenHomeResponse?.body?.alertmessage?.alertpassword ?? alertPassword;

  return SafeArea(
    child: SizedBox(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(
                    width: double.infinity,
                    color: HexColor(screenProfileResponse?.body?.profileGeneralInfo?.gencolor ?? drawerColor),
                    padding: const EdgeInsets.all(20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      buildTableGeneralImageInfo(
                        context,
                        screenProfileResponse,
                        tb1: 0.65,
                        tb2: 0.05,
                        tb3: 0.3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildTableDrawerTwoTable(
                        context,
                        textLeftTitle: screenHomeResponse?.body?.screenInfo?.textname ?? homeTextName,
                        textRightDetail: '$name   $lName ',
                        tb1: 0.3,
                        tb2: 0.05,
                        tb3: 0.65,
                        underline: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildTableDrawerTwoTable(
                        context,
                        textLeftTitle: screenHomeResponse?.body?.screenInfo?.textnickname ?? homeTexNickName,
                        textRightDetail: screenProfileResponse?.body?.profileGeneralInfo?.nickname ?? '-',
                        tb1: 0.45,
                        tb2: 0.05,
                        tb3: 0.5,
                        underline: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildTableDrawerTwoTable(
                        context,
                        textLeftTitle: screenHomeResponse?.body?.screenInfo?.textstdcode ?? homeTextStdCode,
                        textRightDetail: screenProfileResponse?.body?.profileGeneralInfo?.studentid ?? '-',
                        tb1: 0.45,
                        tb2: 0.05,
                        tb3: 0.5,
                        underline: false,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      buildTableDrawerTwoTable(
                        context,
                        textLeftTitle: screenHomeResponse?.body?.screenInfo?.textemail ?? homeTextEmail,
                        textRightDetail: screenProfileResponse?.body?.profileGeneralInfo?.email ?? '-',
                        tb1: 0.2,
                        tb2: 0.02,
                        tb3: 0.77,
                        underline: false,
                      ),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    color: bscTransparent,
                    padding: const EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
                    child: buildTableDrawerTwoTable(
                      context,
                      textLeftTitle: screenHomeResponse?.body?.screenInfo?.textrole ?? homeTextRole,
                      textRightDetail: screenProfileResponse?.body?.profileGeneralInfo?.role ?? '-',
                      tb1: 0.5,
                      tb2: 0.05,
                      tb3: 0.45,
                      underline: false,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: bscTransparent,
                    padding: const EdgeInsets.only(top: 0, bottom: 0, left: 15, right: 15),
                    child: changLanguage(
                      context,
                      toggleLanguageView,
                      isHidden,
                      textLeftTitle: screenHomeResponse?.body?.screenInfo?.textlang ?? homeTextLang,
                      textRightDetail: screenHomeResponse?.body?.screenInfo?.textthai ?? homeTextThai,
                      tb1: 0.5,
                      tb2: 0.00,
                      tb3: 0.55,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      color: bscTransparent,
                      padding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                      child: buildTableDrawerTwoTable(
                        context,
                        textLeftTitle: screenHomeResponse?.body?.screenInfo?.btncpass ?? homeBtnConfirmPassword,
                        textRightDetail: '',
                        tb1: 0.5,
                        tb2: 0.05,
                        tb3: 0.45,
                        underline: true,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // context.read<HomeBloc>().add(OnClickDeleteAccountHomeEvent());
                      dialogFiveLineTwoTextFieldTwoBtn(
                        context,
                        content1: textAlertDeleteAccountPassword,
                        content2: textAlertDeleteAccountPDPA,
                        content3: textAlertDeleteAccount,
                        content4: textEmailSupport,
                        content5: textPhoneSupport,
                        btn1: screenHomeResponse?.body?.errorbutton?.buttonok ?? buttonOkTH,
                        btn2: screenHomeResponse?.body?.errorbutton?.buttoncancel ?? buttonCancelTH,
                        isScreenTo: const PDPAMoreScreen(),
                        textFieldOne: TextFieldPasswordCustom(
                          textEditingController: passwordController,
                          onChanged: (value) {
                            passwordController.text = value;
                          },
                          hintLabel: textPassword,
                          textInputType: TextInputType.text,
                          initialvalue: passwordController.text,
                        ),
                        onClickBtn: (String result) {
                          Navigator.of(context).pop();
                          switch (result) {
                            case 'Cancel':
                              {
                                break;
                              }
                            case 'OK':
                              {
                                context
                                    .read<HomeBloc>()
                                    .add(OnClickConfirmDeleteAccountHomeEvent(password: passwordController.text));
                              }
                          }
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      color: bscTransparent,
                      padding: const EdgeInsets.only(top: 0, bottom: 10, left: 15, right: 15),
                      child: buildTableDrawerTwoTable(
                        context,
                        textLeftTitle: screenHomeResponse?.body?.screenInfo?.btndelacc ?? homeBtnDelAcc,
                        textRightDetail: '',
                        tb1: 0.5,
                        tb2: 0.05,
                        tb3: 0.45,
                        underline: true,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: bscTransparent,
                    padding: const EdgeInsets.only(top: 0, bottom: 15, left: 15, right: 15),
                    child: buildTableDrawerTwoTable(
                      context,
                      textLeftTitle: screenHomeResponse?.body?.screenInfo?.textappver ?? homeTextAppVer,
                      // textRightDetail: screenHomeResponse?.body?.vs ?? '-',
                      textRightDetail: versionApp,
                      tb1: 0.5,
                      tb2: 0.05,
                      tb3: 0.45,
                      underline: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: buttonIconsText(
                      onPressed: () {
                        dialogOneLineTwoBtnWarning(
                            context,
                            "$textAlertLogout ",
                            screenHomeResponse?.body?.errorbutton?.buttonok ?? buttonOkTH,
                            screenHomeResponse?.body?.errorbutton?.buttoncancel ?? buttonCancelTH,
                            onClickBtn: (String result) {
                          Navigator.of(context).pop();
                          switch (result) {
                            case 'Cancel':
                              {
                                break;
                              }
                            case 'OK':
                              {
                                context.read<HomeBloc>().add(OnClickConfirmLogoutHomeEvent());
                              }
                          }
                        });
                      },
                      label: screenHomeResponse?.body?.screenInfo?.btnlogout ?? homeBtnLogout,
                      colortext: bcButtonLogout,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: bcButtonLogout,
                      iconlabel: Icons.exit_to_app,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            child: Text(
              "EZ@ ${screenProfileResponse?.body?.profileGeneralInfo?.nickname ?? '-'}",
              style: TextStyle(
                color: Colors.grey[100],
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
