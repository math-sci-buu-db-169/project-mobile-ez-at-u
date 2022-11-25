import 'package:ez_at_u/customs/pin/pin_number.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../module/home/screen/home_widget/setting_pin_lock_app_screen.dart';
import '../../utils/shared_preferences.dart';
import 'local_auth_api.dart';


pinLockAppCreateScreen(){
  return Scaffold(

    backgroundColor: Colors.grey.withOpacity(0.4),
    body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                // colors: [Colors.black87, Colors.black87],
                colors: [Colors.transparent, Colors.transparent],
                begin: Alignment.topRight)),
        child: const PinLockAppCreatePage(
          // isHiddenBio: isHiddenBio,
          // pinValueString: pinValueString,
        ),
      ),
    ),
  );
}

class PinLockAppCreatePage extends StatefulWidget {
  // final bool isHiddenBio;
  // final String pinValueString;
  const PinLockAppCreatePage({
    Key? key,
    // required this.isHiddenBio,
    // required this.pinValueString,
  }) : super(key: key);

  @override
  State<PinLockAppCreatePage> createState() => _PinLockAppCreatePageState();
}

class _PinLockAppCreatePageState extends State<PinLockAppCreatePage> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController onePinController = TextEditingController();
  TextEditingController twoPinController = TextEditingController();
  TextEditingController threePinController = TextEditingController();
  TextEditingController fourPinController = TextEditingController();


  late String pinValueString ;
   _setValuePinAndHidden(
      {required bool pinStatus, required String pinValue}) async {
    print("pinValue_setValuePinAndHidden  pinLockAppCreateScreen");
    print(pinValue);

    prefs = await SharedPreferences.getInstance();
    await setIsPinStatus(pinStatus: pinStatus);
    // valueLanguage = prefs.getString('userChangeLanguage') ?? '';
    await setIsPinValue(pinValue: pinValue);
    setState(
          () {},
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SettingPinLockAppScreen()),
    );
  }

  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.transparent));
  int pinIndex = 0;
  bool pinCreateStatus = false;
  late SharedPreferences prefs;
  late String myNameUser = '';
  var rowPin = MainAxisAlignment.spaceEvenly;
  double paddingKeyBoardNumberValue = 8;
  var rowPinColors = Colors.white;
  late String  enterConfirmPin = "Please enter confirm your PIN.";
   String  enterNewPin = "Please enter new your PIN";

  late String pinValueShowString= enterNewPin;
  @override
  void initState() {
    _isGetTextPinScreen();
    super.initState();
  }

  Future<void> _isGetTextPinScreen() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      enterConfirmPin =  prefs.getString('enterConfirmPin')?? "Please enter confirm your PIN.";
      enterNewPin =  prefs.getString('enterNewPin')?? "Please enter new your PIN";
      pinValueShowString= enterNewPin;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildExitButton(context),
        Expanded(
            child: Container(
              alignment: const Alignment(0, 0.5),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSecurityText(context),
                  const SizedBox(
                    height: 40.0,
                  ),
                  buildPinRow(context,
                      rowPin: rowPin,
                      rowPinColors: rowPinColors,
                      outlineInputBorder: outlineInputBorder,
                      onePinController: onePinController,
                      twoPinController: twoPinController,
                      threePinController: threePinController,
                      fourPinController: fourPinController,
                      paddingKeyBoardNumberValue: paddingKeyBoardNumberValue),
                  buildNumberPad(context, pinIndex, currentPin),
                ],
              ),
            )),
      ],
    );
  }

  buildNumberPad(
      BuildContext context,
      int pinIndex,
      List<String> currentPin,
      ) {
    double paddingKeyBoardNumber = 10;
    return Expanded(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 1,
                          onPressed: () {
                            pinIndexSetup("1");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 2,
                          onPressed: () {
                            pinIndexSetup("2");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 3,
                          onPressed: () {
                            pinIndexSetup("3");
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 4,
                          onPressed: () {
                            pinIndexSetup("4");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 5,
                          onPressed: () {
                            pinIndexSetup("5");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 6,
                          onPressed: () {
                            pinIndexSetup("6");
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 7,
                          onPressed: () {
                            pinIndexSetup("7");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 8,
                          onPressed: () {
                            pinIndexSetup("8");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 9,
                          onPressed: () {
                            pinIndexSetup("9");
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 70.0,
                      height: 70.0,
                    ),

                    // Padding(
                    //   padding: EdgeInsets.all(paddingKeyBoardNumber),
                    //   child: widget.isHiddenBio
                    //       ? keyBoarBio()
                    //       : const SizedBox(
                    //     width: 70.0,
                    //     height: 70.0,
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(paddingKeyBoardNumber),
                      child: KeyBoarNumber(
                          n: 0,
                          onPressed: () {
                            pinIndexSetup("0");
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.all(paddingKeyBoardNumber),
                        child: pinIndex == 0
                            ? const SizedBox(
                          width: 70.0,
                          height: 70.0,
                        )
                            : keyBoarClear(context)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  keyBoarBio(
      BuildContext context,) {
    return Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.3),
        ),
        alignment: Alignment.center,
        child: Tooltip(
          message: 'Fingerprint ,Touch ID ,Biometric, Pattern ',
          child: MaterialButton(
              padding: EdgeInsets.all(8.0),
              onPressed: () async {
                final isAuthenticated = await LocalAuthApi.authenticate();

                if (isAuthenticated) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.0),
              ),
              height: 90.0,
              child: const Icon(
                FontAwesomeIcons.fingerprint,
                size: 35,
                color: Colors.white,
              )),
        ));
  }

  keyBoarClear(
      BuildContext context,) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.3),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: const EdgeInsets.all(8.0),
        onPressed: () {
          clearPin();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: const Icon(
          Icons.clear_rounded,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      isSetPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    } else {
      isSetPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    }
    setState(() {});
  }

  pinIndexSetup(String textValue) {
    String strPin = '';
    setState(()  {
      if (pinIndex == 0) {
        pinIndex = 1;
      } else if (pinIndex < 4) {
        pinIndex++;
      }
      isSetPin(pinIndex, textValue);
      currentPin[pinIndex - 1] = textValue;

      for (var e in currentPin) {
        strPin += e;
      }
      if (pinIndex == 4) {
        if(pinCreateStatus ==  true){
          if (kDebugMode) {
            print(strPin);
          }
          if (strPin == pinValueString)  {
             _setValuePinAndHidden(pinStatus: true, pinValue: strPin);

          }

        }else if (pinCreateStatus == false){
          pinCreateStatus =  true;
          pinValueString = strPin ;
          pinValueShowString= enterConfirmPin;
          rowPinColors = Colors.green.shade100;
          paddingKeyBoardNumberValue = 15;
          Future.delayed(const Duration(milliseconds: 50), () {
            paddingKeyBoardNumberValue = 20;
            Future.delayed(const Duration(milliseconds: 50), () {
              for (var i = pinIndex; i >= 0; i--) {
                clearPin();
                paddingKeyBoardNumberValue = 8;
                rowPinColors = Colors.white;
              }
            });
          });
        }

      }
    });
    if (pinIndex == 4) {
      if (kDebugMode) {
        print(strPin);
      }
      if (strPin != pinValueString) {
        rowPinColors = Colors.yellow.shade100;
        rowPin = MainAxisAlignment.spaceAround;
        paddingKeyBoardNumberValue = 15;
        Future.delayed(const Duration(milliseconds: 50), () {
          rowPin = MainAxisAlignment.spaceBetween;

          paddingKeyBoardNumberValue = 20;
          Future.delayed(const Duration(milliseconds: 50), () {
            for (var i = pinIndex; i >= 0; i--) {
              clearPin();
              rowPin = MainAxisAlignment.spaceEvenly;

              paddingKeyBoardNumberValue = 8;
              rowPinColors = Colors.white;
            }
          });
        });
      }
    }
  }

  isSetPin(int n, String textValue) {
    switch (n) {
      case 1:
        onePinController.text = textValue;
        setState(() {});
        break;
      case 2:
        twoPinController.text = textValue;
        setState(() {});
        break;
      case 3:
        threePinController.text = textValue;
        setState(() {});
        break;
      case 4:
        fourPinController.text = textValue;
        setState(() {});
        break;
    }
  }

  buildPinRow(
      BuildContext context, {
        required OutlineInputBorder outlineInputBorder,
        required TextEditingController onePinController,
        required TextEditingController twoPinController,
        required TextEditingController threePinController,
        required TextEditingController fourPinController,
        required MainAxisAlignment rowPin,
        required Color rowPinColors,
        required double paddingKeyBoardNumberValue,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: paddingKeyBoardNumberValue,
              left: paddingKeyBoardNumberValue),
          child: PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: onePinController,
            rowPinColors: rowPinColors,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: paddingKeyBoardNumberValue,
              left: paddingKeyBoardNumberValue),
          child: PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: twoPinController,
            rowPinColors: rowPinColors,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: paddingKeyBoardNumberValue,
              left: paddingKeyBoardNumberValue),
          child: PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: threePinController,
            rowPinColors: rowPinColors,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: paddingKeyBoardNumberValue,
              left: paddingKeyBoardNumberValue),
          child: PinNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: fourPinController,
            rowPinColors: rowPinColors,
          ),
        ),
      ],
    );
  }

  buildSecurityText(BuildContext context) {
    return Column(
      children: [

        Text(
          pinValueShowString,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  buildExitButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
              onPressed: () {},
              height: 50.0,
              minWidth: 50.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Tooltip(
                message: 'Exit',
                child: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const SettingPinLockAppScreen()));
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
