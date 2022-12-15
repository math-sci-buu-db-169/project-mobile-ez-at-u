import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","position_th":"ตำแหน่ง","office_th":"สถานที่ทำงาน","position_en":"Positions","office_en":"Office","detail_th":"รายละเอียด","detail_en":"Description"},"data":{"position":"นักพัฒนาซอฟต์แวร์","positionen":"software developer","office":null,"officeen":null}}

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

/// screeninfo : {"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","position_th":"ตำแหน่ง","office_th":"สถานที่ทำงาน","position_en":"Positions","office_en":"Office","detail_th":"รายละเอียด","detail_en":"Description"}
/// data : {"id":0,"orderchoose":0,"position_th":"1","position_en":"2","office_th":"9","office_en":"8","detail_th":"5","detail_en":"6"}

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

/// id : 0
/// orderchoose : 0
/// position_th : "1"
/// position_en : "2"
/// office_th : "9"
/// office_en : "8"
/// detail_th : "5"
/// detail_en : "6"

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
/// position_th : "ตำแหน่ง"
/// office_th : "สถานที่ทำงาน"
/// position_en : "Positions"
/// office_en : "Office"
/// detail_th : "รายละเอียด"
/// detail_en : "Description"

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
    String? detailEn,}){
    _save = save;
    _editinfomations = editinfomations;
    _positionTh = positionTh;
    _officeTh = officeTh;
    _positionEn = positionEn;
    _officeEn = officeEn;
    _detailTh = detailTh;
    _detailEn = detailEn;
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
  }
  String? _save;
  String? _editinfomations;
  String? _positionTh;
  String? _officeTh;
  String? _positionEn;
  String? _officeEn;
  String? _detailTh;
  String? _detailEn;
  Screeninfo copyWith({  String? save,
    String? editinfomations,
    String? positionTh,
    String? officeTh,
    String? positionEn,
    String? officeEn,
    String? detailTh,
    String? detailEn,
  }) => Screeninfo(  save: save ?? _save,
    editinfomations: editinfomations ?? _editinfomations,
    positionTh: positionTh ?? _positionTh,
    officeTh: officeTh ?? _officeTh,
    positionEn: positionEn ?? _positionEn,
    officeEn: officeEn ?? _officeEn,
    detailTh: detailTh ?? _detailTh,
    detailEn: detailEn ?? _detailEn,
  );
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get positionTh => _positionTh;
  String? get officeTh => _officeTh;
  String? get positionEn => _positionEn;
  String? get officeEn => _officeEn;
  String? get detailTh => _detailTh;
  String? get detailEn => _detailEn;

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