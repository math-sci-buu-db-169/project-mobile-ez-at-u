import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/setting","timeexpire":false}
/// body : {"screenInfo":{"textlang":"Language","textthai":"ไทย","btncpass":"Change password","btncpin":"Change PIN","btndelacc":"Delete account","btnlogout":"Logout","modetheme":"Theme mode","lockscreencode":"Lock screen code","dark":"Dark","setting":"Setting","langeuage":"EN"},"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertdeleteaccount":"Do you want to delete your account? If you want to delete your account Press 'Okay' or 'Cancel' to continue using your account.","alertdeleteaccountpassword":"Please enter your password to confirm account deletion","alertdeleteaccountpdpa":"Account deletion is according to terms and conditions.","alertlogout":"Do you want to logout?","alertpassword":"Password","emailsupport":"scibuu.pr@gmail.com","phonesupport":"0-3810-3011"}}

SettingScreenResponse settingScreenResponseFromJson(String str) => SettingScreenResponse.fromJson(json.decode(str));
String settingScreenResponseToJson(SettingScreenResponse data) => json.encode(data.toJson());
class SettingScreenResponse {
  SettingScreenResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  SettingScreenResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
SettingScreenResponse copyWith({  Head? head,
  Body? body,
}) => SettingScreenResponse(  head: head ?? _head,
  body: body ?? _body,
);
  Head? get head => _head;
  Body? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_head != null) {
      map['head'] = _head?.toJson();
    }
    if (_body != null) {
      map['body'] = _body?.toJson();
    }
    return map;
  }

}

/// screenInfo : {"textlang":"Language","textthai":"ไทย","btncpass":"Change password","btncpin":"Change PIN","btndelacc":"Delete account","btnlogout":"Logout","modetheme":"Theme mode","lockscreencode":"Lock screen code","dark":"Dark","setting":"Setting","langeuage":"EN"}
/// errorbutton : {"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"}
/// alertmessage : {"alertdeleteaccount":"Do you want to delete your account? If you want to delete your account Press 'Okay' or 'Cancel' to continue using your account.","alertdeleteaccountpassword":"Please enter your password to confirm account deletion","alertdeleteaccountpdpa":"Account deletion is according to terms and conditions.","alertlogout":"Do you want to logout?","alertpassword":"Password","emailsupport":"scibuu.pr@gmail.com","phonesupport":"0-3810-3011"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      ScreenInfo? screenInfo, 
      Errorbutton? errorbutton, 
      Alertmessage? alertmessage,}){
    _screenInfo = screenInfo;
    _errorbutton = errorbutton;
    _alertmessage = alertmessage;
}

  Body.fromJson(dynamic json) {
    _screenInfo = json['screenInfo'] != null ? ScreenInfo.fromJson(json['screenInfo']) : null;
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _alertmessage = json['alertmessage'] != null ? Alertmessage.fromJson(json['alertmessage']) : null;
  }
  ScreenInfo? _screenInfo;
  Errorbutton? _errorbutton;
  Alertmessage? _alertmessage;
Body copyWith({  ScreenInfo? screenInfo,
  Errorbutton? errorbutton,
  Alertmessage? alertmessage,
}) => Body(  screenInfo: screenInfo ?? _screenInfo,
  errorbutton: errorbutton ?? _errorbutton,
  alertmessage: alertmessage ?? _alertmessage,
);
  ScreenInfo? get screenInfo => _screenInfo;
  Errorbutton? get errorbutton => _errorbutton;
  Alertmessage? get alertmessage => _alertmessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screenInfo != null) {
      map['screenInfo'] = _screenInfo?.toJson();
    }
    if (_errorbutton != null) {
      map['errorbutton'] = _errorbutton?.toJson();
    }
    if (_alertmessage != null) {
      map['alertmessage'] = _alertmessage?.toJson();
    }
    return map;
  }

}

/// alertdeleteaccount : "Do you want to delete your account? If you want to delete your account Press 'Okay' or 'Cancel' to continue using your account."
/// alertdeleteaccountpassword : "Please enter your password to confirm account deletion"
/// alertdeleteaccountpdpa : "Account deletion is according to terms and conditions."
/// alertlogout : "Do you want to logout?"
/// alertpassword : "Password"
/// emailsupport : "scibuu.pr@gmail.com"
/// phonesupport : "0-3810-3011"

Alertmessage alertmessageFromJson(String str) => Alertmessage.fromJson(json.decode(str));
String alertmessageToJson(Alertmessage data) => json.encode(data.toJson());
class Alertmessage {
  Alertmessage({
      String? alertdeleteaccount, 
      String? alertdeleteaccountpassword, 
      String? alertdeleteaccountpdpa, 
      String? alertlogout, 
      String? alertpassword, 
      String? emailsupport, 
      String? phonesupport,}){
    _alertdeleteaccount = alertdeleteaccount;
    _alertdeleteaccountpassword = alertdeleteaccountpassword;
    _alertdeleteaccountpdpa = alertdeleteaccountpdpa;
    _alertlogout = alertlogout;
    _alertpassword = alertpassword;
    _emailsupport = emailsupport;
    _phonesupport = phonesupport;
}

  Alertmessage.fromJson(dynamic json) {
    _alertdeleteaccount = json['alertdeleteaccount'];
    _alertdeleteaccountpassword = json['alertdeleteaccountpassword'];
    _alertdeleteaccountpdpa = json['alertdeleteaccountpdpa'];
    _alertlogout = json['alertlogout'];
    _alertpassword = json['alertpassword'];
    _emailsupport = json['emailsupport'];
    _phonesupport = json['phonesupport'];
  }
  String? _alertdeleteaccount;
  String? _alertdeleteaccountpassword;
  String? _alertdeleteaccountpdpa;
  String? _alertlogout;
  String? _alertpassword;
  String? _emailsupport;
  String? _phonesupport;
Alertmessage copyWith({  String? alertdeleteaccount,
  String? alertdeleteaccountpassword,
  String? alertdeleteaccountpdpa,
  String? alertlogout,
  String? alertpassword,
  String? emailsupport,
  String? phonesupport,
}) => Alertmessage(  alertdeleteaccount: alertdeleteaccount ?? _alertdeleteaccount,
  alertdeleteaccountpassword: alertdeleteaccountpassword ?? _alertdeleteaccountpassword,
  alertdeleteaccountpdpa: alertdeleteaccountpdpa ?? _alertdeleteaccountpdpa,
  alertlogout: alertlogout ?? _alertlogout,
  alertpassword: alertpassword ?? _alertpassword,
  emailsupport: emailsupport ?? _emailsupport,
  phonesupport: phonesupport ?? _phonesupport,
);
  String? get alertdeleteaccount => _alertdeleteaccount;
  String? get alertdeleteaccountpassword => _alertdeleteaccountpassword;
  String? get alertdeleteaccountpdpa => _alertdeleteaccountpdpa;
  String? get alertlogout => _alertlogout;
  String? get alertpassword => _alertpassword;
  String? get emailsupport => _emailsupport;
  String? get phonesupport => _phonesupport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alertdeleteaccount'] = _alertdeleteaccount;
    map['alertdeleteaccountpassword'] = _alertdeleteaccountpassword;
    map['alertdeleteaccountpdpa'] = _alertdeleteaccountpdpa;
    map['alertlogout'] = _alertlogout;
    map['alertpassword'] = _alertpassword;
    map['emailsupport'] = _emailsupport;
    map['phonesupport'] = _phonesupport;
    return map;
  }

}

/// buttonok : "OK"
/// buttonconfirm : "Confirm"
/// buttonyes : "Yes"
/// buttonno : "No"
/// buttoncancel : "Cancel"

Errorbutton errorbuttonFromJson(String str) => Errorbutton.fromJson(json.decode(str));
String errorbuttonToJson(Errorbutton data) => json.encode(data.toJson());
class Errorbutton {
  Errorbutton({
      String? buttonok, 
      String? buttonconfirm, 
      String? buttonyes, 
      String? buttonno, 
      String? buttoncancel,}){
    _buttonok = buttonok;
    _buttonconfirm = buttonconfirm;
    _buttonyes = buttonyes;
    _buttonno = buttonno;
    _buttoncancel = buttoncancel;
}

  Errorbutton.fromJson(dynamic json) {
    _buttonok = json['buttonok'];
    _buttonconfirm = json['buttonconfirm'];
    _buttonyes = json['buttonyes'];
    _buttonno = json['buttonno'];
    _buttoncancel = json['buttoncancel'];
  }
  String? _buttonok;
  String? _buttonconfirm;
  String? _buttonyes;
  String? _buttonno;
  String? _buttoncancel;
Errorbutton copyWith({  String? buttonok,
  String? buttonconfirm,
  String? buttonyes,
  String? buttonno,
  String? buttoncancel,
}) => Errorbutton(  buttonok: buttonok ?? _buttonok,
  buttonconfirm: buttonconfirm ?? _buttonconfirm,
  buttonyes: buttonyes ?? _buttonyes,
  buttonno: buttonno ?? _buttonno,
  buttoncancel: buttoncancel ?? _buttoncancel,
);
  String? get buttonok => _buttonok;
  String? get buttonconfirm => _buttonconfirm;
  String? get buttonyes => _buttonyes;
  String? get buttonno => _buttonno;
  String? get buttoncancel => _buttoncancel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buttonok'] = _buttonok;
    map['buttonconfirm'] = _buttonconfirm;
    map['buttonyes'] = _buttonyes;
    map['buttonno'] = _buttonno;
    map['buttoncancel'] = _buttoncancel;
    return map;
  }

}

/// textlang : "Language"
/// textthai : "ไทย"
/// btncpass : "Change password"
/// btncpin : "Change PIN"
/// btndelacc : "Delete account"
/// btnlogout : "Logout"
/// modetheme : "Theme mode"
/// lockscreencode : "Lock screen code"
/// dark : "Dark"
/// setting : "Setting"
/// langeuage : "EN"

ScreenInfo screenInfoFromJson(String str) => ScreenInfo.fromJson(json.decode(str));
String screenInfoToJson(ScreenInfo data) => json.encode(data.toJson());
class ScreenInfo {
  ScreenInfo({
      String? textlang, 
      String? textthai, 
      String? btncpass, 
      String? btncpin, 
      String? btndelacc, 
      String? btnlogout, 
      String? modetheme, 
      String? lockscreencode, 
      String? dark, 
      String? setting, 
      String? langeuage,}){
    _textlang = textlang;
    _textthai = textthai;
    _btncpass = btncpass;
    _btncpin = btncpin;
    _btndelacc = btndelacc;
    _btnlogout = btnlogout;
    _modetheme = modetheme;
    _lockscreencode = lockscreencode;
    _dark = dark;
    _setting = setting;
    _langeuage = langeuage;
}

  ScreenInfo.fromJson(dynamic json) {
    _textlang = json['textlang'];
    _textthai = json['textthai'];
    _btncpass = json['btncpass'];
    _btncpin = json['btncpin'];
    _btndelacc = json['btndelacc'];
    _btnlogout = json['btnlogout'];
    _modetheme = json['modetheme'];
    _lockscreencode = json['lockscreencode'];
    _dark = json['dark'];
    _setting = json['setting'];
    _langeuage = json['langeuage'];
  }
  String? _textlang;
  String? _textthai;
  String? _btncpass;
  String? _btncpin;
  String? _btndelacc;
  String? _btnlogout;
  String? _modetheme;
  String? _lockscreencode;
  String? _dark;
  String? _setting;
  String? _langeuage;
ScreenInfo copyWith({  String? textlang,
  String? textthai,
  String? btncpass,
  String? btncpin,
  String? btndelacc,
  String? btnlogout,
  String? modetheme,
  String? lockscreencode,
  String? dark,
  String? setting,
  String? langeuage,
}) => ScreenInfo(  textlang: textlang ?? _textlang,
  textthai: textthai ?? _textthai,
  btncpass: btncpass ?? _btncpass,
  btncpin: btncpin ?? _btncpin,
  btndelacc: btndelacc ?? _btndelacc,
  btnlogout: btnlogout ?? _btnlogout,
  modetheme: modetheme ?? _modetheme,
  lockscreencode: lockscreencode ?? _lockscreencode,
  dark: dark ?? _dark,
  setting: setting ?? _setting,
  langeuage: langeuage ?? _langeuage,
);
  String? get textlang => _textlang;
  String? get textthai => _textthai;
  String? get btncpass => _btncpass;
  String? get btncpin => _btncpin;
  String? get btndelacc => _btndelacc;
  String? get btnlogout => _btnlogout;
  String? get modetheme => _modetheme;
  String? get lockscreencode => _lockscreencode;
  String? get dark => _dark;
  String? get setting => _setting;
  String? get langeuage => _langeuage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textlang'] = _textlang;
    map['textthai'] = _textthai;
    map['btncpass'] = _btncpass;
    map['btncpin'] = _btncpin;
    map['btndelacc'] = _btndelacc;
    map['btnlogout'] = _btnlogout;
    map['modetheme'] = _modetheme;
    map['lockscreencode'] = _lockscreencode;
    map['dark'] = _dark;
    map['setting'] = _setting;
    map['langeuage'] = _langeuage;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "home/setting"
/// timeexpire : false

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());
class Head {
  Head({
      num? status, 
      String? message, 
      String? modulename, 
      bool? timeexpire,}){
    _status = status;
    _message = message;
    _modulename = modulename;
    _timeexpire = timeexpire;
}

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _modulename = json['modulename'];
    _timeexpire = json['timeexpire'];
  }
  num? _status;
  String? _message;
  String? _modulename;
  bool? _timeexpire;
Head copyWith({  num? status,
  String? message,
  String? modulename,
  bool? timeexpire,
}) => Head(  status: status ?? _status,
  message: message ?? _message,
  modulename: modulename ?? _modulename,
  timeexpire: timeexpire ?? _timeexpire,
);
  num? get status => _status;
  String? get message => _message;
  String? get modulename => _modulename;
  bool? get timeexpire => _timeexpire;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['modulename'] = _modulename;
    map['timeexpire'] = _timeexpire;
    return map;
  }

}