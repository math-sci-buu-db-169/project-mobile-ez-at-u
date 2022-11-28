import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity","timeexpire":false}
/// body : {"screeninfo":{"titleteacheractivity":"กิจกรรม","textactivity":"กิจกรรม","studentcode":"รหัสนิสิต","student":"นิสิต","startdate":"วันที่เริ่มทำ","time":"ระยะเวลา","venue":"สถานที่ทำกิจกรรม","year":"ปี","term":"เทอม","detail":"รายละเอียด","finishdate":"วันที่ทำเสร็จ","date":"วันที่"},"activitylist":[{"acid":"55","acname":"de","year":"2015","term":"summer","startdate":"28/11/2022","finishdate":"28/11/2022","timehours":"08","timeminutes":"03","venue":"rer","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","detail":"frf","status":"Unapproved!","color":"#FAFFBE"},{"acid":"53","acname":"ปฏิเสธ","year":"2022","term":"1","startdate":"1/11/2022","finishdate":"1/11/2022","timehours":"10","timeminutes":"20","venue":"HOME","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","detail":"Test","status":"Rejected!","color":"#f3f6f4"},{"acid":"50","acname":"ยืนยันแล้ว","year":"2022","term":"1","startdate":"1/11/2022","finishdate":"1/11/2022","timehours":"10","timeminutes":"20","venue":"HOME","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","detail":"Test","status":"Approved!","color":"#C7FFAD"},{"acid":"47","acname":"asd","year":"2010","term":"1","startdate":"1/11/2022","finishdate":"1/11/2022","timehours":"10","timeminutes":"20","venue":"HOME","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","detail":"Test","status":"Unapproved!","color":"#FAFFBE"}],"options":[{"title":"ชื่อนิสิต","value":"1"},{"title":"ชื่อกิจกรรม","value":"2"}],"options_status":[{"status":"รอรับการยืนยัน","value":"1"},{"status":"ยืนยันแล้ว","value":"2"},{"status":"ถูกปฏิเสธ","value":"3"}]}

ActivityListTeacherScreen activityListTeacherScreenFromJson(String str) => ActivityListTeacherScreen.fromJson(json.decode(str));
String activityListTeacherScreenToJson(ActivityListTeacherScreen data) => json.encode(data.toJson());
class ActivityListTeacherScreen {
  ActivityListTeacherScreen({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  ActivityListTeacherScreen.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
ActivityListTeacherScreen copyWith({  Head? head,
  Body? body,
}) => ActivityListTeacherScreen(  head: head ?? _head,
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

/// screeninfo : {"titleteacheractivity":"กิจกรรม","textactivity":"กิจกรรม","studentcode":"รหัสนิสิต","student":"นิสิต","startdate":"วันที่เริ่มทำ","time":"ระยะเวลา","venue":"สถานที่ทำกิจกรรม","year":"ปี","term":"เทอม","detail":"รายละเอียด","finishdate":"วันที่ทำเสร็จ","date":"วันที่"}
/// activitylist : [{"acid":"55","acname":"de","year":"2015","term":"summer","startdate":"28/11/2022","finishdate":"28/11/2022","timehours":"08","timeminutes":"03","venue":"rer","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","detail":"frf","status":"Unapproved!","color":"#FAFFBE"},{"acid":"53","acname":"ปฏิเสธ","year":"2022","term":"1","startdate":"1/11/2022","finishdate":"1/11/2022","timehours":"10","timeminutes":"20","venue":"HOME","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","detail":"Test","status":"Rejected!","color":"#f3f6f4"},{"acid":"50","acname":"ยืนยันแล้ว","year":"2022","term":"1","startdate":"1/11/2022","finishdate":"1/11/2022","timehours":"10","timeminutes":"20","venue":"HOME","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","detail":"Test","status":"Approved!","color":"#C7FFAD"},{"acid":"47","acname":"asd","year":"2010","term":"1","startdate":"1/11/2022","finishdate":"1/11/2022","timehours":"10","timeminutes":"20","venue":"HOME","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","detail":"Test","status":"Unapproved!","color":"#FAFFBE"}]
/// options : [{"title":"ชื่อนิสิต","value":"1"},{"title":"ชื่อกิจกรรม","value":"2"}]
/// options_status : [{"status":"รอรับการยืนยัน","value":"1"},{"status":"ยืนยันแล้ว","value":"2"},{"status":"ถูกปฏิเสธ","value":"3"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<Activitylist>? activitylist, 
      List<Options>? options, 
      List<OptionsStatus>? optionsStatus,}){
    _screeninfo = screeninfo;
    _activitylist = activitylist;
    _options = options;
    _optionsStatus = optionsStatus;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['activitylist'] != null) {
      _activitylist = [];
      json['activitylist'].forEach((v) {
        _activitylist?.add(Activitylist.fromJson(v));
      });
    }
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Options.fromJson(v));
      });
    }
    if (json['options_status'] != null) {
      _optionsStatus = [];
      json['options_status'].forEach((v) {
        _optionsStatus?.add(OptionsStatus.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Activitylist>? _activitylist;
  List<Options>? _options;
  List<OptionsStatus>? _optionsStatus;
Body copyWith({  Screeninfo? screeninfo,
  List<Activitylist>? activitylist,
  List<Options>? options,
  List<OptionsStatus>? optionsStatus,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  activitylist: activitylist ?? _activitylist,
  options: options ?? _options,
  optionsStatus: optionsStatus ?? _optionsStatus,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<Activitylist>? get activitylist => _activitylist;
  List<Options>? get options => _options;
  List<OptionsStatus>? get optionsStatus => _optionsStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_activitylist != null) {
      map['activitylist'] = _activitylist?.map((v) => v.toJson()).toList();
    }
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    if (_optionsStatus != null) {
      map['options_status'] = _optionsStatus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// status : "รอรับการยืนยัน"
/// value : "1"

OptionsStatus optionsStatusFromJson(String str) => OptionsStatus.fromJson(json.decode(str));
String optionsStatusToJson(OptionsStatus data) => json.encode(data.toJson());
class OptionsStatus {
  OptionsStatus({
      String? status, 
      String? value,}){
    _status = status;
    _value = value;
}

  OptionsStatus.fromJson(dynamic json) {
    _status = json['status'];
    _value = json['value'];
  }
  String? _status;
  String? _value;
OptionsStatus copyWith({  String? status,
  String? value,
}) => OptionsStatus(  status: status ?? _status,
  value: value ?? _value,
);
  String? get status => _status;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['value'] = _value;
    return map;
  }

}

/// title : "ชื่อนิสิต"
/// value : "1"

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));
String optionsToJson(Options data) => json.encode(data.toJson());
class Options {
  Options({
      String? title, 
      String? value,}){
    _title = title;
    _value = value;
}

  Options.fromJson(dynamic json) {
    _title = json['title'];
    _value = json['value'];
  }
  String? _title;
  String? _value;
Options copyWith({  String? title,
  String? value,
}) => Options(  title: title ?? _title,
  value: value ?? _value,
);
  String? get title => _title;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['value'] = _value;
    return map;
  }

}

/// acid : "55"
/// acname : "de"
/// year : "2015"
/// term : "summer"
/// startdate : "28/11/2022"
/// finishdate : "28/11/2022"
/// timehours : "08"
/// timeminutes : "03"
/// venue : "rer"
/// stdname : "คุณสิทธิพล"
/// stdlastname : "ชินโน"
/// stdcode : "62030340"
/// detail : "frf"
/// status : "Unapproved!"
/// color : "#FAFFBE"

Activitylist activitylistFromJson(String str) => Activitylist.fromJson(json.decode(str));
String activitylistToJson(Activitylist data) => json.encode(data.toJson());
class Activitylist {
  Activitylist({
      String? acid, 
      String? acname, 
      String? year, 
      String? term, 
      String? startdate, 
      String? finishdate, 
      String? timehours, 
      String? timeminutes, 
      String? venue, 
      String? stdname, 
      String? stdlastname, 
      String? stdcode, 
      String? detail, 
      String? status, 
      String? color,}){
    _acid = acid;
    _acname = acname;
    _year = year;
    _term = term;
    _startdate = startdate;
    _finishdate = finishdate;
    _timehours = timehours;
    _timeminutes = timeminutes;
    _venue = venue;
    _stdname = stdname;
    _stdlastname = stdlastname;
    _stdcode = stdcode;
    _detail = detail;
    _status = status;
    _color = color;
}

  Activitylist.fromJson(dynamic json) {
    _acid = json['acid'];
    _acname = json['acname'];
    _year = json['year'];
    _term = json['term'];
    _startdate = json['startdate'];
    _finishdate = json['finishdate'];
    _timehours = json['timehours'];
    _timeminutes = json['timeminutes'];
    _venue = json['venue'];
    _stdname = json['stdname'];
    _stdlastname = json['stdlastname'];
    _stdcode = json['stdcode'];
    _detail = json['detail'];
    _status = json['status'];
    _color = json['color'];
  }
  String? _acid;
  String? _acname;
  String? _year;
  String? _term;
  String? _startdate;
  String? _finishdate;
  String? _timehours;
  String? _timeminutes;
  String? _venue;
  String? _stdname;
  String? _stdlastname;
  String? _stdcode;
  String? _detail;
  String? _status;
  String? _color;
Activitylist copyWith({  String? acid,
  String? acname,
  String? year,
  String? term,
  String? startdate,
  String? finishdate,
  String? timehours,
  String? timeminutes,
  String? venue,
  String? stdname,
  String? stdlastname,
  String? stdcode,
  String? detail,
  String? status,
  String? color,
}) => Activitylist(  acid: acid ?? _acid,
  acname: acname ?? _acname,
  year: year ?? _year,
  term: term ?? _term,
  startdate: startdate ?? _startdate,
  finishdate: finishdate ?? _finishdate,
  timehours: timehours ?? _timehours,
  timeminutes: timeminutes ?? _timeminutes,
  venue: venue ?? _venue,
  stdname: stdname ?? _stdname,
  stdlastname: stdlastname ?? _stdlastname,
  stdcode: stdcode ?? _stdcode,
  detail: detail ?? _detail,
  status: status ?? _status,
  color: color ?? _color,
);
  String? get acid => _acid;
  String? get acname => _acname;
  String? get year => _year;
  String? get term => _term;
  String? get startdate => _startdate;
  String? get finishdate => _finishdate;
  String? get timehours => _timehours;
  String? get timeminutes => _timeminutes;
  String? get venue => _venue;
  String? get stdname => _stdname;
  String? get stdlastname => _stdlastname;
  String? get stdcode => _stdcode;
  String? get detail => _detail;
  String? get status => _status;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['acid'] = _acid;
    map['acname'] = _acname;
    map['year'] = _year;
    map['term'] = _term;
    map['startdate'] = _startdate;
    map['finishdate'] = _finishdate;
    map['timehours'] = _timehours;
    map['timeminutes'] = _timeminutes;
    map['venue'] = _venue;
    map['stdname'] = _stdname;
    map['stdlastname'] = _stdlastname;
    map['stdcode'] = _stdcode;
    map['detail'] = _detail;
    map['status'] = _status;
    map['color'] = _color;
    return map;
  }

}

/// titleteacheractivity : "กิจกรรม"
/// textactivity : "กิจกรรม"
/// studentcode : "รหัสนิสิต"
/// student : "นิสิต"
/// startdate : "วันที่เริ่มทำ"
/// time : "ระยะเวลา"
/// venue : "สถานที่ทำกิจกรรม"
/// year : "ปี"
/// term : "เทอม"
/// detail : "รายละเอียด"
/// finishdate : "วันที่ทำเสร็จ"
/// date : "วันที่"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titleteacheractivity, 
      String? textactivity, 
      String? studentcode, 
      String? student, 
      String? startdate, 
      String? time, 
      String? venue, 
      String? year, 
      String? term, 
      String? detail, 
      String? finishdate, 
      String? date,}){
    _titleteacheractivity = titleteacheractivity;
    _textactivity = textactivity;
    _studentcode = studentcode;
    _student = student;
    _startdate = startdate;
    _time = time;
    _venue = venue;
    _year = year;
    _term = term;
    _detail = detail;
    _finishdate = finishdate;
    _date = date;
}

  Screeninfo.fromJson(dynamic json) {
    _titleteacheractivity = json['titleteacheractivity'];
    _textactivity = json['textactivity'];
    _studentcode = json['studentcode'];
    _student = json['student'];
    _startdate = json['startdate'];
    _time = json['time'];
    _venue = json['venue'];
    _year = json['year'];
    _term = json['term'];
    _detail = json['detail'];
    _finishdate = json['finishdate'];
    _date = json['date'];
  }
  String? _titleteacheractivity;
  String? _textactivity;
  String? _studentcode;
  String? _student;
  String? _startdate;
  String? _time;
  String? _venue;
  String? _year;
  String? _term;
  String? _detail;
  String? _finishdate;
  String? _date;
Screeninfo copyWith({  String? titleteacheractivity,
  String? textactivity,
  String? studentcode,
  String? student,
  String? startdate,
  String? time,
  String? venue,
  String? year,
  String? term,
  String? detail,
  String? finishdate,
  String? date,
}) => Screeninfo(  titleteacheractivity: titleteacheractivity ?? _titleteacheractivity,
  textactivity: textactivity ?? _textactivity,
  studentcode: studentcode ?? _studentcode,
  student: student ?? _student,
  startdate: startdate ?? _startdate,
  time: time ?? _time,
  venue: venue ?? _venue,
  year: year ?? _year,
  term: term ?? _term,
  detail: detail ?? _detail,
  finishdate: finishdate ?? _finishdate,
  date: date ?? _date,
);
  String? get titleteacheractivity => _titleteacheractivity;
  String? get textactivity => _textactivity;
  String? get studentcode => _studentcode;
  String? get student => _student;
  String? get startdate => _startdate;
  String? get time => _time;
  String? get venue => _venue;
  String? get year => _year;
  String? get term => _term;
  String? get detail => _detail;
  String? get finishdate => _finishdate;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleteacheractivity'] = _titleteacheractivity;
    map['textactivity'] = _textactivity;
    map['studentcode'] = _studentcode;
    map['student'] = _student;
    map['startdate'] = _startdate;
    map['time'] = _time;
    map['venue'] = _venue;
    map['year'] = _year;
    map['term'] = _term;
    map['detail'] = _detail;
    map['finishdate'] = _finishdate;
    map['date'] = _date;
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