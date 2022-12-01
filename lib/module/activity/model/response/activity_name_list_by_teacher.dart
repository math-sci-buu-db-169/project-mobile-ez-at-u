import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity","timeexpire":false}
/// body : {"activitynamelistteacher":[{"activitynameidresponse":6,"activitynameresponse":"ทดลองเพิ่มกิจกรรมโดยอาจารย์ 6","objectivesresponse":"วัตถุประสงค์ที่ 1 เพื่อ... วัตถุประสงค์ที่ 2 เพื่อ... วัตถุประสงค์ที่ 3 เพื่อ...","startdatebyteacherresponse":"29/11/2022","finishdatebyteacherresponse":"29/11/2022"},{"activitynameidresponse":7,"activitynameresponse":"ทดลองเพิ่มกิจกรรมโดยอาจารย์ 7","objectivesresponse":"วัตถุประสงค์ที่ 1 เพื่อ... วัตถุประสงค์ที่ 2 เพื่อ... วัตถุประสงค์ที่ 3 เพื่อ...","startdatebyteacherresponse":"29/11/2022","finishdatebyteacherresponse":"29/11/2022"},{"activitynameidresponse":8,"activitynameresponse":"ทดสอบจาก swagger1","objectivesresponse":"1111","startdatebyteacherresponse":"11/11/2011","finishdatebyteacherresponse":"12/12/2012"},{"activitynameidresponse":9,"activitynameresponse":"ทดสอบจาก post man1","objectivesresponse":"1111","startdatebyteacherresponse":"11/11/2011","finishdatebyteacherresponse":"12/12/2012"},{"activitynameidresponse":10,"activitynameresponse":"ทดสอบจากแอป 1","objectivesresponse":"1\n2\n3\n4\n5","startdatebyteacherresponse":"30/11/2022","finishdatebyteacherresponse":"30/11/2022"}]}

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

/// activitynamelistteacher : [{"activitynameidresponse":6,"activitynameresponse":"ทดลองเพิ่มกิจกรรมโดยอาจารย์ 6","objectivesresponse":"วัตถุประสงค์ที่ 1 เพื่อ... วัตถุประสงค์ที่ 2 เพื่อ... วัตถุประสงค์ที่ 3 เพื่อ...","startdatebyteacherresponse":"29/11/2022","finishdatebyteacherresponse":"29/11/2022"},{"activitynameidresponse":7,"activitynameresponse":"ทดลองเพิ่มกิจกรรมโดยอาจารย์ 7","objectivesresponse":"วัตถุประสงค์ที่ 1 เพื่อ... วัตถุประสงค์ที่ 2 เพื่อ... วัตถุประสงค์ที่ 3 เพื่อ...","startdatebyteacherresponse":"29/11/2022","finishdatebyteacherresponse":"29/11/2022"},{"activitynameidresponse":8,"activitynameresponse":"ทดสอบจาก swagger1","objectivesresponse":"1111","startdatebyteacherresponse":"11/11/2011","finishdatebyteacherresponse":"12/12/2012"},{"activitynameidresponse":9,"activitynameresponse":"ทดสอบจาก post man1","objectivesresponse":"1111","startdatebyteacherresponse":"11/11/2011","finishdatebyteacherresponse":"12/12/2012"},{"activitynameidresponse":10,"activitynameresponse":"ทดสอบจากแอป 1","objectivesresponse":"1\n2\n3\n4\n5","startdatebyteacherresponse":"30/11/2022","finishdatebyteacherresponse":"30/11/2022"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      List<Activitynamelistteacher>? activitynamelistteacher,}){
    _activitynamelistteacher = activitynamelistteacher;
}

  Body.fromJson(dynamic json) {
    if (json['activitynamelistteacher'] != null) {
      _activitynamelistteacher = [];
      json['activitynamelistteacher'].forEach((v) {
        _activitynamelistteacher?.add(Activitynamelistteacher.fromJson(v));
      });
    }
  }
  List<Activitynamelistteacher>? _activitynamelistteacher;
Body copyWith({  List<Activitynamelistteacher>? activitynamelistteacher,
}) => Body(  activitynamelistteacher: activitynamelistteacher ?? _activitynamelistteacher,
);
  List<Activitynamelistteacher>? get activitynamelistteacher => _activitynamelistteacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_activitynamelistteacher != null) {
      map['activitynamelistteacher'] = _activitynamelistteacher?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// activitynameidresponse : 6
/// activitynameresponse : "ทดลองเพิ่มกิจกรรมโดยอาจารย์ 6"
/// objectivesresponse : "วัตถุประสงค์ที่ 1 เพื่อ... วัตถุประสงค์ที่ 2 เพื่อ... วัตถุประสงค์ที่ 3 เพื่อ..."
/// startdatebyteacherresponse : "29/11/2022"
/// finishdatebyteacherresponse : "29/11/2022"

Activitynamelistteacher activitynamelistteacherFromJson(String str) => Activitynamelistteacher.fromJson(json.decode(str));
String activitynamelistteacherToJson(Activitynamelistteacher data) => json.encode(data.toJson());
class Activitynamelistteacher {
  Activitynamelistteacher({
      num? activitynameidresponse, 
      String? activitynameresponse, 
      String? objectivesresponse, 
      String? startdatebyteacherresponse, 
      String? finishdatebyteacherresponse,}){
    _activitynameidresponse = activitynameidresponse;
    _activitynameresponse = activitynameresponse;
    _objectivesresponse = objectivesresponse;
    _startdatebyteacherresponse = startdatebyteacherresponse;
    _finishdatebyteacherresponse = finishdatebyteacherresponse;
}

  Activitynamelistteacher.fromJson(dynamic json) {
    _activitynameidresponse = json['activitynameidresponse'];
    _activitynameresponse = json['activitynameresponse'];
    _objectivesresponse = json['objectivesresponse'];
    _startdatebyteacherresponse = json['startdatebyteacherresponse'];
    _finishdatebyteacherresponse = json['finishdatebyteacherresponse'];
  }
  num? _activitynameidresponse;
  String? _activitynameresponse;
  String? _objectivesresponse;
  String? _startdatebyteacherresponse;
  String? _finishdatebyteacherresponse;
Activitynamelistteacher copyWith({  num? activitynameidresponse,
  String? activitynameresponse,
  String? objectivesresponse,
  String? startdatebyteacherresponse,
  String? finishdatebyteacherresponse,
}) => Activitynamelistteacher(  activitynameidresponse: activitynameidresponse ?? _activitynameidresponse,
  activitynameresponse: activitynameresponse ?? _activitynameresponse,
  objectivesresponse: objectivesresponse ?? _objectivesresponse,
  startdatebyteacherresponse: startdatebyteacherresponse ?? _startdatebyteacherresponse,
  finishdatebyteacherresponse: finishdatebyteacherresponse ?? _finishdatebyteacherresponse,
);
  num? get activitynameidresponse => _activitynameidresponse;
  String? get activitynameresponse => _activitynameresponse;
  String? get objectivesresponse => _objectivesresponse;
  String? get startdatebyteacherresponse => _startdatebyteacherresponse;
  String? get finishdatebyteacherresponse => _finishdatebyteacherresponse;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activitynameidresponse'] = _activitynameidresponse;
    map['activitynameresponse'] = _activitynameresponse;
    map['objectivesresponse'] = _objectivesresponse;
    map['startdatebyteacherresponse'] = _startdatebyteacherresponse;
    map['finishdatebyteacherresponse'] = _finishdatebyteacherresponse;
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