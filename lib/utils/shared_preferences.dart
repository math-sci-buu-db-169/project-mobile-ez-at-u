import 'package:ez_at_u/customs/message/text_button.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
String versionApp = "0.0.1.0 Beta";
setUserKeyAndRefreshKey({required String? refreshKey, required String? globalKey, required String? isRole, required String? userLanguage}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('refreshKey', refreshKey ?? "");
  await prefs.setString('UserKey', globalKey ?? "");
  await prefs.setString('Role', isRole ?? "TC");
  await prefs.setString('userLanguage', userLanguage?? "TH");

  // print('refreshKey');
  // print( prefs.getString('refreshKey') );
}

// setUserKey({String? globalKey}) async {
//   if (globalKey == null) {
//   } else if (globalKey == '') {
//   } else if (globalKey == 'null') {
//   } else {
//     prefs = await SharedPreferences.getInstance();
//     await prefs.setString('UserKey', globalKey);
//   }
// }
//
// setUserRefreshKey({String? refreshKey}) async {
//   prefs = await SharedPreferences.getInstance();
//   await prefs.setString('refreshKey', refreshKey ?? "");
//   // print('refreshKey');
//   // print( prefs.getString('refreshKey') );
//}
  getUserKey() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('UserKey');
  }

  getUserRefKey() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshKey');
  }

getVersionPDPA() async {
  prefs = await SharedPreferences.getInstance();
  return prefs.getString('VersionPDPA');
}

setVersionPDPA({required String? versionPDPA}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('VersionPDPA', versionPDPA ?? "");
  debugPrint('VersionPDPA');
  debugPrint(prefs.getString('VersionPDPA'));
}

setUserLanguage(String userLanguage) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('userLanguage', userLanguage);
}

setMyNameUser(String myNameUser) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('myNameUser', myNameUser);
  print("myNameUser");
  print(myNameUser);
}

setButton(
    {String? buttonOkAPI,
    String? buttonConfirmAPI,
    String? buttonYesAPI,
    String? buttonNoAPI,
    String? buttonCancelAPI}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('buttonOk', buttonOkAPI ?? buttonOkTH);
  await prefs.setString('buttonConfirm', buttonConfirmAPI ?? buttonConfirmTH);
  await prefs.setString('buttonYes', buttonYesAPI ?? buttonYesTH);
  await prefs.setString('buttonNo', buttonNoAPI ?? buttonNoTH);
  await prefs.setString('buttonCancel', buttonCancelAPI ?? buttonCancelTH);
}

void cleanDelete() async {
  prefs = await SharedPreferences.getInstance();
  prefs.remove("UserKey");
  prefs.remove("userLanguage");
  prefs.remove("refreshKey");

  // print( "prefs.getString('UserKey') ");
  //
  // print( prefs.getString('UserKey') );
  // print( "prefs.getString('userLanguage')" );
  // print( prefs.getString('userLanguage') )  ;
  // print( "prefs.getString('refreshKey')" );
  // print( prefs.getString('refreshKey') )  ;
}

void cleanUserKey() async {
  prefs = await SharedPreferences.getInstance();
  prefs.remove("UserKey");
  prefs.remove("refreshKey");
  // print('UserKey');
  // print( prefs.getString('UserKey') );
  // print('refreshKey');
  // print( prefs.getString('refreshKey') );
}

setIsPinStatus({required bool pinStatus}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('pinStatus', pinStatus.toString());
  print('pinStatus');
  print(prefs.getString('pinStatus'));
}

setIBioStatus({required bool bioStatus}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('bioStatus', bioStatus.toString());
  print('bioStatus');
  print(prefs.getString('bioStatus'));
}

setIsPinValue({required String pinValue}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('pinValue', pinValue);
  String? pinValue2 = prefs.getString('pinValue');
  print('pinValue');
  print(prefs.getString('pinValue'));
  print(pinValue2?.length);
}

setIsLogSessions(
    {required int sessionsID,
    required String sessions,
    required String myUserID}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setInt('isSessionsID', sessionsID);
  await prefs.setString('isSessions', sessions);
  await prefs.setString('isUserID', myUserID);
  print('isSessionsID');
  print(prefs.getInt('isSessionsID'));
  print('isSessions');
  print(prefs.getString('isSessions'));
  print('isUserID');
  print(prefs.getString('isUserID'));
}

void cleanIsLogSessions() async {
  prefs = await SharedPreferences.getInstance();
  prefs.remove("isSessionsID");
  prefs.remove("isSessions");
  prefs.remove("isUserID");
  print('isSessionsID');
  print(prefs.getInt('isSessionsID'));
  print('isSessions');
  print(prefs.getString('isSessions'));
  print('isUserID');
  print(prefs.getString('isUserID'));
}

setIsChangUserLanguage() async {
  String userLanguage;
  prefs = await SharedPreferences.getInstance();
  var change = prefs.getString('userLanguage');
  if (change == 'EN') {
    userLanguage = 'TH';
    setUserLanguage(userLanguage);
  } else if (change == 'TH') {
    userLanguage = 'EN';
    setUserLanguage(userLanguage);
  }
}

setThemeModeApp({required int intMode}) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setInt('themeMode', intMode);
  print(
      'themeMode themeMode themeMode themeMode themeMode 99999999999999999999999999999999999999999999999999999');
  print(prefs.getInt('themeMode'));
  print(intMode);
}
setTextPinScreen({required String? enterPin, required String? hello, required String? niceDay, required String? enterConfirmPin, required String? enterNewPin, }) async {
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('enterPin', enterPin ?? "Please enter your PIN.");
  await prefs.setString('Hello', hello ?? "Hello");
  await prefs.setString('niceDay', niceDay ?? "have a nice day.");
  await prefs.setString('enterConfirmPin', enterConfirmPin ?? "Please enter confirm your PIN.");
  await prefs.setString('enterNewPin', enterNewPin ?? "Please enter new your PIN.");

  // print('refreshKey');
  // print( prefs.getString('refreshKey') );
}