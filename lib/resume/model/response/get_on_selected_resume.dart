import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"data":{"position":[{"id":2,"onselect":true}],"experience":[{"id":1,"onselect":true}],"education":{"hsc":[{"id":1,"onselect":true}],"bd":[{"id":2,"onselect":true},{"id":3,"onselect":true}],"md":[{"id":4,"onselect":true}],"dd":[{"id":5,"onselect":true}],"hdd":[{"id":6,"onselect":true}]},"skill":[{"id":1,"onselect":true}],"certificate":[{"id":1,"onselect":true}],"languge":[{"id":1,"onselect":true}],"social":{"onselected_email":true,"onselected_phone":true,"onselected_facebook":true,"onselected_line":true,"onselected_instagram":true,"onselected_twitter":true,"onselected_youtube":true}}}

GetOnSelectedResume getOnSelectedResumeFromJson(String str) => GetOnSelectedResume.fromJson(json.decode(str));
String getOnSelectedResumeToJson(GetOnSelectedResume data) => json.encode(data.toJson());
class GetOnSelectedResume {
  GetOnSelectedResume({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  GetOnSelectedResume.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  GetOnSelectedResume copyWith({  Head? head,
    Body? body,
  }) => GetOnSelectedResume(  head: head ?? _head,
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
/// data_on_select : {"position_on_select":[{"id":3,"onselect":true}],"experience_on_select":[{"id":5,"onselect":true}],"education_on_select":{"hsc_on_select":[{"id":5,"onselect":true}],"bd_on_select":[{"id":5,"onselect":true}],"md_on_select":[{"id":5,"onselect":true}],"dd_on_select":[{"id":5,"onselect":true}],"hdd_on_select":[{"id":5,"onselect":true}]},"skill_on_select":[{"id":5,"onselect":true}],"certificate_on_select":[{"id":5,"onselect":true}],"language_on_select":[{"id":5,"onselect":true}],"social_on_select":{"onselected_email":false,"onselected_phone":false,"onselected_facebook":false,"onselected_line":false,"onselected_instagram":false,"onselected_twitter":false,"onselected_youtube":false},"address_on_select":{"onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":false,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true}}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    DataOnSelect? dataOnSelect,}){
    _dataOnSelect = dataOnSelect;
  }

  Body.fromJson(dynamic json) {
    _dataOnSelect = json['data_on_select'] != null ? DataOnSelect.fromJson(json['data_on_select']) : null;
  }
  DataOnSelect? _dataOnSelect;
  Body copyWith({  DataOnSelect? dataOnSelect,
  }) => Body(  dataOnSelect: dataOnSelect ?? _dataOnSelect,
  );
  DataOnSelect? get dataOnSelect => _dataOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataOnSelect != null) {
      map['data_on_select'] = _dataOnSelect?.toJson();
    }
    return map;
  }

}

/// position_on_select : [{"id":3,"onselect":true}]
/// experience_on_select : [{"id":5,"onselect":true}]
/// education_on_select : {"hsc_on_select":[{"id":5,"onselect":true}],"bd_on_select":[{"id":5,"onselect":true}],"md_on_select":[{"id":5,"onselect":true}],"dd_on_select":[{"id":5,"onselect":true}],"hdd_on_select":[{"id":5,"onselect":true}]}
/// skill_on_select : [{"id":5,"onselect":true}]
/// certificate_on_select : [{"id":5,"onselect":true}]
/// language_on_select : [{"id":5,"onselect":true}]
/// social_on_select : {"onselected_email":false,"onselected_phone":false,"onselected_facebook":false,"onselected_line":false,"onselected_instagram":false,"onselected_twitter":false,"onselected_youtube":false}
/// address_on_select : {"onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":false,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true}

DataOnSelect dataOnSelectFromJson(String str) => DataOnSelect.fromJson(json.decode(str));
String dataOnSelectToJson(DataOnSelect data) => json.encode(data.toJson());
class DataOnSelect {
  DataOnSelect({
    List<PositionOnSelect>? positionOnSelect,
    List<ExperienceOnSelect>? experienceOnSelect,
    EducationOnSelect? educationOnSelect,
    List<SkillOnSelect>? skillOnSelect,
    List<CertificateOnSelect>? certificateOnSelect,
    List<LanguageOnSelect>? languageOnSelect,
    SocialOnSelect? socialOnSelect,
    AddressOnSelect? addressOnSelect,}){
    _positionOnSelect = positionOnSelect;
    _experienceOnSelect = experienceOnSelect;
    _educationOnSelect = educationOnSelect;
    _skillOnSelect = skillOnSelect;
    _certificateOnSelect = certificateOnSelect;
    _languageOnSelect = languageOnSelect;
    _socialOnSelect = socialOnSelect;
    _addressOnSelect = addressOnSelect;
  }

  DataOnSelect.fromJson(dynamic json) {
    if (json['position_on_select'] != null) {
      _positionOnSelect = [];
      json['position_on_select'].forEach((v) {
        _positionOnSelect?.add(PositionOnSelect.fromJson(v));
      });
    }
    if (json['experience_on_select'] != null) {
      _experienceOnSelect = [];
      json['experience_on_select'].forEach((v) {
        _experienceOnSelect?.add(ExperienceOnSelect.fromJson(v));
      });
    }
    _educationOnSelect = json['education_on_select'] != null ? EducationOnSelect.fromJson(json['education_on_select']) : null;
    if (json['skill_on_select'] != null) {
      _skillOnSelect = [];
      json['skill_on_select'].forEach((v) {
        _skillOnSelect?.add(SkillOnSelect.fromJson(v));
      });
    }
    if (json['certificate_on_select'] != null) {
      _certificateOnSelect = [];
      json['certificate_on_select'].forEach((v) {
        _certificateOnSelect?.add(CertificateOnSelect.fromJson(v));
      });
    }
    if (json['language_on_select'] != null) {
      _languageOnSelect = [];
      json['language_on_select'].forEach((v) {
        _languageOnSelect?.add(LanguageOnSelect.fromJson(v));
      });
    }
    _socialOnSelect = json['social_on_select'] != null ? SocialOnSelect.fromJson(json['social_on_select']) : null;
    _addressOnSelect = json['address_on_select'] != null ? AddressOnSelect.fromJson(json['address_on_select']) : null;
  }
  List<PositionOnSelect>? _positionOnSelect;
  List<ExperienceOnSelect>? _experienceOnSelect;
  EducationOnSelect? _educationOnSelect;
  List<SkillOnSelect>? _skillOnSelect;
  List<CertificateOnSelect>? _certificateOnSelect;
  List<LanguageOnSelect>? _languageOnSelect;
  SocialOnSelect? _socialOnSelect;
  AddressOnSelect? _addressOnSelect;
  DataOnSelect copyWith({  List<PositionOnSelect>? positionOnSelect,
    List<ExperienceOnSelect>? experienceOnSelect,
    EducationOnSelect? educationOnSelect,
    List<SkillOnSelect>? skillOnSelect,
    List<CertificateOnSelect>? certificateOnSelect,
    List<LanguageOnSelect>? languageOnSelect,
    SocialOnSelect? socialOnSelect,
    AddressOnSelect? addressOnSelect,
  }) => DataOnSelect(  positionOnSelect: positionOnSelect ?? _positionOnSelect,
    experienceOnSelect: experienceOnSelect ?? _experienceOnSelect,
    educationOnSelect: educationOnSelect ?? _educationOnSelect,
    skillOnSelect: skillOnSelect ?? _skillOnSelect,
    certificateOnSelect: certificateOnSelect ?? _certificateOnSelect,
    languageOnSelect: languageOnSelect ?? _languageOnSelect,
    socialOnSelect: socialOnSelect ?? _socialOnSelect,
    addressOnSelect: addressOnSelect ?? _addressOnSelect,
  );
  List<PositionOnSelect>? get positionOnSelect => _positionOnSelect;
  List<ExperienceOnSelect>? get experienceOnSelect => _experienceOnSelect;
  EducationOnSelect? get educationOnSelect => _educationOnSelect;
  List<SkillOnSelect>? get skillOnSelect => _skillOnSelect;
  List<CertificateOnSelect>? get certificateOnSelect => _certificateOnSelect;
  List<LanguageOnSelect>? get languageOnSelect => _languageOnSelect;
  SocialOnSelect? get socialOnSelect => _socialOnSelect;
  AddressOnSelect? get addressOnSelect => _addressOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_positionOnSelect != null) {
      map['position_on_select'] = _positionOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_experienceOnSelect != null) {
      map['experience_on_select'] = _experienceOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_educationOnSelect != null) {
      map['education_on_select'] = _educationOnSelect?.toJson();
    }
    if (_skillOnSelect != null) {
      map['skill_on_select'] = _skillOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_certificateOnSelect != null) {
      map['certificate_on_select'] = _certificateOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_languageOnSelect != null) {
      map['language_on_select'] = _languageOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_socialOnSelect != null) {
      map['social_on_select'] = _socialOnSelect?.toJson();
    }
    if (_addressOnSelect != null) {
      map['address_on_select'] = _addressOnSelect?.toJson();
    }
    return map;
  }

}

/// onselected_number : false
/// onselected_moo : false
/// onselected_soi : false
/// onselected_road : false
/// onselected_subdistrict : true
/// onselected_district : true
/// onselected_province : true
/// onselected_zipcode : true

AddressOnSelect addressOnSelectFromJson(String str) => AddressOnSelect.fromJson(json.decode(str));
String addressOnSelectToJson(AddressOnSelect data) => json.encode(data.toJson());
class AddressOnSelect {
  AddressOnSelect({
    bool? onselectedNumber,
    bool? onselectedMoo,
    bool? onselectedSoi,
    bool? onselectedRoad,
    bool? onselectedSubdistrict,
    bool? onselectedDistrict,
    bool? onselectedProvince,
    bool? onselectedZipcode,}){
    _onselectedNumber = onselectedNumber;
    _onselectedMoo = onselectedMoo;
    _onselectedSoi = onselectedSoi;
    _onselectedRoad = onselectedRoad;
    _onselectedSubdistrict = onselectedSubdistrict;
    _onselectedDistrict = onselectedDistrict;
    _onselectedProvince = onselectedProvince;
    _onselectedZipcode = onselectedZipcode;
  }

  AddressOnSelect.fromJson(dynamic json) {
    _onselectedNumber = json['onselected_number'];
    _onselectedMoo = json['onselected_moo'];
    _onselectedSoi = json['onselected_soi'];
    _onselectedRoad = json['onselected_road'];
    _onselectedSubdistrict = json['onselected_subdistrict'];
    _onselectedDistrict = json['onselected_district'];
    _onselectedProvince = json['onselected_province'];
    _onselectedZipcode = json['onselected_zipcode'];
  }
  bool? _onselectedNumber;
  bool? _onselectedMoo;
  bool? _onselectedSoi;
  bool? _onselectedRoad;
  bool? _onselectedSubdistrict;
  bool? _onselectedDistrict;
  bool? _onselectedProvince;
  bool? _onselectedZipcode;
  AddressOnSelect copyWith({  bool? onselectedNumber,
    bool? onselectedMoo,
    bool? onselectedSoi,
    bool? onselectedRoad,
    bool? onselectedSubdistrict,
    bool? onselectedDistrict,
    bool? onselectedProvince,
    bool? onselectedZipcode,
  }) => AddressOnSelect(  onselectedNumber: onselectedNumber ?? _onselectedNumber,
    onselectedMoo: onselectedMoo ?? _onselectedMoo,
    onselectedSoi: onselectedSoi ?? _onselectedSoi,
    onselectedRoad: onselectedRoad ?? _onselectedRoad,
    onselectedSubdistrict: onselectedSubdistrict ?? _onselectedSubdistrict,
    onselectedDistrict: onselectedDistrict ?? _onselectedDistrict,
    onselectedProvince: onselectedProvince ?? _onselectedProvince,
    onselectedZipcode: onselectedZipcode ?? _onselectedZipcode,
  );
  bool? get onselectedNumber => _onselectedNumber;
  bool? get onselectedMoo => _onselectedMoo;
  bool? get onselectedSoi => _onselectedSoi;
  bool? get onselectedRoad => _onselectedRoad;
  bool? get onselectedSubdistrict => _onselectedSubdistrict;
  bool? get onselectedDistrict => _onselectedDistrict;
  bool? get onselectedProvince => _onselectedProvince;
  bool? get onselectedZipcode => _onselectedZipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['onselected_number'] = _onselectedNumber;
    map['onselected_moo'] = _onselectedMoo;
    map['onselected_soi'] = _onselectedSoi;
    map['onselected_road'] = _onselectedRoad;
    map['onselected_subdistrict'] = _onselectedSubdistrict;
    map['onselected_district'] = _onselectedDistrict;
    map['onselected_province'] = _onselectedProvince;
    map['onselected_zipcode'] = _onselectedZipcode;
    return map;
  }

}

/// onselected_email : false
/// onselected_phone : false
/// onselected_facebook : false
/// onselected_line : false
/// onselected_instagram : false
/// onselected_twitter : false
/// onselected_youtube : false

SocialOnSelect socialOnSelectFromJson(String str) => SocialOnSelect.fromJson(json.decode(str));
String socialOnSelectToJson(SocialOnSelect data) => json.encode(data.toJson());
class SocialOnSelect {
  SocialOnSelect({
    bool? onselectedEmail,
    bool? onselectedPhone,
    bool? onselectedFacebook,
    bool? onselectedLine,
    bool? onselectedInstagram,
    bool? onselectedTwitter,
    bool? onselectedYoutube,}){
    _onselectedEmail = onselectedEmail;
    _onselectedPhone = onselectedPhone;
    _onselectedFacebook = onselectedFacebook;
    _onselectedLine = onselectedLine;
    _onselectedInstagram = onselectedInstagram;
    _onselectedTwitter = onselectedTwitter;
    _onselectedYoutube = onselectedYoutube;
  }

  SocialOnSelect.fromJson(dynamic json) {
    _onselectedEmail = json['onselected_email'];
    _onselectedPhone = json['onselected_phone'];
    _onselectedFacebook = json['onselected_facebook'];
    _onselectedLine = json['onselected_line'];
    _onselectedInstagram = json['onselected_instagram'];
    _onselectedTwitter = json['onselected_twitter'];
    _onselectedYoutube = json['onselected_youtube'];
  }
  bool? _onselectedEmail;
  bool? _onselectedPhone;
  bool? _onselectedFacebook;
  bool? _onselectedLine;
  bool? _onselectedInstagram;
  bool? _onselectedTwitter;
  bool? _onselectedYoutube;
  SocialOnSelect copyWith({  bool? onselectedEmail,
    bool? onselectedPhone,
    bool? onselectedFacebook,
    bool? onselectedLine,
    bool? onselectedInstagram,
    bool? onselectedTwitter,
    bool? onselectedYoutube,
  }) => SocialOnSelect(  onselectedEmail: onselectedEmail ?? _onselectedEmail,
    onselectedPhone: onselectedPhone ?? _onselectedPhone,
    onselectedFacebook: onselectedFacebook ?? _onselectedFacebook,
    onselectedLine: onselectedLine ?? _onselectedLine,
    onselectedInstagram: onselectedInstagram ?? _onselectedInstagram,
    onselectedTwitter: onselectedTwitter ?? _onselectedTwitter,
    onselectedYoutube: onselectedYoutube ?? _onselectedYoutube,
  );
  bool? get onselectedEmail => _onselectedEmail;
  bool? get onselectedPhone => _onselectedPhone;
  bool? get onselectedFacebook => _onselectedFacebook;
  bool? get onselectedLine => _onselectedLine;
  bool? get onselectedInstagram => _onselectedInstagram;
  bool? get onselectedTwitter => _onselectedTwitter;
  bool? get onselectedYoutube => _onselectedYoutube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['onselected_email'] = _onselectedEmail;
    map['onselected_phone'] = _onselectedPhone;
    map['onselected_facebook'] = _onselectedFacebook;
    map['onselected_line'] = _onselectedLine;
    map['onselected_instagram'] = _onselectedInstagram;
    map['onselected_twitter'] = _onselectedTwitter;
    map['onselected_youtube'] = _onselectedYoutube;
    return map;
  }

}

/// id : 5
/// onselect : true

LanguageOnSelect languageOnSelectFromJson(String str) => LanguageOnSelect.fromJson(json.decode(str));
String languageOnSelectToJson(LanguageOnSelect data) => json.encode(data.toJson());
class LanguageOnSelect {
  LanguageOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  LanguageOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  LanguageOnSelect copyWith({  int? id,
    bool? onselect,
  }) => LanguageOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 5
/// onselect : true

CertificateOnSelect certificateOnSelectFromJson(String str) => CertificateOnSelect.fromJson(json.decode(str));
String certificateOnSelectToJson(CertificateOnSelect data) => json.encode(data.toJson());
class CertificateOnSelect {
  CertificateOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  CertificateOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  CertificateOnSelect copyWith({  int? id,
    bool? onselect,
  }) => CertificateOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 5
/// onselect : true

SkillOnSelect skillOnSelectFromJson(String str) => SkillOnSelect.fromJson(json.decode(str));
String skillOnSelectToJson(SkillOnSelect data) => json.encode(data.toJson());
class SkillOnSelect {
  SkillOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  SkillOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  SkillOnSelect copyWith({  int? id,
    bool? onselect,
  }) => SkillOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// hsc_on_select : [{"id":5,"onselect":true}]
/// bd_on_select : [{"id":5,"onselect":true}]
/// md_on_select : [{"id":5,"onselect":true}]
/// dd_on_select : [{"id":5,"onselect":true}]
/// hdd_on_select : [{"id":5,"onselect":true}]

EducationOnSelect educationOnSelectFromJson(String str) => EducationOnSelect.fromJson(json.decode(str));
String educationOnSelectToJson(EducationOnSelect data) => json.encode(data.toJson());
class EducationOnSelect {
  EducationOnSelect({
    List<HscOnSelect>? hscOnSelect,
    List<BdOnSelect>? bdOnSelect,
    List<MdOnSelect>? mdOnSelect,
    List<DdOnSelect>? ddOnSelect,
    List<HddOnSelect>? hddOnSelect,}){
    _hscOnSelect = hscOnSelect;
    _bdOnSelect = bdOnSelect;
    _mdOnSelect = mdOnSelect;
    _ddOnSelect = ddOnSelect;
    _hddOnSelect = hddOnSelect;
  }

  EducationOnSelect.fromJson(dynamic json) {
    if (json['hsc_on_select'] != null) {
      _hscOnSelect = [];
      json['hsc_on_select'].forEach((v) {
        _hscOnSelect?.add(HscOnSelect.fromJson(v));
      });
    }
    if (json['bd_on_select'] != null) {
      _bdOnSelect = [];
      json['bd_on_select'].forEach((v) {
        _bdOnSelect?.add(BdOnSelect.fromJson(v));
      });
    }
    if (json['md_on_select'] != null) {
      _mdOnSelect = [];
      json['md_on_select'].forEach((v) {
        _mdOnSelect?.add(MdOnSelect.fromJson(v));
      });
    }
    if (json['dd_on_select'] != null) {
      _ddOnSelect = [];
      json['dd_on_select'].forEach((v) {
        _ddOnSelect?.add(DdOnSelect.fromJson(v));
      });
    }
    if (json['hdd_on_select'] != null) {
      _hddOnSelect = [];
      json['hdd_on_select'].forEach((v) {
        _hddOnSelect?.add(HddOnSelect.fromJson(v));
      });
    }
  }
  List<HscOnSelect>? _hscOnSelect;
  List<BdOnSelect>? _bdOnSelect;
  List<MdOnSelect>? _mdOnSelect;
  List<DdOnSelect>? _ddOnSelect;
  List<HddOnSelect>? _hddOnSelect;
  EducationOnSelect copyWith({  List<HscOnSelect>? hscOnSelect,
    List<BdOnSelect>? bdOnSelect,
    List<MdOnSelect>? mdOnSelect,
    List<DdOnSelect>? ddOnSelect,
    List<HddOnSelect>? hddOnSelect,
  }) => EducationOnSelect(  hscOnSelect: hscOnSelect ?? _hscOnSelect,
    bdOnSelect: bdOnSelect ?? _bdOnSelect,
    mdOnSelect: mdOnSelect ?? _mdOnSelect,
    ddOnSelect: ddOnSelect ?? _ddOnSelect,
    hddOnSelect: hddOnSelect ?? _hddOnSelect,
  );
  List<HscOnSelect>? get hscOnSelect => _hscOnSelect;
  List<BdOnSelect>? get bdOnSelect => _bdOnSelect;
  List<MdOnSelect>? get mdOnSelect => _mdOnSelect;
  List<DdOnSelect>? get ddOnSelect => _ddOnSelect;
  List<HddOnSelect>? get hddOnSelect => _hddOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_hscOnSelect != null) {
      map['hsc_on_select'] = _hscOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_bdOnSelect != null) {
      map['bd_on_select'] = _bdOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_mdOnSelect != null) {
      map['md_on_select'] = _mdOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_ddOnSelect != null) {
      map['dd_on_select'] = _ddOnSelect?.map((v) => v.toJson()).toList();
    }
    if (_hddOnSelect != null) {
      map['hdd_on_select'] = _hddOnSelect?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5
/// onselect : true

HddOnSelect hddOnSelectFromJson(String str) => HddOnSelect.fromJson(json.decode(str));
String hddOnSelectToJson(HddOnSelect data) => json.encode(data.toJson());
class HddOnSelect {
  HddOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  HddOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  HddOnSelect copyWith({  int? id,
    bool? onselect,
  }) => HddOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 5
/// onselect : true

DdOnSelect ddOnSelectFromJson(String str) => DdOnSelect.fromJson(json.decode(str));
String ddOnSelectToJson(DdOnSelect data) => json.encode(data.toJson());
class DdOnSelect {
  DdOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  DdOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  DdOnSelect copyWith({  int? id,
    bool? onselect,
  }) => DdOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 5
/// onselect : true

MdOnSelect mdOnSelectFromJson(String str) => MdOnSelect.fromJson(json.decode(str));
String mdOnSelectToJson(MdOnSelect data) => json.encode(data.toJson());
class MdOnSelect {
  MdOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  MdOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  MdOnSelect copyWith({  int? id,
    bool? onselect,
  }) => MdOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 5
/// onselect : true

BdOnSelect bdOnSelectFromJson(String str) => BdOnSelect.fromJson(json.decode(str));
String bdOnSelectToJson(BdOnSelect data) => json.encode(data.toJson());
class BdOnSelect {
  BdOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  BdOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  BdOnSelect copyWith({  int? id,
    bool? onselect,
  }) => BdOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 5
/// onselect : true

HscOnSelect hscOnSelectFromJson(String str) => HscOnSelect.fromJson(json.decode(str));
String hscOnSelectToJson(HscOnSelect data) => json.encode(data.toJson());
class HscOnSelect {
  HscOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  HscOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  HscOnSelect copyWith({  int? id,
    bool? onselect,
  }) => HscOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 5
/// onselect : true

ExperienceOnSelect experienceOnSelectFromJson(String str) => ExperienceOnSelect.fromJson(json.decode(str));
String experienceOnSelectToJson(ExperienceOnSelect data) => json.encode(data.toJson());
class ExperienceOnSelect {
  ExperienceOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  ExperienceOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  ExperienceOnSelect copyWith({  int? id,
    bool? onselect,
  }) => ExperienceOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
    return map;
  }

}

/// id : 3
/// onselect : true

PositionOnSelect positionOnSelectFromJson(String str) => PositionOnSelect.fromJson(json.decode(str));
String positionOnSelectToJson(PositionOnSelect data) => json.encode(data.toJson());
class PositionOnSelect {
  PositionOnSelect({
    int? id,
    bool? onselect,}){
    _id = id;
    _onselect = onselect;
  }

  PositionOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _onselect = json['onselect'];
  }
  int? _id;
  bool? _onselect;
  PositionOnSelect copyWith({  int? id,
    bool? onselect,
  }) => PositionOnSelect(  id: id ?? _id,
    onselect: onselect ?? _onselect,
  );
  int? get id => _id;
  bool? get onselect => _onselect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['onselect'] = _onselect;
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
    int? status,
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
  int? _status;
  String? _message;
  String? _modulename;
  bool? _timeexpire;
  Head copyWith({  int? status,
    String? message,
    String? modulename,
    bool? timeexpire,
  }) => Head(  status: status ?? _status,
    message: message ?? _message,
    modulename: modulename ?? _modulename,
    timeexpire: timeexpire ?? _timeexpire,
  );
  int? get status => _status;
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