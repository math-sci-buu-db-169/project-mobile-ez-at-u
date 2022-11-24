import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../utils/shared_preferences.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_change_password.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_password_custom.dart';
import '../../../../customs/text_link/text_link_to_screen_custom.dart';
import '../../../home/screen/home_screen/home_screen.dart';
import '../../bloc/change_password_bloc/change_password_bloc.dart';
import '../../model/response/change_password_response/change_password_response.dart';
import '../../model/response/screen_change_password_response.dart';
import '../forgot_password_screen/forgot_password_screen.dart';
import '../login_screen/login_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChangePasswordBloc()..add(ChangePasswordScreenInfoEvent()),
        // child: const GenerativeWidget());
        child: const ChangePasswordPage());
  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> with ProgressDialog {
  ChangePasswordResponse? changePasswordResponse;
  ScreenChangePasswordResponse? _screenChangePasswordResponse;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  // context.read<ChangePasswordBloc>().add(ChangePasswordScreenInfoEvent());

  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;

  @override
  void initState() {
    _isSessionExpired();
    super.initState();
  }

  Future<void> _isSessionExpired() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';

    textSessionExpired = _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  void _setValueAndGoHome({ChangePasswordResponse? changePasswordResponse}) async {
    prefs = await SharedPreferences.getInstance();
    await setUserKeyAndRefreshKey(
        globalKey: changePasswordResponse?.body?.token?? "",
        refreshKey: changePasswordResponse?.body?.refreshtoken?? ""

    );
    // await setUserKey(globalKey: changePasswordResponse?.body?.token);
    // // valueLanguage = prefs.getString('userChangeLanguage') ?? '';
    // await setUserRefreshKey(refreshKey: changePasswordResponse?.body?.refreshtoken);
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          showProgressDialog(context);
        }
        if (state is ChangePasswordEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ChangePasswordError) {
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
        if (state is SubmitChangePasswordSuccessState) {
          changePasswordResponse = state.responseChangePasswordResponse;

          _setValueAndGoHome(changePasswordResponse: changePasswordResponse);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              // int index = int.parse(widget.id);
              return const HomeScreen();
            }),
          );
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoChangePasswordSuccessState) {
          _screenChangePasswordResponse = state.responseChangePasswordScreenInfo;
          return cPasswords(
            context,
            _screenChangePasswordResponse,
            currentPasswordController,
            confirmPasswordController,
            newPasswordController,
          );
        }

        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoChangePasswordSuccessState;
      },
    );
  }
}

cPasswords(
    BuildContext context,
    ScreenChangePasswordResponse? screenChangePasswordResponse,
    TextEditingController currentPasswordController,
    TextEditingController confirmPasswordController,
    TextEditingController newPasswordController) {
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
            screenChangePasswordResponse?.body?.screeninfo?.titlechangenewpass ?? changePasswordTitleChangeNewPassword,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextFieldPasswordCustom(
                  textEditingController: currentPasswordController,
                  onChanged: (value) {
                    currentPasswordController.text = value;
                  },
                  hintLabel: screenChangePasswordResponse?.body?.screeninfo?.edtcurrentpass ??
                      changePasswordEdtCurrentPassword,
                  textInputType: TextInputType.text,
                  iconsFile : Icons.lock_person_rounded,
                ),
                TextFieldPasswordCustom(
                  textEditingController: newPasswordController,
                  onChanged: (value) {
                    newPasswordController.text = value;
                  },
                  hintLabel: screenChangePasswordResponse?.body?.screeninfo?.edtnewpass ?? changePasswordEdtPassword,
                  textInputType: TextInputType.text,
                  iconsFile : Icons.lock_reset_rounded,
                ),
                TextFieldPasswordCustom(
                  textEditingController: confirmPasswordController,
                  onChanged: (value) {
                    confirmPasswordController.text = value;
                  },
                  hintLabel:
                      screenChangePasswordResponse?.body?.screeninfo?.edtcpass ?? changePasswordEdtConfirmPassword,
                  textInputType: TextInputType.text,
                  iconsFile : Icons.security_rounded,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextLinkToScreenCustom(
                      linklabel: screenChangePasswordResponse?.body?.screeninfo?.btnforgotpass ??
                          changePasswordTextForgotPassword,
                      linktextcolor: tcForgot,
                      sizetext: sizeTextSmaller14,
                      onTap: () async {
                        dialogOneLineTwoBtnWarning(
                            context,
                            screenChangePasswordResponse?.body?.errorscreeninfo?.errorsubmit ??
                                changePasswordErrorSubmit,
                            screenChangePasswordResponse?.body?.errorbutton?.buttonok ?? buttonOkTH,
                            screenChangePasswordResponse?.body?.errorbutton?.buttoncancel ?? buttonCancelTH,
                            onClickBtn: (String result) {
                          Navigator.of(context).pop();
                          switch (result) {
                            case 'Cancel':
                              {
                                break;
                              }
                            case 'OK':
                              {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                              }
                          }
                        });
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: ButtonCustom(
                      label: screenChangePasswordResponse?.body?.screeninfo?.btnconfirm ?? changePasswordBtnConfirm,
                      colortext: tcButtonTextBlack,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        context.read<ChangePasswordBloc>().add(SubmitChangePasswordEvent(
                            currentPassword: currentPasswordController.text,
                            newPassword: newPasswordController.text,
                            confirmPassword: confirmPasswordController.text));
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ));
}
