import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity"}
/// body : {"screeninfo":{"titleaddact":"Add activity","titleeditact":"Edit activity","edtactname":"Activity name","edtyear":"Year","edtterm":"Term","edtstartdate":"Start date","edtfinishdate":"Finish date","edttimehours":"Total hours(hh)","edttimeminutes":"Total minutes(mm)","edtvenue":"Venue","edtapprover":"Approver","edtdetail":"Detail","btnconfirm":"Confirm"},"errorbutton":{"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"},"alertmessage":{"alertfillallactivity":"Please fill up all activity information."},"yearlist":["2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025"],"termlist":["1","2","summer"],"approverlist":[{"approvercode":"TCMM01","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์"},{"approvercode":"TCMM02","approvername":"ดวงกมล","approverlastname":"ผลเต็ม"},{"approvercode":"TCMM03","approvername":"เดชชาติ","approverlastname":"สามารถ"},{"approvercode":"TCMM04","approvername":"ชาติไทย","approverlastname":"ไทยประยูร"},{"approvercode":"TCMM05","approvername":"บุญยงค์","approverlastname":"ศรีพลแผ้ว"},{"approvercode":"TCMM06","approvername":"รักพร","approverlastname":"ดอกจันทร์"},{"approvercode":"TCMM07","approvername":"วรวิมล","approverlastname":"เจริญทัมมะสถิต"},{"approvercode":"TCMM08","approvername":"วริน","approverlastname":"วิพิศมากูล"},{"approvercode":"TCMM09","approvername":"สมคิด","approverlastname":"อินเทพ"},{"approvercode":"TCMM10","approvername":"สหัทยา","approverlastname":"รัตนะมงคลกุล"},{"approvercode":"TCMM11","approvername":"สาธินี","approverlastname":"เลิศประไพ"},{"approvercode":"TCMM12","approvername":"สินีนาฏ","approverlastname":"ศรีมงคล"},{"approvercode":"TCMM13","approvername":"เสาวรส","approverlastname":"ศรีสุข"},{"approvercode":"TCMM14","approvername":"อรรณพ","approverlastname":"แก้วขาว"},{"approvercode":"TCMM15","approvername":"อภิชาติ","approverlastname":"เนียมวงษ์"},{"approvercode":"TCMM16","approvername":"อารยา","approverlastname":"วิวัฒน์วานิช"},{"approvercode":"TCMM17","approvername":"อารีรักษ์","approverlastname":"ชัยวร"},{"approvercode":"TCMM18","approvername":"จุฑารัตน์","approverlastname":"คงสอน"},{"approvercode":"TCMM19","approvername":"บัณฑิตา","approverlastname":"ฉัตรเท"},{"approvercode":"TCMM21","approvername":"พัชรวดี","approverlastname":"พูลสำราญ"},{"approvercode":"TCMM22","approvername":"ภคินกร","approverlastname":"พูนพายัพ"},{"approvercode":"TCMM23","approvername":"ลี","approverlastname":"ศาสนพิทักษ์"},{"approvercode":"TCMS01","approvername":"กิดาการ","approverlastname":"สายธนู"},{"approvercode":"TCMS02","approvername":"คณินทร์","approverlastname":"ธีรภาพโอฬาร"},{"approvercode":"TCMS03","approvername":"จตุภัทร","approverlastname":"เมฆพายัพ"},{"approvercode":"TCMS12","approvername":"จุฑาพร","approverlastname":"เนียมวงษ์"},{"approvercode":"TCMS04","approvername":"บำรุงศักดิ์","approverlastname":"เผื่อนอารีย์"},{"approvercode":"TCMS05","approvername":"ปรียารัตน์","approverlastname":"นาคสุวรรณ์"},{"approvercode":"TCMS06","approvername":"พัชรี","approverlastname":"วงษ์เกษม"},{"approvercode":"TCMS07","approvername":"วนิดา","approverlastname":"พงษ์ศักดิ์ชาติ"},{"approvercode":"TCMS08","approvername":"อภิศักดิ์","approverlastname":"ไชยโรจน์วัฒนา"},{"approvercode":"TCMS09","approvername":"นพรัตน์","approverlastname":"แป้นงาม"},{"approvercode":"TCMS10","approvername":"ภัทราภรณ์","approverlastname":"กิจผลเจริญ"},{"approvercode":"TCMS11","approvername":"ลภัสรดา","approverlastname":"สิงห์สมบูรณ์"},{"approvercode":"SFMATH01","approvername":"รศ. ดร.อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์"},{"approvercode":"SFMATH02","approvername":"คุณ กฤติกา","approverlastname":"วัฒนพันธุ์"},{"approvercode":"SFMATH03","approvername":"คุณ ศุภกฤต","approverlastname":"นาวิน"}]}

AddEditActivityScreenApi addEditActivityScreenApiFromJson(String str) => AddEditActivityScreenApi.fromJson(json.decode(str));
String addEditActivityScreenApiToJson(AddEditActivityScreenApi data) => json.encode(data.toJson());
class AddEditActivityScreenApi {
  AddEditActivityScreenApi({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  AddEditActivityScreenApi.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
AddEditActivityScreenApi copyWith({  Head? head,
  Body? body,
}) => AddEditActivityScreenApi(  head: head ?? _head,
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

/// screeninfo : {"titleaddact":"Add activity","titleeditact":"Edit activity","edtactname":"Activity name","edtyear":"Year","edtterm":"Term","edtstartdate":"Start date","edtfinishdate":"Finish date","edttimehours":"Total hours(hh)","edttimeminutes":"Total minutes(mm)","edtvenue":"Venue","edtapprover":"Approver","edtdetail":"Detail","btnconfirm":"Confirm"}
/// errorbutton : {"buttonok":"OK","buttonconfirm":"Confirm","buttonyes":"Yes","buttonno":"No","buttoncancel":"Cancel"}
/// alertmessage : {"alertfillallactivity":"Please fill up all activity information."}
/// yearlist : ["2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023","2024","2025"]
/// termlist : ["1","2","summer"]
/// approverlist : [{"approvercode":"TCMM01","approvername":"อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์"},{"approvercode":"TCMM02","approvername":"ดวงกมล","approverlastname":"ผลเต็ม"},{"approvercode":"TCMM03","approvername":"เดชชาติ","approverlastname":"สามารถ"},{"approvercode":"TCMM04","approvername":"ชาติไทย","approverlastname":"ไทยประยูร"},{"approvercode":"TCMM05","approvername":"บุญยงค์","approverlastname":"ศรีพลแผ้ว"},{"approvercode":"TCMM06","approvername":"รักพร","approverlastname":"ดอกจันทร์"},{"approvercode":"TCMM07","approvername":"วรวิมล","approverlastname":"เจริญทัมมะสถิต"},{"approvercode":"TCMM08","approvername":"วริน","approverlastname":"วิพิศมากูล"},{"approvercode":"TCMM09","approvername":"สมคิด","approverlastname":"อินเทพ"},{"approvercode":"TCMM10","approvername":"สหัทยา","approverlastname":"รัตนะมงคลกุล"},{"approvercode":"TCMM11","approvername":"สาธินี","approverlastname":"เลิศประไพ"},{"approvercode":"TCMM12","approvername":"สินีนาฏ","approverlastname":"ศรีมงคล"},{"approvercode":"TCMM13","approvername":"เสาวรส","approverlastname":"ศรีสุข"},{"approvercode":"TCMM14","approvername":"อรรณพ","approverlastname":"แก้วขาว"},{"approvercode":"TCMM15","approvername":"อภิชาติ","approverlastname":"เนียมวงษ์"},{"approvercode":"TCMM16","approvername":"อารยา","approverlastname":"วิวัฒน์วานิช"},{"approvercode":"TCMM17","approvername":"อารีรักษ์","approverlastname":"ชัยวร"},{"approvercode":"TCMM18","approvername":"จุฑารัตน์","approverlastname":"คงสอน"},{"approvercode":"TCMM19","approvername":"บัณฑิตา","approverlastname":"ฉัตรเท"},{"approvercode":"TCMM21","approvername":"พัชรวดี","approverlastname":"พูลสำราญ"},{"approvercode":"TCMM22","approvername":"ภคินกร","approverlastname":"พูนพายัพ"},{"approvercode":"TCMM23","approvername":"ลี","approverlastname":"ศาสนพิทักษ์"},{"approvercode":"TCMS01","approvername":"กิดาการ","approverlastname":"สายธนู"},{"approvercode":"TCMS02","approvername":"คณินทร์","approverlastname":"ธีรภาพโอฬาร"},{"approvercode":"TCMS03","approvername":"จตุภัทร","approverlastname":"เมฆพายัพ"},{"approvercode":"TCMS12","approvername":"จุฑาพร","approverlastname":"เนียมวงษ์"},{"approvercode":"TCMS04","approvername":"บำรุงศักดิ์","approverlastname":"เผื่อนอารีย์"},{"approvercode":"TCMS05","approvername":"ปรียารัตน์","approverlastname":"นาคสุวรรณ์"},{"approvercode":"TCMS06","approvername":"พัชรี","approverlastname":"วงษ์เกษม"},{"approvercode":"TCMS07","approvername":"วนิดา","approverlastname":"พงษ์ศักดิ์ชาติ"},{"approvercode":"TCMS08","approvername":"อภิศักดิ์","approverlastname":"ไชยโรจน์วัฒนา"},{"approvercode":"TCMS09","approvername":"นพรัตน์","approverlastname":"แป้นงาม"},{"approvercode":"TCMS10","approvername":"ภัทราภรณ์","approverlastname":"กิจผลเจริญ"},{"approvercode":"TCMS11","approvername":"ลภัสรดา","approverlastname":"สิงห์สมบูรณ์"},{"approvercode":"SFMATH01","approvername":"รศ. ดร.อภิสิทธิ์","approverlastname":"ภคพงศ์พันธุ์"},{"approvercode":"SFMATH02","approvername":"คุณ กฤติกา","approverlastname":"วัฒนพันธุ์"},{"approvercode":"SFMATH03","approvername":"คุณ ศุภกฤต","approverlastname":"นาวิน"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      Errorbutton? errorbutton, 
      Alertmessage? alertmessage, 
      List<String>? yearlist, 
      List<String>? termlist, 
      List<Approverlist>? approverlist,}){
    _screeninfo = screeninfo;
    _errorbutton = errorbutton;
    _alertmessage = alertmessage;
    _yearlist = yearlist;
    _termlist = termlist;
    _approverlist = approverlist;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _errorbutton = json['errorbutton'] != null ? Errorbutton.fromJson(json['errorbutton']) : null;
    _alertmessage = json['alertmessage'] != null ? Alertmessage.fromJson(json['alertmessage']) : null;
    _yearlist = json['yearlist'] != null ? json['yearlist'].cast<String>() : [];
    _termlist = json['termlist'] != null ? json['termlist'].cast<String>() : [];
    if (json['approverlist'] != null) {
      _approverlist = [];
      json['approverlist'].forEach((v) {
        _approverlist?.add(Approverlist.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  Errorbutton? _errorbutton;
  Alertmessage? _alertmessage;
  List<String>? _yearlist;
  List<String>? _termlist;
  List<Approverlist>? _approverlist;
Body copyWith({  Screeninfo? screeninfo,
  Errorbutton? errorbutton,
  Alertmessage? alertmessage,
  List<String>? yearlist,
  List<String>? termlist,
  List<Approverlist>? approverlist,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  errorbutton: errorbutton ?? _errorbutton,
  alertmessage: alertmessage ?? _alertmessage,
  yearlist: yearlist ?? _yearlist,
  termlist: termlist ?? _termlist,
  approverlist: approverlist ?? _approverlist,
);
  Screeninfo? get screeninfo => _screeninfo;
  Errorbutton? get errorbutton => _errorbutton;
  Alertmessage? get alertmessage => _alertmessage;
  List<String>? get yearlist => _yearlist;
  List<String>? get termlist => _termlist;
  List<Approverlist>? get approverlist => _approverlist;

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
    map['yearlist'] = _yearlist;
    map['termlist'] = _termlist;
    if (_approverlist != null) {
      map['approverlist'] = _approverlist?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// approvercode : "TCMM01"
/// approvername : "อภิสิทธิ์"
/// approverlastname : "ภคพงศ์พันธุ์"

Approverlist approverlistFromJson(String str) => Approverlist.fromJson(json.decode(str));
String approverlistToJson(Approverlist data) => json.encode(data.toJson());
class Approverlist {
  Approverlist({
      String? approvercode, 
      String? approvername, 
      String? approverlastname,}){
    _approvercode = approvercode;
    _approvername = approvername;
    _approverlastname = approverlastname;
}

  Approverlist.fromJson(dynamic json) {
    _approvercode = json['approvercode'];
    _approvername = json['approvername'];
    _approverlastname = json['approverlastname'];
  }
  String? _approvercode;
  String? _approvername;
  String? _approverlastname;
Approverlist copyWith({  String? approvercode,
  String? approvername,
  String? approverlastname,
}) => Approverlist(  approvercode: approvercode ?? _approvercode,
  approvername: approvername ?? _approvername,
  approverlastname: approverlastname ?? _approverlastname,
);
  String? get approvercode => _approvercode;
  String? get approvername => _approvername;
  String? get approverlastname => _approverlastname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['approvercode'] = _approvercode;
    map['approvername'] = _approvername;
    map['approverlastname'] = _approverlastname;
    return map;
  }

}

/// alertfillallactivity : "Please fill up all activity information."

Alertmessage alertmessageFromJson(String str) => Alertmessage.fromJson(json.decode(str));
String alertmessageToJson(Alertmessage data) => json.encode(data.toJson());
class Alertmessage {
  Alertmessage({
      String? alertfillallactivity,}){
    _alertfillallactivity = alertfillallactivity;
}

  Alertmessage.fromJson(dynamic json) {
    _alertfillallactivity = json['alertfillallactivity'];
  }
  String? _alertfillallactivity;
Alertmessage copyWith({  String? alertfillallactivity,
}) => Alertmessage(  alertfillallactivity: alertfillallactivity ?? _alertfillallactivity,
);
  String? get alertfillallactivity => _alertfillallactivity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alertfillallactivity'] = _alertfillallactivity;
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

/// titleaddact : "Add activity"
/// titleeditact : "Edit activity"
/// edtactname : "Activity name"
/// edtyear : "Year"
/// edtterm : "Term"
/// edtstartdate : "Start date"
/// edtfinishdate : "Finish date"
/// edttimehours : "Total hours(hh)"
/// edttimeminutes : "Total minutes(mm)"
/// edtvenue : "Venue"
/// edtapprover : "Approver"
/// edtdetail : "Detail"
/// btnconfirm : "Confirm"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titleaddact, 
      String? titleeditact, 
      String? edtactname, 
      String? edtyear, 
      String? edtterm, 
      String? edtstartdate, 
      String? edtfinishdate, 
      String? edttimehours, 
      String? edttimeminutes, 
      String? edtvenue, 
      String? edtapprover, 
      String? edtdetail, 
      String? btnconfirm,}){
    _titleaddact = titleaddact;
    _titleeditact = titleeditact;
    _edtactname = edtactname;
    _edtyear = edtyear;
    _edtterm = edtterm;
    _edtstartdate = edtstartdate;
    _edtfinishdate = edtfinishdate;
    _edttimehours = edttimehours;
    _edttimeminutes = edttimeminutes;
    _edtvenue = edtvenue;
    _edtapprover = edtapprover;
    _edtdetail = edtdetail;
    _btnconfirm = btnconfirm;
}

  Screeninfo.fromJson(dynamic json) {
    _titleaddact = json['titleaddact'];
    _titleeditact = json['titleeditact'];
    _edtactname = json['edtactname'];
    _edtyear = json['edtyear'];
    _edtterm = json['edtterm'];
    _edtstartdate = json['edtstartdate'];
    _edtfinishdate = json['edtfinishdate'];
    _edttimehours = json['edttimehours'];
    _edttimeminutes = json['edttimeminutes'];
    _edtvenue = json['edtvenue'];
    _edtapprover = json['edtapprover'];
    _edtdetail = json['edtdetail'];
    _btnconfirm = json['btnconfirm'];
  }
  String? _titleaddact;
  String? _titleeditact;
  String? _edtactname;
  String? _edtyear;
  String? _edtterm;
  String? _edtstartdate;
  String? _edtfinishdate;
  String? _edttimehours;
  String? _edttimeminutes;
  String? _edtvenue;
  String? _edtapprover;
  String? _edtdetail;
  String? _btnconfirm;
Screeninfo copyWith({  String? titleaddact,
  String? titleeditact,
  String? edtactname,
  String? edtyear,
  String? edtterm,
  String? edtstartdate,
  String? edtfinishdate,
  String? edttimehours,
  String? edttimeminutes,
  String? edtvenue,
  String? edtapprover,
  String? edtdetail,
  String? btnconfirm,
}) => Screeninfo(  titleaddact: titleaddact ?? _titleaddact,
  titleeditact: titleeditact ?? _titleeditact,
  edtactname: edtactname ?? _edtactname,
  edtyear: edtyear ?? _edtyear,
  edtterm: edtterm ?? _edtterm,
  edtstartdate: edtstartdate ?? _edtstartdate,
  edtfinishdate: edtfinishdate ?? _edtfinishdate,
  edttimehours: edttimehours ?? _edttimehours,
  edttimeminutes: edttimeminutes ?? _edttimeminutes,
  edtvenue: edtvenue ?? _edtvenue,
  edtapprover: edtapprover ?? _edtapprover,
  edtdetail: edtdetail ?? _edtdetail,
  btnconfirm: btnconfirm ?? _btnconfirm,
);
  String? get titleaddact => _titleaddact;
  String? get titleeditact => _titleeditact;
  String? get edtactname => _edtactname;
  String? get edtyear => _edtyear;
  String? get edtterm => _edtterm;
  String? get edtstartdate => _edtstartdate;
  String? get edtfinishdate => _edtfinishdate;
  String? get edttimehours => _edttimehours;
  String? get edttimeminutes => _edttimeminutes;
  String? get edtvenue => _edtvenue;
  String? get edtapprover => _edtapprover;
  String? get edtdetail => _edtdetail;
  String? get btnconfirm => _btnconfirm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleaddact'] = _titleaddact;
    map['titleeditact'] = _titleeditact;
    map['edtactname'] = _edtactname;
    map['edtyear'] = _edtyear;
    map['edtterm'] = _edtterm;
    map['edtstartdate'] = _edtstartdate;
    map['edtfinishdate'] = _edtfinishdate;
    map['edttimehours'] = _edttimehours;
    map['edttimeminutes'] = _edttimeminutes;
    map['edtvenue'] = _edtvenue;
    map['edtapprover'] = _edtapprover;
    map['edtdetail'] = _edtdetail;
    map['btnconfirm'] = _btnconfirm;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "activity"

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());
class Head {
  Head({
      int? status, 
      String? message, 
      String? modulename,}){
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
Head copyWith({  int? status,
  String? message,
  String? modulename,
}) => Head(  status: status ?? _status,
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