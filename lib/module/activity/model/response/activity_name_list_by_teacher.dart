import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity","timeexpire":false}
/// body : {"screeninfo":{"titlelistactivityname":"รายชื่อกิจกรรม"},"activitynamelistteacher":[{"activitynameidresponse":5,"activitynameresponse":"Test add by swagger 2 edit","objectivesresponse":"1.to test add \n 2.to test edit","venueresponse":"Tonsai home","startdatebyteacherresponse":"11/12/2022","finishdatebyteacherresponse":"11/12/2022"},{"activitynameidresponse":4,"activitynameresponse":"Test add by swagger 1","objectivesresponse":"1.to test","venueresponse":"Tonsai home","startdatebyteacherresponse":"11/12/2022","finishdatebyteacherresponse":"11/12/2022"},{"activitynameidresponse":3,"activitynameresponse":"TEST3","objectivesresponse":"0000","venueresponse":"CCC","startdatebyteacherresponse":"12/12/2012","finishdatebyteacherresponse":"12/12/2012"},{"activitynameidresponse":2,"activitynameresponse":"TEST2","objectivesresponse":"67890","venueresponse":"BBB","startdatebyteacherresponse":"11/11/2011","finishdatebyteacherresponse":"11/11/2011"},{"activitynameidresponse":1,"activitynameresponse":"TEST1","objectivesresponse":"12345","venueresponse":"AAA","startdatebyteacherresponse":"10/10/2010","finishdatebyteacherresponse":"10/10/2010"}]}

ActivityNameListByTeacher activityNameListByTeacherFromJson(String str) => ActivityNameListByTeacher.fromJson(json.decode(str));
String activityNameListByTeacherToJson(ActivityNameListByTeacher data) => json.encode(data.toJson());
class ActivityNameListByTeacher {
  ActivityNameListByTeacher({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ActivityNameListByTeacher.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ActivityNameListByTeacher copyWith({  Head? head,
  Body? body,
}) => ActivityNameListByTeacher(  head: head ?? _head,
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

/// screeninfo : {"titlelistactivityname":"รายชื่อกิจกรรม"}
/// activitynamelistteacher : [{"activitynameidresponse":5,"activitynameresponse":"Test add by swagger 2 edit","objectivesresponse":"1.to test add \n 2.to test edit","venueresponse":"Tonsai home","startdatebyteacherresponse":"11/12/2022","finishdatebyteacherresponse":"11/12/2022"},{"activitynameidresponse":4,"activitynameresponse":"Test add by swagger 1","objectivesresponse":"1.to test","venueresponse":"Tonsai home","startdatebyteacherresponse":"11/12/2022","finishdatebyteacherresponse":"11/12/2022"},{"activitynameidresponse":3,"activitynameresponse":"TEST3","objectivesresponse":"0000","venueresponse":"CCC","startdatebyteacherresponse":"12/12/2012","finishdatebyteacherresponse":"12/12/2012"},{"activitynameidresponse":2,"activitynameresponse":"TEST2","objectivesresponse":"67890","venueresponse":"BBB","startdatebyteacherresponse":"11/11/2011","finishdatebyteacherresponse":"11/11/2011"},{"activitynameidresponse":1,"activitynameresponse":"TEST1","objectivesresponse":"12345","venueresponse":"AAA","startdatebyteacherresponse":"10/10/2010","finishdatebyteacherresponse":"10/10/2010"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<Activitynamelistteacher>? activitynamelistteacher,}){
    _screeninfo = screeninfo;
    _activitynamelistteacher = activitynamelistteacher;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['activitynamelistteacher'] != null) {
      _activitynamelistteacher = [];
      json['activitynamelistteacher'].forEach((v) {
        _activitynamelistteacher?.add(Activitynamelistteacher.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Activitynamelistteacher>? _activitynamelistteacher;
Body copyWith({  Screeninfo? screeninfo,
  List<Activitynamelistteacher>? activitynamelistteacher,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  activitynamelistteacher: activitynamelistteacher ?? _activitynamelistteacher,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<Activitynamelistteacher>? get activitynamelistteacher => _activitynamelistteacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_activitynamelistteacher != null) {
      map['activitynamelistteacher'] = _activitynamelistteacher?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// activitynameidresponse : 5
/// activitynameresponse : "Test add by swagger 2 edit"
/// objectivesresponse : "1.to test add \n 2.to test edit"
/// venueresponse : "Tonsai home"
/// startdatebyteacherresponse : "11/12/2022"
/// finishdatebyteacherresponse : "11/12/2022"

Activitynamelistteacher activitynamelistteacherFromJson(String str) => Activitynamelistteacher.fromJson(json.decode(str));
String activitynamelistteacherToJson(Activitynamelistteacher data) => json.encode(data.toJson());
class Activitynamelistteacher {
  Activitynamelistteacher({
      num? activitynameidresponse, 
      String? activitynameresponse, 
      String? objectivesresponse, 
      String? venueresponse, 
      String? startdatebyteacherresponse, 
      String? finishdatebyteacherresponse,}){
    _activitynameidresponse = activitynameidresponse;
    _activitynameresponse = activitynameresponse;
    _objectivesresponse = objectivesresponse;
    _venueresponse = venueresponse;
    _startdatebyteacherresponse = startdatebyteacherresponse;
    _finishdatebyteacherresponse = finishdatebyteacherresponse;
}

  Activitynamelistteacher.fromJson(dynamic json) {
    _activitynameidresponse = json['activitynameidresponse'];
    _activitynameresponse = json['activitynameresponse'];
    _objectivesresponse = json['objectivesresponse'];
    _venueresponse = json['venueresponse'];
    _startdatebyteacherresponse = json['startdatebyteacherresponse'];
    _finishdatebyteacherresponse = json['finishdatebyteacherresponse'];
  }
  num? _activitynameidresponse;
  String? _activitynameresponse;
  String? _objectivesresponse;
  String? _venueresponse;
  String? _startdatebyteacherresponse;
  String? _finishdatebyteacherresponse;
Activitynamelistteacher copyWith({  num? activitynameidresponse,
  String? activitynameresponse,
  String? objectivesresponse,
  String? venueresponse,
  String? startdatebyteacherresponse,
  String? finishdatebyteacherresponse,
}) => Activitynamelistteacher(  activitynameidresponse: activitynameidresponse ?? _activitynameidresponse,
  activitynameresponse: activitynameresponse ?? _activitynameresponse,
  objectivesresponse: objectivesresponse ?? _objectivesresponse,
  venueresponse: venueresponse ?? _venueresponse,
  startdatebyteacherresponse: startdatebyteacherresponse ?? _startdatebyteacherresponse,
  finishdatebyteacherresponse: finishdatebyteacherresponse ?? _finishdatebyteacherresponse,
);
  num? get activitynameidresponse => _activitynameidresponse;
  String? get activitynameresponse => _activitynameresponse;
  String? get objectivesresponse => _objectivesresponse;
  String? get venueresponse => _venueresponse;
  String? get startdatebyteacherresponse => _startdatebyteacherresponse;
  String? get finishdatebyteacherresponse => _finishdatebyteacherresponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activitynameidresponse'] = _activitynameidresponse;
    map['activitynameresponse'] = _activitynameresponse;
    map['objectivesresponse'] = _objectivesresponse;
    map['venueresponse'] = _venueresponse;
    map['startdatebyteacherresponse'] = _startdatebyteacherresponse;
    map['finishdatebyteacherresponse'] = _finishdatebyteacherresponse;
    return map;
  }

}

/// titlelistactivityname : "รายชื่อกิจกรรม"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titlelistactivityname,}){
    _titlelistactivityname = titlelistactivityname;
}

  Screeninfo.fromJson(dynamic json) {
    _titlelistactivityname = json['titlelistactivityname'];
  }
  String? _titlelistactivityname;
Screeninfo copyWith({  String? titlelistactivityname,
}) => Screeninfo(  titlelistactivityname: titlelistactivityname ?? _titlelistactivityname,
);
  String? get titlelistactivityname => _titlelistactivityname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlelistactivityname'] = _titlelistactivityname;
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