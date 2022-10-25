import 'dart:convert';

ScreenMoreBoardStudentDetailResponse screenMoreBoardStudentDetailResponseFromJson(String str) =>
    ScreenMoreBoardStudentDetailResponse.fromJson(json.decode(str));
String screenMoreBoardStudentDetailResponseToJson(ScreenMoreBoardStudentDetailResponse data) =>
    json.encode(data.toJson());

class ScreenMoreBoardStudentDetailResponse {
  ScreenMoreBoardStudentDetailResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreBoardStudentDetailResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreBoardStudentDetailResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreBoardStudentDetailResponse(
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

/// screeninfo : {"titleboardnisit":"ทำเนียบนิสิต","textnisit":"นักศึกษา","textstudentcode":"รหัสนิสิต","textname":"ชื่อ","textnickname":"ชื่อเล่น","textgen":"รุ่น","textadvisor":"อาจารย์ที่รึกษา","texttel":"โทร","textcontact":"ช่องทางการติดต่อ","textcareer":"สายงาน","textworkstatus":"สถานะการทำงาน","textcompany":"ชื่อสถานที่ทำงาน"}
/// data : {"gen":"65","studentcode":"demo","name":"เด็กชาย ธาราดล","lastname":"ชินโน","nickname":"น้องบาส","advisor":[{"position":"รองศาสตราจารย์ ดร.","teachername":"อภิสิทธิ์ ภคพงศ์พันธุ์","teacherlastname":"-"},{"position":"ผู้ช่วยศาสตราจารย์ ดร.","teachername":"ดวงกมล ผลเต็ม","teacherlastname":"-"},{"position":"ผู้ช่วยศาสตราจารย์ ดร.","teachername":"เดชชาติ สามารถ","teacherlastname":"-"}],"phone":"demoDM3ine","line":"demoDM3ine","facebook":"demofacbok","instagram":"demoinstagrm","twitter":"demotwittera","youtube":"demoyoutubeagg","userworkplace":"buu","usercareer":"dev","usercompany":"fw","attention":"คอมพิวเตอร์ ","status":"ศึกษาต่อ","jobtype":"นักพัฒนา","img":"/9j/"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    Data? data,
  }) {
    _screeninfo = screeninfo;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Screeninfo? _screeninfo;
  Data? _data;
  Body copyWith({
    Screeninfo? screeninfo,
    Data? data,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
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

/// gen : "65"
/// studentcode : "demo"
/// name : "เด็กชาย ธาราดล"
/// lastname : "ชินโน"
/// nickname : "น้องบาส"
/// advisor : [{"position":"รองศาสตราจารย์ ดร.","teachername":"อภิสิทธิ์ ภคพงศ์พันธุ์","teacherlastname":"-"},{"position":"ผู้ช่วยศาสตราจารย์ ดร.","teachername":"ดวงกมล ผลเต็ม","teacherlastname":"-"},{"position":"ผู้ช่วยศาสตราจารย์ ดร.","teachername":"เดชชาติ สามารถ","teacherlastname":"-"}]
/// phone : "demoDM3ine"
/// line : "demoDM3ine"
/// facebook : "demofacbok"
/// instagram : "demoinstagrm"
/// twitter : "demotwittera"
/// youtube : "demoyoutubeagg"
/// userworkplace : "buu"
/// usercareer : "dev"
/// usercompany : "fw"
/// attention : "คอมพิวเตอร์ "
/// status : "ศึกษาต่อ"
/// jobtype : "นักพัฒนา"
/// img : "/9j/"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? gen,
    String? studentcode,
    String? name,
    String? lastname,
    String? nickname,
    List<Advisor>? advisor,
    String? phone,
    String? line,
    String? facebook,
    String? instagram,
    String? twitter,
    String? youtube,
    String? userworkplace,
    String? usercareer,
    String? usercompany,
    String? attention,
    String? status,
    String? jobtype,
    String? img,
  }) {
    _gen = gen;
    _studentcode = studentcode;
    _name = name;
    _lastname = lastname;
    _nickname = nickname;
    _advisor = advisor;
    _phone = phone;
    _line = line;
    _facebook = facebook;
    _instagram = instagram;
    _twitter = twitter;
    _youtube = youtube;
    _userworkplace = userworkplace;
    _usercareer = usercareer;
    _usercompany = usercompany;
    _attention = attention;
    _status = status;
    _jobtype = jobtype;
    _img = img;
  }

  Data.fromJson(dynamic json) {
    _gen = json['gen'];
    _studentcode = json['studentcode'];
    _name = json['name'];
    _lastname = json['lastname'];
    _nickname = json['nickname'];
    if (json['advisor'] != null) {
      _advisor = [];
      json['advisor'].forEach((v) {
        _advisor?.add(Advisor.fromJson(v));
      });
    }
    _phone = json['phone'];
    _line = json['line'];
    _facebook = json['facebook'];
    _instagram = json['instagram'];
    _twitter = json['twitter'];
    _youtube = json['youtube'];
    _userworkplace = json['userworkplace'];
    _usercareer = json['usercareer'];
    _usercompany = json['usercompany'];
    _attention = json['attention'];
    _status = json['status'];
    _jobtype = json['jobtype'];
    _img = json['img'];
  }
  String? _gen;
  String? _studentcode;
  String? _name;
  String? _lastname;
  String? _nickname;
  List<Advisor>? _advisor;
  String? _phone;
  String? _line;
  String? _facebook;
  String? _instagram;
  String? _twitter;
  String? _youtube;
  String? _userworkplace;
  String? _usercareer;
  String? _usercompany;
  String? _attention;
  String? _status;
  String? _jobtype;
  String? _img;
  Data copyWith({
    String? gen,
    String? studentcode,
    String? name,
    String? lastname,
    String? nickname,
    List<Advisor>? advisor,
    String? phone,
    String? line,
    String? facebook,
    String? instagram,
    String? twitter,
    String? youtube,
    String? userworkplace,
    String? usercareer,
    String? usercompany,
    String? attention,
    String? status,
    String? jobtype,
    String? img,
  }) =>
      Data(
        gen: gen ?? _gen,
        studentcode: studentcode ?? _studentcode,
        name: name ?? _name,
        lastname: lastname ?? _lastname,
        nickname: nickname ?? _nickname,
        advisor: advisor ?? _advisor,
        phone: phone ?? _phone,
        line: line ?? _line,
        facebook: facebook ?? _facebook,
        instagram: instagram ?? _instagram,
        twitter: twitter ?? _twitter,
        youtube: youtube ?? _youtube,
        userworkplace: userworkplace ?? _userworkplace,
        usercareer: usercareer ?? _usercareer,
        usercompany: usercompany ?? _usercompany,
        attention: attention ?? _attention,
        status: status ?? _status,
        jobtype: jobtype ?? _jobtype,
        img: img ?? _img,
      );
  String? get gen => _gen;
  String? get studentcode => _studentcode;
  String? get name => _name;
  String? get lastname => _lastname;
  String? get nickname => _nickname;
  List<Advisor>? get advisor => _advisor;
  String? get phone => _phone;
  String? get line => _line;
  String? get facebook => _facebook;
  String? get instagram => _instagram;
  String? get twitter => _twitter;
  String? get youtube => _youtube;
  String? get userworkplace => _userworkplace;
  String? get usercareer => _usercareer;
  String? get usercompany => _usercompany;
  String? get attention => _attention;
  String? get status => _status;
  String? get jobtype => _jobtype;
  String? get img => _img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gen'] = _gen;
    map['studentcode'] = _studentcode;
    map['name'] = _name;
    map['lastname'] = _lastname;
    map['nickname'] = _nickname;
    if (_advisor != null) {
      map['advisor'] = _advisor?.map((v) => v.toJson()).toList();
    }
    map['phone'] = _phone;
    map['line'] = _line;
    map['facebook'] = _facebook;
    map['instagram'] = _instagram;
    map['twitter'] = _twitter;
    map['youtube'] = _youtube;
    map['userworkplace'] = _userworkplace;
    map['usercareer'] = _usercareer;
    map['usercompany'] = _usercompany;
    map['attention'] = _attention;
    map['status'] = _status;
    map['jobtype'] = _jobtype;
    map['img'] = _img;
    return map;
  }
}

/// position : "รองศาสตราจารย์ ดร."
/// teachername : "อภิสิทธิ์ ภคพงศ์พันธุ์"
/// teacherlastname : "-"

Advisor advisorFromJson(String str) => Advisor.fromJson(json.decode(str));
String advisorToJson(Advisor data) => json.encode(data.toJson());

class Advisor {
  Advisor({
    String? position,
    String? teachername,
    String? teacherlastname,
  }) {
    _position = position;
    _teachername = teachername;
    _teacherlastname = teacherlastname;
  }

  Advisor.fromJson(dynamic json) {
    _position = json['position'];
    _teachername = json['teachername'];
    _teacherlastname = json['teacherlastname'];
  }
  String? _position;
  String? _teachername;
  String? _teacherlastname;
  Advisor copyWith({
    String? position,
    String? teachername,
    String? teacherlastname,
  }) =>
      Advisor(
        position: position ?? _position,
        teachername: teachername ?? _teachername,
        teacherlastname: teacherlastname ?? _teacherlastname,
      );
  String? get position => _position;
  String? get teachername => _teachername;
  String? get teacherlastname => _teacherlastname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['position'] = _position;
    map['teachername'] = _teachername;
    map['teacherlastname'] = _teacherlastname;
    return map;
  }
}

/// titleboardnisit : "ทำเนียบนิสิต"
/// textnisit : "นักศึกษา"
/// textstudentcode : "รหัสนิสิต"
/// textname : "ชื่อ"
/// textnickname : "ชื่อเล่น"
/// textgen : "รุ่น"
/// textadvisor : "อาจารย์ที่รึกษา"
/// texttel : "โทร"
/// textcontact : "ช่องทางการติดต่อ"
/// textcareer : "สายงาน"
/// textworkstatus : "สถานะการทำงาน"
/// textcompany : "ชื่อสถานที่ทำงาน"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titleboardnisit,
    String? textnisit,
    String? textstudentcode,
    String? textname,
    String? textnickname,
    String? textgen,
    String? textadvisor,
    String? texttel,
    String? textcontact,
    String? textcareer,
    String? textworkstatus,
    String? textcompany,
  }) {
    _titleboardnisit = titleboardnisit;
    _textnisit = textnisit;
    _textstudentcode = textstudentcode;
    _textname = textname;
    _textnickname = textnickname;
    _textgen = textgen;
    _textadvisor = textadvisor;
    _texttel = texttel;
    _textcontact = textcontact;
    _textcareer = textcareer;
    _textworkstatus = textworkstatus;
    _textcompany = textcompany;
  }

  Screeninfo.fromJson(dynamic json) {
    _titleboardnisit = json['titleboardnisit'];
    _textnisit = json['textnisit'];
    _textstudentcode = json['textstudentcode'];
    _textname = json['textname'];
    _textnickname = json['textnickname'];
    _textgen = json['textgen'];
    _textadvisor = json['textadvisor'];
    _texttel = json['texttel'];
    _textcontact = json['textcontact'];
    _textcareer = json['textcareer'];
    _textworkstatus = json['textworkstatus'];
    _textcompany = json['textcompany'];
  }
  String? _titleboardnisit;
  String? _textnisit;
  String? _textstudentcode;
  String? _textname;
  String? _textnickname;
  String? _textgen;
  String? _textadvisor;
  String? _texttel;
  String? _textcontact;
  String? _textcareer;
  String? _textworkstatus;
  String? _textcompany;
  Screeninfo copyWith({
    String? titleboardnisit,
    String? textnisit,
    String? textstudentcode,
    String? textname,
    String? textnickname,
    String? textgen,
    String? textadvisor,
    String? texttel,
    String? textcontact,
    String? textcareer,
    String? textworkstatus,
    String? textcompany,
  }) =>
      Screeninfo(
        titleboardnisit: titleboardnisit ?? _titleboardnisit,
        textnisit: textnisit ?? _textnisit,
        textstudentcode: textstudentcode ?? _textstudentcode,
        textname: textname ?? _textname,
        textnickname: textnickname ?? _textnickname,
        textgen: textgen ?? _textgen,
        textadvisor: textadvisor ?? _textadvisor,
        texttel: texttel ?? _texttel,
        textcontact: textcontact ?? _textcontact,
        textcareer: textcareer ?? _textcareer,
        textworkstatus: textworkstatus ?? _textworkstatus,
        textcompany: textcompany ?? _textcompany,
      );
  String? get titleboardnisit => _titleboardnisit;
  String? get textnisit => _textnisit;
  String? get textstudentcode => _textstudentcode;
  String? get textname => _textname;
  String? get textnickname => _textnickname;
  String? get textgen => _textgen;
  String? get textadvisor => _textadvisor;
  String? get texttel => _texttel;
  String? get textcontact => _textcontact;
  String? get textcareer => _textcareer;
  String? get textworkstatus => _textworkstatus;
  String? get textcompany => _textcompany;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleboardnisit'] = _titleboardnisit;
    map['textnisit'] = _textnisit;
    map['textstudentcode'] = _textstudentcode;
    map['textname'] = _textname;
    map['textnickname'] = _textnickname;
    map['textgen'] = _textgen;
    map['textadvisor'] = _textadvisor;
    map['texttel'] = _texttel;
    map['textcontact'] = _textcontact;
    map['textcareer'] = _textcareer;
    map['textworkstatus'] = _textworkstatus;
    map['textcompany'] = _textcompany;
    return map;
  }
}

/// status : 200
/// message : "success"
/// modulename : "home"

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());

class Head {
  Head({
    int? status,
    String? message,
    String? modulename,
  }) {
    _status = status;
    _message = message;
    _modulename = modulename;
  }

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _modulename = json['modulename'];
  }
  int? _status;
  String? _message;
  String? _modulename;
  Head copyWith({
    int? status,
    String? message,
    String? modulename,
  }) =>
      Head(
        status: status ?? _status,
        message: message ?? _message,
        modulename: modulename ?? _modulename,
      );
  int? get status => _status;
  String? get message => _message;
  String? get modulename => _modulename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['modulename'] = _modulename;
    return map;
  }
}
