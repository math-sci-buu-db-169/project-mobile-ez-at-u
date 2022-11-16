import 'package:ez_at_u/customs/pin/pin_number.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:ez_at_u/module/login/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_auth_api.dart';

class PinScreen extends StatefulWidget {
  final bool isHiddenBio;
  final String pinValueString;
  const PinScreen({
    Key? key,
    required this.isHiddenBio,
    required this.pinValueString,
  }) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black87, Colors.black87],
                  begin: Alignment.topRight)),
          child: PinPage(
            isHiddenBio: widget.isHiddenBio,
            pinValueString: widget.pinValueString,
          ),
        ),
      ),
    );
  }
}

class PinPage extends StatefulWidget {
  final bool isHiddenBio;
  final String pinValueString;
  const PinPage({
    Key? key,
    required this.isHiddenBio,
    required this.pinValueString,
  }) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController onePinController = TextEditingController();
  TextEditingController twoPinController = TextEditingController();
  TextEditingController threePinController = TextEditingController();
  TextEditingController fourPinController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.transparent));
  int pinIndex = 0;
  late SharedPreferences prefs;
  late String myNameUser = '';
  @override
  void initState() {
    _isGetMyNameUser();
    super.initState();
  }

  Future<void> _isGetMyNameUser() async {
    prefs = await SharedPreferences.getInstance();
    myNameUser = prefs.getString('myNameUser') ?? '';
    print("myNameUser : $myNameUser");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        buildExitButton(context),
        Expanded(
            child: Container(
          alignment: Alignment(0, 0.5),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSecurityText(context),
              const SizedBox(
                height: 40.0,
              ),
              buildPinRow(
                context,
                outlineInputBorder: outlineInputBorder,
                onePinController: onePinController,
                twoPinController: twoPinController,
                threePinController: threePinController,
                fourPinController: fourPinController,
              ),
              buildNumberPad(context, pinIndex, currentPin),
            ],
          ),
        )),
      ],
    ));
  }

  buildNumberPad(
    BuildContext context,
    int pinIndex,
    List<String> currentPin,
  ) {
    return Expanded(
        child: Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoarNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    }),
                KeyBoarNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    }),
                KeyBoarNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoarNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    }),
                KeyBoarNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    }),
                KeyBoarNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoarNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    }),
                KeyBoarNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    }),
                KeyBoarNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Container(
                //   width: 60.0,
                // ),
                widget.isHiddenBio
                    ? keyBoarBio()
                    : Container(
                        width: 60.0,
                      ),
                KeyBoarNumber(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup("0");
                    }),
                pinIndex == 0
                    ? Container(
                        width: 60.0,
                      )
                    : keyBoarClear()
              ],
            ),
          ],
        ),
      ),
    ));
  }

  keyBoarBio() {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent.withOpacity(0.3),
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
            child:const Icon(
              FontAwesomeIcons.fingerprint,
              size: 35,
              color: Colors.white,
            )

        ),
      )

    );
  }

  keyBoarClear() {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent.withOpacity(0.3),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
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
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    isSetPin(pinIndex, textValue);
    currentPin[pinIndex - 1] = textValue;
    String strPin = '';

    for (var e in currentPin) {
      strPin += e;
    }
    if (pinIndex == 4) {
      print(strPin);
      if (strPin == widget.pinValueString) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        for (var i = pinIndex; i >= 0; i--) {
          clearPin();
        }
      }
    }
    setState(() {});
  }

  isSetPin(int n, String textValue) {
    switch (n) {
      case 1:
        onePinController.text = textValue;
        break;
      case 2:
        twoPinController.text = textValue;
        break;
      case 3:
        threePinController.text = textValue;
        break;
      case 4:
        fourPinController.text = textValue;
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
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: onePinController,
        ),
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: twoPinController,
        ),
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: threePinController,
        ),
        PinNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: fourPinController,
        ),
      ],
    );
  }

  buildSecurityText(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello $myNameUser, have a nice day. ",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Please enter your PIN.",
          style: TextStyle(
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
                message: 'Exit Application',
                child: IconButton(
                  onPressed: () {
                    SystemNavigator.pop();
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
