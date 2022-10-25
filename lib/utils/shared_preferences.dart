import 'package:ez_u/customs/message/text_button.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
String versionApp = "0.0.1.0 Beta" ;

setUserKey(  {String? globalKey} ) async{
  if (globalKey == null ){

  }
  else if (globalKey == '' ){

  } else if (globalKey == 'null' ){

  }else{
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('UserKey', globalKey);
  }
}
getUserKey() async{
  prefs = await SharedPreferences.getInstance();
  return prefs.getString('UserKey');
}
setUserRefreshKey(  {String? refreshKey} ) async{
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('refreshKey', refreshKey??"");
    // print('refreshKey');
    // print( prefs.getString('refreshKey') );
}
setVersionPDPA(  {String? versionPDPA} ) async{
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('VersionPDPA', versionPDPA??"");
    debugPrint('VersionPDPA');
    debugPrint( prefs.getString('VersionPDPA') );

}

setUserLanguage( String userLanguage) async{
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('userLanguage', userLanguage);
}
setButton( {String? buttonOkAPI,String? buttonConfirmAPI,String? buttonYesAPI,String? buttonNoAPI,String? buttonCancelAPI} ) async{
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('buttonOk', buttonOkAPI?? buttonOkTH);
  await prefs.setString('buttonConfirm', buttonConfirmAPI?? buttonConfirmTH);
  await prefs.setString('buttonYes', buttonYesAPI?? buttonYesTH);
  await prefs.setString('buttonNo', buttonNoAPI?? buttonNoTH);
  await prefs.setString('buttonCancel', buttonCancelAPI?? buttonCancelTH);
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

setIsChangUserLanguage( ) async{
  String userLanguage;
  prefs = await SharedPreferences.getInstance();
  var change =  prefs.getString('userLanguage') ;
  if(change == 'EN'){
    userLanguage ='TH';
    setUserLanguage(userLanguage);
  }else if (change == 'TH') {
    userLanguage = 'EN';
    setUserLanguage(userLanguage);
  }

}

