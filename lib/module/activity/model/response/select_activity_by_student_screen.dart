import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity","timeexpire":false}
/// body : {"screeninfo":{"titleselectactivity":"Select activity","buttonselectactivity":"Select","textactivityname":"Activity name"},"activitynamelist":[{"activitynameidresponse":10,"activitynameresponse":"เพิ่มใน db","teacheridresponse":"DMOTC"},{"activitynameidresponse":9,"activitynameresponse":"TEST MB3","teacheridresponse":"DMOTC"},{"activitynameidresponse":8,"activitynameresponse":"เพิ่มโดยอาจารย์อภิสิทธิ์","teacheridresponse":"TCMM01"},{"activitynameidresponse":6,"activitynameresponse":"เพิ่มโดยอาจารย์ 2","teacheridresponse":"DMOTC"},{"activitynameidresponse":5,"activitynameresponse":"เพิ่มโดยอาจารย์ 1","teacheridresponse":"DMOTC"},{"activitynameidresponse":4,"activitynameresponse":"Test MB 2","teacheridresponse":"DMOTC"},{"activitynameidresponse":1,"activitynameresponse":"ทดสอบ 1","teacheridresponse":"DMOTC"}]}

SelectActivityByStudentScreenApi selectActivityByStudentScreenFromJson(String str) => SelectActivityByStudentScreenApi.fromJson(json.decode(str));
String selectActivityByStudentScreenToJson(SelectActivityByStudentScreenApi data) => json.encode(data.toJson());
class SelectActivityByStudentScreenApi {
  SelectActivityByStudentScreenApi({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  SelectActivityByStudentScreenApi.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
SelectActivityByStudentScreenApi copyWith({  Head? head,
  Body? body,
}) => SelectActivityByStudentScreenApi(  head: head ?? _head,
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

/// screeninfo : {"titleselectactivity":"Select activity","buttonselectactivity":"Select","textactivityname":"Activity name"}
/// activitynamelist : [{"activitynameidresponse":10,"activitynameresponse":"เพิ่มใน db","teacheridresponse":"DMOTC"},{"activitynameidresponse":9,"activitynameresponse":"TEST MB3","teacheridresponse":"DMOTC"},{"activitynameidresponse":8,"activitynameresponse":"เพิ่มโดยอาจารย์อภิสิทธิ์","teacheridresponse":"TCMM01"},{"activitynameidresponse":6,"activitynameresponse":"เพิ่มโดยอาจารย์ 2","teacheridresponse":"DMOTC"},{"activitynameidresponse":5,"activitynameresponse":"เพิ่มโดยอาจารย์ 1","teacheridresponse":"DMOTC"},{"activitynameidresponse":4,"activitynameresponse":"Test MB 2","teacheridresponse":"DMOTC"},{"activitynameidresponse":1,"activitynameresponse":"ทดสอบ 1","teacheridresponse":"DMOTC"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<Activitynamelist>? activitynamelist,}){
    _screeninfo = screeninfo;
    _activitynamelist = activitynamelist;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['activitynamelist'] != null) {
      _activitynamelist = [];
      json['activitynamelist'].forEach((v) {
        _activitynamelist?.add(Activitynamelist.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Activitynamelist>? _activitynamelist;
Body copyWith({  Screeninfo? screeninfo,
  List<Activitynamelist>? activitynamelist,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  activitynamelist: activitynamelist ?? _activitynamelist,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<Activitynamelist>? get activitynamelist => _activitynamelist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_activitynamelist != null) {
      map['activitynamelist'] = _activitynamelist?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// activitynameidresponse : 10
/// activitynameresponse : "เพิ่มใน db"
/// teacheridresponse : "DMOTC"

Activitynamelist activitynamelistFromJson(String str) => Activitynamelist.fromJson(json.decode(str));
String activitynamelistToJson(Activitynamelist data) => json.encode(data.toJson());
class Activitynamelist {
  Activitynamelist({
      num? activitynameidresponse, 
      String? activitynameresponse, 
      String? teacheridresponse,}){
    _activitynameidresponse = activitynameidresponse;
    _activitynameresponse = activitynameresponse;
    _teacheridresponse = teacheridresponse;
}

  Activitynamelist.fromJson(dynamic json) {
    _activitynameidresponse = json['activitynameidresponse'];
    _activitynameresponse = json['activitynameresponse'];
    _teacheridresponse = json['teacheridresponse'];
  }
  num? _activitynameidresponse;
  String? _activitynameresponse;
  String? _teacheridresponse;
Activitynamelist copyWith({  num? activitynameidresponse,
  String? activitynameresponse,
  String? teacheridresponse,
}) => Activitynamelist(  activitynameidresponse: activitynameidresponse ?? _activitynameidresponse,
  activitynameresponse: activitynameresponse ?? _activitynameresponse,
  teacheridresponse: teacheridresponse ?? _teacheridresponse,
);
  num? get activitynameidresponse => _activitynameidresponse;
  String? get activitynameresponse => _activitynameresponse;
  String? get teacheridresponse => _teacheridresponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activitynameidresponse'] = _activitynameidresponse;
    map['activitynameresponse'] = _activitynameresponse;
    map['teacheridresponse'] = _teacheridresponse;
    return map;
  }

}

/// titleselectactivity : "Select activity"
/// buttonselectactivity : "Select"
/// textactivityname : "Activity name"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titleselectactivity, 
      String? buttonselectactivity, 
      String? textactivityname,}){
    _titleselectactivity = titleselectactivity;
    _buttonselectactivity = buttonselectactivity;
    _textactivityname = textactivityname;
}

  Screeninfo.fromJson(dynamic json) {
    _titleselectactivity = json['titleselectactivity'];
    _buttonselectactivity = json['buttonselectactivity'];
    _textactivityname = json['textactivityname'];
  }
  String? _titleselectactivity;
  String? _buttonselectactivity;
  String? _textactivityname;
Screeninfo copyWith({  String? titleselectactivity,
  String? buttonselectactivity,
  String? textactivityname,
}) => Screeninfo(  titleselectactivity: titleselectactivity ?? _titleselectactivity,
  buttonselectactivity: buttonselectactivity ?? _buttonselectactivity,
  textactivityname: textactivityname ?? _textactivityname,
);
  String? get titleselectactivity => _titleselectactivity;
  String? get buttonselectactivity => _buttonselectactivity;
  String? get textactivityname => _textactivityname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleselectactivity'] = _titleselectactivity;
    map['buttonselectactivity'] = _buttonselectactivity;
    map['textactivityname'] = _textactivityname;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "activity"
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