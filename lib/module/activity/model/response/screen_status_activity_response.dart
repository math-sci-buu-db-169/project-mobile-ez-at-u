import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"Activity"}
/// body : {"screeninfo":{"titleapproved":"ได้รับการอนุมัติแล้ว!","titleunapproved":"รอรับการอนุมัติ!","titlerejected":"ไม่อนุมัติ!","textactivity":"กิจกรรม","textyear":"ปี","textterm":"เทอม","textstartdate":"วันเริ่ม","textfinishdate":"วันสิ้นสุด","textunittime":"ชั่วโมง : นาที","texttime":"จำนวนชั่วโมง","textvenue":"สถานที่จัด","edtapprover":"ผู้ยืนยัน","textdetail":"รายละเอียด","buttonleft":"แก้ไข","buttonright":"ลบ"},"errorbutton":{"buttonok":"ตกลง","buttonconfirm":"ยืนยัน","buttonyes":"ใช่","buttonno":"ไม่ใช่","buttoncancel":"ยกเลิก"},"alertmessage":{"alertdeleteactivity":"คุณต้องการลบกิจกรรมนี้ใช่หรือไม่"},"activity":[{"id":"40","name":"111","year":"2020","term":"1","startdate":"15/11/2022","finishdate":"15/11/2022","timehours":"10","timeminutes":"10","venue":"homehome","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"test111","status":"Unapproved!","color":"#FAFFBE"},{"id":"26","name":"ทดสอบยิง 2","year":"2020","term":"2","startdate":"02/02/2020","finishdate":"02/02/2020","timehours":"18","timeminutes":"28","venue":"บ้าน","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"ทดสอบยิงครั้งที่ 2","status":"Unapproved!","color":"#FAFFBE"},{"id":"24","name":"ทดสอบยิง 2","year":"2020","term":"2","startdate":"02/02/2020","finishdate":"02/02/2020","timehours":"17","timeminutes":"27","venue":"บ้าน","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"ทดสอบยิงครั้งที่ 2","status":"Unapproved!","color":"#FAFFBE"},{"id":"14","name":"กิจกรรมสร้างแอป","year":"2022","term":"1","startdate":"7/2/2658","finishdate":"7/2/2658","timehours":"12","timeminutes":"22","venue":"Room SC652","approvername":"บุญยงค์","approverlastname":"ศรีพลแผ้ว","approvercode":"TCMM05","detail":"ทดสอบกิจกรรมสร้างแอป","status":"Approved!","color":"#C7FFAD"},{"id":"10","name":"โครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","year":"2017","term":"s","startdate":"7/2/2658","finishdate":"7/2/2566","timehours":"10","timeminutes":"20","venue":"Room SVT546","approvername":"ดวงกมล","approverlastname":"ผลเต็ม","approvercode":"TCMM02","detail":"ทดสอบโครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","status":"Unapproved!","color":"#FAFFBE"},{"id":"9","name":"โครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","year":"2019","term":"1","startdate":"7/1/2567","finishdate":"7/1/2656","timehours":"09","timeminutes":"19","venue":"RoomSD9546","approvername":"เดชชาติ","approverlastname":"สามารถ","approvercode":"TCMM03","detail":"ทดสอบโครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","status":"Rejected!","color":"#f3f6f4"},{"id":"8","name":"โครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","year":"2018","term":"s","startdate":"7/4/2658","finishdate":"7/4/2565","timehours":"08","timeminutes":"18","venue":"Room SC302","approvername":"ชาติไทย","approverlastname":"ไทยประยูร","approvercode":"TCMM04","detail":"ทดสอบโครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","status":"Approved!","color":"#C7FFAD"},{"id":"5","name":"Test edit","year":"2020","term":"2","startdate":"07/02/2020","finishdate":"08/02/2020","timehours":"05","timeminutes":"15","venue":"บ้าน","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"ทดสอบแก้ไข","status":"Unapproved!","color":"#FAFFBE"}]}

ScreenStatusActivityResponse screenStatusActivityResponseFromJson(String str) => ScreenStatusActivityResponse.fromJson(json.decode(str));
String screenStatusActivityResponseToJson(ScreenStatusActivityResponse data) => json.encode(data.toJson());
class ScreenStatusActivityResponse {
  ScreenStatusActivityResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ScreenStatusActivityResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ScreenStatusActivityResponse copyWith({  Head? head,
  Body? body,
}) => ScreenStatusActivityResponse(  head: head ?? _head,
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

/// screeninfo : {"titleapproved":"ได้รับการอนุมัติแล้ว!","titleunapproved":"รอรับการอนุมัติ!","titlerejected":"ไม่อนุมัติ!","textactivity":"กิจกรรม","textyear":"ปี","textterm":"เทอม","textstartdate":"วันเริ่ม","textfinishdate":"วันสิ้นสุด","textunittime":"ชั่วโมง : นาที","texttime":"จำนวนชั่วโมง","textvenue":"สถานที่จัด","edtapprover":"ผู้ยืนยัน","textdetail":"รายละเอียด","buttonleft":"แก้ไข","buttonright":"ลบ"}
/// errorbutton : {"buttonok":"ตกลง","buttonconfirm":"ยืนยัน","buttonyes":"ใช่","buttonno":"ไม่ใช่","buttoncancel":"ยกเลิก"}
/// alertmessage : {"alertdeleteactivity":"คุณต้องการลบกิจกรรมนี้ใช่หรือไม่"}
/// activity : [{"id":"40","name":"111","year":"2020","term":"1","startdate":"15/11/2022","finishdate":"15/11/2022","timehours":"10","timeminutes":"10","venue":"homehome","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"test111","status":"Unapproved!","color":"#FAFFBE"},{"id":"26","name":"ทดสอบยิง 2","year":"2020","term":"2","startdate":"02/02/2020","finishdate":"02/02/2020","timehours":"18","timeminutes":"28","venue":"บ้าน","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"ทดสอบยิงครั้งที่ 2","status":"Unapproved!","color":"#FAFFBE"},{"id":"24","name":"ทดสอบยิง 2","year":"2020","term":"2","startdate":"02/02/2020","finishdate":"02/02/2020","timehours":"17","timeminutes":"27","venue":"บ้าน","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"ทดสอบยิงครั้งที่ 2","status":"Unapproved!","color":"#FAFFBE"},{"id":"14","name":"กิจกรรมสร้างแอป","year":"2022","term":"1","startdate":"7/2/2658","finishdate":"7/2/2658","timehours":"12","timeminutes":"22","venue":"Room SC652","approvername":"บุญยงค์","approverlastname":"ศรีพลแผ้ว","approvercode":"TCMM05","detail":"ทดสอบกิจกรรมสร้างแอป","status":"Approved!","color":"#C7FFAD"},{"id":"10","name":"โครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","year":"2017","term":"s","startdate":"7/2/2658","finishdate":"7/2/2566","timehours":"10","timeminutes":"20","venue":"Room SVT546","approvername":"ดวงกมล","approverlastname":"ผลเต็ม","approvercode":"TCMM02","detail":"ทดสอบโครงการพัฒนาผู้เรียนให้มีความสามารถในการคิดอย่างเป็นระบบ คิดสร้างสรรค์ ตัดสินใจแก้ปัญหาได้อย่างมีสติสมเหตุผล","status":"Unapproved!","color":"#FAFFBE"},{"id":"9","name":"โครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","year":"2019","term":"1","startdate":"7/1/2567","finishdate":"7/1/2656","timehours":"09","timeminutes":"19","venue":"RoomSD9546","approvername":"เดชชาติ","approverlastname":"สามารถ","approvercode":"TCMM03","detail":"ทดสอบโครงการพัฒนาผู้เรียนให้มีทักษะในการแสวงหาความรู้ด้วยตนเอง รักเรียนรู้ และพัฒนาตนเองอย่างต่อเนื่อง","status":"Rejected!","color":"#f3f6f4"},{"id":"8","name":"โครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","year":"2018","term":"s","startdate":"7/4/2658","finishdate":"7/4/2565","timehours":"08","timeminutes":"18","venue":"Room SC302","approvername":"ชาติไทย","approverlastname":"ไทยประยูร","approvercode":"TCMM04","detail":"ทดสอบโครงการส่งเสริม คุณธรรม จริยธรรม และค่านิยมที่พึงประสงค์ ของผู้เรียน","status":"Approved!","color":"#C7FFAD"},{"id":"5","name":"Test edit","year":"2020","term":"2","startdate":"07/02/2020","finishdate":"08/02/2020","timehours":"05","timeminutes":"15","venue":"บ้าน","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์","approvercode":"TCMM01","detail":"ทดสอบแก้ไข","status":"Unapproved!","color":"#FAFFBE"}]

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

/// id : "40"
/// name : "111"
/// year : "2020"
/// term : "1"
/// startdate : "15/11/2022"
/// finishdate : "15/11/2022"
/// timehours : "10"
/// timeminutes : "10"
/// venue : "homehome"
/// approvername : "อภิสิทธิ์"
/// approverlastname : "ภคพงศ์พันธุ์"
/// approvercode : "TCMM01"
/// detail : "test111"
/// status : "Unapproved!"
/// color : "#FAFFBE"

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));
String activityToJson(Activity data) => json.encode(data.toJson());
class Activity {
  Activity({
      String? id, 
      String? name, 
      String? year, 
      String? term, 
      String? startdate, 
      String? finishdate, 
      String? timehours, 
      String? timeminutes, 
      String? venue, 
      String? approvername, 
      String? approverlastname, 
      String? approvercode, 
      String? detail, 
      String? status, 
      String? color,}){
    _id = id;
    _name = name;
    _year = year;
    _term = term;
    _startdate = startdate;
    _finishdate = finishdate;
    _timehours = timehours;
    _timeminutes = timeminutes;
    _venue = venue;
    _approvername = approvername;
    _approverlastname = approverlastname;
    _approvercode = approvercode;
    _detail = detail;
    _status = status;
    _color = color;
}

  Activity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _year = json['year'];
    _term = json['term'];
    _startdate = json['startdate'];
    _finishdate = json['finishdate'];
    _timehours = json['timehours'];
    _timeminutes = json['timeminutes'];
    _venue = json['venue'];
    _approvername = json['approvername'];
    _approverlastname = json['approverlastname'];
    _approvercode = json['approvercode'];
    _detail = json['detail'];
    _status = json['status'];
    _color = json['color'];
  }
  String? _id;
  String? _name;
  String? _year;
  String? _term;
  String? _startdate;
  String? _finishdate;
  String? _timehours;
  String? _timeminutes;
  String? _venue;
  String? _approvername;
  String? _approverlastname;
  String? _approvercode;
  String? _detail;
  String? _status;
  String? _color;
Activity copyWith({  String? id,
  String? name,
  String? year,
  String? term,
  String? startdate,
  String? finishdate,
  String? timehours,
  String? timeminutes,
  String? venue,
  String? approvername,
  String? approverlastname,
  String? approvercode,
  String? detail,
  String? status,
  String? color,
}) => Activity(  id: id ?? _id,
  name: name ?? _name,
  year: year ?? _year,
  term: term ?? _term,
  startdate: startdate ?? _startdate,
  finishdate: finishdate ?? _finishdate,
  timehours: timehours ?? _timehours,
  timeminutes: timeminutes ?? _timeminutes,
  venue: venue ?? _venue,
  approvername: approvername ?? _approvername,
  approverlastname: approverlastname ?? _approverlastname,
  approvercode: approvercode ?? _approvercode,
  detail: detail ?? _detail,
  status: status ?? _status,
  color: color ?? _color,
);
  String? get id => _id;
  String? get name => _name;
  String? get year => _year;
  String? get term => _term;
  String? get startdate => _startdate;
  String? get finishdate => _finishdate;
  String? get timehours => _timehours;
  String? get timeminutes => _timeminutes;
  String? get venue => _venue;
  String? get approvername => _approvername;
  String? get approverlastname => _approverlastname;
  String? get approvercode => _approvercode;
  String? get detail => _detail;
  String? get status => _status;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['year'] = _year;
    map['term'] = _term;
    map['startdate'] = _startdate;
    map['finishdate'] = _finishdate;
    map['timehours'] = _timehours;
    map['timeminutes'] = _timeminutes;
    map['venue'] = _venue;
    map['approvername'] = _approvername;
    map['approverlastname'] = _approverlastname;
    map['approvercode'] = _approvercode;
    map['detail'] = _detail;
    map['status'] = _status;
    map['color'] = _color;
    return map;
  }

}

/// alertdeleteactivity : "คุณต้องการลบกิจกรรมนี้ใช่หรือไม่"

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

/// buttonok : "ตกลง"
/// buttonconfirm : "ยืนยัน"
/// buttonyes : "ใช่"
/// buttonno : "ไม่ใช่"
/// buttoncancel : "ยกเลิก"

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

/// titleapproved : "ได้รับการอนุมัติแล้ว!"
/// titleunapproved : "รอรับการอนุมัติ!"
/// titlerejected : "ไม่อนุมัติ!"
/// textactivity : "กิจกรรม"
/// textyear : "ปี"
/// textterm : "เทอม"
/// textstartdate : "วันเริ่ม"
/// textfinishdate : "วันสิ้นสุด"
/// textunittime : "ชั่วโมง : นาที"
/// texttime : "จำนวนชั่วโมง"
/// textvenue : "สถานที่จัด"
/// edtapprover : "ผู้ยืนยัน"
/// textdetail : "รายละเอียด"
/// buttonleft : "แก้ไข"
/// buttonright : "ลบ"

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