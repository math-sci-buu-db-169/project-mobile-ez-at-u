import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","number":"บ้านเลขที่ / House no.","moo":"หมู่ / Moo","soi_th":"ซอย","road_th":"ถนน","subdistrict_th":"ตำบล","district_th":"อำเภอ","province_th":"จังหวัด","soi_en":"Soi","road_en":"Road","subdistrict_en":"Subdistrict","district_en":"District","province_en":"Province","zipcode":"รหัสไปรษณีย์ / Zip Code"},"data":{"number":"num","moo":"mo","soi_th":"so","soi_en":"soi","road_th":"ro","road_en":"road","subdistrict_id":"390206","district_id":"3902","province_id":"39","subdistrict_th":"ฝั่งแดง","district_th":"นากลาง","province_th":"หนองบัวลำภู","subdistrict_en":"Fang Daeng","district_en":"Na Klang","province_en":"Nong Bua Lam Phu","zipcode":"39170","onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":true,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true}}

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

/// screeninfo : {"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","number":"บ้านเลขที่ / House no.","moo":"หมู่ / Moo","soi_th":"ซอย","road_th":"ถนน","subdistrict_th":"ตำบล","district_th":"อำเภอ","province_th":"จังหวัด","soi_en":"Soi","road_en":"Road","subdistrict_en":"Subdistrict","district_en":"District","province_en":"Province","zipcode":"รหัสไปรษณีย์ / Zip Code"}
/// data : {"number":"num","moo":"mo","soi_th":"so","soi_en":"soi","road_th":"ro","road_en":"road","subdistrict_id":"390206","district_id":"3902","province_id":"39","subdistrict_th":"ฝั่งแดง","district_th":"นากลาง","province_th":"หนองบัวลำภู","subdistrict_en":"Fang Daeng","district_en":"Na Klang","province_en":"Nong Bua Lam Phu","zipcode":"39170","onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":true,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true}

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

/// number : "num"
/// moo : "mo"
/// soi_th : "so"
/// soi_en : "soi"
/// road_th : "ro"
/// road_en : "road"
/// subdistrict_id : "390206"
/// district_id : "3902"
/// province_id : "39"
/// subdistrict_th : "ฝั่งแดง"
/// district_th : "นากลาง"
/// province_th : "หนองบัวลำภู"
/// subdistrict_en : "Fang Daeng"
/// district_en : "Na Klang"
/// province_en : "Nong Bua Lam Phu"
/// zipcode : "39170"
/// onselected_number : false
/// onselected_moo : false
/// onselected_soi : false
/// onselected_road : true
/// onselected_subdistrict : true
/// onselected_district : true
/// onselected_province : true
/// onselected_zipcode : true

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? number, 
      String? moo, 
      String? soiTh, 
      String? soiEn, 
      String? roadTh, 
      String? roadEn, 
      String? subdistrictId, 
      String? districtId, 
      String? provinceId, 
      String? subdistrictTh, 
      String? districtTh, 
      String? provinceTh, 
      String? subdistrictEn, 
      String? districtEn, 
      String? provinceEn, 
      String? zipcode, 
      bool? onselectedNumber, 
      bool? onselectedMoo, 
      bool? onselectedSoi, 
      bool? onselectedRoad, 
      bool? onselectedSubdistrict, 
      bool? onselectedDistrict, 
      bool? onselectedProvince, 
      bool? onselectedZipcode,}){
    _number = number;
    _moo = moo;
    _soiTh = soiTh;
    _soiEn = soiEn;
    _roadTh = roadTh;
    _roadEn = roadEn;
    _subdistrictId = subdistrictId;
    _districtId = districtId;
    _provinceId = provinceId;
    _subdistrictTh = subdistrictTh;
    _districtTh = districtTh;
    _provinceTh = provinceTh;
    _subdistrictEn = subdistrictEn;
    _districtEn = districtEn;
    _provinceEn = provinceEn;
    _zipcode = zipcode;
    _onselectedNumber = onselectedNumber;
    _onselectedMoo = onselectedMoo;
    _onselectedSoi = onselectedSoi;
    _onselectedRoad = onselectedRoad;
    _onselectedSubdistrict = onselectedSubdistrict;
    _onselectedDistrict = onselectedDistrict;
    _onselectedProvince = onselectedProvince;
    _onselectedZipcode = onselectedZipcode;
}

  Data.fromJson(dynamic json) {
    _number = json['number'];
    _moo = json['moo'];
    _soiTh = json['soi_th'];
    _soiEn = json['soi_en'];
    _roadTh = json['road_th'];
    _roadEn = json['road_en'];
    _subdistrictId = json['subdistrict_id'];
    _districtId = json['district_id'];
    _provinceId = json['province_id'];
    _subdistrictTh = json['subdistrict_th'];
    _districtTh = json['district_th'];
    _provinceTh = json['province_th'];
    _subdistrictEn = json['subdistrict_en'];
    _districtEn = json['district_en'];
    _provinceEn = json['province_en'];
    _zipcode = json['zipcode'];
    _onselectedNumber = json['onselected_number'];
    _onselectedMoo = json['onselected_moo'];
    _onselectedSoi = json['onselected_soi'];
    _onselectedRoad = json['onselected_road'];
    _onselectedSubdistrict = json['onselected_subdistrict'];
    _onselectedDistrict = json['onselected_district'];
    _onselectedProvince = json['onselected_province'];
    _onselectedZipcode = json['onselected_zipcode'];
  }
  String? _number;
  String? _moo;
  String? _soiTh;
  String? _soiEn;
  String? _roadTh;
  String? _roadEn;
  String? _subdistrictId;
  String? _districtId;
  String? _provinceId;
  String? _subdistrictTh;
  String? _districtTh;
  String? _provinceTh;
  String? _subdistrictEn;
  String? _districtEn;
  String? _provinceEn;
  String? _zipcode;
  bool? _onselectedNumber;
  bool? _onselectedMoo;
  bool? _onselectedSoi;
  bool? _onselectedRoad;
  bool? _onselectedSubdistrict;
  bool? _onselectedDistrict;
  bool? _onselectedProvince;
  bool? _onselectedZipcode;
Data copyWith({  String? number,
  String? moo,
  String? soiTh,
  String? soiEn,
  String? roadTh,
  String? roadEn,
  String? subdistrictId,
  String? districtId,
  String? provinceId,
  String? subdistrictTh,
  String? districtTh,
  String? provinceTh,
  String? subdistrictEn,
  String? districtEn,
  String? provinceEn,
  String? zipcode,
  bool? onselectedNumber,
  bool? onselectedMoo,
  bool? onselectedSoi,
  bool? onselectedRoad,
  bool? onselectedSubdistrict,
  bool? onselectedDistrict,
  bool? onselectedProvince,
  bool? onselectedZipcode,
}) => Data(  number: number ?? _number,
  moo: moo ?? _moo,
  soiTh: soiTh ?? _soiTh,
  soiEn: soiEn ?? _soiEn,
  roadTh: roadTh ?? _roadTh,
  roadEn: roadEn ?? _roadEn,
  subdistrictId: subdistrictId ?? _subdistrictId,
  districtId: districtId ?? _districtId,
  provinceId: provinceId ?? _provinceId,
  subdistrictTh: subdistrictTh ?? _subdistrictTh,
  districtTh: districtTh ?? _districtTh,
  provinceTh: provinceTh ?? _provinceTh,
  subdistrictEn: subdistrictEn ?? _subdistrictEn,
  districtEn: districtEn ?? _districtEn,
  provinceEn: provinceEn ?? _provinceEn,
  zipcode: zipcode ?? _zipcode,
  onselectedNumber: onselectedNumber ?? _onselectedNumber,
  onselectedMoo: onselectedMoo ?? _onselectedMoo,
  onselectedSoi: onselectedSoi ?? _onselectedSoi,
  onselectedRoad: onselectedRoad ?? _onselectedRoad,
  onselectedSubdistrict: onselectedSubdistrict ?? _onselectedSubdistrict,
  onselectedDistrict: onselectedDistrict ?? _onselectedDistrict,
  onselectedProvince: onselectedProvince ?? _onselectedProvince,
  onselectedZipcode: onselectedZipcode ?? _onselectedZipcode,
);
  String? get number => _number;
  String? get moo => _moo;
  String? get soiTh => _soiTh;
  String? get soiEn => _soiEn;
  String? get roadTh => _roadTh;
  String? get roadEn => _roadEn;
  String? get subdistrictId => _subdistrictId;
  String? get districtId => _districtId;
  String? get provinceId => _provinceId;
  String? get subdistrictTh => _subdistrictTh;
  String? get districtTh => _districtTh;
  String? get provinceTh => _provinceTh;
  String? get subdistrictEn => _subdistrictEn;
  String? get districtEn => _districtEn;
  String? get provinceEn => _provinceEn;
  String? get zipcode => _zipcode;
  bool? get onselectedNumber => _onselectedNumber;
  bool? get onselectedMoo => _onselectedMoo;
  bool? get onselectedSoi => _onselectedSoi;
  bool? get onselectedRoad => _onselectedRoad;
  bool? get onselectedSubdistrict => _onselectedSubdistrict;
  bool? get onselectedDistrict => _onselectedDistrict;
  bool? get onselectedProvince => _onselectedProvince;
  bool? get onselectedZipcode => _onselectedZipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['moo'] = _moo;
    map['soi_th'] = _soiTh;
    map['soi_en'] = _soiEn;
    map['road_th'] = _roadTh;
    map['road_en'] = _roadEn;
    map['subdistrict_id'] = _subdistrictId;
    map['district_id'] = _districtId;
    map['province_id'] = _provinceId;
    map['subdistrict_th'] = _subdistrictTh;
    map['district_th'] = _districtTh;
    map['province_th'] = _provinceTh;
    map['subdistrict_en'] = _subdistrictEn;
    map['district_en'] = _districtEn;
    map['province_en'] = _provinceEn;
    map['zipcode'] = _zipcode;
    map['onselected_number'] = _onselectedNumber;
    map['onselected_moo'] = _onselectedMoo;
    map['onselected_soi'] = _onselectedSoi;
    map['onselected_road'] = _onselectedRoad;
    map['onselected_subdistrict'] = _onselectedSubdistrict;
    map['onselected_district'] = _onselectedDistrict;
    map['onselected_province'] = _onselectedProvince;
    map['onselected_zipcode'] = _onselectedZipcode;
    return map;
  }

}

/// save : "บันทึก"
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