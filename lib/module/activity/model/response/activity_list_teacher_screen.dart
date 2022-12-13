import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity","timeexpire":false}
/// body : {"screeninfo":{"titleteacheractivity":"Activity","textactivity":"Activity","studentcode":"Code","student":"Student","startdate":"Start date","time":"Period","venue":"Venue","year":"Year","term":"Term","detail":"Detail","finishdate":"Finish date","date":"Date","buttonapprove":"Approve","buttondisapprove":"Disapprove","textsearch":"Search","texthere":"here"},"activitylist":[{"acid":23,"acname":"ทดสอบ 1","startdate":"7/12/2022","finishdate":"7/12/2022","venue":"Tonsai home","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","status":"U","color":"#FAFFBE"},{"acid":22,"acname":"เพิ่มใน db","startdate":"30/01/2024","finishdate":"30/01/2025","venue":"Home ton","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","status":"U","color":"#FAFFBE"},{"acid":21,"acname":"เพิ่มโดยอาจารย์ 1","startdate":"8/12/2022","finishdate":"10/12/2022","venue":"Tonsai Homeee","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","status":"A","color":"#C7FFAD"},{"acid":20,"acname":"เพิ่มใน db","startdate":"30/01/2024","finishdate":"30/01/2025","venue":"Home ton","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","status":"A","color":"#C7FFAD"},{"acid":19,"acname":"เพิ่มโดยอาจารย์ 1","startdate":"8/12/2022","finishdate":"10/12/2022","venue":"Tonsai Homeee","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","status":"A","color":"#C7FFAD"}],"options":[{"title":"Student name","value":"1"},{"title":"Activity name","value":"2"}],"options_status":[{"status":"clear all","value":"0"},{"status":"Unapproved","value":"1"},{"status":"Approved","value":"2"},{"status":"Rejected","value":"3"}]}

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

/// screeninfo : {"titleteacheractivity":"Activity","textactivity":"Activity","studentcode":"Code","student":"Student","startdate":"Start date","time":"Period","venue":"Venue","year":"Year","term":"Term","detail":"Detail","finishdate":"Finish date","date":"Date","buttonapprove":"Approve","buttondisapprove":"Disapprove","textsearch":"Search","texthere":"here"}
/// activitylist : [{"acid":23,"acname":"ทดสอบ 1","startdate":"7/12/2022","finishdate":"7/12/2022","venue":"Tonsai home","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","status":"U","color":"#FAFFBE"},{"acid":22,"acname":"เพิ่มใน db","startdate":"30/01/2024","finishdate":"30/01/2025","venue":"Home ton","stdname":"คุณต้นสาย","stdlastname":"ตรีถัน","stdcode":"62030080","status":"U","color":"#FAFFBE"},{"acid":21,"acname":"เพิ่มโดยอาจารย์ 1","startdate":"8/12/2022","finishdate":"10/12/2022","venue":"Tonsai Homeee","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","status":"A","color":"#C7FFAD"},{"acid":20,"acname":"เพิ่มใน db","startdate":"30/01/2024","finishdate":"30/01/2025","venue":"Home ton","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","status":"A","color":"#C7FFAD"},{"acid":19,"acname":"เพิ่มโดยอาจารย์ 1","startdate":"8/12/2022","finishdate":"10/12/2022","venue":"Tonsai Homeee","stdname":"คุณสิทธิพล","stdlastname":"ชินโน","stdcode":"62030340","status":"A","color":"#C7FFAD"}]
/// options : [{"title":"Student name","value":"1"},{"title":"Activity name","value":"2"}]
/// options_status : [{"status":"clear all","value":"0"},{"status":"Unapproved","value":"1"},{"status":"Approved","value":"2"},{"status":"Rejected","value":"3"}]

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

/// status : "clear all"
/// value : "0"

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

/// title : "Student name"
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

/// acid : 23
/// acname : "ทดสอบ 1"
/// startdate : "7/12/2022"
/// finishdate : "7/12/2022"
/// venue : "Tonsai home"
/// stdname : "คุณต้นสาย"
/// stdlastname : "ตรีถัน"
/// stdcode : "62030080"
/// status : "U"
/// color : "#FAFFBE"

Activitylist activitylistFromJson(String str) => Activitylist.fromJson(json.decode(str));
String activitylistToJson(Activitylist data) => json.encode(data.toJson());
class Activitylist {
  Activitylist({
      num? acid, 
      String? acname, 
      String? startdate, 
      String? finishdate, 
      String? venue, 
      String? stdname, 
      String? stdlastname, 
      String? stdcode, 
      String? status, 
      String? color,}){
    _acid = acid;
    _acname = acname;
    _startdate = startdate;
    _finishdate = finishdate;
    _venue = venue;
    _stdname = stdname;
    _stdlastname = stdlastname;
    _stdcode = stdcode;
    _status = status;
    _color = color;
}

  Activitylist.fromJson(dynamic json) {
    _acid = json['acid'];
    _acname = json['acname'];
    _startdate = json['startdate'];
    _finishdate = json['finishdate'];
    _venue = json['venue'];
    _stdname = json['stdname'];
    _stdlastname = json['stdlastname'];
    _stdcode = json['stdcode'];
    _status = json['status'];
    _color = json['color'];
  }
  num? _acid;
  String? _acname;
  String? _startdate;
  String? _finishdate;
  String? _venue;
  String? _stdname;
  String? _stdlastname;
  String? _stdcode;
  String? _status;
  String? _color;
Activitylist copyWith({  num? acid,
  String? acname,
  String? startdate,
  String? finishdate,
  String? venue,
  String? stdname,
  String? stdlastname,
  String? stdcode,
  String? status,
  String? color,
}) => Activitylist(  acid: acid ?? _acid,
  acname: acname ?? _acname,
  startdate: startdate ?? _startdate,
  finishdate: finishdate ?? _finishdate,
  venue: venue ?? _venue,
  stdname: stdname ?? _stdname,
  stdlastname: stdlastname ?? _stdlastname,
  stdcode: stdcode ?? _stdcode,
  status: status ?? _status,
  color: color ?? _color,
);
  num? get acid => _acid;
  String? get acname => _acname;
  String? get startdate => _startdate;
  String? get finishdate => _finishdate;
  String? get venue => _venue;
  String? get stdname => _stdname;
  String? get stdlastname => _stdlastname;
  String? get stdcode => _stdcode;
  String? get status => _status;
  String? get color => _color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['acid'] = _acid;
    map['acname'] = _acname;
    map['startdate'] = _startdate;
    map['finishdate'] = _finishdate;
    map['venue'] = _venue;
    map['stdname'] = _stdname;
    map['stdlastname'] = _stdlastname;
    map['stdcode'] = _stdcode;
    map['status'] = _status;
    map['color'] = _color;
    return map;
  }

}

/// titleteacheractivity : "Activity"
/// textactivity : "Activity"
/// studentcode : "Code"
/// student : "Student"
/// startdate : "Start date"
/// time : "Period"
/// venue : "Venue"
/// year : "Year"
/// term : "Term"
/// detail : "Detail"
/// finishdate : "Finish date"
/// date : "Date"
/// buttonapprove : "Approve"
/// buttondisapprove : "Disapprove"
/// textsearch : "Search"
/// texthere : "here"

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
      String? date, 
      String? buttonapprove, 
      String? buttondisapprove, 
      String? textsearch, 
      String? texthere,}){
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
    _buttonapprove = buttonapprove;
    _buttondisapprove = buttondisapprove;
    _textsearch = textsearch;
    _texthere = texthere;
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
    _buttonapprove = json['buttonapprove'];
    _buttondisapprove = json['buttondisapprove'];
    _textsearch = json['textsearch'];
    _texthere = json['texthere'];
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
  String? _buttonapprove;
  String? _buttondisapprove;
  String? _textsearch;
  String? _texthere;
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
  String? buttonapprove,
  String? buttondisapprove,
  String? textsearch,
  String? texthere,
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
  buttonapprove: buttonapprove ?? _buttonapprove,
  buttondisapprove: buttondisapprove ?? _buttondisapprove,
  textsearch: textsearch ?? _textsearch,
  texthere: texthere ?? _texthere,
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
  String? get buttonapprove => _buttonapprove;
  String? get buttondisapprove => _buttondisapprove;
  String? get textsearch => _textsearch;
  String? get texthere => _texthere;

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
    map['buttonapprove'] = _buttonapprove;
    map['buttondisapprove'] = _buttondisapprove;
    map['textsearch'] = _textsearch;
    map['texthere'] = _texthere;
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