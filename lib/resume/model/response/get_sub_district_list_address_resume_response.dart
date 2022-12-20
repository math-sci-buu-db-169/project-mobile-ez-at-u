import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"tambonlist":[{"tambonid":390201,"tambonnameth":"นากลาง","tambonnameen":"Na Klang"},{"tambonid":390202,"tambonnameth":"ด่านช้าง","tambonnameen":"Dan Chang"},{"tambonid":390205,"tambonnameth":"กุดดินจี่","tambonnameen":"Kut Din Chi"},{"tambonid":390206,"tambonnameth":"ฝั่งแดง","tambonnameen":"Fang Daeng"},{"tambonid":390207,"tambonnameth":"เก่ากลอย","tambonnameen":"Kao Kloi"},{"tambonid":390209,"tambonnameth":"โนนเมือง","tambonnameen":"Non Mueang"},{"tambonid":390210,"tambonnameth":"อุทัยสวรรค์","tambonnameen":"Uthai Sawan"},{"tambonid":390211,"tambonnameth":"ดงสวรรค์","tambonnameen":"Dong Sawan"},{"tambonid":390213,"tambonnameth":"กุดแห่","tambonnameen":"Kut Hae"}]}

GetSubDistrictListAddressResumeResponse getSubDistrictListAddressResumeResponseFromJson(String str) => GetSubDistrictListAddressResumeResponse.fromJson(json.decode(str));
String getSubDistrictListAddressResumeResponseToJson(GetSubDistrictListAddressResumeResponse data) => json.encode(data.toJson());
class GetSubDistrictListAddressResumeResponse {
  GetSubDistrictListAddressResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetSubDistrictListAddressResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetSubDistrictListAddressResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetSubDistrictListAddressResumeResponse(  head: head ?? _head,
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

/// tambonlist : [{"tambonid":390201,"tambonnameth":"นากลาง","tambonnameen":"Na Klang"},{"tambonid":390202,"tambonnameth":"ด่านช้าง","tambonnameen":"Dan Chang"},{"tambonid":390205,"tambonnameth":"กุดดินจี่","tambonnameen":"Kut Din Chi"},{"tambonid":390206,"tambonnameth":"ฝั่งแดง","tambonnameen":"Fang Daeng"},{"tambonid":390207,"tambonnameth":"เก่ากลอย","tambonnameen":"Kao Kloi"},{"tambonid":390209,"tambonnameth":"โนนเมือง","tambonnameen":"Non Mueang"},{"tambonid":390210,"tambonnameth":"อุทัยสวรรค์","tambonnameen":"Uthai Sawan"},{"tambonid":390211,"tambonnameth":"ดงสวรรค์","tambonnameen":"Dong Sawan"},{"tambonid":390213,"tambonnameth":"กุดแห่","tambonnameen":"Kut Hae"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      List<Tambonlist>? tambonlist,}){
    _tambonlist = tambonlist;
}

  Body.fromJson(dynamic json) {
    if (json['tambonlist'] != null) {
      _tambonlist = [];
      json['tambonlist'].forEach((v) {
        _tambonlist?.add(Tambonlist.fromJson(v));
      });
    }
  }
  List<Tambonlist>? _tambonlist;
Body copyWith({  List<Tambonlist>? tambonlist,
}) => Body(  tambonlist: tambonlist ?? _tambonlist,
);
  List<Tambonlist>? get tambonlist => _tambonlist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tambonlist != null) {
      map['tambonlist'] = _tambonlist?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// tambonid : 390201
/// tambonnameth : "นากลาง"
/// tambonnameen : "Na Klang"

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