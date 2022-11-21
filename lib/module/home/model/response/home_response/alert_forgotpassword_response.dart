import 'dart:convert';

/// head : {"status":200,"message":"success","module":"home"}
/// body : {"alert":"คุณต้องการออกจากระบบใช่หรือไม่","cancel":"ยกเลิก","ok":"ตกลง","confirm":"ยืนยัน","no":"ไม่ใช่","yes":"ใช่","apccrpt":"ยินยอม","Decline":"ปฏิเสธ","close":"ปิด"}

AlertForgotPasswordrResponse alertForgotPasswordrResponseFromJson(String str) =>
    AlertForgotPasswordrResponse.fromJson(json.decode(str));
String alertForgotPasswordrResponseToJson(AlertForgotPasswordrResponse data) => json.encode(data.toJson());

class AlertForgotPasswordrResponse {
  AlertForgotPasswordrResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  AlertForgotPasswordrResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  AlertForgotPasswordrResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      AlertForgotPasswordrResponse(
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

/// alert : "คุณต้องการออกจากระบบใช่หรือไม่"
/// cancel : "ยกเลิก"
/// ok : "ตกลง"
/// confirm : "ยืนยัน"
/// no : "ไม่ใช่"
/// yes : "ใช่"
/// apccrpt : "ยินยอม"
/// Decline : "ปฏิเสธ"
/// close : "ปิด"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    String? alert,
    String? cancel,
    String? ok,
    String? confirm,
    String? no,
    String? yes,
    String? apccrpt,
    String? decline,
    String? close,
  }) {
    _alert = alert;
    _cancel = cancel;
    _ok = ok;
    _confirm = confirm;
    _no = no;
    _yes = yes;
    _apccrpt = apccrpt;
    _decline = decline;
    _close = close;
  }

  Body.fromJson(dynamic json) {
    _alert = json['alert'];
    _cancel = json['cancel'];
    _ok = json['ok'];
    _confirm = json['confirm'];
    _no = json['no'];
    _yes = json['yes'];
    _apccrpt = json['apccrpt'];
    _decline = json['Decline'];
    _close = json['close'];
  }
  String? _alert;
  String? _cancel;
  String? _ok;
  String? _confirm;
  String? _no;
  String? _yes;
  String? _apccrpt;
  String? _decline;
  String? _close;
  Body copyWith({
    String? alert,
    String? cancel,
    String? ok,
    String? confirm,
    String? no,
    String? yes,
    String? apccrpt,
    String? decline,
    String? close,
  }) =>
      Body(
        alert: alert ?? _alert,
        cancel: cancel ?? _cancel,
        ok: ok ?? _ok,
        confirm: confirm ?? _confirm,
        no: no ?? _no,
        yes: yes ?? _yes,
        apccrpt: apccrpt ?? _apccrpt,
        decline: decline ?? _decline,
        close: close ?? _close,
      );
  String? get alert => _alert;
  String? get cancel => _cancel;
  String? get ok => _ok;
  String? get confirm => _confirm;
  String? get no => _no;
  String? get yes => _yes;
  String? get apccrpt => _apccrpt;
  String? get decline => _decline;
  String? get close => _close;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alert'] = _alert;
    map['cancel'] = _cancel;
    map['ok'] = _ok;
    map['confirm'] = _confirm;
    map['no'] = _no;
    map['yes'] = _yes;
    map['apccrpt'] = _apccrpt;
    map['Decline'] = _decline;
    map['close'] = _close;
    return map;
  }
}

/// status : 200
/// message : "success"
/// module : "home"
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