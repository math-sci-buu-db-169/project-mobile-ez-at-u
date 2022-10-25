import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"login"}
/// body : {"screeninfo":{"textforgothead":"","edtIDforgot":"รหัสนิสิต / รหัสอาจารย์","edtemailforgot":"อีเมล","btnforgotnext":"ต่อไป","textheadsetnewpass":"","textotpwillsent":"รหัสยืนยันตัวตนจะถูกส่งไปยัง","edtpass":"รหัสผ่าน","edtcpass":"ยืนยันรหัสผ่าน","otp":"รหัส OTP","texpleaseconfirm":"กรุณายืนยัน","btnsentotpagain":"ส่งรหัสยืนยันอีกครั้ง","btnconfirm":"ยืนยัน"}}

ScreenForgotPasswordResponse screenforgotpasswordresponseFromJson(String str) =>
    ScreenForgotPasswordResponse.fromJson(json.decode(str));
String screenForgotPasswordResponseToJson(ScreenForgotPasswordResponse data) => json.encode(data.toJson());

class ScreenForgotPasswordResponse {
  ScreenForgotPasswordResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenForgotPasswordResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenForgotPasswordResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenForgotPasswordResponse(
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

/// screeninfo : {"titleforgot":"ลืมรหัสผ่าน","edtIDforgot":"รหัสนิสิต / รหัสอาจารย์","edtemailforgot":"อีเมล","btnforgotnext":"ต่อไป","titlesetnewpass":"ตั้งค่ารหัสผ่านใหม่","textotpwillsent":"รหัสยืนยันตัวตนจะถูกส่งไปยัง","edtpass":"รหัสผ่าน","edtcpass":"ยืนยันรหัสผ่าน","otp":"รหัส OTP","texpleaseconfirm":"กรุณายืนยัน","btnsentotpagain":"ส่งรหัสยืนยันอีกครั้ง","btnconfirm":"ยืนยัน"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
  }) {
    _screeninfo = screeninfo;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
  }
  Screeninfo? _screeninfo;
  Body copyWith({
    Screeninfo? screeninfo,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
      );
  Screeninfo? get screeninfo => _screeninfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    return map;
  }
}

/// titleforgot : "ลืมรหัสผ่าน"
/// edtIDforgot : "รหัสนิสิต / รหัสอาจารย์"
/// edtemailforgot : "อีเมล"
/// btnforgotnext : "ต่อไป"
/// titlesetnewpass : "ตั้งค่ารหัสผ่านใหม่"
/// textotpwillsent : "รหัสยืนยันตัวตนจะถูกส่งไปยัง"
/// edtpass : "รหัสผ่านใหม่"
/// edtcpass : "ยืนยันรหัสผ่าน"
/// otp : "รหัส OTP"
/// texpleaseconfirm : "กรุณายืนยัน"
/// btnsentotpagain : "ส่งรหัสยืนยันอีกครั้ง"
/// btnconfirm : "ยืนยัน"
/// textref : "รหัสอ้างอิง"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titleforgot,
    String? edtIDforgot,
    String? edtemailforgot,
    String? btnforgotnext,
    String? titlesetnewpass,
    String? textotpwillsent,
    String? edtpass,
    String? edtcpass,
    String? otp,
    String? texpleaseconfirm,
    String? btnsentotpagain,
    String? btnconfirm,
    String? textref,
  }) {
    _titleforgot = titleforgot;
    _edtIDforgot = edtIDforgot;
    _edtemailforgot = edtemailforgot;
    _btnforgotnext = btnforgotnext;
    _titlesetnewpass = titlesetnewpass;
    _textotpwillsent = textotpwillsent;
    _edtpass = edtpass;
    _edtcpass = edtcpass;
    _otp = otp;
    _texpleaseconfirm = texpleaseconfirm;
    _btnsentotpagain = btnsentotpagain;
    _btnconfirm = btnconfirm;
    _textref = textref;
  }

  Screeninfo.fromJson(dynamic json) {
    _titleforgot = json['titleforgot'];
    _edtIDforgot = json['edtIDforgot'];
    _edtemailforgot = json['edtemailforgot'];
    _btnforgotnext = json['btnforgotnext'];
    _titlesetnewpass = json['titlesetnewpass'];
    _textotpwillsent = json['textotpwillsent'];
    _edtpass = json['edtpass'];
    _edtcpass = json['edtcpass'];
    _otp = json['otp'];
    _texpleaseconfirm = json['texpleaseconfirm'];
    _btnsentotpagain = json['btnsentotpagain'];
    _btnconfirm = json['btnconfirm'];
    _textref = json['textref'];
  }
  String? _titleforgot;
  String? _edtIDforgot;
  String? _edtemailforgot;
  String? _btnforgotnext;
  String? _titlesetnewpass;
  String? _textotpwillsent;
  String? _edtpass;
  String? _edtcpass;
  String? _otp;
  String? _texpleaseconfirm;
  String? _btnsentotpagain;
  String? _btnconfirm;
  String? _textref;
  Screeninfo copyWith({
    String? titleforgot,
    String? edtIDforgot,
    String? edtemailforgot,
    String? btnforgotnext,
    String? titlesetnewpass,
    String? textotpwillsent,
    String? edtpass,
    String? edtcpass,
    String? otp,
    String? texpleaseconfirm,
    String? btnsentotpagain,
    String? btnconfirm,
    String? textref,
  }) =>
      Screeninfo(
        titleforgot: titleforgot ?? _titleforgot,
        edtIDforgot: edtIDforgot ?? _edtIDforgot,
        edtemailforgot: edtemailforgot ?? _edtemailforgot,
        btnforgotnext: btnforgotnext ?? _btnforgotnext,
        titlesetnewpass: titlesetnewpass ?? _titlesetnewpass,
        textotpwillsent: textotpwillsent ?? _textotpwillsent,
        edtpass: edtpass ?? _edtpass,
        edtcpass: edtcpass ?? _edtcpass,
        otp: otp ?? _otp,
        texpleaseconfirm: texpleaseconfirm ?? _texpleaseconfirm,
        btnsentotpagain: btnsentotpagain ?? _btnsentotpagain,
        btnconfirm: btnconfirm ?? _btnconfirm,
        textref: textref ?? _textref,
      );
  String? get titleforgot => _titleforgot;
  String? get edtIDforgot => _edtIDforgot;
  String? get edtemailforgot => _edtemailforgot;
  String? get btnforgotnext => _btnforgotnext;
  String? get titlesetnewpass => _titlesetnewpass;
  String? get textotpwillsent => _textotpwillsent;
  String? get edtpass => _edtpass;
  String? get edtcpass => _edtcpass;
  String? get otp => _otp;
  String? get texpleaseconfirm => _texpleaseconfirm;
  String? get btnsentotpagain => _btnsentotpagain;
  String? get btnconfirm => _btnconfirm;
  String? get textref => _textref;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleforgot'] = _titleforgot;
    map['edtIDforgot'] = _edtIDforgot;
    map['edtemailforgot'] = _edtemailforgot;
    map['btnforgotnext'] = _btnforgotnext;
    map['titlesetnewpass'] = _titlesetnewpass;
    map['textotpwillsent'] = _textotpwillsent;
    map['edtpass'] = _edtpass;
    map['edtcpass'] = _edtcpass;
    map['otp'] = _otp;
    map['texpleaseconfirm'] = _texpleaseconfirm;
    map['btnsentotpagain'] = _btnsentotpagain;
    map['btnconfirm'] = _btnconfirm;
    map['textref'] = _textref;
    return map;
  }
}

/// status : 200
/// message : "success"
/// modulename : "login"

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());

class Head {
  Head({
    int? status,
    String? message,
    String? modulename,
  }) {
    _status = status;
    _message = message;
    _modulename = modulename;
  }

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _modulename = json['modulename'];
  }
  int? _status;
  String? _message;
  String? _modulename;
  Head copyWith({
    int? status,
    String? message,
    String? modulename,
  }) =>
      Head(
        status: status ?? _status,
        message: message ?? _message,
        modulename: modulename ?? _modulename,
      );
  int? get status => _status;
  String? get message => _message;
  String? get modulename => _modulename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['modulename'] = _modulename;
    return map;
  }
}
