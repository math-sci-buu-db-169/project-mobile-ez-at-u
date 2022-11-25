import 'dart:convert';

/// head : {"status":200,"message":"success","module":"home"}
/// body : {"screenInfo":{"screenmore":{"textmore":"More","textboard":"Board","btnstd":"Student","btntc":"Teacher","textabdepart":"About department","btndeparthis":"Department history","btncou":"Course","btnface":"Facebook","btnweb":"Website","textsup":"Support","btntermandcon":"Terms and conditions","btnfaq":" FAQ","btnconus":" Contact us","texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"},"screenhome":{"titlestatus":"My activity","textactivity":"Activity name","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","texttime":"Total time","texttimestatus":"( Hr : min )","textvenue":"Venue","edtapprover":"Approver","textdetail":"Detail","btnadd":"ADD","textname":"Name","textnickname":"Nickname","textgen":"Gen.","textstdcode":"Student code","textemail":"Email","textrole":"Role","textlang":"Language","textlangdetail":"Thai","textstdtc":"Student / Teacher","btncpass":"Change password","btndelacc":"Delete account","textappver":"Application version","btnlogout":"Logout"}},"pavat_url":"https://math.buu.ac.th/history/frontend/index","luksuit_url":"https://math.buu.ac.th/course/frontend/index","facebook_url":"https://www.facebook.com/SciMathBUU","website_url":"https://math.buu.ac.th/","vs":"1.0.0.0 Beta"}

ScreenHomeResponse screenhomeresponseFromJson(String str) => ScreenHomeResponse.fromJson(json.decode(str));
String screenHomeToJson(ScreenHomeResponse data) => json.encode(data.toJson());

class ScreenHomeResponse {
  ScreenHomeResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenHomeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenHomeResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenHomeResponse(
        head: head ?? _head,
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

/// screenInfo : {"titleact":"My activity","btnadd":"Add","textname":"Name","textnickname":"Nickname","textgen":"Gen","textstdcode":"Student code","textemail":"Email","textrole":"Role","textlang":"Language","textthai":"ไทย","btncpass":"Change password","btncpin":"Change PIN","btndelacc":"Delete account","textappver":"Application version","btnlogout":"Logout"}
/// errorbutton : {"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"}
/// alertmessage : {"alertdeleteaccount":"Do you want to delete your account? If you want to delete your account Press 'Okay' or 'Cancel' to continue using your account.","alertdeleteaccountpassword":"Please enter your password to confirm account deletion.EN ","alertdeleteaccountpdpa":"Account deletion is subject to terms and conditions.EN ","alertlogout":"Do you want to logout?","alertpassword":"Password","emailsupport":"scibuu.pr@gmail.com","phonesupport":"0-3810-3011"}

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
/// alertdeleteaccountpassword : "Please enter your password to confirm account deletion.EN "
/// alertdeleteaccountpdpa : "Account deletion is subject to terms and conditions.EN "
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

/// titleact : "My activity"
/// btnadd : "Add"
/// textname : "Name"
/// textnickname : "Nickname"
/// textgen : "Gen"
/// textstdcode : "Student code"
/// textemail : "Email"
/// textrole : "Role"
/// textlang : "Language"
/// textthai : "ไทย"
/// btncpass : "Change password"
/// btncpin : "Change PIN"
/// btndelacc : "Delete account"
/// textappver : "Application version"
/// btnlogout : "Logout"

ScreenInfo screenInfoFromJson(String str) => ScreenInfo.fromJson(json.decode(str));
String screenInfoToJson(ScreenInfo data) => json.encode(data.toJson());
class ScreenInfo {
  ScreenInfo({
    String? titleact,
    String? btnadd,
    String? textname,
    String? textnickname,
    String? textgen,
    String? textstdcode,
    String? textemail,
    String? textrole,
    String? textlang,
    String? textthai,
    String? btncpass,
    String? btncpin,
    String? btndelacc,
    String? textappver,
    String? btnlogout,
    String? modetheme,
    String? lockscreencode,
    String? dark,
    String? setting,}){
    _titleact = titleact;
    _btnadd = btnadd;
    _textname = textname;
    _textnickname = textnickname;
    _textgen = textgen;
    _textstdcode = textstdcode;
    _textemail = textemail;
    _textrole = textrole;
    _textlang = textlang;
    _textthai = textthai;
    _btncpass = btncpass;
    _btncpin = btncpin;
    _btndelacc = btndelacc;
    _textappver = textappver;
    _btnlogout = btnlogout;
    _modetheme = modetheme;
    _lockscreencode = lockscreencode;
    _dark = dark;
    _setting = setting;
  }

  ScreenInfo.fromJson(dynamic json) {
    _titleact = json['titleact'];
    _btnadd = json['btnadd'];
    _textname = json['textname'];
    _textnickname = json['textnickname'];
    _textgen = json['textgen'];
    _textstdcode = json['textstdcode'];
    _textemail = json['textemail'];
    _textrole = json['textrole'];
    _textlang = json['textlang'];
    _textthai = json['textthai'];
    _btncpass = json['btncpass'];
    _btncpin = json['btncpin'];
    _btndelacc = json['btndelacc'];
    _textappver = json['textappver'];
    _btnlogout = json['btnlogout'];
    _modetheme = json['modetheme'];
    _lockscreencode = json['lockscreencode'];
    _dark = json['dark'];
    _setting = json['setting'];
  }
  String? _titleact;
  String? _btnadd;
  String? _textname;
  String? _textnickname;
  String? _textgen;
  String? _textstdcode;
  String? _textemail;
  String? _textrole;
  String? _textlang;
  String? _textthai;
  String? _btncpass;
  String? _btncpin;
  String? _btndelacc;
  String? _textappver;
  String? _btnlogout;
  String? _modetheme;
  String? _lockscreencode;
  String? _dark;
  String? _setting;
  ScreenInfo copyWith({  String? titleact,
    String? btnadd,
    String? textname,
    String? textnickname,
    String? textgen,
    String? textstdcode,
    String? textemail,
    String? textrole,
    String? textlang,
    String? textthai,
    String? btncpass,
    String? btncpin,
    String? btndelacc,
    String? textappver,
    String? btnlogout,
    String? modetheme,
    String? lockscreencode,
    String? dark,
    String? setting,
  }) => ScreenInfo(  titleact: titleact ?? _titleact,
    btnadd: btnadd ?? _btnadd,
    textname: textname ?? _textname,
    textnickname: textnickname ?? _textnickname,
    textgen: textgen ?? _textgen,
    textstdcode: textstdcode ?? _textstdcode,
    textemail: textemail ?? _textemail,
    textrole: textrole ?? _textrole,
    textlang: textlang ?? _textlang,
    textthai: textthai ?? _textthai,
    btncpass: btncpass ?? _btncpass,
    btncpin: btncpin ?? _btncpin,
    btndelacc: btndelacc ?? _btndelacc,
    textappver: textappver ?? _textappver,
    btnlogout: btnlogout ?? _btnlogout,
    modetheme: modetheme ?? _modetheme,
    lockscreencode: lockscreencode ?? _lockscreencode,
    dark: dark ?? _dark,
    setting: setting ?? _setting,
  );
  String? get titleact => _titleact;
  String? get btnadd => _btnadd;
  String? get textname => _textname;
  String? get textnickname => _textnickname;
  String? get textgen => _textgen;
  String? get textstdcode => _textstdcode;
  String? get textemail => _textemail;
  String? get textrole => _textrole;
  String? get textlang => _textlang;
  String? get textthai => _textthai;
  String? get btncpass => _btncpass;
  String? get btncpin => _btncpin;
  String? get btndelacc => _btndelacc;
  String? get textappver => _textappver;
  String? get btnlogout => _btnlogout;
  String? get modetheme => _modetheme;
  String? get lockscreencode => _lockscreencode;
  String? get dark => _dark;
  String? get setting => _setting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleact'] = _titleact;
    map['btnadd'] = _btnadd;
    map['textname'] = _textname;
    map['textnickname'] = _textnickname;
    map['textgen'] = _textgen;
    map['textstdcode'] = _textstdcode;
    map['textemail'] = _textemail;
    map['textrole'] = _textrole;
    map['textlang'] = _textlang;
    map['textthai'] = _textthai;
    map['btncpass'] = _btncpass;
    map['btncpin'] = _btncpin;
    map['btndelacc'] = _btndelacc;
    map['textappver'] = _textappver;
    map['btnlogout'] = _btnlogout;
    map['modetheme'] = _modetheme;
    map['lockscreencode'] = _lockscreencode;
    map['dark'] = _dark;
    map['setting'] = _setting;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "Activity"
/// timeexpire : false


/// status : 200
/// message : "success"
/// modulename : "Activity"

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