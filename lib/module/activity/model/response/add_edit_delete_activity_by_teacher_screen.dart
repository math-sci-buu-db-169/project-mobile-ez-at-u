import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"activity","timeexpire":false}
/// body : {"screeninfo":{"titleaddactivity":"Add activity","textactivityname":"Activity name","textobjectives":"Objectives","textstartdate":"Start date","textfinishdate":"Finish date","buttonadd":"Add","titlelistactivityname":"Activity name list","titleeditactivity":"Edit activity","buttonsave":"Save","buttondelete":"Delete"}}

AddEditDeleteActivityByTeacherScreen addEditDeleteActivityByTeacherScreenFromJson(String str) => AddEditDeleteActivityByTeacherScreen.fromJson(json.decode(str));
String addEditDeleteActivityByTeacherScreenToJson(AddEditDeleteActivityByTeacherScreen data) => json.encode(data.toJson());
class AddEditDeleteActivityByTeacherScreen {
  AddEditDeleteActivityByTeacherScreen({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  AddEditDeleteActivityByTeacherScreen.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
AddEditDeleteActivityByTeacherScreen copyWith({  Head? head,
  Body? body,
}) => AddEditDeleteActivityByTeacherScreen(  head: head ?? _head,
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

/// screeninfo : {"titleaddactivity":"Add activity","textactivityname":"Activity name","textobjectives":"Objectives","textstartdate":"Start date","textfinishdate":"Finish date","buttonadd":"Add","titlelistactivityname":"Activity name list","titleeditactivity":"Edit activity","buttonsave":"Save","buttondelete":"Delete"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo,}){
    _screeninfo = screeninfo;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
  }
  Screeninfo? _screeninfo;
Body copyWith({  Screeninfo? screeninfo,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
);
  Screeninfo? get screeninfo => _screeninfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    return map;
  }

}

/// titleaddactivity : "Add activity"
/// textactivityname : "Activity name"
/// textobjectives : "Objectives"
/// textstartdate : "Start date"
/// textfinishdate : "Finish date"
/// buttonadd : "Add"
/// titlelistactivityname : "Activity name list"
/// titleeditactivity : "Edit activity"
/// buttonsave : "Save"
/// buttondelete : "Delete"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titleaddactivity, 
      String? textactivityname, 
      String? textobjectives, 
      String? textstartdate, 
      String? textfinishdate, 
      String? buttonadd, 
      String? titlelistactivityname, 
      String? titleeditactivity, 
      String? buttonsave, 
      String? buttondelete,}){
    _titleaddactivity = titleaddactivity;
    _textactivityname = textactivityname;
    _textobjectives = textobjectives;
    _textstartdate = textstartdate;
    _textfinishdate = textfinishdate;
    _buttonadd = buttonadd;
    _titlelistactivityname = titlelistactivityname;
    _titleeditactivity = titleeditactivity;
    _buttonsave = buttonsave;
    _buttondelete = buttondelete;
}

  Screeninfo.fromJson(dynamic json) {
    _titleaddactivity = json['titleaddactivity'];
    _textactivityname = json['textactivityname'];
    _textobjectives = json['textobjectives'];
    _textstartdate = json['textstartdate'];
    _textfinishdate = json['textfinishdate'];
    _buttonadd = json['buttonadd'];
    _titlelistactivityname = json['titlelistactivityname'];
    _titleeditactivity = json['titleeditactivity'];
    _buttonsave = json['buttonsave'];
    _buttondelete = json['buttondelete'];
  }
  String? _titleaddactivity;
  String? _textactivityname;
  String? _textobjectives;
  String? _textstartdate;
  String? _textfinishdate;
  String? _buttonadd;
  String? _titlelistactivityname;
  String? _titleeditactivity;
  String? _buttonsave;
  String? _buttondelete;
Screeninfo copyWith({  String? titleaddactivity,
  String? textactivityname,
  String? textobjectives,
  String? textstartdate,
  String? textfinishdate,
  String? buttonadd,
  String? titlelistactivityname,
  String? titleeditactivity,
  String? buttonsave,
  String? buttondelete,
}) => Screeninfo(  titleaddactivity: titleaddactivity ?? _titleaddactivity,
  textactivityname: textactivityname ?? _textactivityname,
  textobjectives: textobjectives ?? _textobjectives,
  textstartdate: textstartdate ?? _textstartdate,
  textfinishdate: textfinishdate ?? _textfinishdate,
  buttonadd: buttonadd ?? _buttonadd,
  titlelistactivityname: titlelistactivityname ?? _titlelistactivityname,
  titleeditactivity: titleeditactivity ?? _titleeditactivity,
  buttonsave: buttonsave ?? _buttonsave,
  buttondelete: buttondelete ?? _buttondelete,
);
  String? get titleaddactivity => _titleaddactivity;
  String? get textactivityname => _textactivityname;
  String? get textobjectives => _textobjectives;
  String? get textstartdate => _textstartdate;
  String? get textfinishdate => _textfinishdate;
  String? get buttonadd => _buttonadd;
  String? get titlelistactivityname => _titlelistactivityname;
  String? get titleeditactivity => _titleeditactivity;
  String? get buttonsave => _buttonsave;
  String? get buttondelete => _buttondelete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleaddactivity'] = _titleaddactivity;
    map['textactivityname'] = _textactivityname;
    map['textobjectives'] = _textobjectives;
    map['textstartdate'] = _textstartdate;
    map['textfinishdate'] = _textfinishdate;
    map['buttonadd'] = _buttonadd;
    map['titlelistactivityname'] = _titlelistactivityname;
    map['titleeditactivity'] = _titleeditactivity;
    map['buttonsave'] = _buttonsave;
    map['buttondelete'] = _buttondelete;
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