import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home","timeexpire":false}
/// body : {"screeninfo":{"noactivity":"There are no activities that need to be approved","subactlineone":"Please wait for students to choose their activities","subactlinetwo":"or check the items that need to be approved again later"}}

NoActivityTeacherResponse noActivityTeacherResponseFromJson(String str) => NoActivityTeacherResponse.fromJson(json.decode(str));
String noActivityTeacherResponseToJson(NoActivityTeacherResponse data) => json.encode(data.toJson());
class NoActivityTeacherResponse {
  NoActivityTeacherResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  NoActivityTeacherResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
NoActivityTeacherResponse copyWith({  Head? head,
  Body? body,
}) => NoActivityTeacherResponse(  head: head ?? _head,
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

/// screeninfo : {"noactivity":"There are no activities that need to be approved","subactlineone":"Please wait for students to choose their activities","subactlinetwo":"or check the items that need to be approved again later"}

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

/// noactivity : "There are no activities that need to be approved"
/// subactlineone : "Please wait for students to choose their activities"
/// subactlinetwo : "or check the items that need to be approved again later"

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