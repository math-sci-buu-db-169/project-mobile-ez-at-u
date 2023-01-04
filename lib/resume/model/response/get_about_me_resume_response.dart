import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"aboutme_th":"เกี่ยวกับฉัน","aboutme_en":"About me","save":"Save","editinfomations":"Edit Infomation","deleteor":"Delete/ลบ","delete":"Delete"},"data":{"details":"สิ่งที่ใช้สมัครงานวัตถุประสงค์ของ RESUME คือสิ่งที่ต้องทำคือปล่อยให้ตัวบุคคลทำงานร่วมกันเพื่อให้ RESUME ของเอกสารสำคัญซึ่งนำไปใช้งาน วัตถุประสงค์ของ RESUME คือสิ่งที่ต้องทำคือปล่อยให้ตัวบุคคลทำงานร่วมกันเพื่อให้ RESUME ตอบสนองเอกสารสำคัญในการนำไปใช้  บอกเล่าตัวเองเพื่อตำแหน่งงานที่ต้องการในตัวเองเพื่อพนักงานตำแหน่งงานที่ต้องการ","detailsen":"used for applying for jobs  The main purpose of RESUME is to introduce yourself to the employer, so RESUME is an important document which is used in job application.  The main purpose of RESUME is to introduce yourself to the employer, so RESUME "},"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}}

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

/// screeninfo : {"aboutme_th":"เกี่ยวกับฉัน","aboutme_en":"About me","save":"Save","editinfomations":"Edit Infomation","deleteor":"Delete/ลบ","delete":"Delete"}
/// data : {"details":"สิ่งที่ใช้สมัครงานวัตถุประสงค์ของ RESUME คือสิ่งที่ต้องทำคือปล่อยให้ตัวบุคคลทำงานร่วมกันเพื่อให้ RESUME ของเอกสารสำคัญซึ่งนำไปใช้งาน วัตถุประสงค์ของ RESUME คือสิ่งที่ต้องทำคือปล่อยให้ตัวบุคคลทำงานร่วมกันเพื่อให้ RESUME ตอบสนองเอกสารสำคัญในการนำไปใช้  บอกเล่าตัวเองเพื่อตำแหน่งงานที่ต้องการในตัวเองเพื่อพนักงานตำแหน่งงานที่ต้องการ","detailsen":"used for applying for jobs  The main purpose of RESUME is to introduce yourself to the employer, so RESUME is an important document which is used in job application.  The main purpose of RESUME is to introduce yourself to the employer, so RESUME "}
/// errorbutton : {"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"}
/// alertmessage : {"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      Data? data, 
      Errorbutton? errorbutton, 
      Alertmessage? alertmessage,}){
    _screeninfo = screeninfo;
    _data = data;
    _errorbutton = errorbutton;
    _alertmessage = alertmessage;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _alertmessage = json['alertmessage'] != null ? Alertmessage.fromJson(json['alertmessage']) : null;
  }
  Screeninfo? _screeninfo;
  Data? _data;
  Errorbutton? _errorbutton;
  Alertmessage? _alertmessage;
Body copyWith({  Screeninfo? screeninfo,
  Data? data,
  Errorbutton? errorbutton,
  Alertmessage? alertmessage,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  data: data ?? _data,
  errorbutton: errorbutton ?? _errorbutton,
  alertmessage: alertmessage ?? _alertmessage,
);
  Screeninfo? get screeninfo => _screeninfo;
  Data? get data => _data;
  Errorbutton? get errorbutton => _errorbutton;
  Alertmessage? get alertmessage => _alertmessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
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

/// details : "สิ่งที่ใช้สมัครงานวัตถุประสงค์ของ RESUME คือสิ่งที่ต้องทำคือปล่อยให้ตัวบุคคลทำงานร่วมกันเพื่อให้ RESUME ของเอกสารสำคัญซึ่งนำไปใช้งาน วัตถุประสงค์ของ RESUME คือสิ่งที่ต้องทำคือปล่อยให้ตัวบุคคลทำงานร่วมกันเพื่อให้ RESUME ตอบสนองเอกสารสำคัญในการนำไปใช้  บอกเล่าตัวเองเพื่อตำแหน่งงานที่ต้องการในตัวเองเพื่อพนักงานตำแหน่งงานที่ต้องการ"
/// detailsen : "used for applying for jobs  The main purpose of RESUME is to introduce yourself to the employer, so RESUME is an important document which is used in job application.  The main purpose of RESUME is to introduce yourself to the employer, so RESUME "

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
/// save : "Save"
/// editinfomations : "Edit Infomation"
/// deleteor : "Delete/ลบ"
/// delete : "Delete"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? aboutmeTh, 
      String? aboutmeEn, 
      String? save, 
      String? editinfomations, 
      String? deleteor, 
      String? delete,}){
    _aboutmeTh = aboutmeTh;
    _aboutmeEn = aboutmeEn;
    _save = save;
    _editinfomations = editinfomations;
    _deleteor = deleteor;
    _delete = delete;
}

  Screeninfo.fromJson(dynamic json) {
    _aboutmeTh = json['aboutme_th'];
    _aboutmeEn = json['aboutme_en'];
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _deleteor = json['deleteor'];
    _delete = json['delete'];
  }
  String? _aboutmeTh;
  String? _aboutmeEn;
  String? _save;
  String? _editinfomations;
  String? _deleteor;
  String? _delete;
Screeninfo copyWith({  String? aboutmeTh,
  String? aboutmeEn,
  String? save,
  String? editinfomations,
  String? deleteor,
  String? delete,
}) => Screeninfo(  aboutmeTh: aboutmeTh ?? _aboutmeTh,
  aboutmeEn: aboutmeEn ?? _aboutmeEn,
  save: save ?? _save,
  editinfomations: editinfomations ?? _editinfomations,
  deleteor: deleteor ?? _deleteor,
  delete: delete ?? _delete,
);
  String? get aboutmeTh => _aboutmeTh;
  String? get aboutmeEn => _aboutmeEn;
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get deleteor => _deleteor;
  String? get delete => _delete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aboutme_th'] = _aboutmeTh;
    map['aboutme_en'] = _aboutmeEn;
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['deleteor'] = _deleteor;
    map['delete'] = _delete;
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