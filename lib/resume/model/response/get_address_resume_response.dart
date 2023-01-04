import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","deleteor":"Delete/ลบ","delete":"ลบ","number":"บ้านเลขที่ / House no.","moo":"หมู่ / Moo","soi_th":"ซอย","road_th":"ถนน","subdistrict_th":"ตำบล","district_th":"อำเภอ","province_th":"จังหวัด","soi_en":"Soi","road_en":"Road","subdistrict_en":"Subdistrict","district_en":"District","province_en":"Province","zipcode":"รหัสไปรษณีย์ / Zip Code"},"data":{"number":"169","moo":"","soi_th":"","soi_en":"","road_th":"","road_en":"","subdistrict_id":"200104","district_id":"2001","province_id":"20","subdistrict_th":"แสนสุข","district_th":"เมืองชลบุรี","province_th":"ชลบุรี","subdistrict_en":"Saen Suk","district_en":"Mueang Chon Buri","province_en":"Chon Buri","zipcode":"20130","onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":false,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true},"districtlist":[{"districtid":2001,"districtnameth":"เมืองชลบุรี","districtnameen":"Mueang Chon Buri"},{"districtid":2002,"districtnameth":"บ้านบึง","districtnameen":"Ban Bueng"},{"districtid":2003,"districtnameth":"หนองใหญ่","districtnameen":"Nong Yai"},{"districtid":2004,"districtnameth":"บางละมุง","districtnameen":"Bang Lamung"},{"districtid":2005,"districtnameth":"พานทอง","districtnameen":"Phan Thong"},{"districtid":2006,"districtnameth":"พนัสนิคม","districtnameen":"Phanat Nikhom"},{"districtid":2007,"districtnameth":"ศรีราชา","districtnameen":"Si Racha"},{"districtid":2008,"districtnameth":"เกาะสีชัง","districtnameen":"Ko Sichang"},{"districtid":2009,"districtnameth":"สัตหีบ","districtnameen":"Sattahip"},{"districtid":2010,"districtnameth":"บ่อทอง","districtnameen":"Bo Thong"},{"districtid":2011,"districtnameth":"เกาะจันทร์","districtnameen":"Ko Chan"}],"tambonlist":[{"tambonid":200101,"tambonnameth":"บางปลาสร้อย","tambonnameen":"Bang Pla Soi"},{"tambonid":200102,"tambonnameth":"มะขามหย่ง","tambonnameen":"Makham Yong"},{"tambonid":200103,"tambonnameth":"บ้านโขด","tambonnameen":"Ban Khot"},{"tambonid":200104,"tambonnameth":"แสนสุข","tambonnameen":"Saen Suk"},{"tambonid":200105,"tambonnameth":"บ้านสวน","tambonnameen":"Ban Suan"},{"tambonid":200106,"tambonnameth":"หนองรี","tambonnameen":"Nong Ri"},{"tambonid":200107,"tambonnameth":"นาป่า","tambonnameen":"Na Pa"},{"tambonid":200108,"tambonnameth":"หนองข้างคอก","tambonnameen":"Nong Khang Khok"},{"tambonid":200109,"tambonnameth":"ดอนหัวฬ่อ","tambonnameen":"Don Hua Lo"},{"tambonid":200110,"tambonnameth":"หนองไม้แดง","tambonnameen":"Nong Mai Daeng"},{"tambonid":200111,"tambonnameth":"บางทราย","tambonnameen":"Bang Sai"},{"tambonid":200112,"tambonnameth":"คลองตำหรุ","tambonnameen":"Khlong Tamru"},{"tambonid":200113,"tambonnameth":"เหมือง","tambonnameen":"Mueang"},{"tambonid":200114,"tambonnameth":"บ้านปึก","tambonnameen":"Ban Puek"},{"tambonid":200115,"tambonnameth":"ห้วยกะปิ","tambonnameen":"Huai Kapi"},{"tambonid":200116,"tambonnameth":"เสม็ด","tambonnameen":"Samet"},{"tambonid":200117,"tambonnameth":"อ่างศิลา","tambonnameen":"Ang Sila"},{"tambonid":200118,"tambonnameth":"สำนักบก","tambonnameen":"Samnak Bok"}],"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}}

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

/// screeninfo : {"save":"บันทึก","editinfomations":"แก้ไขข้อมูล","deleteor":"Delete/ลบ","delete":"ลบ","number":"บ้านเลขที่ / House no.","moo":"หมู่ / Moo","soi_th":"ซอย","road_th":"ถนน","subdistrict_th":"ตำบล","district_th":"อำเภอ","province_th":"จังหวัด","soi_en":"Soi","road_en":"Road","subdistrict_en":"Subdistrict","district_en":"District","province_en":"Province","zipcode":"รหัสไปรษณีย์ / Zip Code"}
/// data : {"number":"169","moo":"","soi_th":"","soi_en":"","road_th":"","road_en":"","subdistrict_id":"200104","district_id":"2001","province_id":"20","subdistrict_th":"แสนสุข","district_th":"เมืองชลบุรี","province_th":"ชลบุรี","subdistrict_en":"Saen Suk","district_en":"Mueang Chon Buri","province_en":"Chon Buri","zipcode":"20130","onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":false,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true}
/// districtlist : [{"districtid":2001,"districtnameth":"เมืองชลบุรี","districtnameen":"Mueang Chon Buri"},{"districtid":2002,"districtnameth":"บ้านบึง","districtnameen":"Ban Bueng"},{"districtid":2003,"districtnameth":"หนองใหญ่","districtnameen":"Nong Yai"},{"districtid":2004,"districtnameth":"บางละมุง","districtnameen":"Bang Lamung"},{"districtid":2005,"districtnameth":"พานทอง","districtnameen":"Phan Thong"},{"districtid":2006,"districtnameth":"พนัสนิคม","districtnameen":"Phanat Nikhom"},{"districtid":2007,"districtnameth":"ศรีราชา","districtnameen":"Si Racha"},{"districtid":2008,"districtnameth":"เกาะสีชัง","districtnameen":"Ko Sichang"},{"districtid":2009,"districtnameth":"สัตหีบ","districtnameen":"Sattahip"},{"districtid":2010,"districtnameth":"บ่อทอง","districtnameen":"Bo Thong"},{"districtid":2011,"districtnameth":"เกาะจันทร์","districtnameen":"Ko Chan"}]
/// tambonlist : [{"tambonid":200101,"tambonnameth":"บางปลาสร้อย","tambonnameen":"Bang Pla Soi"},{"tambonid":200102,"tambonnameth":"มะขามหย่ง","tambonnameen":"Makham Yong"},{"tambonid":200103,"tambonnameth":"บ้านโขด","tambonnameen":"Ban Khot"},{"tambonid":200104,"tambonnameth":"แสนสุข","tambonnameen":"Saen Suk"},{"tambonid":200105,"tambonnameth":"บ้านสวน","tambonnameen":"Ban Suan"},{"tambonid":200106,"tambonnameth":"หนองรี","tambonnameen":"Nong Ri"},{"tambonid":200107,"tambonnameth":"นาป่า","tambonnameen":"Na Pa"},{"tambonid":200108,"tambonnameth":"หนองข้างคอก","tambonnameen":"Nong Khang Khok"},{"tambonid":200109,"tambonnameth":"ดอนหัวฬ่อ","tambonnameen":"Don Hua Lo"},{"tambonid":200110,"tambonnameth":"หนองไม้แดง","tambonnameen":"Nong Mai Daeng"},{"tambonid":200111,"tambonnameth":"บางทราย","tambonnameen":"Bang Sai"},{"tambonid":200112,"tambonnameth":"คลองตำหรุ","tambonnameen":"Khlong Tamru"},{"tambonid":200113,"tambonnameth":"เหมือง","tambonnameen":"Mueang"},{"tambonid":200114,"tambonnameth":"บ้านปึก","tambonnameen":"Ban Puek"},{"tambonid":200115,"tambonnameth":"ห้วยกะปิ","tambonnameen":"Huai Kapi"},{"tambonid":200116,"tambonnameth":"เสม็ด","tambonnameen":"Samet"},{"tambonid":200117,"tambonnameth":"อ่างศิลา","tambonnameen":"Ang Sila"},{"tambonid":200118,"tambonnameth":"สำนักบก","tambonnameen":"Samnak Bok"}]
/// errorbutton : {"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"}
/// alertmessage : {"alertdeletedata_th":"คุณต้องการลบข้อมูลนี้ใช่หรือไม่?","alertdeletedata_en":"Do you want to delete this information?","alertsavedata_th":" คุณต้องการบันทึกข้อมูลนี้ใช่หรือไม่","alertsavedata_en":"Do you want to save this information?","completefields_th":"กรุณากรอกให้ครบทุกช่อง","completefields_en":"Please complete all fields."}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      Data? data, 
      List<Districtlist>? districtlist, 
      List<Tambonlist>? tambonlist, 
      Errorbutton? errorbutton, 
      Alertmessage? alertmessage,}){
    _screeninfo = screeninfo;
    _data = data;
    _districtlist = districtlist;
    _tambonlist = tambonlist;
    _errorbutton = errorbutton;
    _alertmessage = alertmessage;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['districtlist'] != null) {
      _districtlist = [];
      json['districtlist'].forEach((v) {
        _districtlist?.add(Districtlist.fromJson(v));
      });
    }
    if (json['tambonlist'] != null) {
      _tambonlist = [];
      json['tambonlist'].forEach((v) {
        _tambonlist?.add(Tambonlist.fromJson(v));
      });
    }
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _alertmessage = json['alertmessage'] != null ? Alertmessage.fromJson(json['alertmessage']) : null;
  }
  Screeninfo? _screeninfo;
  Data? _data;
  List<Districtlist>? _districtlist;
  List<Tambonlist>? _tambonlist;
  Errorbutton? _errorbutton;
  Alertmessage? _alertmessage;
Body copyWith({  Screeninfo? screeninfo,
  Data? data,
  List<Districtlist>? districtlist,
  List<Tambonlist>? tambonlist,
  Errorbutton? errorbutton,
  Alertmessage? alertmessage,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  data: data ?? _data,
  districtlist: districtlist ?? _districtlist,
  tambonlist: tambonlist ?? _tambonlist,
  errorbutton: errorbutton ?? _errorbutton,
  alertmessage: alertmessage ?? _alertmessage,
);
  Screeninfo? get screeninfo => _screeninfo;
  Data? get data => _data;
  List<Districtlist>? get districtlist => _districtlist;
  List<Tambonlist>? get tambonlist => _tambonlist;
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
    if (_districtlist != null) {
      map['districtlist'] = _districtlist?.map((v) => v.toJson()).toList();
    }
    if (_tambonlist != null) {
      map['tambonlist'] = _tambonlist?.map((v) => v.toJson()).toList();
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

/// tambonid : 200101
/// tambonnameth : "บางปลาสร้อย"
/// tambonnameen : "Bang Pla Soi"

Tambonlist tambonlistFromJson(String str) => Tambonlist.fromJson(json.decode(str));
String tambonlistToJson(Tambonlist data) => json.encode(data.toJson());
class Tambonlist {
  Tambonlist({
      int? tambonid, 
      String? tambonnameth, 
      String? tambonnameen,}){
    _tambonid = tambonid;
    _tambonnameth = tambonnameth;
    _tambonnameen = tambonnameen;
}

  Tambonlist.fromJson(dynamic json) {
    _tambonid = json['tambonid'];
    _tambonnameth = json['tambonnameth'];
    _tambonnameen = json['tambonnameen'];
  }
  int? _tambonid;
  String? _tambonnameth;
  String? _tambonnameen;
Tambonlist copyWith({  int? tambonid,
  String? tambonnameth,
  String? tambonnameen,
}) => Tambonlist(  tambonid: tambonid ?? _tambonid,
  tambonnameth: tambonnameth ?? _tambonnameth,
  tambonnameen: tambonnameen ?? _tambonnameen,
);
  int? get tambonid => _tambonid;
  String? get tambonnameth => _tambonnameth;
  String? get tambonnameen => _tambonnameen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tambonid'] = _tambonid;
    map['tambonnameth'] = _tambonnameth;
    map['tambonnameen'] = _tambonnameen;
    return map;
  }

}

/// districtid : 2001
/// districtnameth : "เมืองชลบุรี"
/// districtnameen : "Mueang Chon Buri"

Districtlist districtlistFromJson(String str) => Districtlist.fromJson(json.decode(str));
String districtlistToJson(Districtlist data) => json.encode(data.toJson());
class Districtlist {
  Districtlist({
      int? districtid, 
      String? districtnameth, 
      String? districtnameen,}){
    _districtid = districtid;
    _districtnameth = districtnameth;
    _districtnameen = districtnameen;
}

  Districtlist.fromJson(dynamic json) {
    _districtid = json['districtid'];
    _districtnameth = json['districtnameth'];
    _districtnameen = json['districtnameen'];
  }
  int? _districtid;
  String? _districtnameth;
  String? _districtnameen;
Districtlist copyWith({  int? districtid,
  String? districtnameth,
  String? districtnameen,
}) => Districtlist(  districtid: districtid ?? _districtid,
  districtnameth: districtnameth ?? _districtnameth,
  districtnameen: districtnameen ?? _districtnameen,
);
  int? get districtid => _districtid;
  String? get districtnameth => _districtnameth;
  String? get districtnameen => _districtnameen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['districtid'] = _districtid;
    map['districtnameth'] = _districtnameth;
    map['districtnameen'] = _districtnameen;
    return map;
  }

}

/// number : "169"
/// moo : ""
/// soi_th : ""
/// soi_en : ""
/// road_th : ""
/// road_en : ""
/// subdistrict_id : "200104"
/// district_id : "2001"
/// province_id : "20"
/// subdistrict_th : "แสนสุข"
/// district_th : "เมืองชลบุรี"
/// province_th : "ชลบุรี"
/// subdistrict_en : "Saen Suk"
/// district_en : "Mueang Chon Buri"
/// province_en : "Chon Buri"
/// zipcode : "20130"
/// onselected_number : false
/// onselected_moo : false
/// onselected_soi : false
/// onselected_road : false
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
/// deleteor : "Delete/ลบ"
/// delete : "ลบ"
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
      String? deleteor, 
      String? delete, 
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
    _deleteor = deleteor;
    _delete = delete;
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
    _deleteor = json['deleteor'];
    _delete = json['delete'];
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
  String? _deleteor;
  String? _delete;
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
  String? deleteor,
  String? delete,
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
  deleteor: deleteor ?? _deleteor,
  delete: delete ?? _delete,
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
  String? get deleteor => _deleteor;
  String? get delete => _delete;
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
    map['deleteor'] = _deleteor;
    map['delete'] = _delete;
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