import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home","timeexpire":false}
/// body : {"userrole":"TC"}

GetUserRoleResponse getUserRoleResponseFromJson(String str) => GetUserRoleResponse.fromJson(json.decode(str));
String getUserRoleResponseToJson(GetUserRoleResponse data) => json.encode(data.toJson());
class GetUserRoleResponse {
  GetUserRoleResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetUserRoleResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetUserRoleResponse copyWith({  Head? head,
  Body? body,
}) => GetUserRoleResponse(  head: head ?? _head,
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

/// userrole : "TC"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      String? userrole,}){
    _userrole = userrole;
}

  Body.fromJson(dynamic json) {
    _userrole = json['userrole'];
  }
  String? _userrole;
Body copyWith({  String? userrole,
}) => Body(  userrole: userrole ?? _userrole,
);
  String? get userrole => _userrole;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userrole'] = _userrole;
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