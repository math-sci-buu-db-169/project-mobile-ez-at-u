import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","startdate_th":"วันเริ่มต้น","enddate_th":"วันสิ้นสุด","startdate_en":"Start date","enddate_en":"End date","type_th":"ประเภทการศึกษา","type_en":"Education type","placeofstudy_th":"สถานศึกษา","placeofstudy_en":"Place name","detail_th":null,"detail_en":null},"data":{"hsc":{"id":0,"orderchoose":1,"startdate":"Jun 2015","enddate":"Jun 2018","type":"HSC","placeofstudy":"การศึกษาระดับมัธยมศึกษาตอนปลาย","placeogstudyen":"High school education","detail":"วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์","detailen":"cience-mathematics Khamsaen Wittayasan School"},"bd":{"id":0,"orderchoose":1,"startdate":"Jun 2018","enddate":"Jun 2022","type":"BD","placeofstudy":"ปริญญาตรี","placeogstudyen":"Bachelor's degree","detail":"สาขาวิชาคณิตศาสตร์ ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา","detailen":"major in mathematics Department of Mathematics Faculty of Science Burapha University"},"md":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"dd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"hdd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null}}}

GetEducationResumeResponse getEducationResumeResponseFromJson(String str) => GetEducationResumeResponse.fromJson(json.decode(str));
String getEducationResumeResponseToJson(GetEducationResumeResponse data) => json.encode(data.toJson());
class GetEducationResumeResponse {
  GetEducationResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetEducationResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetEducationResumeResponse copyWith({  Head? head,
    Body? body,
  }) => GetEducationResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","startdate_th":"วันเริ่มต้น","enddate_th":"วันสิ้นสุด","startdate_en":"Start date","enddate_en":"End date","type_th":"ประเภทการศึกษา","type_en":"Education type","placeofstudy_th":"สถานศึกษา","placeofstudy_en":"Place name","detail_th":"รายละเอียด","detail_en":"Description","deleteor":"Delete/ลบ","delete":"ลบ"}
/// data : {"id":1,"orderchoose":1,"startdate":"Jun 2015","enddate":"Jun 2018","type":"HSC","placeofstudy_th":"การศึกษาระดับมัธยมศึกษาตอนปลาย","placeofstudy_en":"High school education","detail_th":"วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์","detail_en":"cience-mathematics Khamsaen Wittayasan School"}
/// type : [{"typeid":"hsc       ","type_th":"High School Certificate","type_en":"ประกาศนียบัตรมัธยมศึกษาตอนปลาย"},{"typeid":"bd        ","type_th":"Bachelor Degrees","type_en":"ระดับปริญญาตรี"},{"typeid":"md        ","type_th":"Master Degrees","type_en":"ปริญญาโท    "},{"typeid":"dd        ","type_th":"Doctor Degrees","type_en":"ปริญญาเอก"},{"typeid":"hdd       ","type_th":"Honorary Doctorate Degree ","type_en":"ปริญญาดุษฎีบัณฑิตกิตติมศักดิ์"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    Data? data,
    List<Type>? type,}){
    _screeninfo = screeninfo;
    _data = data;
    _type = type;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['type'] != null) {
      _type = [];
      json['type'].forEach((v) {
        _type?.add(Type.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  Data? _data;
  List<Type>? _type;
  Body copyWith({  Screeninfo? screeninfo,
    Data? data,
    List<Type>? type,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    data: data ?? _data,
    type: type ?? _type,
  );
  Screeninfo? get screeninfo => _screeninfo;
  Data? get data => _data;
  List<Type>? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_type != null) {
      map['type'] = _type?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// typeid : "hsc       "
/// type_th : "High School Certificate"
/// type_en : "ประกาศนียบัตรมัธยมศึกษาตอนปลาย"

Type typeFromJson(String str) => Type.fromJson(json.decode(str));
String typeToJson(Type data) => json.encode(data.toJson());
class Type {
  Type({
    String? typeid,
    String? typeTh,
    String? typeEn,}){
    _typeid = typeid;
    _typeTh = typeTh;
    _typeEn = typeEn;
  }

  Type.fromJson(dynamic json) {
    _typeid = json['typeid'];
    _typeTh = json['type_th'];
    _typeEn = json['type_en'];
  }
  String? _typeid;
  String? _typeTh;
  String? _typeEn;
  Type copyWith({  String? typeid,
    String? typeTh,
    String? typeEn,
  }) => Type(  typeid: typeid ?? _typeid,
    typeTh: typeTh ?? _typeTh,
    typeEn: typeEn ?? _typeEn,
  );
  String? get typeid => _typeid;
  String? get typeTh => _typeTh;
  String? get typeEn => _typeEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['typeid'] = _typeid;
    map['type_th'] = _typeTh;
    map['type_en'] = _typeEn;
    return map;
  }

}

/// id : 1
/// orderchoose : 1
/// startdate : "Jun 2015"
/// enddate : "Jun 2018"
/// type : "HSC"
/// placeofstudy_th : "การศึกษาระดับมัธยมศึกษาตอนปลาย"
/// placeofstudy_en : "High school education"
/// detail_th : "วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์"
/// detail_en : "cience-mathematics Khamsaen Wittayasan School"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    int? id,
    int? orderchoose,
    String? startdate,
    String? enddate,
    String? type,
    String? placeofstudyTh,
    String? placeofstudyEn,
    String? detailTh,
    String? detailEn,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudyTh = placeofstudyTh;
    _placeofstudyEn = placeofstudyEn;
    _detailTh = detailTh;
    _detailEn = detailEn;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudyTh = json['placeofstudy_th'];
    _placeofstudyEn = json['placeofstudy_en'];
    _detailTh = json['detail_th'];
    _detailEn = json['detail_en'];
  }
  int? _id;
  int? _orderchoose;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudyTh;
  String? _placeofstudyEn;
  String? _detailTh;
  String? _detailEn;
  Data copyWith({  int? id,
    int? orderchoose,
    String? startdate,
    String? enddate,
    String? type,
    String? placeofstudyTh,
    String? placeofstudyEn,
    String? detailTh,
    String? detailEn,
  }) => Data(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    startdate: startdate ?? _startdate,
    enddate: enddate ?? _enddate,
    type: type ?? _type,
    placeofstudyTh: placeofstudyTh ?? _placeofstudyTh,
    placeofstudyEn: placeofstudyEn ?? _placeofstudyEn,
    detailTh: detailTh ?? _detailTh,
    detailEn: detailEn ?? _detailEn,
  );
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudyTh => _placeofstudyTh;
  String? get placeofstudyEn => _placeofstudyEn;
  String? get detailTh => _detailTh;
  String? get detailEn => _detailEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy_th'] = _placeofstudyTh;
    map['placeofstudy_en'] = _placeofstudyEn;
    map['detail_th'] = _detailTh;
    map['detail_en'] = _detailEn;
    return map;
  }

}

/// save : "บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// startdate_th : "วันเริ่มต้น"
/// enddate_th : "วันสิ้นสุด"
/// startdate_en : "Start date"
/// enddate_en : "End date"
/// type_th : "ประเภทการศึกษา"
/// type_en : "Education type"
/// placeofstudy_th : "สถานศึกษา"
/// placeofstudy_en : "Place name"
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
    String? startdateTh,
    String? enddateTh,
    String? startdateEn,
    String? enddateEn,
    String? typeTh,
    String? typeEn,
    String? placeofstudyTh,
    String? placeofstudyEn,
    String? detailTh,
    String? detailEn,
    String? deleteor,
    String? delete,}){
    _save = save;
    _editinfomations = editinfomations;
    _startdateTh = startdateTh;
    _enddateTh = enddateTh;
    _startdateEn = startdateEn;
    _enddateEn = enddateEn;
    _typeTh = typeTh;
    _typeEn = typeEn;
    _placeofstudyTh = placeofstudyTh;
    _placeofstudyEn = placeofstudyEn;
    _detailTh = detailTh;
    _detailEn = detailEn;
    _deleteor = deleteor;
    _delete = delete;
  }

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _startdateTh = json['startdate_th'];
    _enddateTh = json['enddate_th'];
    _startdateEn = json['startdate_en'];
    _enddateEn = json['enddate_en'];
    _typeTh = json['type_th'];
    _typeEn = json['type_en'];
    _placeofstudyTh = json['placeofstudy_th'];
    _placeofstudyEn = json['placeofstudy_en'];
    _detailTh = json['detail_th'];
    _detailEn = json['detail_en'];
    _deleteor = json['deleteor'];
    _delete = json['delete'];
  }
  String? _save;
  String? _editinfomations;
  String? _startdateTh;
  String? _enddateTh;
  String? _startdateEn;
  String? _enddateEn;
  String? _typeTh;
  String? _typeEn;
  String? _placeofstudyTh;
  String? _placeofstudyEn;
  String? _detailTh;
  String? _detailEn;
  String? _deleteor;
  String? _delete;
  Screeninfo copyWith({  String? save,
    String? editinfomations,
    String? startdateTh,
    String? enddateTh,
    String? startdateEn,
    String? enddateEn,
    String? typeTh,
    String? typeEn,
    String? placeofstudyTh,
    String? placeofstudyEn,
    String? detailTh,
    String? detailEn,
    String? deleteor,
    String? delete,
  }) => Screeninfo(  save: save ?? _save,
    editinfomations: editinfomations ?? _editinfomations,
    startdateTh: startdateTh ?? _startdateTh,
    enddateTh: enddateTh ?? _enddateTh,
    startdateEn: startdateEn ?? _startdateEn,
    enddateEn: enddateEn ?? _enddateEn,
    typeTh: typeTh ?? _typeTh,
    typeEn: typeEn ?? _typeEn,
    placeofstudyTh: placeofstudyTh ?? _placeofstudyTh,
    placeofstudyEn: placeofstudyEn ?? _placeofstudyEn,
    detailTh: detailTh ?? _detailTh,
    detailEn: detailEn ?? _detailEn,
    deleteor: deleteor ?? _deleteor,
    delete: delete ?? _delete,
  );
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get startdateTh => _startdateTh;
  String? get enddateTh => _enddateTh;
  String? get startdateEn => _startdateEn;
  String? get enddateEn => _enddateEn;
  String? get typeTh => _typeTh;
  String? get typeEn => _typeEn;
  String? get placeofstudyTh => _placeofstudyTh;
  String? get placeofstudyEn => _placeofstudyEn;
  String? get detailTh => _detailTh;
  String? get detailEn => _detailEn;
  String? get deleteor => _deleteor;
  String? get delete => _delete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['startdate_th'] = _startdateTh;
    map['enddate_th'] = _enddateTh;
    map['startdate_en'] = _startdateEn;
    map['enddate_en'] = _enddateEn;
    map['type_th'] = _typeTh;
    map['type_en'] = _typeEn;
    map['placeofstudy_th'] = _placeofstudyTh;
    map['placeofstudy_en'] = _placeofstudyEn;
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