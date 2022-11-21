import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"login"}
/// body : {"token":"antmodbirdnok"}

SubmitLoginResponse submitLoginResponseFromJson(String str) => SubmitLoginResponse.fromJson(json.decode(str));
String submitLoginResponseToJson(SubmitLoginResponse data) => json.encode(data.toJson());

class SubmitLoginResponse {
  SubmitLoginResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  SubmitLoginResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  SubmitLoginResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      SubmitLoginResponse(
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

/// token :"5e1670bd"
/// language : "TH"
/// refreshtoken : "5e1670bd"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    String? token,
    String? language,
    String? refreshtoken,
    String? role,}){
    _token = token;
    _language = language;
    _refreshtoken = refreshtoken;
    _role = role;
  }

  Body.fromJson(dynamic json) {
    _token = json['token'];
    _language = json['language'];
    _refreshtoken = json['refreshtoken'];
    _role = json['role'];
  }
  String? _token;
  String? _language;
  String? _refreshtoken;
  String? _role;
  Body copyWith({  String? token,
    String? language,
    String? refreshtoken,
    String? role,
  }) => Body(  token: token ?? _token,
    language: language ?? _language,
    refreshtoken: refreshtoken ?? _refreshtoken,
    role: role ?? _role,
  );
  String? get token => _token;
  String? get language => _language;
  String? get refreshtoken => _refreshtoken;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['language'] = _language;
    map['refreshtoken'] = _refreshtoken;
    map['role'] = _role;
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