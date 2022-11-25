import 'package:ez_at_u/module/home/screen/home_widget/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../customs/color/color_const.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/message/text_home.dart';
import '../../../../customs/pin/pin_lock_app_screen.dart';
import '../../../../customs/pin/pin_lock_create_screen.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../login/bloc/change_password_bloc/change_password_bloc.dart';
import '../../../login/model/response/change_password_response/change_password_response.dart';
import '../../../login/model/response/screen_change_password_response.dart';
import '../../../login/screen/login_screen/login_screen.dart';
import '../home_screen/home_screen.dart';

class SettingPinLockAppScreen extends StatelessWidget {
  const SettingPinLockAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ChangePasswordBloc()..add(ChangePasswordScreenInfoEvent()),
        // child: const GenerativeWidget());
        child: const PinLockAppPage());
  }
}

class PinLockAppPage extends StatefulWidget {
  const PinLockAppPage({Key? key}) : super(key: key);

  @override
  State<PinLockAppPage> createState() => _PinLockAppPageState();
}

class _PinLockAppPageState extends State<PinLockAppPage> with ProgressDialog {
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
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;

  final controllerPin = InputController();
  @override
  void initState() {
    _isSessionPin();
    _isSessionExpired();
    super.initState();
  }

  void _togglePinLockAppView() async {
    setState(
      () {
        if (_isHiddenPin == true) {
          setIsPinStatus(pinStatus: false);
          setIBioStatus(bioStatus: false);
          prefs.remove("pinValue");
        }
        if (_isHiddenPin == false) {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>   pinLockAppCreateScreen()));
        }

        _isSessionPin();
      },
    );
  }

  void _toggleBioLockAppView() async {


    setState(
      () {
        _isHiddenBio = !_isHiddenBio;
        if (_isHiddenBio == true) {
          setIBioStatus(bioStatus: true);
        } else {
          setIBioStatus(bioStatus: false);
        }
      },
    );
  }

  Future<void> _isSessionExpired() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';

    textSessionExpired =
        _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
        _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  Future<void> _isSessionPin() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      String pinStringToBool = prefs.getString('pinStatus') ?? 'false';
      String bioStringToBool = prefs.getString('bioStatus') ?? 'false';
      _isHiddenPin = pinStringToBool == 'true' ? true : false;
      _isHiddenBio = bioStringToBool == 'true' ? true : false;
      _pinValueString = prefs.getString('pinValue') ?? '....';
    });
  }

  void _setValuePinAndHidden(
      {required bool pinStatus, required String pinValue}) async {
    print("pinValue_setValuePinAndHidden");
    print(pinValue);

    prefs = await SharedPreferences.getInstance();
    await setIsPinStatus(pinStatus: pinStatus);
    // valueLanguage = prefs.getString('userChangeLanguage') ?? '';
    await setIsPinValue(pinValue: pinValue);
    setState(
      () {},
    );
  }

  void _setValueAndGoHome(
      {ChangePasswordResponse? changePasswordResponse}) async {
    prefs = await SharedPreferences.getInstance();
    await setUserKeyAndRefreshKey(
        globalKey: changePasswordResponse?.body?.token?? "",
        refreshKey: changePasswordResponse?.body?.refreshtoken?? "",
      isRole: changePasswordResponse?.body?.role ??"TC",
      userLanguage: changePasswordResponse?.body?.language ??"TH",

    );
    // await setUserKey(globalKey: changePasswordResponse?.body?.token);
    // // valueLanguage = prefs.getString('userChangeLanguage') ?? '';
    // await setUserRefreshKey(
    //     refreshKey: changePasswordResponse?.body?.refreshtoken);
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
        if (state is SubmitChangePasswordSuccessState) {
          changePasswordResponse = state.responseChangePasswordResponse;

          _setValueAndGoHome(changePasswordResponse: changePasswordResponse);
          Navigator.pushReplacement(
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
          _screenChangePasswordResponse =
              state.responseChangePasswordScreenInfo;
          return pinLockAppBody(
            context,
            _togglePinLockAppView,
            _toggleBioLockAppView,
            _screenChangePasswordResponse,
            currentPasswordController,
            confirmPasswordController,
            newPasswordController,
            controllerPin,
            _isSessionPin,
            _setValuePinAndHidden,
            isHiddenPin: _isHiddenPin,
            isHiddenBio: _isHiddenBio,
            pinValueString: _pinValueString,
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

pinLockAppBody(
    BuildContext context,
    void Function() togglePinLockAppView,
    void Function() toggleBioLockAppView,
    ScreenChangePasswordResponse? screenChangePasswordResponse,
    TextEditingController currentPasswordController,
    TextEditingController confirmPasswordController,
    TextEditingController newPasswordController,
    InputController controllerPin,
    Future<void> Function() isSessionPin,
    void Function({required bool pinStatus, required String pinValue})
        setValuePinAndHidden,
    {required bool isHiddenPin,
    required bool isHiddenBio,
    required String pinValueString,

    }) {
  print('pinValueString');
  print(pinValueString);
  print(pinValueString.length);
  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor ,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  const SettingScreen( )));
            },
            icon:  Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color:  Theme.of(context).bottomAppBarColor ,
            ),
          ),
          title:  Text(
            homeBtnPINAPP ?? homeBtnPINAPP,
            style: TextStyle(
              color: Theme.of(context).bottomAppBarColor ,
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
                GestureDetector(
                    onTap: () {
                      togglePinLockAppView();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                           ),
                        // margin: EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 0, top: 3, right: 0, bottom: 0),
                        child: Column(
                          children: [

                            Table(
                              border: TableBorder.symmetric(
                                  outside: const BorderSide(
                                      width: 2, color: Colors.transparent)),
                              columnWidths: const {
                                0: FractionColumnWidth(0.9),
                                1: FractionColumnWidth(0.1),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                   Text(
                                    "Lock Application Screen",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).bottomAppBarColor ),
                                  ),
                                  Switch.adaptive(
                                    value: isHiddenPin == true?true:false,
                                    onChanged: (value) {
                                      togglePinLockAppView();
                                    },
                                    activeColor:Colors.green,
                                    activeTrackColor:Colors.green,


                                  ),
                                  // IconButton(
                                  //     onPressed: () {
                                  //       togglePinLockAppView();
                                  //     },
                                  //     icon: isHiddenPin
                                  //         ? const Icon(Icons.toggle_on,
                                  //             size: 35.0,
                                  //             color: Color(0xFF00A80A))
                                  //         : const Icon(Icons.toggle_off,
                                  //             size: 35.0,
                                  //             color: Color(0xFF4F4F4F)))
                                ])
                              ],
                            ),
                            isHiddenPin
                                ? const SizedBox()
                                : Table(
                                    border: TableBorder.symmetric(
                                        outside: const BorderSide(
                                            width: 2,
                                            color: Colors.transparent)),
                                    columnWidths: const {
                                      0: FractionColumnWidth(1.0),
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children:  [
                                      TableRow(children: [
                                        Text(
                                          "      If you forget your PIN Lock Application, you will need to delete and "
                                          "To reinstall Application EZ@U, you will need to log out. "
                                          "You will need to delete the Application EZ@U cache data from your mobile phone.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).bottomAppBarColor.withOpacity(0.8),),
                                        ),
                                      ])
                                    ],
                                  )
                          ],
                        ))),

                Divider(
                  color: Theme.of(context).bottomAppBarColor.withOpacity(0.3),
                  height: 5,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                isHiddenPin
                    ? GestureDetector(
                        onTap: () {
                          toggleBioLockAppView();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                ),
                            // margin: EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 0, top: 0, right: 2, bottom: 0),
                            child: Column(
                              children: [
                                Table(
                                  border: TableBorder.symmetric(
                                      outside: const BorderSide(
                                          width: 2, color: Colors.transparent)),
                                  columnWidths: const {
                                    0: FractionColumnWidth(0.9),
                                    1: FractionColumnWidth(0.1),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(children: [
                                       Text(
                                        "Fingerprint scanner and face scan",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).bottomAppBarColor),
                                      ),Switch.adaptive(
                                        value: isHiddenBio == true?true:false,
                                        onChanged: (value) {
                                          toggleBioLockAppView();
                                        },
                                        activeColor:Colors.green,
                                        activeTrackColor:Colors.green,


                                      )

                                    ])
                                  ],
                                ),
                              ],
                            )))
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            ),
                        // margin: EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 0, top: 0, right: 2, bottom: 0),
                        child: Column(
                          children: [
                            Table(
                              border: TableBorder.symmetric(
                                  outside: const BorderSide(
                                      width: 2, color: Colors.transparent)),
                              columnWidths: const {
                                0: FractionColumnWidth(0.9),
                                1: FractionColumnWidth(0.1),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                   Text(
                                    "Fingerprint scanner and face scan",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).bottomAppBarColor),
                                  ),
                                  Switch.adaptive(
                                    value: false,
                                    onChanged: (value) {
                                    },
                                    activeColor:Colors.green,
                                    activeTrackColor:Colors.green,


                                  )
                                ])
                              ],
                            ),
                          ],
                        )),

                Divider(
                  color: Theme.of(context).bottomAppBarColor.withOpacity(0.3),
                  height: 5,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),

                isHiddenPin
                    ? GestureDetector(
                        onTap: () {

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              // int index = int.parse(widget.id);
                              return  PinLockAppScreen(isHiddenBio: false, pinValueString: pinValueString, optionLockApp: false,);
                            }),
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),

                            ),
                            // margin: EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 0, top: 0, right: 2, bottom: 0),
                            child: Column(
                              children: [
                                Table(
                                  border: TableBorder.symmetric(
                                      outside: const BorderSide(
                                          width: 2, color: Colors.transparent)),
                                  columnWidths: const {
                                    0: FractionColumnWidth(0.9),
                                    1: FractionColumnWidth(0.1),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children:  [
                                    TableRow(children: [
                                      Text(
                                        "Change Passcode ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color:Theme.of(context).bottomAppBarColor),
                                      ),
                                      Icon(
                                          Icons.chevron_right_outlined,
                                          size: 35.0,
                                          color:Theme.of(context).bottomAppBarColor),
                                    ])
                                  ],
                                ),
                                Table(
                                  border: TableBorder.symmetric(
                                      outside: const BorderSide(
                                          width: 2, color: Colors.transparent)),
                                  columnWidths: const {
                                    0: FractionColumnWidth(1.0),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children:  [
                                    TableRow(children: [
                                      Text(
                                        "      If you forget your PIN Lock Application, you will need to delete and "
                                        "To reinstall Application EZ@U, you will need to log out. "
                                        "You will need to delete the Application EZ@U cache data from your mobile phone.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).bottomAppBarColor.withOpacity(0.8),),
                                      ),
                                    ])
                                  ],
                                ),
                              ],
                            )))
                    : const SizedBox(),
                isHiddenPin
                    ?Divider(
                  color: Theme.of(context).bottomAppBarColor.withOpacity(0.3),
                  height: 5,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ):const SizedBox(
                  height: 1,
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
