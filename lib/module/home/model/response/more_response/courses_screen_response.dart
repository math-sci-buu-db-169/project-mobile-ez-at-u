import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home","timeexpire":false}
/// body : {"screeninfo":{"titlecourse":"หลักสูตร","bachelor":"หลักสูตรระดับปริญญาตรี","graduate":"หลักสูตรระดับบัณฑิตศึกษา","coursall":"หลักสูตรทั้งหมด","websitecoursall":"http://math.buu.ac.th/coursesoffered/frontend/index","publish":"วันที่เผยแพร่","by":"โดย"},"bachelors":[{"namecourses":"วท.บ. (คณิตศาสตร์ )","weblink":"https://sites.google.com/go.buu.ac.th/bscmathematics","publish":"10/08/2022","updater":"Araya"},{"namecourses":"วท.บ. (สถิติ)","weblink":"https://sites.google.com/go.buu.ac.th/bscstatistics/home","publish":"10/08/2022","updater":"Araya"},{"namecourses":"วท.บ. (วิทยาการข้อมูลและการวิเคราะห์ข้อมูล)","weblink":"https://sites.google.com/go.buu.ac.th/dsdabuu","publish":"10/08/2022","updater":"Araya"}],"masters":[{"namecourses":"วท.ม. (คณิตศาสตรศึกษา)","weblink":"https://sites.google.com/go.buu.ac.th/msc-math-education/home","publish":"28/10/ 2022","updater":"Araya"}]}

CoursesScreenResponse coursesScreenResponseFromJson(String str) => CoursesScreenResponse.fromJson(json.decode(str));
String coursesScreenResponseToJson(CoursesScreenResponse data) => json.encode(data.toJson());
class CoursesScreenResponse {
  CoursesScreenResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  CoursesScreenResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
CoursesScreenResponse copyWith({  Head? head,
  Body? body,
}) => CoursesScreenResponse(  head: head ?? _head,
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

/// screeninfo : {"titlecourse":"หลักสูตร","bachelor":"หลักสูตรระดับปริญญาตรี","graduate":"หลักสูตรระดับบัณฑิตศึกษา","coursall":"หลักสูตรทั้งหมด","websitecoursall":"http://math.buu.ac.th/coursesoffered/frontend/index","publish":"วันที่เผยแพร่","by":"โดย"}
/// bachelors : [{"namecourses":"วท.บ. (คณิตศาสตร์ )","weblink":"https://sites.google.com/go.buu.ac.th/bscmathematics","publish":"10/08/2022","updater":"Araya"},{"namecourses":"วท.บ. (สถิติ)","weblink":"https://sites.google.com/go.buu.ac.th/bscstatistics/home","publish":"10/08/2022","updater":"Araya"},{"namecourses":"วท.บ. (วิทยาการข้อมูลและการวิเคราะห์ข้อมูล)","weblink":"https://sites.google.com/go.buu.ac.th/dsdabuu","publish":"10/08/2022","updater":"Araya"}]
/// masters : [{"namecourses":"วท.ม. (คณิตศาสตรศึกษา)","weblink":"https://sites.google.com/go.buu.ac.th/msc-math-education/home","publish":"28/10/ 2022","updater":"Araya"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<Bachelors>? bachelors, 
      List<Masters>? masters,}){
    _screeninfo = screeninfo;
    _bachelors = bachelors;
    _masters = masters;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['bachelors'] != null) {
      _bachelors = [];
      json['bachelors'].forEach((v) {
        _bachelors?.add(Bachelors.fromJson(v));
      });
    }
    if (json['masters'] != null) {
      _masters = [];
      json['masters'].forEach((v) {
        _masters?.add(Masters.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Bachelors>? _bachelors;
  List<Masters>? _masters;
Body copyWith({  Screeninfo? screeninfo,
  List<Bachelors>? bachelors,
  List<Masters>? masters,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  bachelors: bachelors ?? _bachelors,
  masters: masters ?? _masters,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<Bachelors>? get bachelors => _bachelors;
  List<Masters>? get masters => _masters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_bachelors != null) {
      map['bachelors'] = _bachelors?.map((v) => v.toJson()).toList();
    }
    if (_masters != null) {
      map['masters'] = _masters?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// namecourses : "วท.ม. (คณิตศาสตรศึกษา)"
/// weblink : "https://sites.google.com/go.buu.ac.th/msc-math-education/home"
/// publish : "28/10/ 2022"
/// updater : "Araya"

Masters mastersFromJson(String str) => Masters.fromJson(json.decode(str));
String mastersToJson(Masters data) => json.encode(data.toJson());
class Masters {
  Masters({
      String? namecourses, 
      String? weblink, 
      String? publish, 
      String? updater,}){
    _namecourses = namecourses;
    _weblink = weblink;
    _publish = publish;
    _updater = updater;
}

  Masters.fromJson(dynamic json) {
    _namecourses = json['namecourses'];
    _weblink = json['weblink'];
    _publish = json['publish'];
    _updater = json['updater'];
  }
  String? _namecourses;
  String? _weblink;
  String? _publish;
  String? _updater;
Masters copyWith({  String? namecourses,
  String? weblink,
  String? publish,
  String? updater,
}) => Masters(  namecourses: namecourses ?? _namecourses,
  weblink: weblink ?? _weblink,
  publish: publish ?? _publish,
  updater: updater ?? _updater,
);
  String? get namecourses => _namecourses;
  String? get weblink => _weblink;
  String? get publish => _publish;
  String? get updater => _updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namecourses'] = _namecourses;
    map['weblink'] = _weblink;
    map['publish'] = _publish;
    map['updater'] = _updater;
    return map;
  }

}

/// namecourses : "วท.บ. (คณิตศาสตร์ )"
/// weblink : "https://sites.google.com/go.buu.ac.th/bscmathematics"
/// publish : "10/08/2022"
/// updater : "Araya"

Bachelors bachelorsFromJson(String str) => Bachelors.fromJson(json.decode(str));
String bachelorsToJson(Bachelors data) => json.encode(data.toJson());
class Bachelors {
  Bachelors({
      String? namecourses, 
      String? weblink, 
      String? publish, 
      String? updater,}){
    _namecourses = namecourses;
    _weblink = weblink;
    _publish = publish;
    _updater = updater;
}

  Bachelors.fromJson(dynamic json) {
    _namecourses = json['namecourses'];
    _weblink = json['weblink'];
    _publish = json['publish'];
    _updater = json['updater'];
  }
  String? _namecourses;
  String? _weblink;
  String? _publish;
  String? _updater;
Bachelors copyWith({  String? namecourses,
  String? weblink,
  String? publish,
  String? updater,
}) => Bachelors(  namecourses: namecourses ?? _namecourses,
  weblink: weblink ?? _weblink,
  publish: publish ?? _publish,
  updater: updater ?? _updater,
);
  String? get namecourses => _namecourses;
  String? get weblink => _weblink;
  String? get publish => _publish;
  String? get updater => _updater;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namecourses'] = _namecourses;
    map['weblink'] = _weblink;
    map['publish'] = _publish;
    map['updater'] = _updater;
    return map;
  }

}

/// titlecourse : "หลักสูตร"
/// bachelor : "หลักสูตรระดับปริญญาตรี"
/// graduate : "หลักสูตรระดับบัณฑิตศึกษา"
/// coursall : "หลักสูตรทั้งหมด"
/// websitecoursall : "http://math.buu.ac.th/coursesoffered/frontend/index"
/// publish : "วันที่เผยแพร่"
/// by : "โดย"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titlecourse, 
      String? bachelor, 
      String? graduate, 
      String? coursall, 
      String? websitecoursall, 
      String? publish, 
      String? by,}){
    _titlecourse = titlecourse;
    _bachelor = bachelor;
    _graduate = graduate;
    _coursall = coursall;
    _websitecoursall = websitecoursall;
    _publish = publish;
    _by = by;
}

  Screeninfo.fromJson(dynamic json) {
    _titlecourse = json['titlecourse'];
    _bachelor = json['bachelor'];
    _graduate = json['graduate'];
    _coursall = json['coursall'];
    _websitecoursall = json['websitecoursall'];
    _publish = json['publish'];
    _by = json['by'];
  }
  String? _titlecourse;
  String? _bachelor;
  String? _graduate;
  String? _coursall;
  String? _websitecoursall;
  String? _publish;
  String? _by;
Screeninfo copyWith({  String? titlecourse,
  String? bachelor,
  String? graduate,
  String? coursall,
  String? websitecoursall,
  String? publish,
  String? by,
}) => Screeninfo(  titlecourse: titlecourse ?? _titlecourse,
  bachelor: bachelor ?? _bachelor,
  graduate: graduate ?? _graduate,
  coursall: coursall ?? _coursall,
  websitecoursall: websitecoursall ?? _websitecoursall,
  publish: publish ?? _publish,
  by: by ?? _by,
);
  String? get titlecourse => _titlecourse;
  String? get bachelor => _bachelor;
  String? get graduate => _graduate;
  String? get coursall => _coursall;
  String? get websitecoursall => _websitecoursall;
  String? get publish => _publish;
  String? get by => _by;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlecourse'] = _titlecourse;
    map['bachelor'] = _bachelor;
    map['graduate'] = _graduate;
    map['coursall'] = _coursall;
    map['websitecoursall'] = _websitecoursall;
    map['publish'] = _publish;
    map['by'] = _by;
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