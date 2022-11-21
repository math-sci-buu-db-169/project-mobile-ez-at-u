import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"home"}
/// body : {}

ChangePasswordResponse changePasswordResponseFromJson(String str) => ChangePasswordResponse.fromJson(json.decode(str));
String changePasswordResponseToJson(ChangePasswordResponse data) => json.encode(data.toJson());

class ChangePasswordResponse {
  ChangePasswordResponse({
    Head? head,
    dynamic body,
  }) {
    _head = head;
    _body = body;
  }

  ChangePasswordResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  dynamic _body;
  ChangePasswordResponse copyWith({
    Head? head,
    dynamic body,
  }) =>
      ChangePasswordResponse(
        head: head ?? _head,
        body: body ?? _body,
      );
  Head? get head => _head;
  dynamic get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_head != null) {
      map['head'] = _head?.toJson();
    }
    map['body'] = _body;
    return map;
  }
}

/// modulename : "home"
/// token : "eyJhb"
/// refreshtoken : "b"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    String? token,
    String? refreshtoken,
  }) {
    _token = token;
    _refreshtoken = refreshtoken;
  }

  Body.fromJson(dynamic json) {
    _token = json['token'];
    _refreshtoken = json['refreshtoken'];
  }
  String? _token;
  String? _refreshtoken;
  Body copyWith({
    String? token,
    String? refreshtoken,
  }) =>
      Body(
        token: token ?? _token,
        refreshtoken: refreshtoken ?? _refreshtoken,
      );
  String? get token => _token;
  String? get refreshtoken => _refreshtoken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['refreshtoken'] = _refreshtoken;
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
