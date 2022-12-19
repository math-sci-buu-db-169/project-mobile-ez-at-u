import 'dart:convert';
/// data_on_select : {"position_on_select":[{"id":0,"setOnSelect":true}],"experience_on_select":[{"id":0,"setOnSelect":true}],"education_on_select":{"hsc_on_select":[{"id":0,"setOnSelect":true}],"bd_on_select":[{"id":0,"setOnSelect":true}],"md_on_select":[{"id":0,"setOnSelect":true}],"dd_on_select":[{"id":0,"setOnSelect":true}],"hdd_on_select":[{"id":0,"setOnSelect":true}]},"skill_on_select":[{"id":0,"setOnSelect":true}],"certificate_on_select":[{"id":0,"setOnSelect":true}],"language_on_select":[{"id":0,"setOnSelect":true}],"social_on_select":{"setOnSelected_email":true,"setOnSelected_phone":true,"setOnSelected_facebook":true,"setOnSelected_line":true,"setOnSelected_instagram":true,"setOnSelected_twitter":true,"setOnSelected_youtube":true},"address_on_select":{"setOnSelected_number":true,"setOnSelected_moo":true,"setOnSelected_soi":true,"setOnSelected_road":true,"setOnSelected_subdistrict":true,"setOnSelected_district":true,"setOnSelected_province":true,"setOnSelected_zipcode":true}}

SetOnSelectedResume setOnSelectedResumeFromJson(String str) => SetOnSelectedResume.fromJson(json.decode(str));
String setOnSelectedResumeToJson(SetOnSelectedResume data) => json.encode(data.toJson());
class SetOnSelectedResume {
  SetOnSelectedResume({
      DataOnSelect? dataOnSelect,}){
    _dataOnSelect = dataOnSelect;
}

  SetOnSelectedResume.fromJson(dynamic json) {
    _dataOnSelect = json['data_on_select'] != null ? DataOnSelect.fromJson(json['data_on_select']) : null;
  }
  DataOnSelect? _dataOnSelect;
SetOnSelectedResume copyWith({  DataOnSelect? dataOnSelect,
}) => SetOnSelectedResume(  dataOnSelect: dataOnSelect ?? _dataOnSelect,
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

/// position_on_select : [{"id":0,"setOnSelect":true}]
/// experience_on_select : [{"id":0,"setOnSelect":true}]
/// education_on_select : {"hsc_on_select":[{"id":0,"setOnSelect":true}],"bd_on_select":[{"id":0,"setOnSelect":true}],"md_on_select":[{"id":0,"setOnSelect":true}],"dd_on_select":[{"id":0,"setOnSelect":true}],"hdd_on_select":[{"id":0,"setOnSelect":true}]}
/// skill_on_select : [{"id":0,"setOnSelect":true}]
/// certificate_on_select : [{"id":0,"setOnSelect":true}]
/// language_on_select : [{"id":0,"setOnSelect":true}]
/// social_on_select : {"setOnSelected_email":true,"setOnSelected_phone":true,"setOnSelected_facebook":true,"setOnSelected_line":true,"setOnSelected_instagram":true,"setOnSelected_twitter":true,"setOnSelected_youtube":true}
/// address_on_select : {"setOnSelected_number":true,"setOnSelected_moo":true,"setOnSelected_soi":true,"setOnSelected_road":true,"setOnSelected_subdistrict":true,"setOnSelected_district":true,"setOnSelected_province":true,"setOnSelected_zipcode":true}

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

/// setOnSelected_number : true
/// setOnSelected_moo : true
/// setOnSelected_soi : true
/// setOnSelected_road : true
/// setOnSelected_subdistrict : true
/// setOnSelected_district : true
/// setOnSelected_province : true
/// setOnSelected_zipcode : true

AddressOnSelect addressOnSelectFromJson(String str) => AddressOnSelect.fromJson(json.decode(str));
String addressOnSelectToJson(AddressOnSelect data) => json.encode(data.toJson());
class AddressOnSelect {
  AddressOnSelect({
      bool? setOnSelectedNumber, 
      bool? setOnSelectedMoo, 
      bool? setOnSelectedSoi, 
      bool? setOnSelectedRoad, 
      bool? setOnSelectedSubdistrict, 
      bool? setOnSelectedDistrict, 
      bool? setOnSelectedProvince, 
      bool? setOnSelectedZipcode,}){
    _setOnSelectedNumber = setOnSelectedNumber;
    _setOnSelectedMoo = setOnSelectedMoo;
    _setOnSelectedSoi = setOnSelectedSoi;
    _setOnSelectedRoad = setOnSelectedRoad;
    _setOnSelectedSubdistrict = setOnSelectedSubdistrict;
    _setOnSelectedDistrict = setOnSelectedDistrict;
    _setOnSelectedProvince = setOnSelectedProvince;
    _setOnSelectedZipcode = setOnSelectedZipcode;
}

  AddressOnSelect.fromJson(dynamic json) {
    _setOnSelectedNumber = json['setOnSelected_number'];
    _setOnSelectedMoo = json['setOnSelected_moo'];
    _setOnSelectedSoi = json['setOnSelected_soi'];
    _setOnSelectedRoad = json['setOnSelected_road'];
    _setOnSelectedSubdistrict = json['setOnSelected_subdistrict'];
    _setOnSelectedDistrict = json['setOnSelected_district'];
    _setOnSelectedProvince = json['setOnSelected_province'];
    _setOnSelectedZipcode = json['setOnSelected_zipcode'];
  }
  bool? _setOnSelectedNumber;
  bool? _setOnSelectedMoo;
  bool? _setOnSelectedSoi;
  bool? _setOnSelectedRoad;
  bool? _setOnSelectedSubdistrict;
  bool? _setOnSelectedDistrict;
  bool? _setOnSelectedProvince;
  bool? _setOnSelectedZipcode;
AddressOnSelect copyWith({  bool? setOnSelectedNumber,
  bool? setOnSelectedMoo,
  bool? setOnSelectedSoi,
  bool? setOnSelectedRoad,
  bool? setOnSelectedSubdistrict,
  bool? setOnSelectedDistrict,
  bool? setOnSelectedProvince,
  bool? setOnSelectedZipcode,
}) => AddressOnSelect(  setOnSelectedNumber: setOnSelectedNumber ?? _setOnSelectedNumber,
  setOnSelectedMoo: setOnSelectedMoo ?? _setOnSelectedMoo,
  setOnSelectedSoi: setOnSelectedSoi ?? _setOnSelectedSoi,
  setOnSelectedRoad: setOnSelectedRoad ?? _setOnSelectedRoad,
  setOnSelectedSubdistrict: setOnSelectedSubdistrict ?? _setOnSelectedSubdistrict,
  setOnSelectedDistrict: setOnSelectedDistrict ?? _setOnSelectedDistrict,
  setOnSelectedProvince: setOnSelectedProvince ?? _setOnSelectedProvince,
  setOnSelectedZipcode: setOnSelectedZipcode ?? _setOnSelectedZipcode,
);
  bool? get setOnSelectedNumber => _setOnSelectedNumber;
  bool? get setOnSelectedMoo => _setOnSelectedMoo;
  bool? get setOnSelectedSoi => _setOnSelectedSoi;
  bool? get setOnSelectedRoad => _setOnSelectedRoad;
  bool? get setOnSelectedSubdistrict => _setOnSelectedSubdistrict;
  bool? get setOnSelectedDistrict => _setOnSelectedDistrict;
  bool? get setOnSelectedProvince => _setOnSelectedProvince;
  bool? get setOnSelectedZipcode => _setOnSelectedZipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['setOnSelected_number'] = _setOnSelectedNumber;
    map['setOnSelected_moo'] = _setOnSelectedMoo;
    map['setOnSelected_soi'] = _setOnSelectedSoi;
    map['setOnSelected_road'] = _setOnSelectedRoad;
    map['setOnSelected_subdistrict'] = _setOnSelectedSubdistrict;
    map['setOnSelected_district'] = _setOnSelectedDistrict;
    map['setOnSelected_province'] = _setOnSelectedProvince;
    map['setOnSelected_zipcode'] = _setOnSelectedZipcode;
    return map;
  }

}

/// setOnSelected_email : true
/// setOnSelected_phone : true
/// setOnSelected_facebook : true
/// setOnSelected_line : true
/// setOnSelected_instagram : true
/// setOnSelected_twitter : true
/// setOnSelected_youtube : true

SocialOnSelect socialOnSelectFromJson(String str) => SocialOnSelect.fromJson(json.decode(str));
String socialOnSelectToJson(SocialOnSelect data) => json.encode(data.toJson());
class SocialOnSelect {
  SocialOnSelect({
      bool? setOnSelectedEmail, 
      bool? setOnSelectedPhone, 
      bool? setOnSelectedFacebook, 
      bool? setOnSelectedLine, 
      bool? setOnSelectedInstagram, 
      bool? setOnSelectedTwitter, 
      bool? setOnSelectedYoutube,}){
    _setOnSelectedEmail = setOnSelectedEmail;
    _setOnSelectedPhone = setOnSelectedPhone;
    _setOnSelectedFacebook = setOnSelectedFacebook;
    _setOnSelectedLine = setOnSelectedLine;
    _setOnSelectedInstagram = setOnSelectedInstagram;
    _setOnSelectedTwitter = setOnSelectedTwitter;
    _setOnSelectedYoutube = setOnSelectedYoutube;
}

  SocialOnSelect.fromJson(dynamic json) {
    _setOnSelectedEmail = json['setOnSelected_email'];
    _setOnSelectedPhone = json['setOnSelected_phone'];
    _setOnSelectedFacebook = json['setOnSelected_facebook'];
    _setOnSelectedLine = json['setOnSelected_line'];
    _setOnSelectedInstagram = json['setOnSelected_instagram'];
    _setOnSelectedTwitter = json['setOnSelected_twitter'];
    _setOnSelectedYoutube = json['setOnSelected_youtube'];
  }
  bool? _setOnSelectedEmail;
  bool? _setOnSelectedPhone;
  bool? _setOnSelectedFacebook;
  bool? _setOnSelectedLine;
  bool? _setOnSelectedInstagram;
  bool? _setOnSelectedTwitter;
  bool? _setOnSelectedYoutube;
SocialOnSelect copyWith({  bool? setOnSelectedEmail,
  bool? setOnSelectedPhone,
  bool? setOnSelectedFacebook,
  bool? setOnSelectedLine,
  bool? setOnSelectedInstagram,
  bool? setOnSelectedTwitter,
  bool? setOnSelectedYoutube,
}) => SocialOnSelect(  setOnSelectedEmail: setOnSelectedEmail ?? _setOnSelectedEmail,
  setOnSelectedPhone: setOnSelectedPhone ?? _setOnSelectedPhone,
  setOnSelectedFacebook: setOnSelectedFacebook ?? _setOnSelectedFacebook,
  setOnSelectedLine: setOnSelectedLine ?? _setOnSelectedLine,
  setOnSelectedInstagram: setOnSelectedInstagram ?? _setOnSelectedInstagram,
  setOnSelectedTwitter: setOnSelectedTwitter ?? _setOnSelectedTwitter,
  setOnSelectedYoutube: setOnSelectedYoutube ?? _setOnSelectedYoutube,
);
  bool? get setOnSelectedEmail => _setOnSelectedEmail;
  bool? get setOnSelectedPhone => _setOnSelectedPhone;
  bool? get setOnSelectedFacebook => _setOnSelectedFacebook;
  bool? get setOnSelectedLine => _setOnSelectedLine;
  bool? get setOnSelectedInstagram => _setOnSelectedInstagram;
  bool? get setOnSelectedTwitter => _setOnSelectedTwitter;
  bool? get setOnSelectedYoutube => _setOnSelectedYoutube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['setOnSelected_email'] = _setOnSelectedEmail;
    map['setOnSelected_phone'] = _setOnSelectedPhone;
    map['setOnSelected_facebook'] = _setOnSelectedFacebook;
    map['setOnSelected_line'] = _setOnSelectedLine;
    map['setOnSelected_instagram'] = _setOnSelectedInstagram;
    map['setOnSelected_twitter'] = _setOnSelectedTwitter;
    map['setOnSelected_youtube'] = _setOnSelectedYoutube;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

LanguageOnSelect languageOnSelectFromJson(String str) => LanguageOnSelect.fromJson(json.decode(str));
String languageOnSelectToJson(LanguageOnSelect data) => json.encode(data.toJson());
class LanguageOnSelect {
  LanguageOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  LanguageOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
LanguageOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => LanguageOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

CertificateOnSelect certificateOnSelectFromJson(String str) => CertificateOnSelect.fromJson(json.decode(str));
String certificateOnSelectToJson(CertificateOnSelect data) => json.encode(data.toJson());
class CertificateOnSelect {
  CertificateOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  CertificateOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
CertificateOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => CertificateOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

SkillOnSelect skillOnSelectFromJson(String str) => SkillOnSelect.fromJson(json.decode(str));
String skillOnSelectToJson(SkillOnSelect data) => json.encode(data.toJson());
class SkillOnSelect {
  SkillOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  SkillOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
SkillOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => SkillOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// hsc_on_select : [{"id":0,"setOnSelect":true}]
/// bd_on_select : [{"id":0,"setOnSelect":true}]
/// md_on_select : [{"id":0,"setOnSelect":true}]
/// dd_on_select : [{"id":0,"setOnSelect":true}]
/// hdd_on_select : [{"id":0,"setOnSelect":true}]

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

/// id : 0
/// setOnSelect : true

HddOnSelect hddOnSelectFromJson(String str) => HddOnSelect.fromJson(json.decode(str));
String hddOnSelectToJson(HddOnSelect data) => json.encode(data.toJson());
class HddOnSelect {
  HddOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  HddOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
HddOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => HddOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

DdOnSelect ddOnSelectFromJson(String str) => DdOnSelect.fromJson(json.decode(str));
String ddOnSelectToJson(DdOnSelect data) => json.encode(data.toJson());
class DdOnSelect {
  DdOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  DdOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
DdOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => DdOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

MdOnSelect mdOnSelectFromJson(String str) => MdOnSelect.fromJson(json.decode(str));
String mdOnSelectToJson(MdOnSelect data) => json.encode(data.toJson());
class MdOnSelect {
  MdOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  MdOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
MdOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => MdOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

BdOnSelect bdOnSelectFromJson(String str) => BdOnSelect.fromJson(json.decode(str));
String bdOnSelectToJson(BdOnSelect data) => json.encode(data.toJson());
class BdOnSelect {
  BdOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  BdOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
BdOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => BdOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

HscOnSelect hscOnSelectFromJson(String str) => HscOnSelect.fromJson(json.decode(str));
String hscOnSelectToJson(HscOnSelect data) => json.encode(data.toJson());
class HscOnSelect {
  HscOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  HscOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
HscOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => HscOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

ExperienceOnSelect experienceOnSelectFromJson(String str) => ExperienceOnSelect.fromJson(json.decode(str));
String experienceOnSelectToJson(ExperienceOnSelect data) => json.encode(data.toJson());
class ExperienceOnSelect {
  ExperienceOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  ExperienceOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
ExperienceOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => ExperienceOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}

/// id : 0
/// setOnSelect : true

PositionOnSelect positionOnSelectFromJson(String str) => PositionOnSelect.fromJson(json.decode(str));
String positionOnSelectToJson(PositionOnSelect data) => json.encode(data.toJson());
class PositionOnSelect {
  PositionOnSelect({
      int? id, 
      bool? setOnSelect,}){
    _id = id;
    _setOnSelect = setOnSelect;
}

  PositionOnSelect.fromJson(dynamic json) {
    _id = json['id'];
    _setOnSelect = json['setOnSelect'];
  }
  int? _id;
  bool? _setOnSelect;
PositionOnSelect copyWith({  int? id,
  bool? setOnSelect,
}) => PositionOnSelect(  id: id ?? _id,
  setOnSelect: setOnSelect ?? _setOnSelect,
);
  int? get id => _id;
  bool? get setOnSelect => _setOnSelect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['setOnSelect'] = _setOnSelect;
    return map;
  }

}