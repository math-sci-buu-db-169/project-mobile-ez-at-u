import 'dart:convert';

/// head : {"status":200,"message":"success","module":"home"}
/// body : {"noactivity":"ไม่พบกิจกรรมของคุณ","subactlineone":"กดปุ่ม'เพิ่ม'เพื่อบันทึกกิจกรรม","subactlinetwo":"หรือกรุณาตรวจสอบการสถานะกิจกรรมของคุณอีกครั้ง"}

AlertNoActivityResponse alertNoActivityResponseFromJson(String str) =>
    AlertNoActivityResponse.fromJson(json.decode(str));
String alertNoActivityResponseToJson(AlertNoActivityResponse data) => json.encode(data.toJson());

class AlertNoActivityResponse {
  AlertNoActivityResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  AlertNoActivityResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  AlertNoActivityResponse copyWith({  Head? head,
    Body? body,
  }) => AlertNoActivityResponse(  head: head ?? _head,
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

/// screeninfo : {"noactivity":"ไม่พบกิจกรรมของคุณ ***","subactlineone":"กดปุ่ม'เพิ่ม'เพื่อบันทึกกิจกรรม ***","subactlinetwo":"หรือกรุณาตรวจสอบสถานะกิจกรรมของคุณอีกครั้ง ***"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,}){
    _screeninfo = screeninfo;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
  }
  Screeninfo? _screeninfo;
  Body copyWith({  Screeninfo? screeninfo,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
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

/// noactivity : "ไม่พบกิจกรรมของคุณ ***"
/// subactlineone : "กดปุ่ม'เพิ่ม'เพื่อบันทึกกิจกรรม ***"
/// subactlinetwo : "หรือกรุณาตรวจสอบสถานะกิจกรรมของคุณอีกครั้ง ***"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? noactivity,
    String? subactlineone,
    String? subactlinetwo,}){
    _noactivity = noactivity;
    _subactlineone = subactlineone;
    _subactlinetwo = subactlinetwo;
  }

  Screeninfo.fromJson(dynamic json) {
    _noactivity = json['noactivity'];
    _subactlineone = json['subactlineone'];
    _subactlinetwo = json['subactlinetwo'];
  }
  String? _noactivity;
  String? _subactlineone;
  String? _subactlinetwo;
  Screeninfo copyWith({  String? noactivity,
    String? subactlineone,
    String? subactlinetwo,
  }) => Screeninfo(  noactivity: noactivity ?? _noactivity,
    subactlineone: subactlineone ?? _subactlineone,
    subactlinetwo: subactlinetwo ?? _subactlinetwo,
  );
  String? get noactivity => _noactivity;
  String? get subactlineone => _subactlineone;
  String? get subactlinetwo => _subactlinetwo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noactivity'] = _noactivity;
    map['subactlineone'] = _subactlineone;
    map['subactlinetwo'] = _subactlinetwo;
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
    int? status,
    String? message,
    String? modulename,}){
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
  Head copyWith({  int? status,
    String? message,
    String? modulename,
  }) => Head(  status: status ?? _status,
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