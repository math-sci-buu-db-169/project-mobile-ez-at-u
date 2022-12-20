import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"zipcode":"39170"}

GetZipCodeAddressResumeResponse getZipCodeAddressResumeResponseFromJson(String str) => GetZipCodeAddressResumeResponse.fromJson(json.decode(str));
String getZipCodeAddressResumeResponseToJson(GetZipCodeAddressResumeResponse data) => json.encode(data.toJson());
class GetZipCodeAddressResumeResponse {
  GetZipCodeAddressResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetZipCodeAddressResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetZipCodeAddressResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetZipCodeAddressResumeResponse(  head: head ?? _head,
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

/// zipcode : "39170"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      String? zipcode,}){
    _zipcode = zipcode;
}

  Body.fromJson(dynamic json) {
    _zipcode = json['zipcode'];
  }
  String? _zipcode;
Body copyWith({  String? zipcode,
}) => Body(  zipcode: zipcode ?? _zipcode,
);
  String? get zipcode => _zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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