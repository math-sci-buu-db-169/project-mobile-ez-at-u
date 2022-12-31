import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","title_th":"ใบรับรอง","title_en":"Certificates","description_th":"รายละเอียด","description_en":"Description","deleteor":"Delete/ลบ","delete":"ลบ"},"data":{"id":0,"orderchoose":0,"title":"","titleen":"","description":"","descriptionen":""},"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}}

GetCertificateResumeResponse getCertificateResumeResponseFromJson(String str) => GetCertificateResumeResponse.fromJson(json.decode(str));
String getCertificateResumeResponseToJson(GetCertificateResumeResponse data) => json.encode(data.toJson());
class GetCertificateResumeResponse {
  GetCertificateResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetCertificateResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetCertificateResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetCertificateResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","title_th":"ใบรับรอง","title_en":"Certificates","description_th":"รายละเอียด","description_en":"Description","deleteor":"Delete/ลบ","delete":"ลบ"}
/// data : {"id":0,"orderchoose":0,"title":"","titleen":"","description":"","descriptionen":""}
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
/// title : ""
/// titleen : ""
/// description : ""
/// descriptionen : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? orderchoose, 
      String? title, 
      String? titleen, 
      String? description, 
      String? descriptionen,}){
    _id = id;
    _orderchoose = orderchoose;
    _title = title;
    _titleen = titleen;
    _description = description;
    _descriptionen = descriptionen;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _title = json['title'];
    _titleen = json['titleen'];
    _description = json['description'];
    _descriptionen = json['descriptionen'];
  }
  int? _id;
  int? _orderchoose;
  String? _title;
  String? _titleen;
  String? _description;
  String? _descriptionen;
Data copyWith({  int? id,
  int? orderchoose,
  String? title,
  String? titleen,
  String? description,
  String? descriptionen,
}) => Data(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  title: title ?? _title,
  titleen: titleen ?? _titleen,
  description: description ?? _description,
  descriptionen: descriptionen ?? _descriptionen,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get title => _title;
  String? get titleen => _titleen;
  String? get description => _description;
  String? get descriptionen => _descriptionen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['title'] = _title;
    map['titleen'] = _titleen;
    map['description'] = _description;
    map['descriptionen'] = _descriptionen;
    return map;
  }

}

/// save : "บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// title_th : "ใบรับรอง"
/// title_en : "Certificates"
/// description_th : "รายละเอียด"
/// description_en : "Description"
/// deleteor : "Delete/ลบ"
/// delete : "ลบ"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? save, 
      String? editinfomations, 
      String? titleTh, 
      String? titleEn, 
      String? descriptionTh, 
      String? descriptionEn, 
      String? deleteor, 
      String? delete,}){
    _save = save;
    _editinfomations = editinfomations;
    _titleTh = titleTh;
    _titleEn = titleEn;
    _descriptionTh = descriptionTh;
    _descriptionEn = descriptionEn;
    _deleteor = deleteor;
    _delete = delete;
}

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _titleTh = json['title_th'];
    _titleEn = json['title_en'];
    _descriptionTh = json['description_th'];
    _descriptionEn = json['description_en'];
    _deleteor = json['deleteor'];
    _delete = json['delete'];
  }
  String? _save;
  String? _editinfomations;
  String? _titleTh;
  String? _titleEn;
  String? _descriptionTh;
  String? _descriptionEn;
  String? _deleteor;
  String? _delete;
Screeninfo copyWith({  String? save,
  String? editinfomations,
  String? titleTh,
  String? titleEn,
  String? descriptionTh,
  String? descriptionEn,
  String? deleteor,
  String? delete,
}) => Screeninfo(  save: save ?? _save,
  editinfomations: editinfomations ?? _editinfomations,
  titleTh: titleTh ?? _titleTh,
  titleEn: titleEn ?? _titleEn,
  descriptionTh: descriptionTh ?? _descriptionTh,
  descriptionEn: descriptionEn ?? _descriptionEn,
  deleteor: deleteor ?? _deleteor,
  delete: delete ?? _delete,
);
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get titleTh => _titleTh;
  String? get titleEn => _titleEn;
  String? get descriptionTh => _descriptionTh;
  String? get descriptionEn => _descriptionEn;
  String? get deleteor => _deleteor;
  String? get delete => _delete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['title_th'] = _titleTh;
    map['title_en'] = _titleEn;
    map['description_th'] = _descriptionTh;
    map['description_en'] = _descriptionEn;
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