import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screeninfo":{"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","skill_th":"ทักษะ","skill_en":"Skill","level":"ระดับความสามารถ / Skill level","level_th":"ระดับความสามารถ","level_en":"Skill level","description_th":"รายละเอียด","description_en":"Description"},"data":[{"id":1,"orderchoose":0,"skill":"เวิร์ด","skillen":"ms word","value":"70","detail":null,"detailen":null},{"id":2,"orderchoose":0,"skill":"ms excel","skillen":"ms excel","value":"60","detail":null,"detailen":null},{"id":3,"orderchoose":0,"skill":"ฟลัทเทอร์","skillen":"Flutter","value":"30","detail":null,"detailen":null},{"id":4,"orderchoose":0,"skill":"คณิต","skillen":"Math","value":"60","detail":null,"detailen":null},{"id":5,"orderchoose":0,"skill":"ดอทเนต","skillen":"Dotnet","value":"80","detail":null,"detailen":null},{"id":6,"orderchoose":0,"skill":"ดาร์ท","skillen":"Dart","value":"60","detail":null,"detailen":null}]}

GetSkillResumeResponse getSkillResumeResponseFromJson(String str) => GetSkillResumeResponse.fromJson(json.decode(str));
String getSkillResumeResponseToJson(GetSkillResumeResponse data) => json.encode(data.toJson());
class GetSkillResumeResponse {
  GetSkillResumeResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  GetSkillResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
GetSkillResumeResponse copyWith({  Head? head,
  Body? body,
}) => GetSkillResumeResponse(  head: head ?? _head,
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

/// screeninfo : {"save":"Save/บันทึก","editinfomations":"แก้ไขข้อมูล","skill_th":"ทักษะ","skill_en":"Skill","level":"ระดับความสามารถ / Skill level","level_th":"ระดับความสามารถ","level_en":"Skill level","description_th":"รายละเอียด","description_en":"Description"}
/// data : [{"id":1,"orderchoose":0,"skill":"เวิร์ด","skillen":"ms word","value":"70","detail":null,"detailen":null},{"id":2,"orderchoose":0,"skill":"ms excel","skillen":"ms excel","value":"60","detail":null,"detailen":null},{"id":3,"orderchoose":0,"skill":"ฟลัทเทอร์","skillen":"Flutter","value":"30","detail":null,"detailen":null},{"id":4,"orderchoose":0,"skill":"คณิต","skillen":"Math","value":"60","detail":null,"detailen":null},{"id":5,"orderchoose":0,"skill":"ดอทเนต","skillen":"Dotnet","value":"80","detail":null,"detailen":null},{"id":6,"orderchoose":0,"skill":"ดาร์ท","skillen":"Dart","value":"60","detail":null,"detailen":null}]

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
/// skill : "เวิร์ด"
/// skillen : "ms word"
/// value : "70"
/// detail : null
/// detailen : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      num? orderchoose, 
      String? skill, 
      String? skillen, 
      String? value, 
      dynamic detail, 
      dynamic detailen,}){
    _id = id;
    _orderchoose = orderchoose;
    _skill = skill;
    _skillen = skillen;
    _value = value;
    _detail = detail;
    _detailen = detailen;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _skill = json['skill'];
    _skillen = json['skillen'];
    _value = json['value'];
    _detail = json['detail'];
    _detailen = json['detailen'];
  }
  num? _id;
  num? _orderchoose;
  String? _skill;
  String? _skillen;
  String? _value;
  dynamic _detail;
  dynamic _detailen;
Data copyWith({  num? id,
  num? orderchoose,
  String? skill,
  String? skillen,
  String? value,
  dynamic detail,
  dynamic detailen,
}) => Data(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  skill: skill ?? _skill,
  skillen: skillen ?? _skillen,
  value: value ?? _value,
  detail: detail ?? _detail,
  detailen: detailen ?? _detailen,
);
  num? get id => _id;
  num? get orderchoose => _orderchoose;
  String? get skill => _skill;
  String? get skillen => _skillen;
  String? get value => _value;
  dynamic get detail => _detail;
  dynamic get detailen => _detailen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['skill'] = _skill;
    map['skillen'] = _skillen;
    map['value'] = _value;
    map['detail'] = _detail;
    map['detailen'] = _detailen;
    return map;
  }

}

/// save : "Save/บันทึก"
/// editinfomations : "แก้ไขข้อมูล"
/// skill_th : "ทักษะ"
/// skill_en : "Skill"
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
      String? skillTh, 
      String? skillEn, 
      String? level, 
      String? levelTh, 
      String? levelEn, 
      String? descriptionTh, 
      String? descriptionEn,}){
    _save = save;
    _editinfomations = editinfomations;
    _skillTh = skillTh;
    _skillEn = skillEn;
    _level = level;
    _levelTh = levelTh;
    _levelEn = levelEn;
    _descriptionTh = descriptionTh;
    _descriptionEn = descriptionEn;
}

  Screeninfo.fromJson(dynamic json) {
    _save = json['save'];
    _editinfomations = json['editinfomations'];
    _skillTh = json['skill_th'];
    _skillEn = json['skill_en'];
    _level = json['level'];
    _levelTh = json['level_th'];
    _levelEn = json['level_en'];
    _descriptionTh = json['description_th'];
    _descriptionEn = json['description_en'];
  }
  String? _save;
  String? _editinfomations;
  String? _skillTh;
  String? _skillEn;
  String? _level;
  String? _levelTh;
  String? _levelEn;
  String? _descriptionTh;
  String? _descriptionEn;
Screeninfo copyWith({  String? save,
  String? editinfomations,
  String? skillTh,
  String? skillEn,
  String? level,
  String? levelTh,
  String? levelEn,
  String? descriptionTh,
  String? descriptionEn,
}) => Screeninfo(  save: save ?? _save,
  editinfomations: editinfomations ?? _editinfomations,
  skillTh: skillTh ?? _skillTh,
  skillEn: skillEn ?? _skillEn,
  level: level ?? _level,
  levelTh: levelTh ?? _levelTh,
  levelEn: levelEn ?? _levelEn,
  descriptionTh: descriptionTh ?? _descriptionTh,
  descriptionEn: descriptionEn ?? _descriptionEn,
);
  String? get save => _save;
  String? get editinfomations => _editinfomations;
  String? get skillTh => _skillTh;
  String? get skillEn => _skillEn;
  String? get level => _level;
  String? get levelTh => _levelTh;
  String? get levelEn => _levelEn;
  String? get descriptionTh => _descriptionTh;
  String? get descriptionEn => _descriptionEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['save'] = _save;
    map['editinfomations'] = _editinfomations;
    map['skill_th'] = _skillTh;
    map['skill_en'] = _skillEn;
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