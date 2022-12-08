import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"Activity","timeexpire":false}
/// body : {"screeninfo":{"titleapproved":"Approved!","titleunapproved":"Waiting!","titlerejected":"Disapproved!","textactivity":"Activity","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","textunittime":"hr : min","texttime":"Total time","textvenue":"Venue","textobjectives":"Objectives","edtapprover":"Approver","textdetail":"Detail","buttonleft":"Edit","buttonright":"Delete"},"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertdeleteactivity":"Do you want to delete this activity?"},"activity":[{"activityid":"9","name":"Test add by swagger 1 and edit to see in approve","startdate":"11/12/2022","finishdate":"11/12/2022","venue":"Tonsai home","objectives":"1.to test","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"8","name":"TEST2","startdate":"11/11/2011","finishdate":"11/11/2011","venue":"BBB","objectives":"67890","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"7","name":"testbyphone6","startdate":"4/12/2022","finishdate":"4/12/2022","venue":"-","objectives":"1234567788","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"6","name":"กิจกรรมเพิ่มโดยอาจารย์1 (Activity that add by teacher 1)","startdate":"6/12/2022","finishdate":"6/12/2022","venue":"BUU","objectives":"55555","teachername":"อารยา","teacherlastname":"วิวัฒน์วานิช","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"5","name":"Test by phone 1","startdate":"4/12/2022","finishdate":"4/12/2022","venue":"","objectives":"1.aaa\n2.bbb\n3.ccc","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"4","name":"TEST2","startdate":"11/11/2011","finishdate":"11/11/2011","venue":"BBB","objectives":"67890","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"3","name":"Test add by swagger 1 and edit to see in approve","startdate":"11/12/2022","finishdate":"11/12/2022","venue":"Tonsai home","objectives":"1.to test","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Rejected!","color":"#f3f6f4"},{"activityid":"2","name":"TEST2","startdate":"11/11/2011","finishdate":"11/11/2011","venue":"BBB","objectives":"67890","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Approved!","color":"#C7FFAD"}]}

ScreenStatusActivityStudentResponse screenStatusActivityResponseFromJson(String str) => ScreenStatusActivityStudentResponse.fromJson(json.decode(str));
String screenStatusActivityResponseToJson(ScreenStatusActivityStudentResponse data) => json.encode(data.toJson());
class ScreenStatusActivityStudentResponse {
  ScreenStatusActivityStudentResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ScreenStatusActivityStudentResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ScreenStatusActivityStudentResponse copyWith({  Head? head,
  Body? body,
}) => ScreenStatusActivityStudentResponse(  head: head ?? _head,
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

/// screeninfo : {"titleapproved":"Approved!","titleunapproved":"Waiting!","titlerejected":"Disapproved!","textactivity":"Activity","textyear":"Year","textterm":"Term","textstartdate":"Start date","textfinishdate":"Finish date","textunittime":"hr : min","texttime":"Total time","textvenue":"Venue","textobjectives":"Objectives","edtapprover":"Approver","textdetail":"Detail","buttonleft":"Edit","buttonright":"Delete"}
/// errorbutton : {"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"}
/// alertmessage : {"alertdeleteactivity":"Do you want to delete this activity?"}
/// activity : [{"activityid":"9","name":"Test add by swagger 1 and edit to see in approve","startdate":"11/12/2022","finishdate":"11/12/2022","venue":"Tonsai home","objectives":"1.to test","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"8","name":"TEST2","startdate":"11/11/2011","finishdate":"11/11/2011","venue":"BBB","objectives":"67890","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"7","name":"testbyphone6","startdate":"4/12/2022","finishdate":"4/12/2022","venue":"-","objectives":"1234567788","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"6","name":"กิจกรรมเพิ่มโดยอาจารย์1 (Activity that add by teacher 1)","startdate":"6/12/2022","finishdate":"6/12/2022","venue":"BUU","objectives":"55555","teachername":"อารยา","teacherlastname":"วิวัฒน์วานิช","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"5","name":"Test by phone 1","startdate":"4/12/2022","finishdate":"4/12/2022","venue":"","objectives":"1.aaa\n2.bbb\n3.ccc","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"4","name":"TEST2","startdate":"11/11/2011","finishdate":"11/11/2011","venue":"BBB","objectives":"67890","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Unapproved!","color":"#FAFFBE"},{"activityid":"3","name":"Test add by swagger 1 and edit to see in approve","startdate":"11/12/2022","finishdate":"11/12/2022","venue":"Tonsai home","objectives":"1.to test","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Rejected!","color":"#f3f6f4"},{"activityid":"2","name":"TEST2","startdate":"11/11/2011","finishdate":"11/11/2011","venue":"BBB","objectives":"67890","teachername":"เดโมชื่อ","teacherlastname":"เดโมนามสกุล","status":"Approved!","color":"#C7FFAD"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      Errorbutton? errorbutton, 
      Alertmessage? alertmessage, 
      List<Activity>? activity,}){
    _screeninfo = screeninfo;
    _errorbutton = errorbutton;
    _alertmessage = alertmessage;
    _activity = activity;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _alertmessage = json['alertmessage'] != null ? Alertmessage.fromJson(json['alertmessage']) : null;
    if (json['activity'] != null) {
      _activity = [];
      json['activity'].forEach((v) {
        _activity?.add(Activity.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  Errorbutton? _errorbutton;
  Alertmessage? _alertmessage;
  List<Activity>? _activity;
Body copyWith({  Screeninfo? screeninfo,
  Errorbutton? errorbutton,
  Alertmessage? alertmessage,
  List<Activity>? activity,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  errorbutton: errorbutton ?? _errorbutton,
  alertmessage: alertmessage ?? _alertmessage,
  activity: activity ?? _activity,
);
  Screeninfo? get screeninfo => _screeninfo;
  Errorbutton? get errorbutton => _errorbutton;
  Alertmessage? get alertmessage => _alertmessage;
  List<Activity>? get activity => _activity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_errorbutton != null) {
      map['errorbutton'] = _errorbutton?.toJson();
    }
    if (_alertmessage != null) {
      map['alertmessage'] = _alertmessage?.toJson();
    }
    if (_activity != null) {
      map['activity'] = _activity?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// activityid : "9"
/// name : "Test add by swagger 1 and edit to see in approve"
/// startdate : "11/12/2022"
/// finishdate : "11/12/2022"
/// venue : "Tonsai home"
/// objectives : "1.to test"
/// teachername : "เดโมชื่อ"
/// teacherlastname : "เดโมนามสกุล"
/// status : "Unapproved!"
/// color : "#FAFFBE"

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));
String activityToJson(Activity data) => json.encode(data.toJson());
class Activity {
  Activity({
      String? activityid, 
      String? name, 
      String? startdate, 
      String? finishdate, 
      String? venue, 
      String? objectives, 
      String? teachername, 
      String? teacherlastname, 
      String? status, 
      String? color,}){
    _activityid = activityid;
    _name = name;
    _startdate = startdate;
    _finishdate = finishdate;
    _venue = venue;
    _objectives = objectives;
    _teachername = teachername;
    _teacherlastname = teacherlastname;
    _status = status;
    _color = color;
}

  Activity.fromJson(dynamic json) {
    _activityid = json['activityid'];
    _name = json['name'];
    _startdate = json['startdate'];
    _finishdate = json['finishdate'];
    _venue = json['venue'];
    _objectives = json['objectives'];
    _teachername = json['teachername'];
    _teacherlastname = json['teacherlastname'];
    _status = json['status'];
    _color = json['color'];
  }
  String? _activityid;
  String? _name;
  String? _startdate;
  String? _finishdate;
  String? _venue;
  String? _objectives;
  String? _teachername;
  String? _teacherlastname;
  String? _status;
  String? _color;
Activity copyWith({  String? activityid,
  String? name,
  String? startdate,
  String? finishdate,
  String? venue,
  String? objectives,
  String? teachername,
  String? teacherlastname,
  String? status,
  String? color,
}) => Activity(  activityid: activityid ?? _activityid,
  name: name ?? _name,
  startdate: startdate ?? _startdate,
  finishdate: finishdate ?? _finishdate,
  venue: venue ?? _venue,
  objectives: objectives ?? _objectives,
  teachername: teachername ?? _teachername,
  teacherlastname: teacherlastname ?? _teacherlastname,
  status: status ?? _status,
  color: color ?? _color,
);
  String? get activityid => _activityid;
  String? get name => _name;
  String? get startdate => _startdate;
  String? get finishdate => _finishdate;
  String? get venue => _venue;
  String? get objectives => _objectives;
  String? get teachername => _teachername;
  String? get teacherlastname => _teacherlastname;
  String? get status => _status;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activityid'] = _activityid;
    map['name'] = _name;
    map['startdate'] = _startdate;
    map['finishdate'] = _finishdate;
    map['venue'] = _venue;
    map['objectives'] = _objectives;
    map['teachername'] = _teachername;
    map['teacherlastname'] = _teacherlastname;
    map['status'] = _status;
    map['color'] = _color;
    return map;
  }

}

/// alertdeleteactivity : "Do you want to delete this activity?"

Alertmessage alertmessageFromJson(String str) => Alertmessage.fromJson(json.decode(str));
String alertmessageToJson(Alertmessage data) => json.encode(data.toJson());
class Alertmessage {
  Alertmessage({
      String? alertdeleteactivity,}){
    _alertdeleteactivity = alertdeleteactivity;
}

  Alertmessage.fromJson(dynamic json) {
    _alertdeleteactivity = json['alertdeleteactivity'];
  }
  String? _alertdeleteactivity;
Alertmessage copyWith({  String? alertdeleteactivity,
}) => Alertmessage(  alertdeleteactivity: alertdeleteactivity ?? _alertdeleteactivity,
);
  String? get alertdeleteactivity => _alertdeleteactivity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alertdeleteactivity'] = _alertdeleteactivity;
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

/// titleapproved : "Approved!"
/// titleunapproved : "Waiting!"
/// titlerejected : "Disapproved!"
/// textactivity : "Activity"
/// textyear : "Year"
/// textterm : "Term"
/// textstartdate : "Start date"
/// textfinishdate : "Finish date"
/// textunittime : "hr : min"
/// texttime : "Total time"
/// textvenue : "Venue"
/// textobjectives : "Objectives"
/// edtapprover : "Approver"
/// textdetail : "Detail"
/// buttonleft : "Edit"
/// buttonright : "Delete"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titleapproved, 
      String? titleunapproved, 
      String? titlerejected, 
      String? textactivity, 
      String? textyear, 
      String? textterm, 
      String? textstartdate, 
      String? textfinishdate, 
      String? textunittime, 
      String? texttime, 
      String? textvenue, 
      String? textobjectives, 
      String? edtapprover, 
      String? textdetail, 
      String? buttonleft, 
      String? buttonright,}){
    _titleapproved = titleapproved;
    _titleunapproved = titleunapproved;
    _titlerejected = titlerejected;
    _textactivity = textactivity;
    _textyear = textyear;
    _textterm = textterm;
    _textstartdate = textstartdate;
    _textfinishdate = textfinishdate;
    _textunittime = textunittime;
    _texttime = texttime;
    _textvenue = textvenue;
    _textobjectives = textobjectives;
    _edtapprover = edtapprover;
    _textdetail = textdetail;
    _buttonleft = buttonleft;
    _buttonright = buttonright;
}

  Screeninfo.fromJson(dynamic json) {
    _titleapproved = json['titleapproved'];
    _titleunapproved = json['titleunapproved'];
    _titlerejected = json['titlerejected'];
    _textactivity = json['textactivity'];
    _textyear = json['textyear'];
    _textterm = json['textterm'];
    _textstartdate = json['textstartdate'];
    _textfinishdate = json['textfinishdate'];
    _textunittime = json['textunittime'];
    _texttime = json['texttime'];
    _textvenue = json['textvenue'];
    _textobjectives = json['textobjectives'];
    _edtapprover = json['edtapprover'];
    _textdetail = json['textdetail'];
    _buttonleft = json['buttonleft'];
    _buttonright = json['buttonright'];
  }
  String? _titleapproved;
  String? _titleunapproved;
  String? _titlerejected;
  String? _textactivity;
  String? _textyear;
  String? _textterm;
  String? _textstartdate;
  String? _textfinishdate;
  String? _textunittime;
  String? _texttime;
  String? _textvenue;
  String? _textobjectives;
  String? _edtapprover;
  String? _textdetail;
  String? _buttonleft;
  String? _buttonright;
Screeninfo copyWith({  String? titleapproved,
  String? titleunapproved,
  String? titlerejected,
  String? textactivity,
  String? textyear,
  String? textterm,
  String? textstartdate,
  String? textfinishdate,
  String? textunittime,
  String? texttime,
  String? textvenue,
  String? textobjectives,
  String? edtapprover,
  String? textdetail,
  String? buttonleft,
  String? buttonright,
}) => Screeninfo(  titleapproved: titleapproved ?? _titleapproved,
  titleunapproved: titleunapproved ?? _titleunapproved,
  titlerejected: titlerejected ?? _titlerejected,
  textactivity: textactivity ?? _textactivity,
  textyear: textyear ?? _textyear,
  textterm: textterm ?? _textterm,
  textstartdate: textstartdate ?? _textstartdate,
  textfinishdate: textfinishdate ?? _textfinishdate,
  textunittime: textunittime ?? _textunittime,
  texttime: texttime ?? _texttime,
  textvenue: textvenue ?? _textvenue,
  textobjectives: textobjectives ?? _textobjectives,
  edtapprover: edtapprover ?? _edtapprover,
  textdetail: textdetail ?? _textdetail,
  buttonleft: buttonleft ?? _buttonleft,
  buttonright: buttonright ?? _buttonright,
);
  String? get titleapproved => _titleapproved;
  String? get titleunapproved => _titleunapproved;
  String? get titlerejected => _titlerejected;
  String? get textactivity => _textactivity;
  String? get textyear => _textyear;
  String? get textterm => _textterm;
  String? get textstartdate => _textstartdate;
  String? get textfinishdate => _textfinishdate;
  String? get textunittime => _textunittime;
  String? get texttime => _texttime;
  String? get textvenue => _textvenue;
  String? get textobjectives => _textobjectives;
  String? get edtapprover => _edtapprover;
  String? get textdetail => _textdetail;
  String? get buttonleft => _buttonleft;
  String? get buttonright => _buttonright;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleapproved'] = _titleapproved;
    map['titleunapproved'] = _titleunapproved;
    map['titlerejected'] = _titlerejected;
    map['textactivity'] = _textactivity;
    map['textyear'] = _textyear;
    map['textterm'] = _textterm;
    map['textstartdate'] = _textstartdate;
    map['textfinishdate'] = _textfinishdate;
    map['textunittime'] = _textunittime;
    map['texttime'] = _texttime;
    map['textvenue'] = _textvenue;
    map['textobjectives'] = _textobjectives;
    map['edtapprover'] = _edtapprover;
    map['textdetail'] = _textdetail;
    map['buttonleft'] = _buttonleft;
    map['buttonright'] = _buttonright;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "Activity"
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