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

/// screeninfo : {"textprefix_th":"คำนำหน้า","textprefix_en":"prefix","textname_th":"ชื่อ","textname_en":"Name","textlastname_th":"นามสกุล","textlastname_en":"Last name","save":"บันทึก","editinfomations":"แก้ไขข้อมูล"}
/// prefix : [{"specifically":"P1","th":"นาง","en":"MRS"},{"specifically":"P2","th":"นางสาว","en":"MISS"},{"specifically":"P3","th":"นาย","en":"MR"}]
/// data : {"prefixid":"P3","prefix_th":"นาย","prefix_en":"MR","name":"สิทธิพล","lastname":"ชินโน","nameen":"sittipon","lastnameen":"chinno"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    List<Prefix>? prefix,
    Data? data,}){
    _screeninfo = screeninfo;
    _prefix = prefix;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['prefix'] != null) {
      _prefix = [];
      json['prefix'].forEach((v) {
        _prefix?.add(Prefix.fromJson(v));
      });
    }
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Screeninfo? _screeninfo;
  List<Prefix>? _prefix;
  Data? _data;
  Body copyWith({  Screeninfo? screeninfo,
    List<Prefix>? prefix,
    Data? data,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    prefix: prefix ?? _prefix,
    data: data ?? _data,
  );
  Screeninfo? get screeninfo => _screeninfo;
  List<Prefix>? get prefix => _prefix;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_prefix != null) {
      map['prefix'] = _prefix?.map((v) => v.toJson()).toList();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// prefixid : "P3"
/// prefix_th : "นาย"
/// prefix_en : "MR"
/// name : "สิทธิพล"
/// lastname : "ชินโน"
/// nameen : "sittipon"
/// lastnameen : "chinno"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    String? prefixid,
    String? prefixTh,
    String? prefixEn,
    String? name,
    String? lastname,
    String? nameen,
    String? lastnameen,}){
    _prefixid = prefixid;
    _prefixTh = prefixTh;
    _prefixEn = prefixEn;
    _name = name;
    _lastname = lastname;
    _nameen = nameen;
    _lastnameen = lastnameen;
  }

  Data.fromJson(dynamic json) {
    _prefixid = json['prefixid'];
    _prefixTh = json['prefix_th'];
    _prefixEn = json['prefix_en'];
    _name = json['name'];
    _lastname = json['lastname'];
    _nameen = json['nameen'];
    _lastnameen = json['lastnameen'];
  }
  String? _prefixid;
  String? _prefixTh;
  String? _prefixEn;
  String? _name;
  String? _lastname;
  String? _nameen;
  String? _lastnameen;
  Data copyWith({  String? prefixid,
    String? prefixTh,
    String? prefixEn,
    String? name,
    String? lastname,
    String? nameen,
    String? lastnameen,
  }) => Data(  prefixid: prefixid ?? _prefixid,
    prefixTh: prefixTh ?? _prefixTh,
    prefixEn: prefixEn ?? _prefixEn,
    name: name ?? _name,
    lastname: lastname ?? _lastname,
    nameen: nameen ?? _nameen,
    lastnameen: lastnameen ?? _lastnameen,
  );
  String? get prefixid => _prefixid;
  String? get prefixTh => _prefixTh;
  String? get prefixEn => _prefixEn;
  String? get name => _name;
  String? get lastname => _lastname;
  String? get nameen => _nameen;
  String? get lastnameen => _lastnameen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prefixid'] = _prefixid;
    map['prefix_th'] = _prefixTh;
    map['prefix_en'] = _prefixEn;
    map['name'] = _name;
    map['lastname'] = _lastname;
    map['nameen'] = _nameen;
    map['lastnameen'] = _lastnameen;
    return map;
  }

}

/// specifically : "P1"
/// th : "นาง"
/// en : "MRS"

Prefix prefixFromJson(String str) => Prefix.fromJson(json.decode(str));
String prefixToJson(Prefix data) => json.encode(data.toJson());
class Prefix {
  Prefix({
    String? specifically,
    String? th,
    String? en,}){
    _specifically = specifically;
    _th = th;
    _en = en;
  }

  Prefix.fromJson(dynamic json) {
    _specifically = json['specifically'];
    _th = json['th'];
    _en = json['en'];
  }
  String? _specifically;
  String? _th;
  String? _en;
  Prefix copyWith({  String? specifically,
    String? th,
    String? en,
  }) => Prefix(  specifically: specifically ?? _specifically,
    th: th ?? _th,
    en: en ?? _en,
  );
  String? get specifically => _specifically;
  String? get th => _th;
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['specifically'] = _specifically;
    map['th'] = _th;
    map['en'] = _en;
    return map;
  }

}

/// textprefix_th : "คำนำหน้า"
/// textprefix_en : "prefix"
/// textname_th : "ชื่อ"
/// textname_en : "Name"
/// textlastname_th : "นามสกุล"
/// textlastname_en : "Last name"
/// save : "บันทึก"
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
    int? status,
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
  int? _status;
  String? _message;
  String? _modulename;
  bool? _timeexpire;
  Head copyWith({  int? status,
    String? message,
    String? modulename,
    bool? timeexpire,
  }) => Head(  status: status ?? _status,
    message: message ?? _message,
    modulename: modulename ?? _modulename,
    timeexpire: timeexpire ?? _timeexpire,
  );
  int? get status => _status;
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