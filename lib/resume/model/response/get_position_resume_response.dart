import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","position_th":"ตำแหน่งที่สนใจ","office_th":"สถานที่ทำงาน","position_en":"Interested position","office_en":"Office","detail_th":"รายละเอียด","detail_en":"Description","deleteor":"Delete/ลบ","delete":"ลบ"},"data":{"id":0,"orderchoose":0,"position_th":"","position_en":"","office_th":"","office_en":"","detail_th":"","detail_en":""},"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}}

GetPositionResumeResponse getPositionResumeResponseFromJson(String str) => GetPositionResumeResponse.fromJson(json.decode(str));
String getPositionResumeResponseToJson(GetPositionResumeResponse data) => json.encode(data.toJson());
class GetPositionResumeResponse {
  GetPositionResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetPositionResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetPositionResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetPositionResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","position_th":"ตำแหน่งที่สนใจ","office_th":"สถานที่ทำงาน","position_en":"Interested position","office_en":"Office","detail_th":"รายละเอียด","detail_en":"Description","deleteor":"Delete/ลบ","delete":"ลบ"}
/// data : {"id":0,"orderchoose":0,"position_th":"","position_en":"","office_th":"","office_en":"","detail_th":"","detail_en":""}
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

/// id : 0
/// orderchoose : 0
/// position_th : ""
/// position_en : ""
/// office_th : ""
/// office_en : ""
/// detail_th : ""
/// detail_en : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? orderchoose, 
      String? positionTh, 
      String? positionEn, 
      String? officeTh, 
      String? officeEn, 
      String? detailTh, 
      String? detailEn,}){
    _id = id;
    _orderchoose = orderchoose;
    _positionTh = positionTh;
    _positionEn = positionEn;
    _officeTh = officeTh;
    _officeEn = officeEn;
    _detailTh = detailTh;
    _detailEn = detailEn;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _positionTh = json['position_th'];
    _positionEn = json['position_en'];
    _officeTh = json['office_th'];
    _officeEn = json['office_en'];
    _detailTh = json['detail_th'];
    _detailEn = json['detail_en'];
  }
  int? _id;
  int? _orderchoose;
  String? _positionTh;
  String? _positionEn;
  String? _officeTh;
  String? _officeEn;
  String? _detailTh;
  String? _detailEn;
Data copyWith({  int? id,
  int? orderchoose,
  String? positionTh,
  String? positionEn,
  String? officeTh,
  String? officeEn,
  String? detailTh,
  String? detailEn,
}) => Data(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  positionTh: positionTh ?? _positionTh,
  positionEn: positionEn ?? _positionEn,
  officeTh: officeTh ?? _officeTh,
  officeEn: officeEn ?? _officeEn,
  detailTh: detailTh ?? _detailTh,
  detailEn: detailEn ?? _detailEn,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get positionTh => _positionTh;
  String? get positionEn => _positionEn;
  String? get officeTh => _officeTh;
  String? get officeEn => _officeEn;
  String? get detailTh => _detailTh;
  String? get detailEn => _detailEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['position_th'] = _positionTh;
    map['position_en'] = _positionEn;
    map['office_th'] = _officeTh;
    map['office_en'] = _officeEn;
    map['detail_th'] = _detailTh;
    map['detail_en'] = _detailEn;
    return map;
  }

}

/// save : "บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// position_th : "ตำแหน่งที่สนใจ"
/// office_th : "สถานที่ทำงาน"
/// position_en : "Interested position"
/// office_en : "Office"
/// detail_th : "รายละเอียด"
/// detail_en : "Description"
/// deleteor : "Delete/ลบ"
/// delete : "ลบ"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? save, 
      String? editinfomations, 
      String? positionTh, 
      String? officeTh, 
      String? positionEn, 
      String? officeEn, 
      String? detailTh, 
      String? detailEn, 
      String? deleteor, 
      String? delete,}){
    _save = save;
    _editinfomations = editinfomations;
    _positionTh = positionTh;
    _officeTh = officeTh;
    _positionEn = positionEn;
    _officeEn = officeEn;
    _detailTh = detailTh;
    _detailEn = detailEn;
    _deleteor = deleteor;
    _delete = delete;
}

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _positionTh = json['position_th'];
    _officeTh = json['office_th'];
    _positionEn = json['position_en'];
    _officeEn = json['office_en'];
    _detailTh = json['detail_th'];
    _detailEn = json['detail_en'];
    _deleteor = json['deleteor'];
    _delete = json['delete'];
  }
  String? _save;
  String? _editinfomations;
  String? _positionTh;
  String? _officeTh;
  String? _positionEn;
  String? _officeEn;
  String? _detailTh;
  String? _detailEn;
  String? _deleteor;
  String? _delete;
Screeninfo copyWith({  String? save,
  String? editinfomations,
  String? positionTh,
  String? officeTh,
  String? positionEn,
  String? officeEn,
  String? detailTh,
  String? detailEn,
  String? deleteor,
  String? delete,
}) => Screeninfo(  save: save ?? _save,
  editinfomations: editinfomations ?? _editinfomations,
  positionTh: positionTh ?? _positionTh,
  officeTh: officeTh ?? _officeTh,
  positionEn: positionEn ?? _positionEn,
  officeEn: officeEn ?? _officeEn,
  detailTh: detailTh ?? _detailTh,
  detailEn: detailEn ?? _detailEn,
  deleteor: deleteor ?? _deleteor,
  delete: delete ?? _delete,
);
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get positionTh => _positionTh;
  String? get officeTh => _officeTh;
  String? get positionEn => _positionEn;
  String? get officeEn => _officeEn;
  String? get detailTh => _detailTh;
  String? get detailEn => _detailEn;
  String? get deleteor => _deleteor;
  String? get delete => _delete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['position_th'] = _positionTh;
    map['office_th'] = _officeTh;
    map['position_en'] = _positionEn;
    map['office_en'] = _officeEn;
    map['detail_th'] = _detailTh;
    map['detail_en'] = _detailEn;
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