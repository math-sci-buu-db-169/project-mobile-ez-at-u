import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"textprefix_th":"คำนำหน้า","textprefix_en":"prefix","textname_th":"ชื่อ","textname_en":"Name","textlastname_th":"นามสกุล","textlastname_en":"Last name","save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล"},"data":{"prefix":"นาย 2","name":"สิทธิพล 2","lastname":"ชินโน 2","prefixen":"Mr 2","nameen":"Sittipon 2","lastnameen":"Chinno 2"}}

GetUserInformationResumeResponse getUserInformationResumeResponseFromJson(String str) => GetUserInformationResumeResponse.fromJson(json.decode(str));
String getUserInformationResumeResponseToJson(GetUserInformationResumeResponse data) => json.encode(data.toJson());
class GetUserInformationResumeResponse {
  GetUserInformationResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetUserInformationResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetUserInformationResumeResponse copyWith({  Head? head,
    Body? body,
  }) => GetUserInformationResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"textprefix_th":"คำนำหน้า","textprefix_en":"prefix","textname_th":"ชื่อ","textname_en":"Name","textlastname_th":"นามสกุล","textlastname_en":"Last name","save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล"}
/// data : {"prefix":"นาย 2","name":"สิทธิพล 2","lastname":"ชินโน 2","prefixen":"Mr 2","nameen":"Sittipon 2","lastnameen":"Chinno 2"}

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

/// prefix : "นาย 2"
/// name : "สิทธิพล 2"
/// lastname : "ชินโน 2"
/// prefixen : "Mr 2"
/// nameen : "Sittipon 2"
/// lastnameen : "Chinno 2"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    String? prefix,
    String? name,
    String? lastname,
    String? prefixen,
    String? nameen,
    String? lastnameen,}){
    _prefix = prefix;
    _name = name;
    _lastname = lastname;
    _prefixen = prefixen;
    _nameen = nameen;
    _lastnameen = lastnameen;
  }

  Data.fromJson(dynamic json) {
    _prefix = json['prefix'];
    _name = json['name'];
    _lastname = json['lastname'];
    _prefixen = json['prefixen'];
    _nameen = json['nameen'];
    _lastnameen = json['lastnameen'];
  }
  String? _prefix;
  String? _name;
  String? _lastname;
  String? _prefixen;
  String? _nameen;
  String? _lastnameen;
  Data copyWith({  String? prefix,
    String? name,
    String? lastname,
    String? prefixen,
    String? nameen,
    String? lastnameen,
  }) => Data(  prefix: prefix ?? _prefix,
    name: name ?? _name,
    lastname: lastname ?? _lastname,
    prefixen: prefixen ?? _prefixen,
    nameen: nameen ?? _nameen,
    lastnameen: lastnameen ?? _lastnameen,
  );
  String? get prefix => _prefix;
  String? get name => _name;
  String? get lastname => _lastname;
  String? get prefixen => _prefixen;
  String? get nameen => _nameen;
  String? get lastnameen => _lastnameen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prefix'] = _prefix;
    map['name'] = _name;
    map['lastname'] = _lastname;
    map['prefixen'] = _prefixen;
    map['nameen'] = _nameen;
    map['lastnameen'] = _lastnameen;
    return map;
  }

}

/// textprefix_th : "คำนำหน้า"
/// textprefix_en : "prefix"
/// textname_th : "ชื่อ"
/// textname_en : "Name"
/// textlastname_th : "นามสกุล"
/// textlastname_en : "Last name"
/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? textprefixTh,
    String? textprefixEn,
    String? textnameTh,
    String? textnameEn,
    String? textlastnameTh,
    String? textlastnameEn,
    String? save,
    String? editinfomations,}){
    _textprefixTh = textprefixTh;
    _textprefixEn = textprefixEn;
    _textnameTh = textnameTh;
    _textnameEn = textnameEn;
    _textlastnameTh = textlastnameTh;
    _textlastnameEn = textlastnameEn;
    _save = save;
    _editinfomations = editinfomations;
  }

  Screeninfo.fromJson(dynamic json) {
    _textprefixTh = json['textprefix_th'];
    _textprefixEn = json['textprefix_en'];
    _textnameTh = json['textname_th'];
    _textnameEn = json['textname_en'];
    _textlastnameTh = json['textlastname_th'];
    _textlastnameEn = json['textlastname_en'];
    _save = json['save'];
    _editinfomations = json['editinfomations'];
  }
  String? _textprefixTh;
  String? _textprefixEn;
  String? _textnameTh;
  String? _textnameEn;
  String? _textlastnameTh;
  String? _textlastnameEn;
  String? _save;
  String? _editinfomations;
  Screeninfo copyWith({  String? textprefixTh,
    String? textprefixEn,
    String? textnameTh,
    String? textnameEn,
    String? textlastnameTh,
    String? textlastnameEn,
    String? save,
    String? editinfomations,
  }) => Screeninfo(  textprefixTh: textprefixTh ?? _textprefixTh,
    textprefixEn: textprefixEn ?? _textprefixEn,
    textnameTh: textnameTh ?? _textnameTh,
    textnameEn: textnameEn ?? _textnameEn,
    textlastnameTh: textlastnameTh ?? _textlastnameTh,
    textlastnameEn: textlastnameEn ?? _textlastnameEn,
    save: save ?? _save,
    editinfomations: editinfomations ?? _editinfomations,
  );
  String? get textprefixTh => _textprefixTh;
  String? get textprefixEn => _textprefixEn;
  String? get textnameTh => _textnameTh;
  String? get textnameEn => _textnameEn;
  String? get textlastnameTh => _textlastnameTh;
  String? get textlastnameEn => _textlastnameEn;
  String? get save => _save;
  String? get editinfomations => _editinfomations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textprefix_th'] = _textprefixTh;
    map['textprefix_en'] = _textprefixEn;
    map['textname_th'] = _textnameTh;
    map['textname_en'] = _textnameEn;
    map['textlastname_th'] = _textlastnameTh;
    map['textlastname_en'] = _textlastnameEn;
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
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