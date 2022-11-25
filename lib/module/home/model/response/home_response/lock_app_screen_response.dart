import 'dart:convert';
/// head : {"status":200,"message":"Success Token Online STON","modulename":"home","timeexpire":false}
/// body : {"lockapp":"ล็อคหน้าจอแอปพลิเคชัน","lockappdetail":"หากคุณลืมแอปพลิเคชัน PIN Lock คุณจะต้องลบและติดตั้งแอปพลิเคชัน EZ@U ใหม่อีกครั้ง คุณจะต้องออกจากระบบ คุณจะต้องลบข้อมูลแคชของ Application EZ@U ออกจากโทรศัพท์มือถือของคุณ","bioscan":"สแกนลายนิ้วมือและสแกนใบหน้า","changepasscode":"เปลี่ยนรหัสผ่าน","enternewpin":"โปรดป้อน PIN ใหม่ของคุณ","enterconfirmpin":"กรุณากรอกยืนยัน PIN ของคุณ","enterpin":"กรุณาใส่รหัส PIN ของคุณ","hello":"หวัดดี","niceday":"ขอให้เป็นวันที่ดี.","setpinscreen":"ตั้งรหัส"}

LockAppScreenResponse lockAppScreenResponseFromJson(String str) => LockAppScreenResponse.fromJson(json.decode(str));
String lockAppScreenResponseToJson(LockAppScreenResponse data) => json.encode(data.toJson());
class LockAppScreenResponse {
  LockAppScreenResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  LockAppScreenResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
LockAppScreenResponse copyWith({  Head? head,
  Body? body,
}) => LockAppScreenResponse(  head: head ?? _head,
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

/// lockapp : "ล็อคหน้าจอแอปพลิเคชัน"
/// lockappdetail : "หากคุณลืมแอปพลิเคชัน PIN Lock คุณจะต้องลบและติดตั้งแอปพลิเคชัน EZ@U ใหม่อีกครั้ง คุณจะต้องออกจากระบบ คุณจะต้องลบข้อมูลแคชของ Application EZ@U ออกจากโทรศัพท์มือถือของคุณ"
/// bioscan : "สแกนลายนิ้วมือและสแกนใบหน้า"
/// changepasscode : "เปลี่ยนรหัสผ่าน"
/// enternewpin : "โปรดป้อน PIN ใหม่ของคุณ"
/// enterconfirmpin : "กรุณากรอกยืนยัน PIN ของคุณ"
/// enterpin : "กรุณาใส่รหัส PIN ของคุณ"
/// hello : "หวัดดี"
/// niceday : "ขอให้เป็นวันที่ดี."
/// setpinscreen : "ตั้งรหัส"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      String? lockapp, 
      String? lockappdetail, 
      String? bioscan, 
      String? changepasscode, 
      String? enternewpin, 
      String? enterconfirmpin, 
      String? enterpin, 
      String? hello, 
      String? niceday, 
      String? setpinscreen,}){
    _lockapp = lockapp;
    _lockappdetail = lockappdetail;
    _bioscan = bioscan;
    _changepasscode = changepasscode;
    _enternewpin = enternewpin;
    _enterconfirmpin = enterconfirmpin;
    _enterpin = enterpin;
    _hello = hello;
    _niceday = niceday;
    _setpinscreen = setpinscreen;
}

  Body.fromJson(dynamic json) {
    _lockapp = json['lockapp'];
    _lockappdetail = json['lockappdetail'];
    _bioscan = json['bioscan'];
    _changepasscode = json['changepasscode'];
    _enternewpin = json['enternewpin'];
    _enterconfirmpin = json['enterconfirmpin'];
    _enterpin = json['enterpin'];
    _hello = json['hello'];
    _niceday = json['niceday'];
    _setpinscreen = json['setpinscreen'];
  }
  String? _lockapp;
  String? _lockappdetail;
  String? _bioscan;
  String? _changepasscode;
  String? _enternewpin;
  String? _enterconfirmpin;
  String? _enterpin;
  String? _hello;
  String? _niceday;
  String? _setpinscreen;
Body copyWith({  String? lockapp,
  String? lockappdetail,
  String? bioscan,
  String? changepasscode,
  String? enternewpin,
  String? enterconfirmpin,
  String? enterpin,
  String? hello,
  String? niceday,
  String? setpinscreen,
}) => Body(  lockapp: lockapp ?? _lockapp,
  lockappdetail: lockappdetail ?? _lockappdetail,
  bioscan: bioscan ?? _bioscan,
  changepasscode: changepasscode ?? _changepasscode,
  enternewpin: enternewpin ?? _enternewpin,
  enterconfirmpin: enterconfirmpin ?? _enterconfirmpin,
  enterpin: enterpin ?? _enterpin,
  hello: hello ?? _hello,
  niceday: niceday ?? _niceday,
  setpinscreen: setpinscreen ?? _setpinscreen,
);
  String? get lockapp => _lockapp;
  String? get lockappdetail => _lockappdetail;
  String? get bioscan => _bioscan;
  String? get changepasscode => _changepasscode;
  String? get enternewpin => _enternewpin;
  String? get enterconfirmpin => _enterconfirmpin;
  String? get enterpin => _enterpin;
  String? get hello => _hello;
  String? get niceday => _niceday;
  String? get setpinscreen => _setpinscreen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lockapp'] = _lockapp;
    map['lockappdetail'] = _lockappdetail;
    map['bioscan'] = _bioscan;
    map['changepasscode'] = _changepasscode;
    map['enternewpin'] = _enternewpin;
    map['enterconfirmpin'] = _enterconfirmpin;
    map['enterpin'] = _enterpin;
    map['hello'] = _hello;
    map['niceday'] = _niceday;
    map['setpinscreen'] = _setpinscreen;
    return map;
  }

}

/// status : 200
/// message : "Success Token Online STON"
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