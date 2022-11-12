import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../module/home/bloc/home_bloc/home_bloc.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  State<FingerprintPage> createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  late SharedPreferences prefs;
  late String _pinValueString;
  late bool _isHiddenPin;
  late bool _isHiddenBio;
  @override
  void initState() {
    _isSessionPin();
    // localAuth(context);
    super.initState();
  }

  Future<void> _isSessionPin() async {
    prefs = await SharedPreferences.getInstance();
    String pinStringToBool = prefs.getString('pinStatus') ?? 'false';
    String bioStringToBool = prefs.getString('bioStatus') ?? 'false';
    _isHiddenPin = pinStringToBool == 'true' ? true : false;
    _isHiddenBio = bioStringToBool == 'true' ? true : false;
    _pinValueString = prefs.getString('pinValue') ?? '...';

    setState(() {});
  }

  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticate(
      localizedReason: 'Please authenticate',
      // biometricOnly: true,
    );
    if (didAuthenticate) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: InkWell(
        onTap: () {
          screenLock(
            context: context,
            correctString: _pinValueString,
            customizedButtonChild: const Icon(
              Icons.fingerprint,
            ),
            customizedButtonTap: () async => await localAuth(context),
            onOpened: () async => await localAuth(context),
            onUnlocked: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreen()),
              // );
            },
          );
        }, // Handle your callback
        child: Ink(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue),
      ),
    );
  }
}

// pinScanner(BuildContext context){
//   Future<void> localAuth(BuildContext context) async {
//     final localAuth = LocalAuthentication();
//     final didAuthenticate = await localAuth.authenticate(
//       localizedReason: 'Please authenticate',
//       // biometricOnly: true,
//     );
//     if (didAuthenticate) {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => const HomeScreen()),
//       // );
//
//     }
//   }
//   return Scaffold(
//     body: SafeArea(
//       child: Container(
//
//       ),
//     ),
//   );
// }
