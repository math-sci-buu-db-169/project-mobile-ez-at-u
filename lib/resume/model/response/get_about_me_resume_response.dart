import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"aboutme_th":"เกี่ยวกับฉัน","aboutme_en":"About me","save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล"},"data":{"details":"Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create systems that are reliable and user-friendly.9999","detailsen":"Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create systems that are reliable and user-friendly.9999"}}

GetAboutMeResumeResponse getAboutMeResumeResponseFromJson(String str) => GetAboutMeResumeResponse.fromJson(json.decode(str));
String getAboutMeResumeResponseToJson(GetAboutMeResumeResponse data) => json.encode(data.toJson());
class GetAboutMeResumeResponse {
  GetAboutMeResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetAboutMeResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetAboutMeResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetAboutMeResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"aboutme_th":"เกี่ยวกับฉัน","aboutme_en":"About me","save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล"}
/// data : {"details":"Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create systems that are reliable and user-friendly.9999","detailsen":"Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create systems that are reliable and user-friendly.9999"}

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

/// details : "Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create systems that are reliable and user-friendly.9999"
/// detailsen : "Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create systems that are reliable and user-friendly.9999"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? details, 
      String? detailsen,}){
    _details = details;
    _detailsen = detailsen;
}

  Data.fromJson(dynamic json) {
    _details = json['details'];
    _detailsen = json['detailsen'];
  }
  String? _details;
  String? _detailsen;
Data copyWith({  String? details,
  String? detailsen,
}) => Data(  details: details ?? _details,
  detailsen: detailsen ?? _detailsen,
);
  String? get details => _details;
  String? get detailsen => _detailsen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['details'] = _details;
    map['detailsen'] = _detailsen;
    return map;
  }

}

/// aboutme_th : "เกี่ยวกับฉัน"
/// aboutme_en : "About me"
/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? aboutmeTh, 
      String? aboutmeEn, 
      String? save, 
      String? editinfomations,}){
    _aboutmeTh = aboutmeTh;
    _aboutmeEn = aboutmeEn;
    _save = save;
    _editinfomations = editinfomations;
}

  Screeninfo.fromJson(dynamic json) {
    _aboutmeTh = json['aboutme_th'];
    _aboutmeEn = json['aboutme_en'];
    _save = json['save'];
    _editinfomations = json['editinfomations'];
  }
  String? _aboutmeTh;
  String? _aboutmeEn;
  String? _save;
  String? _editinfomations;
Screeninfo copyWith({  String? aboutmeTh,
  String? aboutmeEn,
  String? save,
  String? editinfomations,
}) => Screeninfo(  aboutmeTh: aboutmeTh ?? _aboutmeTh,
  aboutmeEn: aboutmeEn ?? _aboutmeEn,
  save: save ?? _save,
  editinfomations: editinfomations ?? _editinfomations,
);
  String? get aboutmeTh => _aboutmeTh;
  String? get aboutmeEn => _aboutmeEn;
  String? get save => _save;
  String? get editinfomations => _editinfomations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aboutme_th'] = _aboutmeTh;
    map['aboutme_en'] = _aboutmeEn;
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