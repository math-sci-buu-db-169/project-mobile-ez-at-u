import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"upimg"}
/// body : {"tccode":"EN","base64Image":"a90d2ce2-a4c4-4279-80ed-fe44a9ba0a6e"}

UpImgTeacherResponse upImgTeacherResponseFromJson(String str) => UpImgTeacherResponse.fromJson(json.decode(str));
String upImgTeacherResponseToJson(UpImgTeacherResponse data) => json.encode(data.toJson());

class UpImgTeacherResponse {
  UpImgTeacherResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  UpImgTeacherResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  UpImgTeacherResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      UpImgTeacherResponse(
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

/// tccode : "EN"
/// base64Image : "a90d2ce2-a4c4-4279-80ed-fe44a9ba0a6e"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    String? tccode,
    String? base64Image,
  }) {
    _tccode = tccode;
    _base64Image = base64Image;
  }

  Body.fromJson(dynamic json) {
    _tccode = json['tccode'];
    _base64Image = json['base64Image'];
  }
  String? _tccode;
  String? _base64Image;
  Body copyWith({
    String? tccode,
    String? base64Image,
  }) =>
      Body(
        tccode: tccode ?? _tccode,
        base64Image: base64Image ?? _base64Image,
      );
  String? get tccode => _tccode;
  String? get base64Image => _base64Image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tccode'] = _tccode;
    map['base64Image'] = _base64Image;
    return map;
  }
}

/// status : 200
/// message : "success"
/// modulename : "upimg"

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
