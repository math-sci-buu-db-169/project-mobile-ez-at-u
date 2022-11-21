import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"Home"}
/// body : {"screeninfo":{"btnChangeLang":"TH/EN","imgLogo":"https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Buu-logo11.png/130px-Buu-logo11.png","edtID":"รหัสนิสิต/รหัสอาจารย์","edtPass":"รหัสผ่าน","btnLogin":"เข้าสู่ระบบ","btnForgotPass":"ลืมรหัสผ่าน?","textReg":"ไม่มีบัญชีใช่หรือไม่?","btnReg":"ลงทะเบียน"}}

ScreenLoginResponse screenLoginResponseFromJson(String str) => ScreenLoginResponse.fromJson(json.decode(str));
String screenLoginResponseToJson(ScreenLoginResponse data) => json.encode(data.toJson());

class ScreenLoginResponse {
  ScreenLoginResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenLoginResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenLoginResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenLoginResponse(
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

/// screeninfo : {"btnChangeLang":"TH / EN","edtID":"รหัสนิสิต / รหัสอาจารย์","edtPass":"รหัสผ่าน","btnLogin":"เข้าสู่ระบบ","btnForgotPass":"ลืมรหัสผ่าน ?","textReg":"ไม่มีบัญชีใช่หรือไม่  ?","btnReg":"ลงทะเบียน","imgLogo":"iVBO","errorbutton":{"buttonok":"ตกลง","buttonconfirm":"ยืนยัน","buttonyes":"ใช่","buttonno":"ไม่ใช่","buttoncancel":"ยกเลิก"}}

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

/// btnChangeLang : "TH / EN"
/// edtID : "รหัสนิสิต / รหัสอาจารย์"
/// edtPass : "รหัสผ่าน"
/// btnLogin : "เข้าสู่ระบบ"
/// btnForgotPass : "ลืมรหัสผ่าน ?"
/// textReg : "ไม่มีบัญชีใช่หรือไม่  ?"
/// btnReg : "ลงทะเบียน"
/// imgLogo : "iVBO"
/// errorbutton : {"buttonok":"ตกลง","buttonconfirm":"ยืนยัน","buttonyes":"ใช่","buttonno":"ไม่ใช่","buttoncancel":"ยกเลิก"}

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? btnChangeLang,
    String? edtID,
    String? edtPass,
    String? btnLogin,
    String? btnForgotPass,
    String? textReg,
    String? btnReg,
    String? imgLogo,
    String? imgSubLogo,
    Errorbutton? errorbutton,
  }) {
    _btnChangeLang = btnChangeLang;
    _edtID = edtID;
    _edtPass = edtPass;
    _btnLogin = btnLogin;
    _btnForgotPass = btnForgotPass;
    _textReg = textReg;
    _btnReg = btnReg;
    _imgLogo = imgLogo;
    _imgSubLogo = imgSubLogo;
    _errorbutton = errorbutton;
  }

  Screeninfo.fromJson(dynamic json) {
    _btnChangeLang = json['btnChangeLang'];
    _edtID = json['edtID'];
    _edtPass = json['edtPass'];
    _btnLogin = json['btnLogin'];
    _btnForgotPass = json['btnForgotPass'];
    _textReg = json['textReg'];
    _btnReg = json['btnReg'];
    _imgLogo = json['imgLogo'];
    _imgSubLogo = json['imgSubLogo'];
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
  }
  String? _btnChangeLang;
  String? _edtID;
  String? _edtPass;
  String? _btnLogin;
  String? _btnForgotPass;
  String? _textReg;
  String? _btnReg;
  String? _imgLogo;
  String? _imgSubLogo;
  Errorbutton? _errorbutton;
  Screeninfo copyWith({
    String? btnChangeLang,
    String? edtID,
    String? edtPass,
    String? btnLogin,
    String? btnForgotPass,
    String? textReg,
    String? btnReg,
    String? imgLogo,
    String? imgSubLogo,
    Errorbutton? errorbutton,
  }) =>
      Screeninfo(
        btnChangeLang: btnChangeLang ?? _btnChangeLang,
        edtID: edtID ?? _edtID,
        edtPass: edtPass ?? _edtPass,
        btnLogin: btnLogin ?? _btnLogin,
        btnForgotPass: btnForgotPass ?? _btnForgotPass,
        textReg: textReg ?? _textReg,
        btnReg: btnReg ?? _btnReg,
        imgLogo: imgLogo ?? _imgLogo,
        imgSubLogo: imgLogo ?? _imgSubLogo,
        errorbutton: errorbutton ?? _errorbutton,
      );
  String? get btnChangeLang => _btnChangeLang;
  String? get edtID => _edtID;
  String? get edtPass => _edtPass;
  String? get btnLogin => _btnLogin;
  String? get btnForgotPass => _btnForgotPass;
  String? get textReg => _textReg;
  String? get btnReg => _btnReg;
  String? get imgLogo => _imgLogo;
  String? get imgSubLogo => _imgSubLogo;
  Errorbutton? get errorbutton => _errorbutton;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['btnChangeLang'] = _btnChangeLang;
    map['edtID'] = _edtID;
    map['edtPass'] = _edtPass;
    map['btnLogin'] = _btnLogin;
    map['btnForgotPass'] = _btnForgotPass;
    map['textReg'] = _textReg;
    map['btnReg'] = _btnReg;
    map['imgLogo'] = _imgLogo;
    map['imgSubLogo'] = _imgSubLogo;
    if (_errorbutton != null) {
      map['errorbutton'] = _errorbutton?.toJson();
    }
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

/// status : 200
/// message : "success"
/// modulename : "HomeActivity"
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