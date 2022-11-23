import 'dart:convert';
/// head : {"status":200,"message":"fail","modulename":"home","timeexpire":true}
/// body : {"expire":true,"expiremessage":"Token Offline Fail","code":"TOF401","timenow":"23/11/2565 2:51:59","timeexpir":"24/11/2022 2:51:46","typetime":"UtcNow"}

CheckTokenExpiredResponse checkTokenExpiredResponseFromJson(String str) => CheckTokenExpiredResponse.fromJson(json.decode(str));
String checkTokenExpiredResponseToJson(CheckTokenExpiredResponse data) => json.encode(data.toJson());
class CheckTokenExpiredResponse {
  checkTokenExpiredResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  CheckTokenExpiredResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  CheckTokenExpiredResponse copyWith({  Head? head,
  Body? body,
}) => checkTokenExpiredResponse(  head: head ?? _head,
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

/// expire : true
/// expiremessage : "Token Offline Fail"
/// code : "TOF401"
/// timenow : "23/11/2565 2:51:59"
/// timeexpir : "24/11/2022 2:51:46"
/// typetime : "UtcNow"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      bool? expire, 
      String? expiremessage, 
      String? code, 
      String? timenow, 
      String? timeexpir, 
      String? typetime,}){
    _expire = expire;
    _expiremessage = expiremessage;
    _code = code;
    _timenow = timenow;
    _timeexpir = timeexpir;
    _typetime = typetime;
}

  Body.fromJson(dynamic json) {
    _expire = json['expire'];
    _expiremessage = json['expiremessage'];
    _code = json['code'];
    _timenow = json['timenow'];
    _timeexpir = json['timeexpir'];
    _typetime = json['typetime'];
  }
  bool? _expire;
  String? _expiremessage;
  String? _code;
  String? _timenow;
  String? _timeexpir;
  String? _typetime;
Body copyWith({  bool? expire,
  String? expiremessage,
  String? code,
  String? timenow,
  String? timeexpir,
  String? typetime,
}) => Body(  expire: expire ?? _expire,
  expiremessage: expiremessage ?? _expiremessage,
  code: code ?? _code,
  timenow: timenow ?? _timenow,
  timeexpir: timeexpir ?? _timeexpir,
  typetime: typetime ?? _typetime,
);
  bool? get expire => _expire;
  String? get expiremessage => _expiremessage;
  String? get code => _code;
  String? get timenow => _timenow;
  String? get timeexpir => _timeexpir;
  String? get typetime => _typetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expire'] = _expire;
    map['expiremessage'] = _expiremessage;
    map['code'] = _code;
    map['timenow'] = _timenow;
    map['timeexpir'] = _timeexpir;
    map['typetime'] = _typetime;
    return map;
  }

}

/// status : 200
/// message : "fail"
/// modulename : "home"
/// timeexpire : true

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