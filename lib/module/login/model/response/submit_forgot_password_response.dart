import 'dart:convert';

SubmitForgotPasswordResponse submitForgotPasswordResponseFromJson(String str) =>
    SubmitForgotPasswordResponse.fromJson(json.decode(str));
String submitForgotPasswordResponseToJson(SubmitForgotPasswordResponse data) => json.encode(data.toJson());

class SubmitForgotPasswordResponse {
  SubmitForgotPasswordResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  SubmitForgotPasswordResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  SubmitForgotPasswordResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      SubmitForgotPasswordResponse(
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

/// refvalue : "nlty4uUT2WvJHT0g"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    String? refvalue,
  }) {
    _refvalue = refvalue;
  }

  Body.fromJson(dynamic json) {
    _refvalue = json['refvalue'];
  }
  String? _refvalue;
  Body copyWith({
    String? refvalue,
  }) =>
      Body(
        refvalue: refvalue ?? _refvalue,
      );
  String? get refvalue => _refvalue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refvalue'] = _refvalue;
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
