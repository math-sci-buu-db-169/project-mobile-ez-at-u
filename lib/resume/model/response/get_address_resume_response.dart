import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","number":"บ้านเลขที่ / House no.","moo":"หมู่ / Moo","soi_th":"ซอย","road_th":"ถนน","subdistrict_th":"ตำบล","district_th":"อำเภอ","province_th":"จังหวัด","soi_en":"Soi","road_en":"Road","subdistrict_en":"Subdistrict","district_en":"District","province_en":"Province","zipcode":"รหัสไปรษณีย์ / Zip Code"},"data":{"role":"ST","number":"169","moo":"","soi":"","road":"string","subdistrict":"ลงหาดบางแสน แสนสุข","district":"เมือง","province":"ชลบุรี","soien":"","roaden":"","subdisteicten":"Long Hard-Bangsaen Road","districten":"Tambon Saensuk","provinceen":"Amphoe Muang","zipcode":"20131"}}

GetAddressResumeResponse getAddressResumeResponseFromJson(String str) => GetAddressResumeResponse.fromJson(json.decode(str));
String getAddressResumeResponseToJson(GetAddressResumeResponse data) => json.encode(data.toJson());
class GetAddressResumeResponse {
  GetAddressResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetAddressResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetAddressResumeResponse copyWith({  Head? head,
    Body? body,
  }) => GetAddressResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","number":"บ้านเลขที่ / House no.","moo":"หมู่ / Moo","soi_th":"ซอย","road_th":"ถนน","subdistrict_th":"ตำบล","district_th":"อำเภอ","province_th":"จังหวัด","soi_en":"Soi","road_en":"Road","subdistrict_en":"Subdistrict","district_en":"District","province_en":"Province","zipcode":"รหัสไปรษณีย์ / Zip Code"}
/// data : {"role":"ST","number":"169","moo":"","soi":"","road":"string","subdistrict":"ลงหาดบางแสน แสนสุข","district":"เมือง","province":"ชลบุรี","soien":"","roaden":"","subdisteicten":"Long Hard-Bangsaen Road","districten":"Tambon Saensuk","provinceen":"Amphoe Muang","zipcode":"20131"}

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

/// role : "ST"
/// number : "169"
/// moo : ""
/// soi : ""
/// road : "string"
/// subdistrict : "ลงหาดบางแสน แสนสุข"
/// district : "เมือง"
/// province : "ชลบุรี"
/// soien : ""
/// roaden : ""
/// subdisteicten : "Long Hard-Bangsaen Road"
/// districten : "Tambon Saensuk"
/// provinceen : "Amphoe Muang"
/// zipcode : "20131"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    String? role,
    String? number,
    String? moo,
    String? soi,
    String? road,
    String? subdistrict,
    String? district,
    String? province,
    String? soien,
    String? roaden,
    String? subdisteicten,
    String? districten,
    String? provinceen,
    String? zipcode,}){
    _role = role;
    _number = number;
    _moo = moo;
    _soi = soi;
    _road = road;
    _subdistrict = subdistrict;
    _district = district;
    _province = province;
    _soien = soien;
    _roaden = roaden;
    _subdisteicten = subdisteicten;
    _districten = districten;
    _provinceen = provinceen;
    _zipcode = zipcode;
  }

  Data.fromJson(dynamic json) {
    _role = json['role'];
    _number = json['number'];
    _moo = json['moo'];
    _soi = json['soi'];
    _road = json['road'];
    _subdistrict = json['subdistrict'];
    _district = json['district'];
    _province = json['province'];
    _soien = json['soien'];
    _roaden = json['roaden'];
    _subdisteicten = json['subdisteicten'];
    _districten = json['districten'];
    _provinceen = json['provinceen'];
    _zipcode = json['zipcode'];
  }
  String? _role;
  String? _number;
  String? _moo;
  String? _soi;
  String? _road;
  String? _subdistrict;
  String? _district;
  String? _province;
  String? _soien;
  String? _roaden;
  String? _subdisteicten;
  String? _districten;
  String? _provinceen;
  String? _zipcode;
  Data copyWith({  String? role,
    String? number,
    String? moo,
    String? soi,
    String? road,
    String? subdistrict,
    String? district,
    String? province,
    String? soien,
    String? roaden,
    String? subdisteicten,
    String? districten,
    String? provinceen,
    String? zipcode,
  }) => Data(  role: role ?? _role,
    number: number ?? _number,
    moo: moo ?? _moo,
    soi: soi ?? _soi,
    road: road ?? _road,
    subdistrict: subdistrict ?? _subdistrict,
    district: district ?? _district,
    province: province ?? _province,
    soien: soien ?? _soien,
    roaden: roaden ?? _roaden,
    subdisteicten: subdisteicten ?? _subdisteicten,
    districten: districten ?? _districten,
    provinceen: provinceen ?? _provinceen,
    zipcode: zipcode ?? _zipcode,
  );
  String? get role => _role;
  String? get number => _number;
  String? get moo => _moo;
  String? get soi => _soi;
  String? get road => _road;
  String? get subdistrict => _subdistrict;
  String? get district => _district;
  String? get province => _province;
  String? get soien => _soien;
  String? get roaden => _roaden;
  String? get subdisteicten => _subdisteicten;
  String? get districten => _districten;
  String? get provinceen => _provinceen;
  String? get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = _role;
    map['number'] = _number;
    map['moo'] = _moo;
    map['soi'] = _soi;
    map['road'] = _road;
    map['subdistrict'] = _subdistrict;
    map['district'] = _district;
    map['province'] = _province;
    map['soien'] = _soien;
    map['roaden'] = _roaden;
    map['subdisteicten'] = _subdisteicten;
    map['districten'] = _districten;
    map['provinceen'] = _provinceen;
    map['zipcode'] = _zipcode;
    return map;
  }

}

/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// number : "บ้านเลขที่ / House no."
/// moo : "หมู่ / Moo"
/// soi_th : "ซอย"
/// road_th : "ถนน"
/// subdistrict_th : "ตำบล"
/// district_th : "อำเภอ"
/// province_th : "จังหวัด"
/// soi_en : "Soi"
/// road_en : "Road"
/// subdistrict_en : "Subdistrict"
/// district_en : "District"
/// province_en : "Province"
/// zipcode : "รหัสไปรษณีย์ / Zip Code"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? save,
    String? editinfomations,
    String? number,
    String? moo,
    String? soiTh,
    String? roadTh,
    String? subdistrictTh,
    String? districtTh,
    String? provinceTh,
    String? soiEn,
    String? roadEn,
    String? subdistrictEn,
    String? districtEn,
    String? provinceEn,
    String? zipcode,}){
    _save = save;
    _editinfomations = editinfomations;
    _number = number;
    _moo = moo;
    _soiTh = soiTh;
    _roadTh = roadTh;
    _subdistrictTh = subdistrictTh;
    _districtTh = districtTh;
    _provinceTh = provinceTh;
    _soiEn = soiEn;
    _roadEn = roadEn;
    _subdistrictEn = subdistrictEn;
    _districtEn = districtEn;
    _provinceEn = provinceEn;
    _zipcode = zipcode;
  }

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _number = json['number'];
    _moo = json['moo'];
    _soiTh = json['soi_th'];
    _roadTh = json['road_th'];
    _subdistrictTh = json['subdistrict_th'];
    _districtTh = json['district_th'];
    _provinceTh = json['province_th'];
    _soiEn = json['soi_en'];
    _roadEn = json['road_en'];
    _subdistrictEn = json['subdistrict_en'];
    _districtEn = json['district_en'];
    _provinceEn = json['province_en'];
    _zipcode = json['zipcode'];
  }
  String? _save;
  String? _editinfomations;
  String? _number;
  String? _moo;
  String? _soiTh;
  String? _roadTh;
  String? _subdistrictTh;
  String? _districtTh;
  String? _provinceTh;
  String? _soiEn;
  String? _roadEn;
  String? _subdistrictEn;
  String? _districtEn;
  String? _provinceEn;
  String? _zipcode;
  Screeninfo copyWith({  String? save,
    String? editinfomations,
    String? number,
    String? moo,
    String? soiTh,
    String? roadTh,
    String? subdistrictTh,
    String? districtTh,
    String? provinceTh,
    String? soiEn,
    String? roadEn,
    String? subdistrictEn,
    String? districtEn,
    String? provinceEn,
    String? zipcode,
  }) => Screeninfo(  save: save ?? _save,
    editinfomations: editinfomations ?? _editinfomations,
    number: number ?? _number,
    moo: moo ?? _moo,
    soiTh: soiTh ?? _soiTh,
    roadTh: roadTh ?? _roadTh,
    subdistrictTh: subdistrictTh ?? _subdistrictTh,
    districtTh: districtTh ?? _districtTh,
    provinceTh: provinceTh ?? _provinceTh,
    soiEn: soiEn ?? _soiEn,
    roadEn: roadEn ?? _roadEn,
    subdistrictEn: subdistrictEn ?? _subdistrictEn,
    districtEn: districtEn ?? _districtEn,
    provinceEn: provinceEn ?? _provinceEn,
    zipcode: zipcode ?? _zipcode,
  );
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get number => _number;
  String? get moo => _moo;
  String? get soiTh => _soiTh;
  String? get roadTh => _roadTh;
  String? get subdistrictTh => _subdistrictTh;
  String? get districtTh => _districtTh;
  String? get provinceTh => _provinceTh;
  String? get soiEn => _soiEn;
  String? get roadEn => _roadEn;
  String? get subdistrictEn => _subdistrictEn;
  String? get districtEn => _districtEn;
  String? get provinceEn => _provinceEn;
  String? get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['number'] = _number;
    map['moo'] = _moo;
    map['soi_th'] = _soiTh;
    map['road_th'] = _roadTh;
    map['subdistrict_th'] = _subdistrictTh;
    map['district_th'] = _districtTh;
    map['province_th'] = _provinceTh;
    map['soi_en'] = _soiEn;
    map['road_en'] = _roadEn;
    map['subdistrict_en'] = _subdistrictEn;
    map['district_en'] = _districtEn;
    map['province_en'] = _provinceEn;
    map['zipcode'] = _zipcode;
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