import 'dart:convert';

/// head : {"status":"200","message":"success","module":"login"}
/// body : {"screeninfo":{"textheadsetnewpass":"Change new password","edtcurrentpass":"Current password","edtnewpass":"New password","edtcpass":"Confirm password","btnforgotpass":"Forgot password ?","texpleaseconfirm":"Please confirm","btnconfirm":"Confirm "}}

ScreenChangePasswordResponse screenChangePasswordResponseFromJson(String str) =>
    ScreenChangePasswordResponse.fromJson(json.decode(str));
String screenChangePasswordResponseToJson(ScreenChangePasswordResponse data) => json.encode(data.toJson());

class ScreenChangePasswordResponse {
  ScreenChangePasswordResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenChangePasswordResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenChangePasswordResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenChangePasswordResponse(
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

// screeninfo : {"titlechangenewpass":"เปลี่ยนรหัสผ่าน","edtcurrentpass":"รหัสผ่านปัจจุบัน","edtnewpass":"รหัสผ่านใหม่","edtcpass":"ยืนยันรหัสผ่าน","btnforgotpass":"ลืมรหัสผ่าน?","btnconfirm":"ยืนยัน"}
/// errorbutton : {"buttonok":"ตกลง","buttonconfirm":"ยืนยัน","buttonyes":"ใช่","buttonno":"ไม่ใช่","buttoncancel":"ยกเลิก"}
/// errorscreeninfo : {"errorsubmit":"คุณต้องการออกจากระบบเพื่อกู้คืนรหัสผ่านใช่หรือไม่"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    Errorbutton? errorbutton,
    Errorscreeninfo? errorscreeninfo,
  }) {
    _screeninfo = screeninfo;
    _errorbutton = errorbutton;
    _errorscreeninfo = errorscreeninfo;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _errorscreeninfo = json['errorscreeninfo'] != null ? Errorscreeninfo.fromJson(json['errorscreeninfo']) : null;
  }
  Screeninfo? _screeninfo;
  Errorbutton? _errorbutton;
  Errorscreeninfo? _errorscreeninfo;
  Body copyWith({
    Screeninfo? screeninfo,
    Errorbutton? errorbutton,
    Errorscreeninfo? errorscreeninfo,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        errorbutton: errorbutton ?? _errorbutton,
        errorscreeninfo: errorscreeninfo ?? _errorscreeninfo,
      );
  Screeninfo? get screeninfo => _screeninfo;
  Errorbutton? get errorbutton => _errorbutton;
  Errorscreeninfo? get errorscreeninfo => _errorscreeninfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_errorbutton != null) {
      map['errorbutton'] = _errorbutton?.toJson();
    }
    if (_errorscreeninfo != null) {
      map['errorscreeninfo'] = _errorscreeninfo?.toJson();
    }
    return map;
  }
}

/// errorsubmit : "คุณต้องการออกจากระบบเพื่อกู้คืนรหัสผ่านใช่หรือไม่"

Errorscreeninfo errorscreeninfoFromJson(String str) => Errorscreeninfo.fromJson(json.decode(str));
String errorscreeninfoToJson(Errorscreeninfo data) => json.encode(data.toJson());

class Errorscreeninfo {
  Errorscreeninfo({
    String? errorsubmit,
  }) {
    _errorsubmit = errorsubmit;
  }

  Errorscreeninfo.fromJson(dynamic json) {
    _errorsubmit = json['errorsubmit'];
  }
  String? _errorsubmit;
  Errorscreeninfo copyWith({
    String? errorsubmit,
  }) =>
      Errorscreeninfo(
        errorsubmit: errorsubmit ?? _errorsubmit,
      );
  String? get errorsubmit => _errorsubmit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorsubmit'] = _errorsubmit;
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
    String? buttoncancel,
  }) {
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
  Errorbutton copyWith({
    String? buttonok,
    String? buttonconfirm,
    String? buttonyes,
    String? buttonno,
    String? buttoncancel,
  }) =>
      Errorbutton(
        buttonok: buttonok ?? _buttonok,
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

/// titlechangenewpass : "เปลี่ยนรหัสผ่าน"
/// edtcurrentpass : "รหัสผ่านปัจจุบัน"
/// edtnewpass : "รหัสผ่านใหม่"
/// edtcpass : "ยืนยันรหัสผ่าน"
/// btnforgotpass : "ลืมรหัสผ่าน?"
/// btnconfirm : "ยืนยัน"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titlechangenewpass,
    String? edtcurrentpass,
    String? edtnewpass,
    String? edtcpass,
    String? btnforgotpass,
    String? btnconfirm,
  }) {
    _titlechangenewpass = titlechangenewpass;
    _edtcurrentpass = edtcurrentpass;
    _edtnewpass = edtnewpass;
    _edtcpass = edtcpass;
    _btnforgotpass = btnforgotpass;
    _btnconfirm = btnconfirm;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlechangenewpass = json['titlechangenewpass'];
    _edtcurrentpass = json['edtcurrentpass'];
    _edtnewpass = json['edtnewpass'];
    _edtcpass = json['edtcpass'];
    _btnforgotpass = json['btnforgotpass'];
    _btnconfirm = json['btnconfirm'];
  }
  String? _titlechangenewpass;
  String? _edtcurrentpass;
  String? _edtnewpass;
  String? _edtcpass;
  String? _btnforgotpass;
  String? _btnconfirm;
  Screeninfo copyWith({
    String? titlechangenewpass,
    String? edtcurrentpass,
    String? edtnewpass,
    String? edtcpass,
    String? btnforgotpass,
    String? btnconfirm,
  }) =>
      Screeninfo(
        titlechangenewpass: titlechangenewpass ?? _titlechangenewpass,
        edtcurrentpass: edtcurrentpass ?? _edtcurrentpass,
        edtnewpass: edtnewpass ?? _edtnewpass,
        edtcpass: edtcpass ?? _edtcpass,
        btnforgotpass: btnforgotpass ?? _btnforgotpass,
        btnconfirm: btnconfirm ?? _btnconfirm,
      );
  String? get titlechangenewpass => _titlechangenewpass;
  String? get edtcurrentpass => _edtcurrentpass;
  String? get edtnewpass => _edtnewpass;
  String? get edtcpass => _edtcpass;
  String? get btnforgotpass => _btnforgotpass;
  String? get btnconfirm => _btnconfirm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlechangenewpass'] = _titlechangenewpass;
    map['edtcurrentpass'] = _edtcurrentpass;
    map['edtnewpass'] = _edtnewpass;
    map['edtcpass'] = _edtcpass;
    map['btnforgotpass'] = _btnforgotpass;
    map['btnconfirm'] = _btnconfirm;
    return map;
  }
}

/// status : 200
/// message : "success"
/// modulename : "home"
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