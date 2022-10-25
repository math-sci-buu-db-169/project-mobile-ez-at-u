import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"login"}

ChangeLanguageResponse changeLanguageResponseFromJson(String str) => ChangeLanguageResponse.fromJson(json.decode(str));
String changeLanguageResponseToJson(ChangeLanguageResponse data) => json.encode(data.toJson());

class ChangeLanguageResponse {
  ChangeLanguageResponse({
    Head? head,
  }) {
    _head = head;
  }

  ChangeLanguageResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
  }
  Head? _head;
  ChangeLanguageResponse copyWith({
    Head? head,
  }) =>
      ChangeLanguageResponse(
        head: head ?? _head,
      );
  Head? get head => _head;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_head != null) {
      map['head'] = _head?.toJson();
    }
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
