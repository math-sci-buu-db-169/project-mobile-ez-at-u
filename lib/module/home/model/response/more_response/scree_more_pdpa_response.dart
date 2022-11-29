import 'dart:convert';

/// head : {"status":"200","message":"success","module":"home"}
/// body : {"screeninfo":{"texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"}}

ScreenMorePDPAResponse screenMorePDPAesponseFromJson(String str) => ScreenMorePDPAResponse.fromJson(json.decode(str));
String screenMorePDPAesponseToJson(ScreenMorePDPAResponse data) => json.encode(data.toJson());

class ScreenMorePDPAResponse {
  ScreenMorePDPAResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMorePDPAResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMorePDPAResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMorePDPAResponse(
        head: head ?? _head,
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

/// screeninfo : {"titlepdpa":"Terms and conditions","btnaccept":"Accept","btndecline":"Decline","textcheckbox":"ยอมรับเงื่อนไขและข้อตกลง"}
/// data : {"pdpaversion":"1.0.1","pdpaurl":"https://webzbinaryz.web.app/pdpa","versionuse":"1"}

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

/// pdpaversion : "1.0.1"
/// pdpaurl : "https://webzbinaryz.web.app/pdpa"
/// versionuse : "1"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    String? pdpaversion,
    String? pdpaurl,
    String? versionuse,}){
    _pdpaversion = pdpaversion;
    _pdpaurl = pdpaurl;
    _versionuse = versionuse;
  }

  Data.fromJson(dynamic json) {
    _pdpaversion = json['pdpaversion'];
    _pdpaurl = json['pdpaurl'];
    _versionuse = json['versionuse'];
  }
  String? _pdpaversion;
  String? _pdpaurl;
  String? _versionuse;
  Data copyWith({  String? pdpaversion,
    String? pdpaurl,
    String? versionuse,
  }) => Data(  pdpaversion: pdpaversion ?? _pdpaversion,
    pdpaurl: pdpaurl ?? _pdpaurl,
    versionuse: versionuse ?? _versionuse,
  );
  String? get pdpaversion => _pdpaversion;
  String? get pdpaurl => _pdpaurl;
  String? get versionuse => _versionuse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pdpaversion'] = _pdpaversion;
    map['pdpaurl'] = _pdpaurl;
    map['versionuse'] = _versionuse;
    return map;
  }

}

/// titlepdpa : "Terms and conditions"
/// btnaccept : "Accept"
/// btndecline : "Decline"
/// textcheckbox : "ยอมรับเงื่อนไขและข้อตกลง"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? titlepdpa,
    String? btnaccept,
    String? btndecline,
    String? textcheckbox,}){
    _titlepdpa = titlepdpa;
    _btnaccept = btnaccept;
    _btndecline = btndecline;
    _textcheckbox = textcheckbox;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlepdpa = json['titlepdpa'];
    _btnaccept = json['btnaccept'];
    _btndecline = json['btndecline'];
    _textcheckbox = json['textcheckbox'];
  }
  String? _titlepdpa;
  String? _btnaccept;
  String? _btndecline;
  String? _textcheckbox;
  Screeninfo copyWith({  String? titlepdpa,
    String? btnaccept,
    String? btndecline,
    String? textcheckbox,
  }) => Screeninfo(  titlepdpa: titlepdpa ?? _titlepdpa,
    btnaccept: btnaccept ?? _btnaccept,
    btndecline: btndecline ?? _btndecline,
    textcheckbox: textcheckbox ?? _textcheckbox,
  );
  String? get titlepdpa => _titlepdpa;
  String? get btnaccept => _btnaccept;
  String? get btndecline => _btndecline;
  String? get textcheckbox => _textcheckbox;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlepdpa'] = _titlepdpa;
    map['btnaccept'] = _btnaccept;
    map['btndecline'] = _btndecline;
    map['textcheckbox'] = _textcheckbox;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "home"
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