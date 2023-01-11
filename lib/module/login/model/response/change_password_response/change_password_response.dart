import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home","timeexpire":false}
/// body : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiVE9OVEMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjA0Mzc3Nzc4LTA0ODgtNDgxZC1iYWQwLTJiZTlkNzc4ZjE1NiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjExLzAxLzIwMjMtMDc6Mjg6MzkgQU0iLCJleHAiOjE2NzM0MjIxMTksImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzkwIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzOTAifQ.mIrNHl-hIjJpNibncqLq0s1ZlYgCGVAFFJqx6OT_EJ4","refreshtoken":"5ff968f5-4270-4119-81bd-7a77382cb138","role":"TC","language":"EN"}

ChangePasswordResponse changePasswordResponseFromJson(String str) => ChangePasswordResponse.fromJson(json.decode(str));
String changePasswordResponseToJson(ChangePasswordResponse data) => json.encode(data.toJson());
class ChangePasswordResponse {
  ChangePasswordResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ChangePasswordResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ChangePasswordResponse copyWith({  Head? head,
  Body? body,
}) => ChangePasswordResponse(  head: head ?? _head,
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

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiVE9OVEMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjA0Mzc3Nzc4LTA0ODgtNDgxZC1iYWQwLTJiZTlkNzc4ZjE1NiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjExLzAxLzIwMjMtMDc6Mjg6MzkgQU0iLCJleHAiOjE2NzM0MjIxMTksImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzkwIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzOTAifQ.mIrNHl-hIjJpNibncqLq0s1ZlYgCGVAFFJqx6OT_EJ4"
/// refreshtoken : "5ff968f5-4270-4119-81bd-7a77382cb138"
/// role : "TC"
/// language : "EN"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      String? token, 
      String? refreshtoken, 
      String? role, 
      String? language,}){
    _token = token;
    _refreshtoken = refreshtoken;
    _role = role;
    _language = language;
}

  Body.fromJson(dynamic json) {
    _token = json['token'];
    _refreshtoken = json['refreshtoken'];
    _role = json['role'];
    _language = json['language'];
  }
  String? _token;
  String? _refreshtoken;
  String? _role;
  String? _language;
Body copyWith({  String? token,
  String? refreshtoken,
  String? role,
  String? language,
}) => Body(  token: token ?? _token,
  refreshtoken: refreshtoken ?? _refreshtoken,
  role: role ?? _role,
  language: language ?? _language,
);
  String? get token => _token;
  String? get refreshtoken => _refreshtoken;
  String? get role => _role;
  String? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['refreshtoken'] = _refreshtoken;
    map['role'] = _role;
    map['language'] = _language;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "home"
/// timeexpire : false

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