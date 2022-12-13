import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","SkillLanguage_th":"ตำแหน่ง","office_th":"สถานที่ทำงาน","SkillLanguage_en":"SkillLanguages","office_en":"Office","detail_th":"รายละเอียด","detail_en":"Description"},"data":{"SkillLanguage":"นักพัฒนาซอฟต์แวร์","SkillLanguageen":"software developer","office":null,"officeen":null}}

GetSkillLanguageResumeResponse getSkillLanguageResumeResponseFromJson(String str) => GetSkillLanguageResumeResponse.fromJson(json.decode(str));
String getSkillLanguageResumeResponseToJson(GetSkillLanguageResumeResponse data) => json.encode(data.toJson());
class GetSkillLanguageResumeResponse {
  GetSkillLanguageResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetSkillLanguageResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetSkillLanguageResumeResponse copyWith({  Head? head,
    Body? body,
  }) => GetSkillLanguageResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","language_th":"ทักษะทางภาษา","language_en":"Skill Language","level":"ระดับความสามารถ / Skill level","level_th":"ระดับความสามารถ","level_en":"Skill level","description_th":"รายละเอียด","description_en":"Description"}
/// data : [{"id":1,"orderchoose":0,"language":"ไทย","languageen":"Thai","value":"70","detail":null,"detailen":null},{"id":3,"orderchoose":0,"language":"sffftring","languageen":"stfffring","value":"99","detail":null,"detailen":null}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    List<Data>? data,}){
    _screeninfo = screeninfo;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Data>? _data;
  Body copyWith({  Screeninfo? screeninfo,
    List<Data>? data,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    data: data ?? _data,
  );
  Screeninfo? get screeninfo => _screeninfo;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// orderchoose : 0
/// language : "ไทย"
/// languageen : "Thai"
/// value : "70"
/// detail : null
/// detailen : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    num? id,
    num? orderchoose,
    String? language,
    String? languageen,
    String? value,
    dynamic detail,
    dynamic detailen,}){
    _id = id;
    _orderchoose = orderchoose;
    _language = language;
    _languageen = languageen;
    _value = value;
    _detail = detail;
    _detailen = detailen;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _language = json['language'];
    _languageen = json['languageen'];
    _value = json['value'];
    _detail = json['detail'];
    _detailen = json['detailen'];
  }
  num? _id;
  num? _orderchoose;
  String? _language;
  String? _languageen;
  String? _value;
  dynamic _detail;
  dynamic _detailen;
  Data copyWith({  num? id,
    num? orderchoose,
    String? language,
    String? languageen,
    String? value,
    dynamic detail,
    dynamic detailen,
  }) => Data(  id: id ?? _id,
    orderchoose: orderchoose ?? _orderchoose,
    language: language ?? _language,
    languageen: languageen ?? _languageen,
    value: value ?? _value,
    detail: detail ?? _detail,
    detailen: detailen ?? _detailen,
  );
  num? get id => _id;
  num? get orderchoose => _orderchoose;
  String? get language => _language;
  String? get languageen => _languageen;
  String? get value => _value;
  dynamic get detail => _detail;
  dynamic get detailen => _detailen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['language'] = _language;
    map['languageen'] = _languageen;
    map['value'] = _value;
    map['detail'] = _detail;
    map['detailen'] = _detailen;
    return map;
  }

}

/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// language_th : "ทักษะทางภาษา"
/// language_en : "Skill Language"
/// level : "ระดับความสามารถ / Skill level"
/// level_th : "ระดับความสามารถ"
/// level_en : "Skill level"
/// description_th : "รายละเอียด"
/// description_en : "Description"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? save,
    String? editinfomations,
    String? languageTh,
    String? languageEn,
    String? level,
    String? levelTh,
    String? levelEn,
    String? descriptionTh,
    String? descriptionEn,}){
    _save = save;
    _editinfomations = editinfomations;
    _languageTh = languageTh;
    _languageEn = languageEn;
    _level = level;
    _levelTh = levelTh;
    _levelEn = levelEn;
    _descriptionTh = descriptionTh;
    _descriptionEn = descriptionEn;
  }

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _languageTh = json['language_th'];
    _languageEn = json['language_en'];
    _level = json['level'];
    _levelTh = json['level_th'];
    _levelEn = json['level_en'];
    _descriptionTh = json['description_th'];
    _descriptionEn = json['description_en'];
  }
  String? _save;
  String? _editinfomations;
  String? _languageTh;
  String? _languageEn;
  String? _level;
  String? _levelTh;
  String? _levelEn;
  String? _descriptionTh;
  String? _descriptionEn;
  Screeninfo copyWith({  String? save,
    String? editinfomations,
    String? languageTh,
    String? languageEn,
    String? level,
    String? levelTh,
    String? levelEn,
    String? descriptionTh,
    String? descriptionEn,
  }) => Screeninfo(  save: save ?? _save,
    editinfomations: editinfomations ?? _editinfomations,
    languageTh: languageTh ?? _languageTh,
    languageEn: languageEn ?? _languageEn,
    level: level ?? _level,
    levelTh: levelTh ?? _levelTh,
    levelEn: levelEn ?? _levelEn,
    descriptionTh: descriptionTh ?? _descriptionTh,
    descriptionEn: descriptionEn ?? _descriptionEn,
  );
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get languageTh => _languageTh;
  String? get languageEn => _languageEn;
  String? get level => _level;
  String? get levelTh => _levelTh;
  String? get levelEn => _levelEn;
  String? get descriptionTh => _descriptionTh;
  String? get descriptionEn => _descriptionEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['language_th'] = _languageTh;
    map['language_en'] = _languageEn;
    map['level'] = _level;
    map['level_th'] = _levelTh;
    map['level_en'] = _levelEn;
    map['description_th'] = _descriptionTh;
    map['description_en'] = _descriptionEn;
    return map;
  }

}

/// status : 200
/// message : "success"
/// modulename : "home/resume"
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