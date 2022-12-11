import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","email":"อีเมล","phone":"โทรศัพท์","facebook":"เฟคบุ๊ค","line":"ไลน์","instagram":"อินสตาแกรม","twitter":"ทวิตเตอร์","youtube":"ยูทูป"},"data":{"email":"email","phone":"phone","facebook":"feacbook","line":"@0930582335","instagram":"instagram","twitter":"twitter","youtube":"twitter"}}

GetContactResumeResponse getContactResumeResponseFromJson(String str) => GetContactResumeResponse.fromJson(json.decode(str));
String getContactResumeResponseToJson(GetContactResumeResponse data) => json.encode(data.toJson());
class GetContactResumeResponse {
  GetContactResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetContactResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetContactResumeResponse copyWith({  Head? head,
    Body? body,
  }) => GetContactResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","email":"อีเมล","phone":"โทรศัพท์","facebook":"เฟคบุ๊ค","line":"ไลน์","instagram":"อินสตาแกรม","twitter":"ทวิตเตอร์","youtube":"ยูทูป"}
/// data : {"email":"email","phone":"phone","facebook":"feacbook","line":"@0930582335","instagram":"instagram","twitter":"twitter","youtube":"twitter"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    Data? data,}){
    _screeninfo = screeninfo;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Screeninfo? _screeninfo;
  Data? _data;
  Body copyWith({  Screeninfo? screeninfo,
    Data? data,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    data: data ?? _data,
  );
  Screeninfo? get screeninfo => _screeninfo;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// email : "email"
/// phone : "phone"
/// facebook : "feacbook"
/// line : "@0930582335"
/// instagram : "instagram"
/// twitter : "twitter"
/// youtube : "twitter"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    String? email,
    String? phone,
    String? facebook,
    String? line,
    String? instagram,
    String? twitter,
    String? youtube,}){
    _email = email;
    _phone = phone;
    _facebook = facebook;
    _line = line;
    _instagram = instagram;
    _twitter = twitter;
    _youtube = youtube;
  }

  Data.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
    _facebook = json['facebook'];
    _line = json['line'];
    _instagram = json['instagram'];
    _twitter = json['twitter'];
    _youtube = json['youtube'];
  }
  String? _email;
  String? _phone;
  String? _facebook;
  String? _line;
  String? _instagram;
  String? _twitter;
  String? _youtube;
  Data copyWith({  String? email,
    String? phone,
    String? facebook,
    String? line,
    String? instagram,
    String? twitter,
    String? youtube,
  }) => Data(  email: email ?? _email,
    phone: phone ?? _phone,
    facebook: facebook ?? _facebook,
    line: line ?? _line,
    instagram: instagram ?? _instagram,
    twitter: twitter ?? _twitter,
    youtube: youtube ?? _youtube,
  );
  String? get email => _email;
  String? get phone => _phone;
  String? get facebook => _facebook;
  String? get line => _line;
  String? get instagram => _instagram;
  String? get twitter => _twitter;
  String? get youtube => _youtube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['facebook'] = _facebook;
    map['line'] = _line;
    map['instagram'] = _instagram;
    map['twitter'] = _twitter;
    map['youtube'] = _youtube;
    return map;
  }

}

/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// email : "อีเมล"
/// phone : "โทรศัพท์"
/// facebook : "เฟคบุ๊ค"
/// line : "ไลน์"
/// instagram : "อินสตาแกรม"
/// twitter : "ทวิตเตอร์"
/// youtube : "ยูทูป"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? save,
    String? editinfomations,
    String? email,
    String? phone,
    String? facebook,
    String? line,
    String? instagram,
    String? twitter,
    String? youtube,}){
    _save = save;
    _editinfomations = editinfomations;
    _email = email;
    _phone = phone;
    _facebook = facebook;
    _line = line;
    _instagram = instagram;
    _twitter = twitter;
    _youtube = youtube;
  }

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _email = json['email'];
    _phone = json['phone'];
    _facebook = json['facebook'];
    _line = json['line'];
    _instagram = json['instagram'];
    _twitter = json['twitter'];
    _youtube = json['youtube'];
  }
  String? _save;
  String? _editinfomations;
  String? _email;
  String? _phone;
  String? _facebook;
  String? _line;
  String? _instagram;
  String? _twitter;
  String? _youtube;
  Screeninfo copyWith({  String? save,
    String? editinfomations,
    String? email,
    String? phone,
    String? facebook,
    String? line,
    String? instagram,
    String? twitter,
    String? youtube,
  }) => Screeninfo(  save: save ?? _save,
    editinfomations: editinfomations ?? _editinfomations,
    email: email ?? _email,
    phone: phone ?? _phone,
    facebook: facebook ?? _facebook,
    line: line ?? _line,
    instagram: instagram ?? _instagram,
    twitter: twitter ?? _twitter,
    youtube: youtube ?? _youtube,
  );
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get email => _email;
  String? get phone => _phone;
  String? get facebook => _facebook;
  String? get line => _line;
  String? get instagram => _instagram;
  String? get twitter => _twitter;
  String? get youtube => _youtube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['email'] = _email;
    map['phone'] = _phone;
    map['facebook'] = _facebook;
    map['line'] = _line;
    map['instagram'] = _instagram;
    map['twitter'] = _twitter;
    map['youtube'] = _youtube;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "home/resume"
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