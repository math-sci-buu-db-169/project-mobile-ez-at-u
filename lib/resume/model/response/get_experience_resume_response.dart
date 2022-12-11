import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","startdate_th":"วันเริ่มต้น","enddate_th":"วันสิ้นสุด","startdate_en":"Start date","enddate_en":"End date","type_th":"ประเภทการศึกษา","type_en":"Education type","placeofstudy_th":"สถานศึกษา","placeofstudy_en":"Place name","detail_th":null,"detail_en":null},"data":{"hsc":{"id":0,"orderchoose":1,"startdate":"Jun 2015","enddate":"Jun 2018","type":"HSC","placeofstudy":"การศึกษาระดับมัธยมศึกษาตอนปลาย","placeogstudyen":"High school education","detail":"วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์","detailen":"cience-mathematics Khamsaen Wittayasan School"},"bd":{"id":0,"orderchoose":1,"startdate":"Jun 2018","enddate":"Jun 2022","type":"BD","placeofstudy":"ปริญญาตรี","placeogstudyen":"Bachelor's degree","detail":"สาขาวิชาคณิตศาสตร์ ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา","detailen":"major in mathematics Department of Mathematics Faculty of Science Burapha University"},"md":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"dd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"hdd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null}}}

GetEducationResumeResumeResponse getEducationResumeResumeResponseFromJson(String str) => GetEducationResumeResumeResponse.fromJson(json.decode(str));
String getEducationResumeResumeResponseToJson(GetEducationResumeResumeResponse data) => json.encode(data.toJson());
class GetEducationResumeResumeResponse {
  GetEducationResumeResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetEducationResumeResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetEducationResumeResumeResponse copyWith({  Head? head,
    Body? body,
  }) => GetEducationResumeResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","startdate_th":"วันเริ่มต้น","enddate_th":"วันสิ้นสุด","startdate_en":"Start date","enddate_en":"End date","type_th":"ประเภทการศึกษา","type_en":"Education type","placeofstudy_th":"สถานศึกษา","placeofstudy_en":"Place name","detail_th":null,"detail_en":null}
/// data : {"hsc":{"id":0,"orderchoose":1,"startdate":"Jun 2015","enddate":"Jun 2018","type":"HSC","placeofstudy":"การศึกษาระดับมัธยมศึกษาตอนปลาย","placeogstudyen":"High school education","detail":"วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์","detailen":"cience-mathematics Khamsaen Wittayasan School"},"bd":{"id":0,"orderchoose":1,"startdate":"Jun 2018","enddate":"Jun 2022","type":"BD","placeofstudy":"ปริญญาตรี","placeogstudyen":"Bachelor's degree","detail":"สาขาวิชาคณิตศาสตร์ ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา","detailen":"major in mathematics Department of Mathematics Faculty of Science Burapha University"},"md":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"dd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null},"hdd":{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null}}

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

/// hsc : {"id":0,"orderchoose":1,"startdate":"Jun 2015","enddate":"Jun 2018","type":"HSC","placeofstudy":"การศึกษาระดับมัธยมศึกษาตอนปลาย","placeogstudyen":"High school education","detail":"วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์","detailen":"cience-mathematics Khamsaen Wittayasan School"}
/// bd : {"id":0,"orderchoose":1,"startdate":"Jun 2018","enddate":"Jun 2022","type":"BD","placeofstudy":"ปริญญาตรี","placeogstudyen":"Bachelor's degree","detail":"สาขาวิชาคณิตศาสตร์ ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา","detailen":"major in mathematics Department of Mathematics Faculty of Science Burapha University"}
/// md : {"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null}
/// dd : {"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null}
/// hdd : {"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":null,"placeofstudy":null,"placeogstudyen":null,"detail":null,"detailen":null}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    Hsc? hsc,
    Bd? bd,
    Md? md,
    Dd? dd,
    Hdd? hdd,}){
    _hsc = hsc;
    _bd = bd;
    _md = md;
    _dd = dd;
    _hdd = hdd;
  }

  Data.fromJson(dynamic json) {
    _hsc = json['hsc'] != null ? Hsc.fromJson(json['hsc']) : null;
    _bd = json['bd'] != null ? Bd.fromJson(json['bd']) : null;
    _md = json['md'] != null ? Md.fromJson(json['md']) : null;
    _dd = json['dd'] != null ? Dd.fromJson(json['dd']) : null;
    _hdd = json['hdd'] != null ? Hdd.fromJson(json['hdd']) : null;
  }
  Hsc? _hsc;
  Bd? _bd;
  Md? _md;
  Dd? _dd;
  Hdd? _hdd;
  Data copyWith({  Hsc? hsc,
    Bd? bd,
    Md? md,
    Dd? dd,
    Hdd? hdd,
  }) => Data(  hsc: hsc ?? _hsc,
    bd: bd ?? _bd,
    md: md ?? _md,
    dd: dd ?? _dd,
    hdd: hdd ?? _hdd,
  );
  Hsc? get hsc => _hsc;
  Bd? get bd => _bd;
  Md? get md => _md;
  Dd? get dd => _dd;
  Hdd? get hdd => _hdd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_hsc != null) {
      map['hsc'] = _hsc?.toJson();
    }
    if (_bd != null) {
      map['bd'] = _bd?.toJson();
    }
    if (_md != null) {
      map['md'] = _md?.toJson();
    }
    if (_dd != null) {
      map['dd'] = _dd?.toJson();
    }
    if (_hdd != null) {
      map['hdd'] = _hdd?.toJson();
    }
    return map;
  }

}

/// id : 0
/// orderchoose : 0
/// startdate : null
/// enddate : null
/// type : null
/// placeofstudy : null
/// placeogstudyen : null
/// detail : null
/// detailen : null

Hdd hddFromJson(String str) => Hdd.fromJson(json.decode(str));
String hddToJson(Hdd data) => json.encode(data.toJson());
class Hdd {
  Hdd({
    num? id,
    num? orderchoose,
    dynamic startdate,
    dynamic enddate,
    dynamic type,
    dynamic placeofstudy,
    dynamic placeogstudyen,
    dynamic detail,
    dynamic detailen,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _placeogstudyen = placeogstudyen;
    _detail = detail;
    _detailen = detailen;
  }

  Hdd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _placeogstudyen = json['placeogstudyen'];
    _detail = json['detail'];
    _detailen = json['detailen'];
  }
  num? _id;
  num? _orderchoose;
  dynamic _startdate;
  dynamic _enddate;
  dynamic _type;
  dynamic _placeofstudy;
  dynamic _placeogstudyen;
  dynamic _detail;
  dynamic _detailen;
  Hdd copyWith({  num? id,
    num? orderchoose,
    dynamic startdate,
    dynamic enddate,
    dynamic type,
    dynamic placeofstudy,
    dynamic placeogstudyen,
    dynamic detail,
    dynamic detailen,
  }) => Hdd(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    startdate: startdate ?? _startdate,
    enddate: enddate ?? _enddate,
    type: type ?? _type,
    placeofstudy: placeofstudy ?? _placeofstudy,
    placeogstudyen: placeogstudyen ?? _placeogstudyen,
    detail: detail ?? _detail,
    detailen: detailen ?? _detailen,
  );
  num? get id => _id;
  num? get orderchoose => _orderchoose;
  dynamic get startdate => _startdate;
  dynamic get enddate => _enddate;
  dynamic get type => _type;
  dynamic get placeofstudy => _placeofstudy;
  dynamic get placeogstudyen => _placeogstudyen;
  dynamic get detail => _detail;
  dynamic get detailen => _detailen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['placeogstudyen'] = _placeogstudyen;
    map['detail'] = _detail;
    map['detailen'] = _detailen;
    return map;
  }

}

/// id : 0
/// orderchoose : 0
/// startdate : null
/// enddate : null
/// type : null
/// placeofstudy : null
/// placeogstudyen : null
/// detail : null
/// detailen : null

Dd ddFromJson(String str) => Dd.fromJson(json.decode(str));
String ddToJson(Dd data) => json.encode(data.toJson());
class Dd {
  Dd({
    num? id,
    num? orderchoose,
    dynamic startdate,
    dynamic enddate,
    dynamic type,
    dynamic placeofstudy,
    dynamic placeogstudyen,
    dynamic detail,
    dynamic detailen,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _placeogstudyen = placeogstudyen;
    _detail = detail;
    _detailen = detailen;
  }

  Dd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _placeogstudyen = json['placeogstudyen'];
    _detail = json['detail'];
    _detailen = json['detailen'];
  }
  num? _id;
  num? _orderchoose;
  dynamic _startdate;
  dynamic _enddate;
  dynamic _type;
  dynamic _placeofstudy;
  dynamic _placeogstudyen;
  dynamic _detail;
  dynamic _detailen;
  Dd copyWith({  num? id,
    num? orderchoose,
    dynamic startdate,
    dynamic enddate,
    dynamic type,
    dynamic placeofstudy,
    dynamic placeogstudyen,
    dynamic detail,
    dynamic detailen,
  }) => Dd(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    startdate: startdate ?? _startdate,
    enddate: enddate ?? _enddate,
    type: type ?? _type,
    placeofstudy: placeofstudy ?? _placeofstudy,
    placeogstudyen: placeogstudyen ?? _placeogstudyen,
    detail: detail ?? _detail,
    detailen: detailen ?? _detailen,
  );
  num? get id => _id;
  num? get orderchoose => _orderchoose;
  dynamic get startdate => _startdate;
  dynamic get enddate => _enddate;
  dynamic get type => _type;
  dynamic get placeofstudy => _placeofstudy;
  dynamic get placeogstudyen => _placeogstudyen;
  dynamic get detail => _detail;
  dynamic get detailen => _detailen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['placeogstudyen'] = _placeogstudyen;
    map['detail'] = _detail;
    map['detailen'] = _detailen;
    return map;
  }

}

/// id : 0
/// orderchoose : 0
/// startdate : null
/// enddate : null
/// type : null
/// placeofstudy : null
/// placeogstudyen : null
/// detail : null
/// detailen : null

Md mdFromJson(String str) => Md.fromJson(json.decode(str));
String mdToJson(Md data) => json.encode(data.toJson());
class Md {
  Md({
    num? id,
    num? orderchoose,
    dynamic startdate,
    dynamic enddate,
    dynamic type,
    dynamic placeofstudy,
    dynamic placeogstudyen,
    dynamic detail,
    dynamic detailen,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _placeogstudyen = placeogstudyen;
    _detail = detail;
    _detailen = detailen;
  }

  Md.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _placeogstudyen = json['placeogstudyen'];
    _detail = json['detail'];
    _detailen = json['detailen'];
  }
  num? _id;
  num? _orderchoose;
  dynamic _startdate;
  dynamic _enddate;
  dynamic _type;
  dynamic _placeofstudy;
  dynamic _placeogstudyen;
  dynamic _detail;
  dynamic _detailen;
  Md copyWith({  num? id,
    num? orderchoose,
    dynamic startdate,
    dynamic enddate,
    dynamic type,
    dynamic placeofstudy,
    dynamic placeogstudyen,
    dynamic detail,
    dynamic detailen,
  }) => Md(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    startdate: startdate ?? _startdate,
    enddate: enddate ?? _enddate,
    type: type ?? _type,
    placeofstudy: placeofstudy ?? _placeofstudy,
    placeogstudyen: placeogstudyen ?? _placeogstudyen,
    detail: detail ?? _detail,
    detailen: detailen ?? _detailen,
  );
  num? get id => _id;
  num? get orderchoose => _orderchoose;
  dynamic get startdate => _startdate;
  dynamic get enddate => _enddate;
  dynamic get type => _type;
  dynamic get placeofstudy => _placeofstudy;
  dynamic get placeogstudyen => _placeogstudyen;
  dynamic get detail => _detail;
  dynamic get detailen => _detailen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['placeogstudyen'] = _placeogstudyen;
    map['detail'] = _detail;
    map['detailen'] = _detailen;
    return map;
  }

}

/// id : 0
/// orderchoose : 1
/// startdate : "Jun 2018"
/// enddate : "Jun 2022"
/// type : "BD"
/// placeofstudy : "ปริญญาตรี"
/// placeogstudyen : "Bachelor's degree"
/// detail : "สาขาวิชาคณิตศาสตร์ ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ มหาวิทยาลัยบูรพา"
/// detailen : "major in mathematics Department of Mathematics Faculty of Science Burapha University"

Bd bdFromJson(String str) => Bd.fromJson(json.decode(str));
String bdToJson(Bd data) => json.encode(data.toJson());
class Bd {
  Bd({
    num? id,
    num? orderchoose,
    String? startdate,
    String? enddate,
    String? type,
    String? placeofstudy,
    String? placeogstudyen,
    String? detail,
    String? detailen,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _placeogstudyen = placeogstudyen;
    _detail = detail;
    _detailen = detailen;
  }

  Bd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _placeogstudyen = json['placeogstudyen'];
    _detail = json['detail'];
    _detailen = json['detailen'];
  }
  num? _id;
  num? _orderchoose;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _placeogstudyen;
  String? _detail;
  String? _detailen;
  Bd copyWith({  num? id,
    num? orderchoose,
    String? startdate,
    String? enddate,
    String? type,
    String? placeofstudy,
    String? placeogstudyen,
    String? detail,
    String? detailen,
  }) => Bd(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    startdate: startdate ?? _startdate,
    enddate: enddate ?? _enddate,
    type: type ?? _type,
    placeofstudy: placeofstudy ?? _placeofstudy,
    placeogstudyen: placeogstudyen ?? _placeogstudyen,
    detail: detail ?? _detail,
    detailen: detailen ?? _detailen,
  );
  num? get id => _id;
  num? get orderchoose => _orderchoose;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get placeogstudyen => _placeogstudyen;
  String? get detail => _detail;
  String? get detailen => _detailen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['placeogstudyen'] = _placeogstudyen;
    map['detail'] = _detail;
    map['detailen'] = _detailen;
    return map;
  }

}

/// id : 0
/// orderchoose : 1
/// startdate : "Jun 2015"
/// enddate : "Jun 2018"
/// type : "HSC"
/// placeofstudy : "การศึกษาระดับมัธยมศึกษาตอนปลาย"
/// placeogstudyen : "High school education"
/// detail : "วิทย์-คณิต โรงเรียนคำแสนวิทยาสรรค์"
/// detailen : "cience-mathematics Khamsaen Wittayasan School"

Hsc hscFromJson(String str) => Hsc.fromJson(json.decode(str));
String hscToJson(Hsc data) => json.encode(data.toJson());
class Hsc {
  Hsc({
    num? id,
    num? orderchoose,
    String? startdate,
    String? enddate,
    String? type,
    String? placeofstudy,
    String? placeogstudyen,
    String? detail,
    String? detailen,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _placeogstudyen = placeogstudyen;
    _detail = detail;
    _detailen = detailen;
  }

  Hsc.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _placeogstudyen = json['placeogstudyen'];
    _detail = json['detail'];
    _detailen = json['detailen'];
  }
  num? _id;
  num? _orderchoose;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _placeogstudyen;
  String? _detail;
  String? _detailen;
  Hsc copyWith({  num? id,
    num? orderchoose,
    String? startdate,
    String? enddate,
    String? type,
    String? placeofstudy,
    String? placeogstudyen,
    String? detail,
    String? detailen,
  }) => Hsc(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    startdate: startdate ?? _startdate,
    enddate: enddate ?? _enddate,
    type: type ?? _type,
    placeofstudy: placeofstudy ?? _placeofstudy,
    placeogstudyen: placeogstudyen ?? _placeogstudyen,
    detail: detail ?? _detail,
    detailen: detailen ?? _detailen,
  );
  num? get id => _id;
  num? get orderchoose => _orderchoose;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get placeogstudyen => _placeogstudyen;
  String? get detail => _detail;
  String? get detailen => _detailen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['placeogstudyen'] = _placeogstudyen;
    map['detail'] = _detail;
    map['detailen'] = _detailen;
    return map;
  }

}

/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// startdate_th : "วันเริ่มต้น"
/// enddate_th : "วันสิ้นสุด"
/// startdate_en : "Start date"
/// enddate_en : "End date"
/// type_th : "ประเภทการศึกษา"
/// type_en : "Education type"
/// placeofstudy_th : "สถานศึกษา"
/// placeofstudy_en : "Place name"
/// detail_th : null
/// detail_en : null

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
    dynamic detailTh,
    dynamic detailEn,}){
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
  dynamic _detailTh;
  dynamic _detailEn;
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
    dynamic detailTh,
    dynamic detailEn,
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
  dynamic get detailTh => _detailTh;
  dynamic get detailEn => _detailEn;

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