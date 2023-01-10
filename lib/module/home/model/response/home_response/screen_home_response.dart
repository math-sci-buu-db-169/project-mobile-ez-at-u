import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity","timeexpire":false}
/// body : {"screenInfo":{"titleact":"กิจกรรมของฉัน","btnadd":"เพิ่ม","textname":"ชื่อ","textnickname":"ชื่อเล่น","textgen":"รุ่น","textstdcode":"รหัสนิสิต","textemail":"อิเมล","textrole":"ประเภทผู้ใช้งาน","textlang":"ภาษา","textthai":"Thai","btncpass":"เปลี่ยนรหัสผ่าน","btncpin":"เปลี่ยนรหัส PIN","btndelacc":"ลบบัญชี","textappver":"เวอร์ชันแอปพลิเคชัน","btnlogout":"ออกจากระบบ","modetheme":"โหมดธีม","lockscreencode":"รหัสล็อคหน้าจอ","dark":"มืด","setting":"ตั้งค่า","position":"ตำแหน่งทางวิชาการ","titleactteacher":"ยืนยันกิจกรรม","btnseeall":"ดูทั้งหมด"},"errorbutton":{"buttonok":"ตกลง","buttonconfirm":"ยืนยัน","buttonyes":"ใช่","buttonno":"ไม่ใช่","buttoncancel":"ยกเลิก"},"alertmessage":{"alertdeleteaccount":"คุณต้องการลบบัญชีใช่หรือไม่ หากคุณต้องการลบบัญชีผู้ใช้ กรุณากดปุ่ม 'ตกลง' หรือกดปุ่ม 'ยกเลิก' เพื่อกลับไปใช้งาน","alertdeleteaccountpassword":"กรุณากรอกรหัสผ่าน เพื่อยืนยันการลบบัญชี ","alertdeleteaccountpdpa":"การลบบัญชี จะเป็นไปตามเงื่อนไขและข้อตกลง","alertlogout":"คุณต้องการออกจากระบบใช่หรือไม่","alertpassword":"รหัสผ่าน","emailsupport":"scibuu.pr@gmail.com","phonesupport":"0-3810-3011","alertpdpa":"alertpdpaTH","alertupdateapp":"alertupdateappTH","titlenewappversion":"แอป EZ@U มีเวอร์ชันใหม่มาแล้วค่ะ","subtitlenewappversion":"กรุณาอัปเดตแอปเพื่อประสบการณ์ในการใช้งานที่ดีกว่าเดิม","titlenewpadaversion":"กรุณาอัปเดตแอปเพื่อสิทธิในการเข้าถึงข้อมูลที่ดีของท่านค่ะ","subtitlenewpadaversion":"แอป EZ@U มีเงื่อนไขข้อตกเวอร์ชันใหม่มาแล้วค่ะ"},"other":{"user_pdpa_version":"1","pdpa_version":"1.0.1","pdpa_link":"https://webzbinaryz.web.app/pdpa","app_version":"1.0.0","app_link":"https://drive.google.com/drive/folders/1rCn2H4H-9X43nW_pRTVDG-V9MEntuu0c?usp=sharing"}}

ScreenHomeResponse screenHomeResponseFromJson(String str) => ScreenHomeResponse.fromJson(json.decode(str));
String screenHomeResponseToJson(ScreenHomeResponse data) => json.encode(data.toJson());
class ScreenHomeResponse {
  ScreenHomeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ScreenHomeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ScreenHomeResponse copyWith({  Head? head,
  Body? body,
}) => ScreenHomeResponse(  head: head ?? _head,
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

/// screenInfo : {"titleact":"กิจกรรมของฉัน","btnadd":"เพิ่ม","textname":"ชื่อ","textnickname":"ชื่อเล่น","textgen":"รุ่น","textstdcode":"รหัสนิสิต","textemail":"อิเมล","textrole":"ประเภทผู้ใช้งาน","textlang":"ภาษา","textthai":"Thai","btncpass":"เปลี่ยนรหัสผ่าน","btncpin":"เปลี่ยนรหัส PIN","btndelacc":"ลบบัญชี","textappver":"เวอร์ชันแอปพลิเคชัน","btnlogout":"ออกจากระบบ","modetheme":"โหมดธีม","lockscreencode":"รหัสล็อคหน้าจอ","dark":"มืด","setting":"ตั้งค่า","position":"ตำแหน่งทางวิชาการ","titleactteacher":"ยืนยันกิจกรรม","btnseeall":"ดูทั้งหมด"}
/// errorbutton : {"buttonok":"ตกลง","buttonconfirm":"ยืนยัน","buttonyes":"ใช่","buttonno":"ไม่ใช่","buttoncancel":"ยกเลิก"}
/// alertmessage : {"alertdeleteaccount":"คุณต้องการลบบัญชีใช่หรือไม่ หากคุณต้องการลบบัญชีผู้ใช้ กรุณากดปุ่ม 'ตกลง' หรือกดปุ่ม 'ยกเลิก' เพื่อกลับไปใช้งาน","alertdeleteaccountpassword":"กรุณากรอกรหัสผ่าน เพื่อยืนยันการลบบัญชี ","alertdeleteaccountpdpa":"การลบบัญชี จะเป็นไปตามเงื่อนไขและข้อตกลง","alertlogout":"คุณต้องการออกจากระบบใช่หรือไม่","alertpassword":"รหัสผ่าน","emailsupport":"scibuu.pr@gmail.com","phonesupport":"0-3810-3011","alertpdpa":"alertpdpaTH","alertupdateapp":"alertupdateappTH","titlenewappversion":"แอป EZ@U มีเวอร์ชันใหม่มาแล้วค่ะ","subtitlenewappversion":"กรุณาอัปเดตแอปเพื่อประสบการณ์ในการใช้งานที่ดีกว่าเดิม","titlenewpadaversion":"กรุณาอัปเดตแอปเพื่อสิทธิในการเข้าถึงข้อมูลที่ดีของท่านค่ะ","subtitlenewpadaversion":"แอป EZ@U มีเงื่อนไขข้อตกเวอร์ชันใหม่มาแล้วค่ะ"}
/// other : {"user_pdpa_version":"1","pdpa_version":"1.0.1","pdpa_link":"https://webzbinaryz.web.app/pdpa","app_version":"1.0.0","app_link":"https://drive.google.com/drive/folders/1rCn2H4H-9X43nW_pRTVDG-V9MEntuu0c?usp=sharing"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      ScreenInfo? screenInfo, 
      Errorbutton? errorbutton, 
      Alertmessage? alertmessage, 
      Other? other,}){
    _screenInfo = screenInfo;
    _errorbutton = errorbutton;
    _alertmessage = alertmessage;
    _other = other;
}

  Body.fromJson(dynamic json) {
    _screenInfo = json['screenInfo'] != null ? ScreenInfo.fromJson(json['screenInfo']) : null;
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _alertmessage = json['alertmessage'] != null ? Alertmessage.fromJson(json['alertmessage']) : null;
    _other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }
  ScreenInfo? _screenInfo;
  Errorbutton? _errorbutton;
  Alertmessage? _alertmessage;
  Other? _other;
Body copyWith({  ScreenInfo? screenInfo,
  Errorbutton? errorbutton,
  Alertmessage? alertmessage,
  Other? other,
}) => Body(  screenInfo: screenInfo ?? _screenInfo,
  errorbutton: errorbutton ?? _errorbutton,
  alertmessage: alertmessage ?? _alertmessage,
  other: other ?? _other,
);
  ScreenInfo? get screenInfo => _screenInfo;
  Errorbutton? get errorbutton => _errorbutton;
  Alertmessage? get alertmessage => _alertmessage;
  Other? get other => _other;

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
    if (_other != null) {
      map['other'] = _other?.toJson();
    }
    return map;
  }

}

/// user_pdpa_version : "1"
/// pdpa_version : "1.0.1"
/// pdpa_link : "https://webzbinaryz.web.app/pdpa"
/// app_version : "1.0.0"
/// app_link : "https://drive.google.com/drive/folders/1rCn2H4H-9X43nW_pRTVDG-V9MEntuu0c?usp=sharing"

Other otherFromJson(String str) => Other.fromJson(json.decode(str));
String otherToJson(Other data) => json.encode(data.toJson());
class Other {
  Other({
      String? userPdpaVersion, 
      String? pdpaVersion, 
      String? pdpaLink, 
      String? appVersion, 
      String? appLink,}){
    _userPdpaVersion = userPdpaVersion;
    _pdpaVersion = pdpaVersion;
    _pdpaLink = pdpaLink;
    _appVersion = appVersion;
    _appLink = appLink;
}

  Other.fromJson(dynamic json) {
    _userPdpaVersion = json['user_pdpa_version'];
    _pdpaVersion = json['pdpa_version'];
    _pdpaLink = json['pdpa_link'];
    _appVersion = json['app_version'];
    _appLink = json['app_link'];
  }
  String? _userPdpaVersion;
  String? _pdpaVersion;
  String? _pdpaLink;
  String? _appVersion;
  String? _appLink;
Other copyWith({  String? userPdpaVersion,
  String? pdpaVersion,
  String? pdpaLink,
  String? appVersion,
  String? appLink,
}) => Other(  userPdpaVersion: userPdpaVersion ?? _userPdpaVersion,
  pdpaVersion: pdpaVersion ?? _pdpaVersion,
  pdpaLink: pdpaLink ?? _pdpaLink,
  appVersion: appVersion ?? _appVersion,
  appLink: appLink ?? _appLink,
);
  String? get userPdpaVersion => _userPdpaVersion;
  String? get pdpaVersion => _pdpaVersion;
  String? get pdpaLink => _pdpaLink;
  String? get appVersion => _appVersion;
  String? get appLink => _appLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_pdpa_version'] = _userPdpaVersion;
    map['pdpa_version'] = _pdpaVersion;
    map['pdpa_link'] = _pdpaLink;
    map['app_version'] = _appVersion;
    map['app_link'] = _appLink;
    return map;
  }

}

/// alertdeleteaccount : "คุณต้องการลบบัญชีใช่หรือไม่ หากคุณต้องการลบบัญชีผู้ใช้ กรุณากดปุ่ม 'ตกลง' หรือกดปุ่ม 'ยกเลิก' เพื่อกลับไปใช้งาน"
/// alertdeleteaccountpassword : "กรุณากรอกรหัสผ่าน เพื่อยืนยันการลบบัญชี "
/// alertdeleteaccountpdpa : "การลบบัญชี จะเป็นไปตามเงื่อนไขและข้อตกลง"
/// alertlogout : "คุณต้องการออกจากระบบใช่หรือไม่"
/// alertpassword : "รหัสผ่าน"
/// emailsupport : "scibuu.pr@gmail.com"
/// phonesupport : "0-3810-3011"
/// alertpdpa : "alertpdpaTH"
/// alertupdateapp : "alertupdateappTH"
/// titlenewappversion : "แอป EZ@U มีเวอร์ชันใหม่มาแล้วค่ะ"
/// subtitlenewappversion : "กรุณาอัปเดตแอปเพื่อประสบการณ์ในการใช้งานที่ดีกว่าเดิม"
/// titlenewpadaversion : "กรุณาอัปเดตแอปเพื่อสิทธิในการเข้าถึงข้อมูลที่ดีของท่านค่ะ"
/// subtitlenewpadaversion : "แอป EZ@U มีเงื่อนไขข้อตกเวอร์ชันใหม่มาแล้วค่ะ"

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
      String? phonesupport, 
      String? alertpdpa, 
      String? alertupdateapp, 
      String? titlenewappversion, 
      String? subtitlenewappversion, 
      String? titlenewpadaversion, 
      String? subtitlenewpadaversion,}){
    _alertdeleteaccount = alertdeleteaccount;
    _alertdeleteaccountpassword = alertdeleteaccountpassword;
    _alertdeleteaccountpdpa = alertdeleteaccountpdpa;
    _alertlogout = alertlogout;
    _alertpassword = alertpassword;
    _emailsupport = emailsupport;
    _phonesupport = phonesupport;
    _alertpdpa = alertpdpa;
    _alertupdateapp = alertupdateapp;
    _titlenewappversion = titlenewappversion;
    _subtitlenewappversion = subtitlenewappversion;
    _titlenewpadaversion = titlenewpadaversion;
    _subtitlenewpadaversion = subtitlenewpadaversion;
}

  Alertmessage.fromJson(dynamic json) {
    _alertdeleteaccount = json['alertdeleteaccount'];
    _alertdeleteaccountpassword = json['alertdeleteaccountpassword'];
    _alertdeleteaccountpdpa = json['alertdeleteaccountpdpa'];
    _alertlogout = json['alertlogout'];
    _alertpassword = json['alertpassword'];
    _emailsupport = json['emailsupport'];
    _phonesupport = json['phonesupport'];
    _alertpdpa = json['alertpdpa'];
    _alertupdateapp = json['alertupdateapp'];
    _titlenewappversion = json['titlenewappversion'];
    _subtitlenewappversion = json['subtitlenewappversion'];
    _titlenewpadaversion = json['titlenewpadaversion'];
    _subtitlenewpadaversion = json['subtitlenewpadaversion'];
  }
  String? _alertdeleteaccount;
  String? _alertdeleteaccountpassword;
  String? _alertdeleteaccountpdpa;
  String? _alertlogout;
  String? _alertpassword;
  String? _emailsupport;
  String? _phonesupport;
  String? _alertpdpa;
  String? _alertupdateapp;
  String? _titlenewappversion;
  String? _subtitlenewappversion;
  String? _titlenewpadaversion;
  String? _subtitlenewpadaversion;
Alertmessage copyWith({  String? alertdeleteaccount,
  String? alertdeleteaccountpassword,
  String? alertdeleteaccountpdpa,
  String? alertlogout,
  String? alertpassword,
  String? emailsupport,
  String? phonesupport,
  String? alertpdpa,
  String? alertupdateapp,
  String? titlenewappversion,
  String? subtitlenewappversion,
  String? titlenewpadaversion,
  String? subtitlenewpadaversion,
}) => Alertmessage(  alertdeleteaccount: alertdeleteaccount ?? _alertdeleteaccount,
  alertdeleteaccountpassword: alertdeleteaccountpassword ?? _alertdeleteaccountpassword,
  alertdeleteaccountpdpa: alertdeleteaccountpdpa ?? _alertdeleteaccountpdpa,
  alertlogout: alertlogout ?? _alertlogout,
  alertpassword: alertpassword ?? _alertpassword,
  emailsupport: emailsupport ?? _emailsupport,
  phonesupport: phonesupport ?? _phonesupport,
  alertpdpa: alertpdpa ?? _alertpdpa,
  alertupdateapp: alertupdateapp ?? _alertupdateapp,
  titlenewappversion: titlenewappversion ?? _titlenewappversion,
  subtitlenewappversion: subtitlenewappversion ?? _subtitlenewappversion,
  titlenewpadaversion: titlenewpadaversion ?? _titlenewpadaversion,
  subtitlenewpadaversion: subtitlenewpadaversion ?? _subtitlenewpadaversion,
);
  String? get alertdeleteaccount => _alertdeleteaccount;
  String? get alertdeleteaccountpassword => _alertdeleteaccountpassword;
  String? get alertdeleteaccountpdpa => _alertdeleteaccountpdpa;
  String? get alertlogout => _alertlogout;
  String? get alertpassword => _alertpassword;
  String? get emailsupport => _emailsupport;
  String? get phonesupport => _phonesupport;
  String? get alertpdpa => _alertpdpa;
  String? get alertupdateapp => _alertupdateapp;
  String? get titlenewappversion => _titlenewappversion;
  String? get subtitlenewappversion => _subtitlenewappversion;
  String? get titlenewpadaversion => _titlenewpadaversion;
  String? get subtitlenewpadaversion => _subtitlenewpadaversion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alertdeleteaccount'] = _alertdeleteaccount;
    map['alertdeleteaccountpassword'] = _alertdeleteaccountpassword;
    map['alertdeleteaccountpdpa'] = _alertdeleteaccountpdpa;
    map['alertlogout'] = _alertlogout;
    map['alertpassword'] = _alertpassword;
    map['emailsupport'] = _emailsupport;
    map['phonesupport'] = _phonesupport;
    map['alertpdpa'] = _alertpdpa;
    map['alertupdateapp'] = _alertupdateapp;
    map['titlenewappversion'] = _titlenewappversion;
    map['subtitlenewappversion'] = _subtitlenewappversion;
    map['titlenewpadaversion'] = _titlenewpadaversion;
    map['subtitlenewpadaversion'] = _subtitlenewpadaversion;
    return map;
  }

}

/// buttonok : "ตกลง"
/// buttonconfirm : "ยืนยัน"
/// buttonyes : "ใช่"
/// buttonno : "ไม่ใช่"
/// buttoncancel : "ยกเลิก"

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

/// titleact : "กิจกรรมของฉัน"
/// btnadd : "เพิ่ม"
/// textname : "ชื่อ"
/// textnickname : "ชื่อเล่น"
/// textgen : "รุ่น"
/// textstdcode : "รหัสนิสิต"
/// textemail : "อิเมล"
/// textrole : "ประเภทผู้ใช้งาน"
/// textlang : "ภาษา"
/// textthai : "Thai"
/// btncpass : "เปลี่ยนรหัสผ่าน"
/// btncpin : "เปลี่ยนรหัส PIN"
/// btndelacc : "ลบบัญชี"
/// textappver : "เวอร์ชันแอปพลิเคชัน"
/// btnlogout : "ออกจากระบบ"
/// modetheme : "โหมดธีม"
/// lockscreencode : "รหัสล็อคหน้าจอ"
/// dark : "มืด"
/// setting : "ตั้งค่า"
/// position : "ตำแหน่งทางวิชาการ"
/// titleactteacher : "ยืนยันกิจกรรม"
/// btnseeall : "ดูทั้งหมด"

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
      String? setting, 
      String? position, 
      String? titleactteacher, 
      String? btnseeall,}){
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
    _position = position;
    _titleactteacher = titleactteacher;
    _btnseeall = btnseeall;
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
    _position = json['position'];
    _titleactteacher = json['titleactteacher'];
    _btnseeall = json['btnseeall'];
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
  String? _position;
  String? _titleactteacher;
  String? _btnseeall;
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
  String? position,
  String? titleactteacher,
  String? btnseeall,
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
  position: position ?? _position,
  titleactteacher: titleactteacher ?? _titleactteacher,
  btnseeall: btnseeall ?? _btnseeall,
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
  String? get position => _position;
  String? get titleactteacher => _titleactteacher;
  String? get btnseeall => _btnseeall;

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
    map['position'] = _position;
    map['titleactteacher'] = _titleactteacher;
    map['btnseeall'] = _btnseeall;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "activity"
/// timeexpire : false

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());
class Head {
  Head({
      int? status, 
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
  int? _status;
  String? _message;
  String? _modulename;
  bool? _timeexpire;
Head copyWith({  int? status,
  String? message,
  String? modulename,
  bool? timeexpire,
}) => Head(  status: status ?? _status,
  message: message ?? _message,
  modulename: modulename ?? _modulename,
  timeexpire: timeexpire ?? _timeexpire,
);
  int? get status => _status;
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