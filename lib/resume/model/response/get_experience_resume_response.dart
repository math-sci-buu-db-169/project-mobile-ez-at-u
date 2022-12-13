import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","startdate_th":"วันเริ่มต้น","enddate_th":"วันสิ้นสุด","startdate_en":"Start date","enddate_en":"End date","type_th":"ประเภทการศึกษา","type_en":"Education type","placeofstudy_th":"สถานศึกษา","placeofstudy_en":"Place name","detail_th":null,"detail_en":null},"data":{"hsc":{"id":0,"orderchoose":1,"startdate":"Jun 2015","enddate":"Jun 2018","type":"HSC","placeofstudy":"การศึกษาระดับมัธยมศึกษาตอนปลาย","placeogstudyen":"High school education","detail":"วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์","detailen":"cience-mathematics Khamsaen Wittayasan School"},"bd":{"id":0,"orderchoose":1,"startdate":"Jun 2018","enddate":"Jun 2022","type":"BD","placeofstudy":"ปริญญาตรี","placeogstudyen":"Bachelor's degree","detail":"สาขาวิชาคณิตศาสตร์ ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา","detailen":"major in mathematics Department of Mathematics Faculty of Science Burapha University"},"md":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"dd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"hdd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null}}}

GetExperienceResumeResponse getExperienceResumeResponseFromJson(String str) => GetExperienceResumeResponse.fromJson(json.decode(str));
String getExperienceResumeResponseToJson(GetExperienceResumeResponse data) => json.encode(data.toJson());
class GetExperienceResumeResponse {
  GetExperienceResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetExperienceResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetExperienceResumeResponse copyWith({  Head? head,
    Body? body,
  }) => GetExperienceResumeResponse(  head: head ?? _head,
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
/// screeninfo : {"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","startdate_th":"วันเริ่มต้น","enddate_th":"วันสิ้นสุด","startdate_en":"Start date","enddate_en":"End date","position_th":"ตำแหน่ง","position_en":"Position","description_th":"รายละเอียด","description_en":"Description"}
/// data : [{"id":1,"orderchoose":0,"startdate":"Jun 2015 ","enddate":"Jun 2018","position_th":"วิศวกรรมซอฟต์แวร์","position_en":"Software Engineer","detail_th":"ฟรีวิลล์ โซลูชั่นส์ จํากัด","detail_en":"Freewill Solutions"},{"id":2,"orderchoose":0,"startdate":"Jun 2015 ","enddate":"Jun 2018","position_th":"วิศวกรรมซอฟต์แวร์","position_en":"Software Engineer","detail_th":"ฟรีวิลล์ โซลูชั่นส์ จํากัด","detail_en":"Freewill Solutions"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    List<Data>? data,}){
    _screeninfo = screeninfo;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Data>? _data;
  Body copyWith({  Screeninfo? screeninfo,
    List<Data>? data,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    data: data ?? _data,
  );
  Screeninfo? get screeninfo => _screeninfo;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// orderchoose : 0
/// startdate : "Jun 2015 "
/// enddate : "Jun 2018"
/// position_th : "วิศวกรรมซอฟต์แวร์"
/// position_en : "Software Engineer"
/// detail_th : "ฟรีวิลล์ โซลูชั่นส์ จํากัด"
/// detail_en : "Freewill Solutions"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    int? id,
    int? orderchoose,
    String? startdate,
    String? enddate,
    String? positionTh,
    String? positionEn,
    String? detailTh,
    String? detailEn,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _positionTh = positionTh;
    _positionEn = positionEn;
    _detailTh = detailTh;
    _detailEn = detailEn;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _positionTh = json['position_th'];
    _positionEn = json['position_en'];
    _detailTh = json['detail_th'];
    _detailEn = json['detail_en'];
  }
  int? _id;
  int? _orderchoose;
  String? _startdate;
  String? _enddate;
  String? _positionTh;
  String? _positionEn;
  String? _detailTh;
  String? _detailEn;
  Data copyWith({  int? id,
    int? orderchoose,
    String? startdate,
    String? enddate,
    String? positionTh,
    String? positionEn,
    String? detailTh,
    String? detailEn,
  }) => Data(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    startdate: startdate ?? _startdate,
    enddate: enddate ?? _enddate,
    positionTh: positionTh ?? _positionTh,
    positionEn: positionEn ?? _positionEn,
    detailTh: detailTh ?? _detailTh,
    detailEn: detailEn ?? _detailEn,
  );
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get positionTh => _positionTh;
  String? get positionEn => _positionEn;
  String? get detailTh => _detailTh;
  String? get detailEn => _detailEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['position_th'] = _positionTh;
    map['position_en'] = _positionEn;
    map['detail_th'] = _detailTh;
    map['detail_en'] = _detailEn;
    return map;
  }

}

/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// startdate_th : "วันเริ่มต้น"
/// enddate_th : "วันสิ้นสุด"
/// startdate_en : "Start date"
/// enddate_en : "End date"
/// position_th : "ตำแหน่ง"
/// position_en : "Position"
/// description_th : "รายละเอียด"
/// description_en : "Description"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? save,
    String? editinfomations,
    String? startdateTh,
    String? enddateTh,
    String? startdateEn,
    String? enddateEn,
    String? positionTh,
    String? positionEn,
    String? descriptionTh,
    String? descriptionEn,}){
    _save = save;
    _editinfomations = editinfomations;
    _startdateTh = startdateTh;
    _enddateTh = enddateTh;
    _startdateEn = startdateEn;
    _enddateEn = enddateEn;
    _positionTh = positionTh;
    _positionEn = positionEn;
    _descriptionTh = descriptionTh;
    _descriptionEn = descriptionEn;
  }

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _startdateTh = json['startdate_th'];
    _enddateTh = json['enddate_th'];
    _startdateEn = json['startdate_en'];
    _enddateEn = json['enddate_en'];
    _positionTh = json['position_th'];
    _positionEn = json['position_en'];
    _descriptionTh = json['description_th'];
    _descriptionEn = json['description_en'];
  }
  String? _save;
  String? _editinfomations;
  String? _startdateTh;
  String? _enddateTh;
  String? _startdateEn;
  String? _enddateEn;
  String? _positionTh;
  String? _positionEn;
  String? _descriptionTh;
  String? _descriptionEn;
  Screeninfo copyWith({  String? save,
    String? editinfomations,
    String? startdateTh,
    String? enddateTh,
    String? startdateEn,
    String? enddateEn,
    String? positionTh,
    String? positionEn,
    String? descriptionTh,
    String? descriptionEn,
  }) => Screeninfo(  save: save ?? _save,
    editinfomations: editinfomations ?? _editinfomations,
    startdateTh: startdateTh ?? _startdateTh,
    enddateTh: enddateTh ?? _enddateTh,
    startdateEn: startdateEn ?? _startdateEn,
    enddateEn: enddateEn ?? _enddateEn,
    positionTh: positionTh ?? _positionTh,
    positionEn: positionEn ?? _positionEn,
    descriptionTh: descriptionTh ?? _descriptionTh,
    descriptionEn: descriptionEn ?? _descriptionEn,
  );
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get startdateTh => _startdateTh;
  String? get enddateTh => _enddateTh;
  String? get startdateEn => _startdateEn;
  String? get enddateEn => _enddateEn;
  String? get positionTh => _positionTh;
  String? get positionEn => _positionEn;
  String? get descriptionTh => _descriptionTh;
  String? get descriptionEn => _descriptionEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['startdate_th'] = _startdateTh;
    map['enddate_th'] = _enddateTh;
    map['startdate_en'] = _startdateEn;
    map['enddate_en'] = _enddateEn;
    map['position_th'] = _positionTh;
    map['position_en'] = _positionEn;
    map['description_th'] = _descriptionTh;
    map['description_en'] = _descriptionEn;
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