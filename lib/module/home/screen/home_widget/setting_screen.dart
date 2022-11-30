import 'package:ez_at_u/module/home/screen/home_widget/setting_pin_lock_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';

import '../../../../customs/color/color_const.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_home.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_password_custom.dart';
import '../../../login/screen/change_password_screen/change_password_screen.dart';
import '../../bloc/home_bloc/home_bloc.dart';
import '../../model/response/home_response/setting_screen_response.dart';
import '../home_screen/home_screen.dart';
import '../more_screen/pdpa_screen.dart';
import 'change_language_widget.dart';
import 'general_info_drawer_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../utils/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeScreenSettingInfoEvent()),
      child: const SettingPage(),
    );
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with ProgressDialog {
  SettingScreenResponse? _settingScreenResponse;

  TextEditingController otpCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String keyToken;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String _role;
  late int intThemeMode = 2;
  late ThemeMode themeMode;

  late bool _isHiddenPin = false;
  // late String? _refreshKey;
  // late bool _isHidden;
  late PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    buildNumber: 'Unknown',
    version: 'Unknown',
  );

  @override
  void initState() {
    // _initPackageInfo();
    // _initRole();
    _iniGetThemeMode();
    _isSessionPin();
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionPin() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      String pinStringToBool = prefs.getString('pinStatus') ?? 'false';
      _isHiddenPin = pinStringToBool == 'true' ? true : false;
    });
  }

  // Future<void> _initPackageInfo() async {
  //   final info = await PackageInfo.fromPlatform();
  //
  //   setState(() {
  //     _packageInfo = info;
  //   });
  // }
  // void _initRole()  async{
  //
  //   prefs = await SharedPreferences.getInstance();
  //   setState(()  {
  //     _role = prefs.getString('Role')??"TC";
  //   });
  // }

  void _iniGetThemeMode() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getInt('themeMode') == null) {
        setThemeModeApp(
          intMode: 2,
        );
      }
      intThemeMode = prefs.getInt('themeMode') ?? 2;
      if (prefs.getInt('themeMode') != null) {
        switch (prefs.getInt('themeMode')) {
          case 0:
            themeMode = ThemeMode.light;
            print("themeMode H case 0: = ${themeMode}");

            break;
          case 1:
            themeMode = ThemeMode.dark;
            print("themeMode  H case 1: = ${themeMode}");
            break;
          case 2:
            themeMode = ThemeMode.system;
            print("themeMode  H case 2: = ${themeMode}");
            break;
          default:
            themeMode = ThemeMode.system;
            print("themeMode  H case default: = ${themeMode}");
            break;
        }
      } else {
        themeMode = ThemeMode.system;
        setThemeModeApp(
          intMode: 2,
        );
      }
    });
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired =
        _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
        _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  void _toggleLanguageView() {
    _settingScreenResponse?.body?.screenInfo?.langeuage == 'TH'
        ? _userLanguage = "EN"
        : _userLanguage = "TH";
    context
        .read<HomeBloc>()
        .add(OnClickChangeLanguageHomeEvent(userLanguage: _userLanguage));
  }

  void _changeLanguageSuccess({required String userLanguage}) {
    setUserLanguage(userLanguage);
    context.read<HomeBloc>().add(HomeScreenSettingInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          showProgressDialog(context);
        }
        if (state is HomeAlertLoading) {
          showProgressTransparent(context);
        }
        if (state is HomeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeError) {
          if (state.message.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(
                context, textSessionExpired, textSubSessionExpired, _buttonOk,
                onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()));
            });
          } else {
            dialogOneLineOneBtn(context, '${state.message}\n ', _buttonOk,
                onClickBtn: () {
              Navigator.of(context).pop();
            });
          }
        }

        if (state is HomeLogoutState) {
          cleanDelete();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen()));
        }
        if (state is OnClickConfirmDeleteAccountState) {
          cleanDelete();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen()));
        }
        if (state is OnClickChangeLanguageHomeSuccessState) {
          _changeLanguageSuccess(userLanguage: state.userLanguage);
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoHomeSettingSuccessState) {
          _settingScreenResponse = state.settingScreenResponse;
            _userLanguage =  _settingScreenResponse?.body?.screenInfo?.langeuage ??"TH";
          String textAlertDeleteAccount =
              _settingScreenResponse?.body?.alertmessage?.alertdeleteaccount ??
                  alertDeleteAccount;
          String textAlertDeleteAccountPassword = _settingScreenResponse
                  ?.body?.alertmessage?.alertdeleteaccountpassword ??
              alertDeleteAccount;
          String textAlertDeleteAccountPDPA =
              _settingScreenResponse?.body?.alertmessage?.alertdeleteaccountpdpa ??
                  alertDeleteAccount;
          String textEmailSupport =
              _settingScreenResponse?.body?.alertmessage?.emailsupport ??
                  emailSupport;
          String textPhoneSupport =
              _settingScreenResponse?.body?.alertmessage?.phonesupport ??
                  phoneSupport;
          String textPassword =
              _settingScreenResponse?.body?.alertmessage?.alertpassword ??
                  alertPassword;
          bool isHidden =
          _settingScreenResponse?.body?.screenInfo?.langeuage ==
                      'TH'
                  ? true
                  : false;

          return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child:Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
              title: Text(
                _settingScreenResponse?.body?.screenInfo?.setting ??homeSetting,
                style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor,
                  fontSize: sizeTitle24,
                ),
              ),
            ),
            body: SafeArea(
              child: Container(
                // color: Colors.grey[200],
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                          padding: const EdgeInsets.only(
                              right: 5, left: 5, top: 5, bottom: 5),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: bscTransparent,
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 15, right: 10),
                                child: changLanguage(
                                  context,
                                  _toggleLanguageView,
                                  isHidden,
                                  textLeftTitle: _settingScreenResponse
                                          ?.body?.screenInfo?.textlang ??
                                      homeTextLang,
                                  textRightDetail: _settingScreenResponse
                                          ?.body?.screenInfo?.textthai ??
                                      homeTextThai,
                                  leftIcon: Icon(FontAwesomeIcons.language,
                                      color: Theme.of(context).iconTheme.color),
                                  tb1: 0.1,
                                  tb2: 0.6,
                                  tb3: 0.3,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                color: bscTransparent,
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 15, right: 10),
                                child: changModeTheme(
                                  context,
                                  _toggleLanguageView,
                                  isHidden,
                                  textLeftTitle:
                                  _settingScreenResponse?.body?.screenInfo?.modetheme ??homeThemeModeAPP,
                                  textRightDetail: _settingScreenResponse?.body?.screenInfo?.dark ??homeThemeDark,
                                  leftIcon: Icon(FontAwesomeIcons.sun,
                                      color: Theme.of(context).iconTheme.color),
                                  tb1: 0.1,
                                  tb2: 0.6,
                                  tb3: 0.3,
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     dialogThemeMode(
                              //         context,
                              //         optionsThemeMode:optionsThemeMode,
                              //         callbackFromOptionThemeMode: (int optionThemeModeResult) {
                              //
                              //       },
                              //     );
                              //   },
                              //   child: Container(
                              //     width: double.infinity,
                              //     color: bscTransparent,
                              //     padding: const EdgeInsets.only(
                              //         top: 0, bottom: 10, left: 15, right: 15),
                              //     child: buildTableDrawerTwoTable(
                              //       context,
                              //       textLeftTitle: homeThemeModeAPP ?? homeThemeModeAPP,
                              //       // textLeftTitle: screenHomeResponse?.body?.screenInfo?.btncpass ?? homeBtnConfirmPassword,
                              //       textRightDetail: optionsThemeMode[intThemeMode],
                              //       tb1: 0.5,
                              //       tb2: 0.05,
                              //       tb3: 0.45,
                              //       underline: true,
                              //     ),
                              //   ),
                              // ),

                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const  SettingPinLockAppScreen()));
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: bscTransparent,
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 10, left: 15, right: 15),
                                  child: buildTableDrawerTwoTableIcons(
                                    context,
                                    textLeftTitle:
                                    _settingScreenResponse?.body?.screenInfo?.lockscreencode ?? homeBtnPINAPP,
                                    // textLeftTitle: screenHomeResponse?.body?.screenInfo?.btncpass ?? homeBtnConfirmPassword,
                                    textRightDetail: '',
                                    leftIcon: Icon(
                                        _isHiddenPin == true
                                            ? FontAwesomeIcons.lock
                                            : FontAwesomeIcons.lockOpen,
                                        color:
                                            Theme.of(context).iconTheme.color),
                                    tb1: 0.1,
                                    tb2: 0.55,
                                    tb3: 0.35,
                                    underline: true,
                                    textDelete: false,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChangePasswordScreen()));
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: bscTransparent,
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 10, left: 15, right: 15),
                                  child: buildTableDrawerTwoTableIcons(
                                    context,
                                    textLeftTitle: _settingScreenResponse
                                            ?.body?.screenInfo?.btncpass ??
                                        homeBtnConfirmPassword,
                                    textRightDetail: '',
                                    leftIcon: Icon(FontAwesomeIcons.key,
                                        color:
                                            Theme.of(context).iconTheme.color),
                                    tb1: 0.1,
                                    tb2: 0.55,
                                    tb3: 0.35,
                                    underline: true,
                                    textDelete: false,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 5,
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
                                    btn1: _settingScreenResponse
                                            ?.body?.errorbutton?.buttonok ??
                                        buttonOkTH,
                                    btn2: _settingScreenResponse
                                            ?.body?.errorbutton?.buttoncancel ??
                                        buttonCancelTH,
                                    isScreenTo: const PDPAMoreScreen(),
                                    textFieldOne: TextFieldPasswordCustom(
                                      textEditingController: passwordController,
                                      onChanged: (value) {
                                        passwordController.text = value;
                                      },
                                      hintLabel: textPassword,
                                      textInputType: TextInputType.text,
                                      initialvalue: passwordController.text,
                                      iconsFile: Icons.lock,
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
                                            context.read<HomeBloc>().add(
                                                OnClickConfirmDeleteAccountHomeEvent(
                                                    password: passwordController
                                                        .text));
                                          }
                                      }
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 10, left: 15, right: 15),
                                  child: buildTableDrawerTwoTableIcons(
                                    context,
                                    textLeftTitle: _settingScreenResponse
                                            ?.body?.screenInfo?.btndelacc ??
                                        homeBtnDelAcc,
                                    textRightDetail: '',
                                    leftIcon: Icon(FontAwesomeIcons.trashCan,
                                        color:Theme.of(context).bottomAppBarColor == Colors.black?Colors.red:Colors.red.withOpacity(0.5)),
                                    tb1: 0.1,
                                    tb2: 0.55,
                                    tb3: 0.35,
                                    underline: true,
                                    textDelete: true,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ));
        }
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoHomeSettingSuccessState;
      },
    );
  }
}
