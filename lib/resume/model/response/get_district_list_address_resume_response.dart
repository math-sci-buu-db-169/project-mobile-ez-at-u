import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"districtlist":[{"districtid":6401,"districtnameth":"เมืองสุโขทัย","districtnameen":"Mueang Sukhothai"},{"districtid":6402,"districtnameth":"บ้านด่านลานหอย","districtnameen":"Ban Dan Lan Hoi"},{"districtid":6403,"districtnameth":"คีรีมาศ","districtnameen":"Khiri Mat"},{"districtid":6404,"districtnameth":"กงไกรลาศ","districtnameen":"Kong Krailat"},{"districtid":6405,"districtnameth":"ศรีสัชนาลัย","districtnameen":"Si Satchanalai"},{"districtid":6406,"districtnameth":"ศรีสำโรง","districtnameen":"Si Samrong"},{"districtid":6407,"districtnameth":"สวรรคโลก","districtnameen":"Sawankhalok"},{"districtid":6408,"districtnameth":"ศรีนคร","districtnameen":"Si Nakhon"},{"districtid":6409,"districtnameth":"ทุ่งเสลี่ยม","districtnameen":"Thung Saliam"}]}

GetDistrictListAddressResumeResponse getDistrictListAddressResumeResponseFromJson(String str) => GetDistrictListAddressResumeResponse.fromJson(json.decode(str));
String getDistrictListAddressResumeResponseToJson(GetDistrictListAddressResumeResponse data) => json.encode(data.toJson());
class GetDistrictListAddressResumeResponse {
  GetDistrictListAddressResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetDistrictListAddressResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetDistrictListAddressResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetDistrictListAddressResumeResponse(  head: head ?? _head,
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

/// districtlist : [{"districtid":6401,"districtnameth":"เมืองสุโขทัย","districtnameen":"Mueang Sukhothai"},{"districtid":6402,"districtnameth":"บ้านด่านลานหอย","districtnameen":"Ban Dan Lan Hoi"},{"districtid":6403,"districtnameth":"คีรีมาศ","districtnameen":"Khiri Mat"},{"districtid":6404,"districtnameth":"กงไกรลาศ","districtnameen":"Kong Krailat"},{"districtid":6405,"districtnameth":"ศรีสัชนาลัย","districtnameen":"Si Satchanalai"},{"districtid":6406,"districtnameth":"ศรีสำโรง","districtnameen":"Si Samrong"},{"districtid":6407,"districtnameth":"สวรรคโลก","districtnameen":"Sawankhalok"},{"districtid":6408,"districtnameth":"ศรีนคร","districtnameen":"Si Nakhon"},{"districtid":6409,"districtnameth":"ทุ่งเสลี่ยม","districtnameen":"Thung Saliam"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      List<Districtlist>? districtlist,}){
    _districtlist = districtlist;
}

  Body.fromJson(dynamic json) {
    if (json['districtlist'] != null) {
      _districtlist = [];
      json['districtlist'].forEach((v) {
        _districtlist?.add(Districtlist.fromJson(v));
      });
    }
  }
  List<Districtlist>? _districtlist;
Body copyWith({  List<Districtlist>? districtlist,
}) => Body(  districtlist: districtlist ?? _districtlist,
);
  List<Districtlist>? get districtlist => _districtlist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_districtlist != null) {
      map['districtlist'] = _districtlist?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// districtid : 6401
/// districtnameth : "เมืองสุโขทัย"
/// districtnameen : "Mueang Sukhothai"

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