import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"login","timeexpire":false}
/// body : {"id":1,"sessions":"X8L5JB0OSHNCST7EJNANVUMIK3CSJ2MI"}

LogSessionsResponse logSessionsResponseFromJson(String str) => LogSessionsResponse.fromJson(json.decode(str));
String logSessionsResponseToJson(LogSessionsResponse data) => json.encode(data.toJson());
class LogSessionsResponse {
  LogSessionsResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  LogSessionsResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
LogSessionsResponse copyWith({  Head? head,
  Body? body,
}) => LogSessionsResponse(  head: head ?? _head,
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

/// id : 1
/// sessions : "X8L5JB0OSHNCST7EJNANVUMIK3CSJ2MI"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      num? id, 
      String? sessions,}){
    _id = id;
    _sessions = sessions;
}

  Body.fromJson(dynamic json) {
    _id = json['id'];
    _sessions = json['sessions'];
  }
  num? _id;
  String? _sessions;
Body copyWith({  num? id,
  String? sessions,
}) => Body(  id: id ?? _id,
  sessions: sessions ?? _sessions,
);
  num? get id => _id;
  String? get sessions => _sessions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sessions'] = _sessions;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "login"
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