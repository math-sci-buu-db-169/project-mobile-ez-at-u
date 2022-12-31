import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"textprefix_th":"คำนำหน้า","textprefix_en":"prefix","textname_th":"ชื่อ","textname_en":"Name","textlastname_th":"นามสกุล","textlastname_en":"Last name","save":"บันทึก","editinfomations":"แก้ไขข้อมูล"},"prefix":[{"specifically":"P1","th":"นาง","en":"MRS"},{"specifically":"P2","th":"นางสาว","en":"MISS"},{"specifically":"P3","th":"นาย","en":"MR"}],"data":{"prefixid":"P1","prefix_th":"นาง","prefix_en":"MRS","name":"","lastname":"","nameen":"","lastnameen":""},"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}}

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
/// data : {"prefixid":"P1","prefix_th":"นาง","prefix_en":"MRS","name":"","lastname":"","nameen":"","lastnameen":""}
/// errorbutton : {"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"}
/// alertmessage : {"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<Prefix>? prefix, 
      Data? data, 
      Errorbutton? errorbutton, 
      Alertmessage? alertmessage,}){
    _screeninfo = screeninfo;
    _prefix = prefix;
    _data = data;
    _errorbutton = errorbutton;
    _alertmessage = alertmessage;
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
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _alertmessage = json['alertmessage'] != null ? Alertmessage.fromJson(json['alertmessage']) : null;
  }
  Screeninfo? _screeninfo;
  List<Prefix>? _prefix;
  Data? _data;
  Errorbutton? _errorbutton;
  Alertmessage? _alertmessage;
Body copyWith({  Screeninfo? screeninfo,
  List<Prefix>? prefix,
  Data? data,
  Errorbutton? errorbutton,
  Alertmessage? alertmessage,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  prefix: prefix ?? _prefix,
  data: data ?? _data,
  errorbutton: errorbutton ?? _errorbutton,
  alertmessage: alertmessage ?? _alertmessage,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<Prefix>? get prefix => _prefix;
  Data? get data => _data;
  Errorbutton? get errorbutton => _errorbutton;
  Alertmessage? get alertmessage => _alertmessage;

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
    if (_errorbutton != null) {
      map['errorbutton'] = _errorbutton?.toJson();
    }
    if (_alertmessage != null) {
      map['alertmessage'] = _alertmessage?.toJson();
    }
    return map;
  }

}

/// alertdeletedata_th : "คุณต้องการลบข้อมูลนี้ใช่หรือไม่?"
/// alertdeletedata_en : "Do you want to delete this information?"
/// alertsavedata_th : " คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่"
/// alertsavedata_en : "Do you want to save this information?"
/// completefields_th : "กรุณากรอกให้ครบทุกช่อง"
/// completefields_en : "Please complete all fields."

Alertmessage alertmessageFromJson(String str) => Alertmessage.fromJson(json.decode(str));
String alertmessageToJson(Alertmessage data) => json.encode(data.toJson());
class Alertmessage {
  Alertmessage({
      String? alertdeletedataTh, 
      String? alertdeletedataEn, 
      String? alertsavedataTh, 
      String? alertsavedataEn, 
      String? completefieldsTh, 
      String? completefieldsEn,}){
    _alertdeletedataTh = alertdeletedataTh;
    _alertdeletedataEn = alertdeletedataEn;
    _alertsavedataTh = alertsavedataTh;
    _alertsavedataEn = alertsavedataEn;
    _completefieldsTh = completefieldsTh;
    _completefieldsEn = completefieldsEn;
}

  Alertmessage.fromJson(dynamic json) {
    _alertdeletedataTh = json['alertdeletedata_th'];
    _alertdeletedataEn = json['alertdeletedata_en'];
    _alertsavedataTh = json['alertsavedata_th'];
    _alertsavedataEn = json['alertsavedata_en'];
    _completefieldsTh = json['completefields_th'];
    _completefieldsEn = json['completefields_en'];
  }
  String? _alertdeletedataTh;
  String? _alertdeletedataEn;
  String? _alertsavedataTh;
  String? _alertsavedataEn;
  String? _completefieldsTh;
  String? _completefieldsEn;
Alertmessage copyWith({  String? alertdeletedataTh,
  String? alertdeletedataEn,
  String? alertsavedataTh,
  String? alertsavedataEn,
  String? completefieldsTh,
  String? completefieldsEn,
}) => Alertmessage(  alertdeletedataTh: alertdeletedataTh ?? _alertdeletedataTh,
  alertdeletedataEn: alertdeletedataEn ?? _alertdeletedataEn,
  alertsavedataTh: alertsavedataTh ?? _alertsavedataTh,
  alertsavedataEn: alertsavedataEn ?? _alertsavedataEn,
  completefieldsTh: completefieldsTh ?? _completefieldsTh,
  completefieldsEn: completefieldsEn ?? _completefieldsEn,
);
  String? get alertdeletedataTh => _alertdeletedataTh;
  String? get alertdeletedataEn => _alertdeletedataEn;
  String? get alertsavedataTh => _alertsavedataTh;
  String? get alertsavedataEn => _alertsavedataEn;
  String? get completefieldsTh => _completefieldsTh;
  String? get completefieldsEn => _completefieldsEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alertdeletedata_th'] = _alertdeletedataTh;
    map['alertdeletedata_en'] = _alertdeletedataEn;
    map['alertsavedata_th'] = _alertsavedataTh;
    map['alertsavedata_en'] = _alertsavedataEn;
    map['completefields_th'] = _completefieldsTh;
    map['completefields_en'] = _completefieldsEn;
    return map;
  }

}

/// buttonok : "OK"
/// buttonconfirm : "Confirm"
/// buttonyes : "Yes"
/// buttonno : "No"
/// buttoncancel : "Cancel"

Errorbutton errorbuttonFromJson(String str) => Errorbutton.fromJson(json.decode(str));
String errorbuttonToJson(Errorbutton data) => json.encode(data.toJson());
class Errorbutton {
  Errorbutton({
      String? buttonok, 
      String? buttonconfirm, 
      String? buttonyes, 
      String? buttonno, 
      String? buttoncancel,}){
    _buttonok = buttonok;
    _buttonconfirm = buttonconfirm;
    _buttonyes = buttonyes;
    _buttonno = buttonno;
    _buttoncancel = buttoncancel;
}

  Errorbutton.fromJson(dynamic json) {
    _buttonok = json['buttonok'];
    _buttonconfirm = json['buttonconfirm'];
    _buttonyes = json['buttonyes'];
    _buttonno = json['buttonno'];
    _buttoncancel = json['buttoncancel'];
  }
  String? _buttonok;
  String? _buttonconfirm;
  String? _buttonyes;
  String? _buttonno;
  String? _buttoncancel;
Errorbutton copyWith({  String? buttonok,
  String? buttonconfirm,
  String? buttonyes,
  String? buttonno,
  String? buttoncancel,
}) => Errorbutton(  buttonok: buttonok ?? _buttonok,
  buttonconfirm: buttonconfirm ?? _buttonconfirm,
  buttonyes: buttonyes ?? _buttonyes,
  buttonno: buttonno ?? _buttonno,
  buttoncancel: buttoncancel ?? _buttoncancel,
);
  String? get buttonok => _buttonok;
  String? get buttonconfirm => _buttonconfirm;
  String? get buttonyes => _buttonyes;
  String? get buttonno => _buttonno;
  String? get buttoncancel => _buttoncancel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['buttonok'] = _buttonok;
    map['buttonconfirm'] = _buttonconfirm;
    map['buttonyes'] = _buttonyes;
    map['buttonno'] = _buttonno;
    map['buttoncancel'] = _buttoncancel;
    return map;
  }

}

/// prefixid : "P1"
/// prefix_th : "นาง"
/// prefix_en : "MRS"
/// name : ""
/// lastname : ""
/// nameen : ""
/// lastnameen : ""

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