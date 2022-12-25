import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screenInfo":{"aboutme":"เกี่ยวกับฉัน","aboutmedetail":"เกี่ยวกับฉัน รายละเอียด","address":"ที่อยู่","appliedposition":"ตำแหน่งที่สมัคร","certificate":"ใบรับรอง","contact":"ติดต่อ","textdefault":"ค่าเริ่มต้น","description":"คำอธิบาย","detail":"รายละเอียด","district":"อำเภอ","editinfomations":"แก้ไขข้อมูล","education":"การศึกษา","educationinfo":"ข้อมูลการศึกษา","email":"อีเมล","enddate":"วันสิ้นสุด","experience":"ประสบการณ์","facebook":"เฟคบุ๊ค","instagram":"อินสตาแกรม","language":"ภาษา","lastname":"นามสกุล","line":"ไลน์","moo":"หมู่","mypositions":"ตำแหน่งของฉัน","n":"นิ้ว","name":"ชื่อ","number":"บ้านเลขที่","phone":"โทรศัพท์","pictuce":"รูปภาพ","placeofstudy":"สถานศึกษา","position":"ตำแหน่ง","positions":"ตำแหน่ง","prefix":"คำนำหน้า","province":"จังหวัด","ratio":"อัตราส่วนภาพต้องเป็น 3:4","road":"ถนน","select":"เลือก","selectacolor":"โปรดเลือกสี","selecttheinformation":"โปรดเลือกข้อมูล ","size":"ขนาด","sizepictuce":"ขนาดไฟล์ไม่เกิน 5 MB","skill":"ทักษะ","soi":"ซอย","startdate":"วันเริ่มต้น","subdistrict":"ตำบล","themecolor":"สีธีม","title":"หัวเรื่อง","titlesetthemecolor":"ตั้งค่าธีมและสี","twitter":"ทวิตเตอร์","type":"ประเภทการศึกษา","value":"ระดับ","whcm":"(กxส) ซม","zipcode":"รหัสไปรษณีย์","unkhown":"ไม่ทราบ","viewpdf":"PDF","titleresumeinformation":"ข้อมูลเรซูเม่","hsc":"ประกาศนียบัตรมัธยมศึกษาตอนปลาย","bd":"ระดับปริญญาตรี","md":"ปริญญาโท    ","dd":"ปริญญาเอก","hdd":"ปริญญาดุษฎีบัณฑิตกิตติมศักดิ์","tapedit":"แตะเพื่อแก้ไข้ข้อมูล","save":"บันทึก","saveor":"Save/บันทึก","youtube":"ยูทูป"},"data":{"userinfo":{"prefixid":"","prefix":"","name":"","lastname":""},"position":[{"id":8,"orderchoose":2,"onselect":true,"position":"4444444","office":"44455","detail":"string"},{"id":7,"orderchoose":9,"onselect":true,"position":"โปรแกรมการแข่งขันกีฬา","office":"","detail":"string"}],"aboutme":"","contactinfo":{"email":"","phone":"","facebook":"","line":"","instagram":"","twitter":"","youtube":"","onselected_email":false,"onselected_phone":false,"onselected_facebook":false,"onselected_line":false,"onselected_instagram":false,"onselected_twitter":false,"onselected_youtube":false},"address":{"number":"num","moo":"mo","soi":"so","road":"ro","subdistrict":"ฝั่งแดง","district":"อำเภอนากลาง","province":"หนองบัวลำภู","zipcode":"","onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":false,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true},"experience":[{"id":3,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","position":"","detail":""}],"education":{"hsc":[{"id":6,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HSC","placeofstudy":"คำแสนวัดสวนดอกอำเภอ","detail":""}],"bd":[{"id":7,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"BD","placeofstudy":"","detail":""}],"md":[{"id":8,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"MD","placeofstudy":"","detail":""}],"dd":[{"id":9,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"DD","placeofstudy":"","detail":""}],"hdd":[{"id":10,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HDD","placeofstudy":"","detail":""}]},"skill":[{"id":4,"orderchoose":0,"onselect":true,"skill":"ออกแบบ","value":"50","detail":"ออกแบบหน้าจอ"}],"certificate":[{"id":2,"orderchoose":4,"onselect":true,"title":"ใบรับรอง d","description":""}],"language":[{"id":2,"orderchoose":1,"onselect":true,"language":"ภาษา","value":"60","detail":""}],"resumedatacount":{"position":2,"experience":1,"education_hsc":1,"education_bd":1,"education_md":1,"education_dd":1,"education_hdd":1,"skill":1,"certificate":1,"language":1},"image":""}}

PreViewResumeResponse preViewResumeResponseFromJson(String str) => PreViewResumeResponse.fromJson(json.decode(str));
String preViewResumeResponseToJson(PreViewResumeResponse data) => json.encode(data.toJson());
class PreViewResumeResponse {
  PreViewResumeResponse({
    Head? head,
    Body? body,}){
    _head = head;
    _body = body;
  }

  PreViewResumeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  PreViewResumeResponse copyWith({  Head? head,
    Body? body,
  }) => PreViewResumeResponse(  head: head ?? _head,
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

/// screenInfo : {"aboutme":"เกี่ยวกับฉัน","aboutmedetail":"เกี่ยวกับฉัน รายละเอียด","address":"ที่อยู่","appliedposition":"ตำแหน่งที่สมัคร","certificate":"ใบรับรอง","contact":"ติดต่อ","textdefault":"ค่าเริ่มต้น","description":"คำอธิบาย","detail":"รายละเอียด","district":"อำเภอ","editinfomations":"แก้ไขข้อมูล","education":"การศึกษา","educationinfo":"ข้อมูลการศึกษา","email":"อีเมล","enddate":"วันสิ้นสุด","experience":"ประสบการณ์","facebook":"เฟคบุ๊ค","instagram":"อินสตาแกรม","language":"ภาษา","lastname":"นามสกุล","line":"ไลน์","moo":"หมู่","mypositions":"ตำแหน่งของฉัน","n":"นิ้ว","name":"ชื่อ","number":"บ้านเลขที่","phone":"โทรศัพท์","pictuce":"รูปภาพ","placeofstudy":"สถานศึกษา","position":"ตำแหน่ง","positions":"ตำแหน่ง","prefix":"คำนำหน้า","province":"จังหวัด","ratio":"อัตราส่วนภาพต้องเป็น 3:4","road":"ถนน","select":"เลือก","selectacolor":"โปรดเลือกสี","selecttheinformation":"โปรดเลือกข้อมูล ","size":"ขนาด","sizepictuce":"ขนาดไฟล์ไม่เกิน 5 MB","skill":"ทักษะ","soi":"ซอย","startdate":"วันเริ่มต้น","subdistrict":"ตำบล","themecolor":"สีธีม","title":"หัวเรื่อง","titlesetthemecolor":"ตั้งค่าธีมและสี","twitter":"ทวิตเตอร์","type":"ประเภทการศึกษา","value":"ระดับ","whcm":"(กxส) ซม","zipcode":"รหัสไปรษณีย์","unkhown":"ไม่ทราบ","viewpdf":"PDF","titleresumeinformation":"ข้อมูลเรซูเม่","hsc":"ประกาศนียบัตรมัธยมศึกษาตอนปลาย","bd":"ระดับปริญญาตรี","md":"ปริญญาโท    ","dd":"ปริญญาเอก","hdd":"ปริญญาดุษฎีบัณฑิตกิตติมศักดิ์","tapedit":"แตะเพื่อแก้ไข้ข้อมูล","save":"บันทึก","saveor":"Save/บันทึก","youtube":"ยูทูป"}
/// data : {"userinfo":{"prefixid":"","prefix":"","name":"","lastname":""},"position":[{"id":8,"orderchoose":2,"onselect":true,"position":"4444444","office":"44455","detail":"string"},{"id":7,"orderchoose":9,"onselect":true,"position":"โปรแกรมการแข่งขันกีฬา","office":"","detail":"string"}],"aboutme":"","contactinfo":{"email":"","phone":"","facebook":"","line":"","instagram":"","twitter":"","youtube":"","onselected_email":false,"onselected_phone":false,"onselected_facebook":false,"onselected_line":false,"onselected_instagram":false,"onselected_twitter":false,"onselected_youtube":false},"address":{"number":"num","moo":"mo","soi":"so","road":"ro","subdistrict":"ฝั่งแดง","district":"อำเภอนากลาง","province":"หนองบัวลำภู","zipcode":"","onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":false,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true},"experience":[{"id":3,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","position":"","detail":""}],"education":{"hsc":[{"id":6,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HSC","placeofstudy":"คำแสนวัดสวนดอกอำเภอ","detail":""}],"bd":[{"id":7,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"BD","placeofstudy":"","detail":""}],"md":[{"id":8,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"MD","placeofstudy":"","detail":""}],"dd":[{"id":9,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"DD","placeofstudy":"","detail":""}],"hdd":[{"id":10,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HDD","placeofstudy":"","detail":""}]},"skill":[{"id":4,"orderchoose":0,"onselect":true,"skill":"ออกแบบ","value":"50","detail":"ออกแบบหน้าจอ"}],"certificate":[{"id":2,"orderchoose":4,"onselect":true,"title":"ใบรับรอง d","description":""}],"language":[{"id":2,"orderchoose":1,"onselect":true,"language":"ภาษา","value":"60","detail":""}],"resumedatacount":{"position":2,"experience":1,"education_hsc":1,"education_bd":1,"education_md":1,"education_dd":1,"education_hdd":1,"skill":1,"certificate":1,"language":1},"image":""}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    Data? data,}){
    _screeninfo = screeninfo;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Screeninfo? _screeninfo;
  Data? _data;
  Body copyWith({  Screeninfo? screeninfo,
    Data? data,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
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
/// userinfo : {"prefixid":"","prefix":"","name":"","lastname":""}
/// position : [{"id":8,"orderchoose":2,"onselect":true,"position":"4444444","office":"44455","detail":"string"},{"id":7,"orderchoose":9,"onselect":true,"position":"โปรแกรมการแข่งขันกีฬา","office":"","detail":"string"}]
/// aboutme : ""
/// contactinfo : {"email":"","phone":"","facebook":"","line":"","instagram":"","twitter":"","youtube":"","onselected_email":false,"onselected_phone":false,"onselected_facebook":false,"onselected_line":false,"onselected_instagram":false,"onselected_twitter":false,"onselected_youtube":false}
/// address : {"number":"num","moo":"mo","soi":"so","road":"ro","subdistrict":"ฝั่งแดง","district":"อำเภอนากลาง","province":"หนองบัวลำภู","zipcode":"","onselected_number":false,"onselected_moo":false,"onselected_soi":false,"onselected_road":false,"onselected_subdistrict":true,"onselected_district":true,"onselected_province":true,"onselected_zipcode":true}
/// experience : [{"id":3,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","position":"","detail":""}]
/// education : {"hsc":[{"id":6,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HSC","placeofstudy":"คำแสนวัดสวนดอกอำเภอ","detail":""}],"bd":[{"id":7,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"BD","placeofstudy":"","detail":""}],"md":[{"id":8,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"MD","placeofstudy":"","detail":""}],"dd":[{"id":9,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"DD","placeofstudy":"","detail":""}],"hdd":[{"id":10,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HDD","placeofstudy":"","detail":""}]}
/// skill : [{"id":4,"orderchoose":0,"onselect":true,"skill":"ออกแบบ","value":"50","detail":"ออกแบบหน้าจอ"}]
/// certificate : [{"id":2,"orderchoose":4,"onselect":true,"title":"ใบรับรอง d","description":""}]
/// language : [{"id":2,"orderchoose":1,"onselect":true,"language":"ภาษา","value":"60","detail":""}]
/// resumedatacount : {"position":2,"experience":1,"education_hsc":1,"education_bd":1,"education_md":1,"education_dd":1,"education_hdd":1,"skill":1,"certificate":1,"language":1}
/// image : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Userinfo? userinfo, 
      List<Position>? position, 
      String? aboutme, 
      Contactinfo? contactinfo, 
      Address? address, 
      List<Experience>? experience, 
      Education? education, 
      List<Skill>? skill, 
      List<Certificate>? certificate, 
      List<Language>? language, 
      Resumedatacount? resumedatacount,
      Resumedatacolor? resumedatacolor,
    String? image,}){
    _userinfo = userinfo;
    _position = position;
    _aboutme = aboutme;
    _contactinfo = contactinfo;
    _address = address;
    _experience = experience;
    _education = education;
    _skill = skill;
    _certificate = certificate;
    _language = language;
    _resumedatacount = resumedatacount;
    _resumedatacolor = resumedatacolor;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _userinfo = json['userinfo'] != null ? Userinfo.fromJson(json['userinfo']) : null;
    if (json['position'] != null) {
      _position = [];
      json['position'].forEach((v) {
        _position?.add(Position.fromJson(v));
      });
    }
    _aboutme = json['aboutme'];
    _contactinfo = json['contactinfo'] != null ? Contactinfo.fromJson(json['contactinfo']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['experience'] != null) {
      _experience = [];
      json['experience'].forEach((v) {
        _experience?.add(Experience.fromJson(v));
      });
    }
    _education = json['education'] != null ? Education.fromJson(json['education']) : null;
    if (json['skill'] != null) {
      _skill = [];
      json['skill'].forEach((v) {
        _skill?.add(Skill.fromJson(v));
      });
    }
    if (json['certificate'] != null) {
      _certificate = [];
      json['certificate'].forEach((v) {
        _certificate?.add(Certificate.fromJson(v));
      });
    }
    if (json['language'] != null) {
      _language = [];
      json['language'].forEach((v) {
        _language?.add(Language.fromJson(v));
      });
    }
    _resumedatacount = json['resumedatacount'] != null ? Resumedatacount.fromJson(json['resumedatacount']) : null;
    _resumedatacolor = json['resumedatacolor'] != null ? Resumedatacolor.fromJson(json['resumedatacolor']) : null;
    _image = json['image'];
  }
  Userinfo? _userinfo;
  List<Position>? _position;
  String? _aboutme;
  Contactinfo? _contactinfo;
  Address? _address;
  List<Experience>? _experience;
  Education? _education;
  List<Skill>? _skill;
  List<Certificate>? _certificate;
  List<Language>? _language;
  Resumedatacount? _resumedatacount;
  Resumedatacolor? _resumedatacolor;
  String? _image;
Data copyWith({  Userinfo? userinfo,
  List<Position>? position,
  String? aboutme,
  Contactinfo? contactinfo,
  Address? address,
  List<Experience>? experience,
  Education? education,
  List<Skill>? skill,
  List<Certificate>? certificate,
  List<Language>? language,
  Resumedatacount? resumedatacount,
  Resumedatacolor? resumedatacolor,
  String? image,
}) => Data(  userinfo: userinfo ?? _userinfo,
  position: position ?? _position,
  aboutme: aboutme ?? _aboutme,
  contactinfo: contactinfo ?? _contactinfo,
  address: address ?? _address,
  experience: experience ?? _experience,
  education: education ?? _education,
  skill: skill ?? _skill,
  certificate: certificate ?? _certificate,
  language: language ?? _language,
  resumedatacount: resumedatacount ?? _resumedatacount,
  resumedatacolor: resumedatacolor ?? _resumedatacolor,
  image: image ?? _image,
);
  Userinfo? get userinfo => _userinfo;
  List<Position>? get position => _position;
  String? get aboutme => _aboutme;
  Contactinfo? get contactinfo => _contactinfo;
  Address? get address => _address;
  List<Experience>? get experience => _experience;
  Education? get education => _education;
  List<Skill>? get skill => _skill;
  List<Certificate>? get certificate => _certificate;
  List<Language>? get language => _language;
  Resumedatacount? get resumedatacount => _resumedatacount;
  Resumedatacolor? get resumedatacolor => _resumedatacolor;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userinfo != null) {
      map['userinfo'] = _userinfo?.toJson();
    }
    if (_position != null) {
      map['position'] = _position?.map((v) => v.toJson()).toList();
    }
    map['aboutme'] = _aboutme;
    if (_contactinfo != null) {
      map['contactinfo'] = _contactinfo?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_experience != null) {
      map['experience'] = _experience?.map((v) => v.toJson()).toList();
    }
    if (_education != null) {
      map['education'] = _education?.toJson();
    }
    if (_skill != null) {
      map['skill'] = _skill?.map((v) => v.toJson()).toList();
    }
    if (_certificate != null) {
      map['certificate'] = _certificate?.map((v) => v.toJson()).toList();
    }
    if (_language != null) {
      map['language'] = _language?.map((v) => v.toJson()).toList();
    }
    if (_resumedatacount != null) {
      map['resumedatacount'] = _resumedatacount?.toJson();
    }
    if (_resumedatacolor != null) {
      map['resumedatacolor'] = _resumedatacolor?.toJson();
    }
    map['image'] = _image;
    return map;
  }

}

Resumedatacolor resumedatacolorFromJson(String str) => Resumedatacolor.fromJson(json.decode(str));
String resumedatacolorToJson(Resumedatacolor data) => json.encode(data.toJson());
class Resumedatacolor {
  Resumedatacolor({
    int? text,
    int? name,
    int? theme,
    int? aboutme,
    int? position,
    int? education,
    int? contact,
    int? address,
    int? experience,
    int? certificate,
    int? skill,
    int? language,}){
    _text = text;
    _name = name;
    _theme = theme;
    _aboutme = aboutme;
    _position = position;
    _education = education;
    _contact = contact;
    _address = address;
    _experience = experience;
    _certificate = certificate;
    _skill = skill;
    _language = language;
  }

  Resumedatacolor.fromJson(dynamic json) {
    _text = json['text'];
    _name = json['name'];
    _theme = json['theme'];
    _aboutme = json['aboutme'];
    _position = json['position'];
    _education = json['education'];
    _contact = json['contact'];
    _address = json['address'];
    _experience = json['experience'];
    _certificate = json['certificate'];
    _skill = json['skill'];
    _language = json['language'];
  }
  int? _text;
  int? _name;
  int? _theme;
  int? _aboutme;
  int? _position;
  int? _education;
  int? _contact;
  int? _address;
  int? _experience;
  int? _certificate;
  int? _skill;
  int? _language;
  Resumedatacolor copyWith({  int? text,
    int? name,
    int? theme,
    int? aboutme,
    int? position,
    int? education,
    int? contact,
    int? address,
    int? experience,
    int? certificate,
    int? skill,
    int? language,
  }) => Resumedatacolor(  text: text ?? _text,
    name: name ?? _name,
    theme: theme ?? _theme,
    aboutme: aboutme ?? _aboutme,
    position: position ?? _position,
    education: education ?? _education,
    contact: contact ?? _contact,
    address: address ?? _address,
    experience: experience ?? _experience,
    certificate: certificate ?? _certificate,
    skill: skill ?? _skill,
    language: language ?? _language,
  );
  int? get text => _text;
  int? get name => _name;
  int? get theme => _theme;
  int? get aboutme => _aboutme;
  int? get position => _position;
  int? get education => _education;
  int? get contact => _contact;
  int? get address => _address;
  int? get experience => _experience;
  int? get certificate => _certificate;
  int? get skill => _skill;
  int? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['name'] = _name;
    map['theme'] = _theme;
    map['aboutme'] = _aboutme;
    map['position'] = _position;
    map['education'] = _education;
    map['contact'] = _contact;
    map['address'] = _address;
    map['experience'] = _experience;
    map['certificate'] = _certificate;
    map['skill'] = _skill;
    map['language'] = _language;
    return map;
  }

}

/// position : 0
/// experience : 0
/// education_hsc : 0
/// education_bd : 0
/// education_md : 0
/// education_dd : 0
/// education_hdd : 0
/// skill : 0
/// certificate : 0
/// language : 0

/// position : 2
/// experience : 1
/// education_hsc : 1
/// education_bd : 1
/// education_md : 1
/// education_dd : 1
/// education_hdd : 1
/// skill : 1
/// certificate : 1
/// language : 1

Resumedatacount resumedatacountFromJson(String str) => Resumedatacount.fromJson(json.decode(str));
String resumedatacountToJson(Resumedatacount data) => json.encode(data.toJson());
class Resumedatacount {
  Resumedatacount({
      int? position, 
      int? experience, 
      int? educationHsc, 
      int? educationBd, 
      int? educationMd, 
      int? educationDd, 
      int? educationHdd, 
      int? skill, 
      int? certificate, 
      int? language,}){
    _position = position;
    _experience = experience;
    _educationHsc = educationHsc;
    _educationBd = educationBd;
    _educationMd = educationMd;
    _educationDd = educationDd;
    _educationHdd = educationHdd;
    _skill = skill;
    _certificate = certificate;
    _language = language;
}

  Resumedatacount.fromJson(dynamic json) {
    _position = json['position'];
    _experience = json['experience'];
    _educationHsc = json['education_hsc'];
    _educationBd = json['education_bd'];
    _educationMd = json['education_md'];
    _educationDd = json['education_dd'];
    _educationHdd = json['education_hdd'];
    _skill = json['skill'];
    _certificate = json['certificate'];
    _language = json['language'];
  }
  int? _position;
  int? _experience;
  int? _educationHsc;
  int? _educationBd;
  int? _educationMd;
  int? _educationDd;
  int? _educationHdd;
  int? _skill;
  int? _certificate;
  int? _language;
Resumedatacount copyWith({  int? position,
  int? experience,
  int? educationHsc,
  int? educationBd,
  int? educationMd,
  int? educationDd,
  int? educationHdd,
  int? skill,
  int? certificate,
  int? language,
}) => Resumedatacount(  position: position ?? _position,
  experience: experience ?? _experience,
  educationHsc: educationHsc ?? _educationHsc,
  educationBd: educationBd ?? _educationBd,
  educationMd: educationMd ?? _educationMd,
  educationDd: educationDd ?? _educationDd,
  educationHdd: educationHdd ?? _educationHdd,
  skill: skill ?? _skill,
  certificate: certificate ?? _certificate,
  language: language ?? _language,
);
  int? get position => _position;
  int? get experience => _experience;
  int? get educationHsc => _educationHsc;
  int? get educationBd => _educationBd;
  int? get educationMd => _educationMd;
  int? get educationDd => _educationDd;
  int? get educationHdd => _educationHdd;
  int? get skill => _skill;
  int? get certificate => _certificate;
  int? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['position'] = _position;
    map['experience'] = _experience;
    map['education_hsc'] = _educationHsc;
    map['education_bd'] = _educationBd;
    map['education_md'] = _educationMd;
    map['education_dd'] = _educationDd;
    map['education_hdd'] = _educationHdd;
    map['skill'] = _skill;
    map['certificate'] = _certificate;
    map['language'] = _language;
    return map;
  }

}

/// id : 2
/// orderchoose : 1
/// onselect : true
/// language : "ภาษา"
/// value : "60"
/// detail : ""

Language languageFromJson(String str) => Language.fromJson(json.decode(str));
String languageToJson(Language data) => json.encode(data.toJson());
class Language {
  Language({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? language, 
      String? value, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _language = language;
    _value = value;
    _detail = detail;
}

  Language.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _language = json['language'];
    _value = json['value'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _language;
  String? _value;
  String? _detail;
Language copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? language,
  String? value,
  String? detail,
}) => Language(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  language: language ?? _language,
  value: value ?? _value,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get language => _language;
  String? get value => _value;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['language'] = _language;
    map['value'] = _value;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 2
/// orderchoose : 4
/// onselect : true
/// title : "ใบรับรอง d"
/// description : ""

Certificate certificateFromJson(String str) => Certificate.fromJson(json.decode(str));
String certificateToJson(Certificate data) => json.encode(data.toJson());
class Certificate {
  Certificate({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? title, 
      String? description,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _title = title;
    _description = description;
}

  Certificate.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _title = json['title'];
    _description = json['description'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _title;
  String? _description;
Certificate copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? title,
  String? description,
}) => Certificate(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  title: title ?? _title,
  description: description ?? _description,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}

/// id : 4
/// orderchoose : 0
/// onselect : true
/// skill : "ออกแบบ"
/// value : "50"
/// detail : "ออกแบบหน้าจอ"

Skill skillFromJson(String str) => Skill.fromJson(json.decode(str));
String skillToJson(Skill data) => json.encode(data.toJson());
class Skill {
  Skill({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? skill, 
      String? value, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _skill = skill;
    _value = value;
    _detail = detail;
}

  Skill.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _skill = json['skill'];
    _value = json['value'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _skill;
  String? _value;
  String? _detail;
Skill copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? skill,
  String? value,
  String? detail,
}) => Skill(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  skill: skill ?? _skill,
  value: value ?? _value,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get skill => _skill;
  String? get value => _value;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['skill'] = _skill;
    map['value'] = _value;
    map['detail'] = _detail;
    return map;
  }

}

/// hsc : [{"id":6,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HSC","placeofstudy":"คำแสนวัดสวนดอกอำเภอ","detail":""}]
/// bd : [{"id":7,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"BD","placeofstudy":"","detail":""}]
/// md : [{"id":8,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"MD","placeofstudy":"","detail":""}]
/// dd : [{"id":9,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"DD","placeofstudy":"","detail":""}]
/// hdd : [{"id":10,"orderchoose":0,"onselect":true,"startdate":"12/2022","enddate":"12/2022","type":"HDD","placeofstudy":"","detail":""}]

Education educationFromJson(String str) => Education.fromJson(json.decode(str));
String educationToJson(Education data) => json.encode(data.toJson());
class Education {
  Education({
      List<Hsc>? hsc, 
      List<Bd>? bd, 
      List<Md>? md, 
      List<Dd>? dd, 
      List<Hdd>? hdd,}){
    _hsc = hsc;
    _bd = bd;
    _md = md;
    _dd = dd;
    _hdd = hdd;
}

  Education.fromJson(dynamic json) {
    if (json['hsc'] != null) {
      _hsc = [];
      json['hsc'].forEach((v) {
        _hsc?.add(Hsc.fromJson(v));
      });
    }
    if (json['bd'] != null) {
      _bd = [];
      json['bd'].forEach((v) {
        _bd?.add(Bd.fromJson(v));
      });
    }
    if (json['md'] != null) {
      _md = [];
      json['md'].forEach((v) {
        _md?.add(Md.fromJson(v));
      });
    }
    if (json['dd'] != null) {
      _dd = [];
      json['dd'].forEach((v) {
        _dd?.add(Dd.fromJson(v));
      });
    }
    if (json['hdd'] != null) {
      _hdd = [];
      json['hdd'].forEach((v) {
        _hdd?.add(Hdd.fromJson(v));
      });
    }
  }
  List<Hsc>? _hsc;
  List<Bd>? _bd;
  List<Md>? _md;
  List<Dd>? _dd;
  List<Hdd>? _hdd;
Education copyWith({  List<Hsc>? hsc,
  List<Bd>? bd,
  List<Md>? md,
  List<Dd>? dd,
  List<Hdd>? hdd,
}) => Education(  hsc: hsc ?? _hsc,
  bd: bd ?? _bd,
  md: md ?? _md,
  dd: dd ?? _dd,
  hdd: hdd ?? _hdd,
);
  List<Hsc>? get hsc => _hsc;
  List<Bd>? get bd => _bd;
  List<Md>? get md => _md;
  List<Dd>? get dd => _dd;
  List<Hdd>? get hdd => _hdd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_hsc != null) {
      map['hsc'] = _hsc?.map((v) => v.toJson()).toList();
    }
    if (_bd != null) {
      map['bd'] = _bd?.map((v) => v.toJson()).toList();
    }
    if (_md != null) {
      map['md'] = _md?.map((v) => v.toJson()).toList();
    }
    if (_dd != null) {
      map['dd'] = _dd?.map((v) => v.toJson()).toList();
    }
    if (_hdd != null) {
      map['hdd'] = _hdd?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 10
/// orderchoose : 0
/// onselect : true
/// startdate : "12/2022"
/// enddate : "12/2022"
/// type : "HDD"
/// placeofstudy : ""
/// detail : ""

Hdd hddFromJson(String str) => Hdd.fromJson(json.decode(str));
String hddToJson(Hdd data) => json.encode(data.toJson());
class Hdd {
  Hdd({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? startdate, 
      String? enddate, 
      String? type, 
      String? placeofstudy, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Hdd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _detail;
Hdd copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? startdate,
  String? enddate,
  String? type,
  String? placeofstudy,
  String? detail,
}) => Hdd(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 9
/// orderchoose : 0
/// onselect : true
/// startdate : "12/2022"
/// enddate : "12/2022"
/// type : "DD"
/// placeofstudy : ""
/// detail : ""

Dd ddFromJson(String str) => Dd.fromJson(json.decode(str));
String ddToJson(Dd data) => json.encode(data.toJson());
class Dd {
  Dd({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? startdate, 
      String? enddate, 
      String? type, 
      String? placeofstudy, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Dd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _detail;
Dd copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? startdate,
  String? enddate,
  String? type,
  String? placeofstudy,
  String? detail,
}) => Dd(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 8
/// orderchoose : 0
/// onselect : true
/// startdate : "12/2022"
/// enddate : "12/2022"
/// type : "MD"
/// placeofstudy : ""
/// detail : ""

Md mdFromJson(String str) => Md.fromJson(json.decode(str));
String mdToJson(Md data) => json.encode(data.toJson());
class Md {
  Md({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? startdate, 
      String? enddate, 
      String? type, 
      String? placeofstudy, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Md.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _detail;
Md copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? startdate,
  String? enddate,
  String? type,
  String? placeofstudy,
  String? detail,
}) => Md(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 7
/// orderchoose : 0
/// onselect : true
/// startdate : "12/2022"
/// enddate : "12/2022"
/// type : "BD"
/// placeofstudy : ""
/// detail : ""

Bd bdFromJson(String str) => Bd.fromJson(json.decode(str));
String bdToJson(Bd data) => json.encode(data.toJson());
class Bd {
  Bd({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? startdate, 
      String? enddate, 
      String? type, 
      String? placeofstudy, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Bd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _detail;
Bd copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? startdate,
  String? enddate,
  String? type,
  String? placeofstudy,
  String? detail,
}) => Bd(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 6
/// orderchoose : 0
/// onselect : true
/// startdate : "12/2022"
/// enddate : "12/2022"
/// type : "HSC"
/// placeofstudy : "คำแสนวัดสวนดอกอำเภอ"
/// detail : ""

Hsc hscFromJson(String str) => Hsc.fromJson(json.decode(str));
String hscToJson(Hsc data) => json.encode(data.toJson());
class Hsc {
  Hsc({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? startdate, 
      String? enddate, 
      String? type, 
      String? placeofstudy, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Hsc.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _detail;
Hsc copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? startdate,
  String? enddate,
  String? type,
  String? placeofstudy,
  String? detail,
}) => Hsc(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 3
/// orderchoose : 0
/// onselect : true
/// startdate : "12/2022"
/// enddate : "12/2022"
/// position : ""
/// detail : ""

Experience experienceFromJson(String str) => Experience.fromJson(json.decode(str));
String experienceToJson(Experience data) => json.encode(data.toJson());
class Experience {
  Experience({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? startdate, 
      String? enddate, 
      String? position, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _startdate = startdate;
    _enddate = enddate;
    _position = position;
    _detail = detail;
}

  Experience.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _position = json['position'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _startdate;
  String? _enddate;
  String? _position;
  String? _detail;
Experience copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? startdate,
  String? enddate,
  String? position,
  String? detail,
}) => Experience(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  position: position ?? _position,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get position => _position;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['position'] = _position;
    map['detail'] = _detail;
    return map;
  }

}

/// number : "num"
/// moo : "mo"
/// soi : "so"
/// road : "ro"
/// subdistrict : "ฝั่งแดง"
/// district : "อำเภอนากลาง"
/// province : "หนองบัวลำภู"
/// zipcode : ""
/// onselected_number : false
/// onselected_moo : false
/// onselected_soi : false
/// onselected_road : false
/// onselected_subdistrict : true
/// onselected_district : true
/// onselected_province : true
/// onselected_zipcode : true

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());
class Address {
  Address({
      String? number, 
      String? moo, 
      String? soi, 
      String? road, 
      String? subdistrict, 
      String? district, 
      String? province, 
      String? zipcode, 
      bool? onselectedNumber, 
      bool? onselectedMoo, 
      bool? onselectedSoi, 
      bool? onselectedRoad, 
      bool? onselectedSubdistrict, 
      bool? onselectedDistrict, 
      bool? onselectedProvince, 
      bool? onselectedZipcode,}){
    _number = number;
    _moo = moo;
    _soi = soi;
    _road = road;
    _subdistrict = subdistrict;
    _district = district;
    _province = province;
    _zipcode = zipcode;
    _onselectedNumber = onselectedNumber;
    _onselectedMoo = onselectedMoo;
    _onselectedSoi = onselectedSoi;
    _onselectedRoad = onselectedRoad;
    _onselectedSubdistrict = onselectedSubdistrict;
    _onselectedDistrict = onselectedDistrict;
    _onselectedProvince = onselectedProvince;
    _onselectedZipcode = onselectedZipcode;
}

  Address.fromJson(dynamic json) {
    _number = json['number'];
    _moo = json['moo'];
    _soi = json['soi'];
    _road = json['road'];
    _subdistrict = json['subdistrict'];
    _district = json['district'];
    _province = json['province'];
    _zipcode = json['zipcode'];
    _onselectedNumber = json['onselected_number'];
    _onselectedMoo = json['onselected_moo'];
    _onselectedSoi = json['onselected_soi'];
    _onselectedRoad = json['onselected_road'];
    _onselectedSubdistrict = json['onselected_subdistrict'];
    _onselectedDistrict = json['onselected_district'];
    _onselectedProvince = json['onselected_province'];
    _onselectedZipcode = json['onselected_zipcode'];
  }
  String? _number;
  String? _moo;
  String? _soi;
  String? _road;
  String? _subdistrict;
  String? _district;
  String? _province;
  String? _zipcode;
  bool? _onselectedNumber;
  bool? _onselectedMoo;
  bool? _onselectedSoi;
  bool? _onselectedRoad;
  bool? _onselectedSubdistrict;
  bool? _onselectedDistrict;
  bool? _onselectedProvince;
  bool? _onselectedZipcode;
Address copyWith({  String? number,
  String? moo,
  String? soi,
  String? road,
  String? subdistrict,
  String? district,
  String? province,
  String? zipcode,
  bool? onselectedNumber,
  bool? onselectedMoo,
  bool? onselectedSoi,
  bool? onselectedRoad,
  bool? onselectedSubdistrict,
  bool? onselectedDistrict,
  bool? onselectedProvince,
  bool? onselectedZipcode,
}) => Address(  number: number ?? _number,
  moo: moo ?? _moo,
  soi: soi ?? _soi,
  road: road ?? _road,
  subdistrict: subdistrict ?? _subdistrict,
  district: district ?? _district,
  province: province ?? _province,
  zipcode: zipcode ?? _zipcode,
  onselectedNumber: onselectedNumber ?? _onselectedNumber,
  onselectedMoo: onselectedMoo ?? _onselectedMoo,
  onselectedSoi: onselectedSoi ?? _onselectedSoi,
  onselectedRoad: onselectedRoad ?? _onselectedRoad,
  onselectedSubdistrict: onselectedSubdistrict ?? _onselectedSubdistrict,
  onselectedDistrict: onselectedDistrict ?? _onselectedDistrict,
  onselectedProvince: onselectedProvince ?? _onselectedProvince,
  onselectedZipcode: onselectedZipcode ?? _onselectedZipcode,
);
  String? get number => _number;
  String? get moo => _moo;
  String? get soi => _soi;
  String? get road => _road;
  String? get subdistrict => _subdistrict;
  String? get district => _district;
  String? get province => _province;
  String? get zipcode => _zipcode;
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
    map['number'] = _number;
    map['moo'] = _moo;
    map['soi'] = _soi;
    map['road'] = _road;
    map['subdistrict'] = _subdistrict;
    map['district'] = _district;
    map['province'] = _province;
    map['zipcode'] = _zipcode;
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

/// email : ""
/// phone : ""
/// facebook : ""
/// line : ""
/// instagram : ""
/// twitter : ""
/// youtube : ""
/// onselected_email : false
/// onselected_phone : false
/// onselected_facebook : false
/// onselected_line : false
/// onselected_instagram : false
/// onselected_twitter : false
/// onselected_youtube : false

Contactinfo contactinfoFromJson(String str) => Contactinfo.fromJson(json.decode(str));
String contactinfoToJson(Contactinfo data) => json.encode(data.toJson());
class Contactinfo {
  Contactinfo({
      String? email, 
      String? phone, 
      String? facebook, 
      String? line, 
      String? instagram, 
      String? twitter, 
      String? youtube, 
      bool? onselectedEmail, 
      bool? onselectedPhone, 
      bool? onselectedFacebook, 
      bool? onselectedLine, 
      bool? onselectedInstagram, 
      bool? onselectedTwitter, 
      bool? onselectedYoutube,}){
    _email = email;
    _phone = phone;
    _facebook = facebook;
    _line = line;
    _instagram = instagram;
    _twitter = twitter;
    _youtube = youtube;
    _onselectedEmail = onselectedEmail;
    _onselectedPhone = onselectedPhone;
    _onselectedFacebook = onselectedFacebook;
    _onselectedLine = onselectedLine;
    _onselectedInstagram = onselectedInstagram;
    _onselectedTwitter = onselectedTwitter;
    _onselectedYoutube = onselectedYoutube;
}

  Contactinfo.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
    _facebook = json['facebook'];
    _line = json['line'];
    _instagram = json['instagram'];
    _twitter = json['twitter'];
    _youtube = json['youtube'];
    _onselectedEmail = json['onselected_email'];
    _onselectedPhone = json['onselected_phone'];
    _onselectedFacebook = json['onselected_facebook'];
    _onselectedLine = json['onselected_line'];
    _onselectedInstagram = json['onselected_instagram'];
    _onselectedTwitter = json['onselected_twitter'];
    _onselectedYoutube = json['onselected_youtube'];
  }
  String? _email;
  String? _phone;
  String? _facebook;
  String? _line;
  String? _instagram;
  String? _twitter;
  String? _youtube;
  bool? _onselectedEmail;
  bool? _onselectedPhone;
  bool? _onselectedFacebook;
  bool? _onselectedLine;
  bool? _onselectedInstagram;
  bool? _onselectedTwitter;
  bool? _onselectedYoutube;
Contactinfo copyWith({  String? email,
  String? phone,
  String? facebook,
  String? line,
  String? instagram,
  String? twitter,
  String? youtube,
  bool? onselectedEmail,
  bool? onselectedPhone,
  bool? onselectedFacebook,
  bool? onselectedLine,
  bool? onselectedInstagram,
  bool? onselectedTwitter,
  bool? onselectedYoutube,
}) => Contactinfo(  email: email ?? _email,
  phone: phone ?? _phone,
  facebook: facebook ?? _facebook,
  line: line ?? _line,
  instagram: instagram ?? _instagram,
  twitter: twitter ?? _twitter,
  youtube: youtube ?? _youtube,
  onselectedEmail: onselectedEmail ?? _onselectedEmail,
  onselectedPhone: onselectedPhone ?? _onselectedPhone,
  onselectedFacebook: onselectedFacebook ?? _onselectedFacebook,
  onselectedLine: onselectedLine ?? _onselectedLine,
  onselectedInstagram: onselectedInstagram ?? _onselectedInstagram,
  onselectedTwitter: onselectedTwitter ?? _onselectedTwitter,
  onselectedYoutube: onselectedYoutube ?? _onselectedYoutube,
);
  String? get email => _email;
  String? get phone => _phone;
  String? get facebook => _facebook;
  String? get line => _line;
  String? get instagram => _instagram;
  String? get twitter => _twitter;
  String? get youtube => _youtube;
  bool? get onselectedEmail => _onselectedEmail;
  bool? get onselectedPhone => _onselectedPhone;
  bool? get onselectedFacebook => _onselectedFacebook;
  bool? get onselectedLine => _onselectedLine;
  bool? get onselectedInstagram => _onselectedInstagram;
  bool? get onselectedTwitter => _onselectedTwitter;
  bool? get onselectedYoutube => _onselectedYoutube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['facebook'] = _facebook;
    map['line'] = _line;
    map['instagram'] = _instagram;
    map['twitter'] = _twitter;
    map['youtube'] = _youtube;
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

/// id : 8
/// orderchoose : 2
/// onselect : true
/// position : "4444444"
/// office : "44455"
/// detail : "string"

Position positionFromJson(String str) => Position.fromJson(json.decode(str));
String positionToJson(Position data) => json.encode(data.toJson());
class Position {
  Position({
      int? id, 
      int? orderchoose, 
      bool? onselect, 
      String? position, 
      String? office, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _onselect = onselect;
    _position = position;
    _office = office;
    _detail = detail;
}

  Position.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _onselect = json['onselect'];
    _position = json['position'];
    _office = json['office'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  bool? _onselect;
  String? _position;
  String? _office;
  String? _detail;
Position copyWith({  int? id,
  int? orderchoose,
  bool? onselect,
  String? position,
  String? office,
  String? detail,
}) => Position(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  onselect: onselect ?? _onselect,
  position: position ?? _position,
  office: office ?? _office,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  bool? get onselect => _onselect;
  String? get position => _position;
  String? get office => _office;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['onselect'] = _onselect;
    map['position'] = _position;
    map['office'] = _office;
    map['detail'] = _detail;
    return map;
  }

}

/// prefixid : ""
/// prefix : ""
/// name : ""
/// lastname : ""

Userinfo userinfoFromJson(String str) => Userinfo.fromJson(json.decode(str));
String userinfoToJson(Userinfo data) => json.encode(data.toJson());
class Userinfo {
  Userinfo({
      String? prefixid, 
      String? prefix, 
      String? name, 
      String? lastname,}){
    _prefixid = prefixid;
    _prefix = prefix;
    _name = name;
    _lastname = lastname;
}

  Userinfo.fromJson(dynamic json) {
    _prefixid = json['prefixid'];
    _prefix = json['prefix'];
    _name = json['name'];
    _lastname = json['lastname'];
  }
  String? _prefixid;
  String? _prefix;
  String? _name;
  String? _lastname;
Userinfo copyWith({  String? prefixid,
  String? prefix,
  String? name,
  String? lastname,
}) => Userinfo(  prefixid: prefixid ?? _prefixid,
  prefix: prefix ?? _prefix,
  name: name ?? _name,
  lastname: lastname ?? _lastname,
);
  String? get prefixid => _prefixid;
  String? get prefix => _prefix;
  String? get name => _name;
  String? get lastname => _lastname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prefixid'] = _prefixid;
    map['prefix'] = _prefix;
    map['name'] = _name;
    map['lastname'] = _lastname;
    return map;
  }

}

/// aboutme : "เกี่ยวกับฉัน"
/// aboutmedetail : "เกี่ยวกับฉัน รายละเอียด"
/// address : "ที่อยู่"
/// appliedposition : "ตำแหน่งที่สมัคร"
/// certificate : "ใบรับรอง"
/// contact : "ติดต่อ"
/// textdefault : "ค่าเริ่มต้น"
/// description : "คำอธิบาย"
/// detail : "รายละเอียด"
/// district : "อำเภอ"
/// editinfomations : "แก้ไขข้อมูล"
/// education : "การศึกษา"
/// educationinfo : "ข้อมูลการศึกษา"
/// email : "อีเมล"
/// enddate : "วันสิ้นสุด"
/// experience : "ประสบการณ์"
/// facebook : "เฟคบุ๊ค"
/// instagram : "อินสตาแกรม"
/// language : "ภาษา"
/// lastname : "นามสกุล"
/// line : "ไลน์"
/// moo : "หมู่"
/// mypositions : "ตำแหน่งของฉัน"
/// n : "นิ้ว"
/// name : "ชื่อ"
/// number : "บ้านเลขที่"
/// phone : "โทรศัพท์"
/// pictuce : "รูปภาพ"
/// placeofstudy : "สถานศึกษา"
/// position : "ตำแหน่ง"
/// positions : "ตำแหน่ง"
/// prefix : "คำนำหน้า"
/// province : "จังหวัด"
/// ratio : "อัตราส่วนภาพต้องเป็น 3:4"
/// road : "ถนน"
/// select : "เลือก"
/// selectacolor : "โปรดเลือกสี"
/// selecttheinformation : "โปรดเลือกข้อมูล "
/// size : "ขนาด"
/// sizepictuce : "ขนาดไฟล์ไม่เกิน 5 MB"
/// skill : "ทักษะ"
/// soi : "ซอย"
/// startdate : "วันเริ่มต้น"
/// subdistrict : "ตำบล"
/// themecolor : "สีธีม"
/// title : "หัวเรื่อง"
/// titlesetthemecolor : "ตั้งค่าธีมและสี"
/// twitter : "ทวิตเตอร์"
/// type : "ประเภทการศึกษา"
/// value : "ระดับ"
/// whcm : "(กxส) ซม"
/// zipcode : "รหัสไปรษณีย์"
/// unkhown : "ไม่ทราบ"
/// viewpdf : "PDF"
/// titleresumeinformation : "ข้อมูลเรซูเม่"
/// hsc : "ประกาศนียบัตรมัธยมศึกษาตอนปลาย"
/// bd : "ระดับปริญญาตรี"
/// md : "ปริญญาโท    "
/// dd : "ปริญญาเอก"
/// hdd : "ปริญญาดุษฎีบัณฑิตกิตติมศักดิ์"
/// tapedit : "แตะเพื่อแก้ไข้ข้อมูล"
/// save : "บันทึก"
/// saveor : "Save/บันทึก"
/// youtube : "ยูทูป"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? aboutme,
    String? aboutmedetail,
    String? address,
    String? appliedposition,
    String? certificate,
    String? contact,
    String? textdefault,
    String? description,
    String? detail,
    String? district,
    String? editinfomations,
    String? education,
    String? educationinfo,
    String? email,
    String? enddate,
    String? experience,
    String? facebook,
    String? instagram,
    String? language,
    String? lastname,
    String? line,
    String? moo,
    String? mypositions,
    String? n,
    String? name,
    String? number,
    String? phone,
    String? pictuce,
    String? placeofstudy,
    String? position,
    String? positions,
    String? prefix,
    String? province,
    String? ratio,
    String? road,
    String? select,
    String? selectacolor,
    String? selecttheinformation,
    String? size,
    String? sizepictuce,
    String? skill,
    String? soi,
    String? startdate,
    String? subdistrict,
    String? themecolor,
    String? title,
    String? titlesetthemecolor,
    String? twitter,
    String? type,
    String? value,
    String? whcm,
    String? zipcode,
    String? unkhown,
    String? viewpdf,
    String? titleresumeinformation,
    String? hsc,
    String? bd,
    String? md,
    String? dd,
    String? hdd,
    String? tapedit,
    String? save,
    String? saveor,
    String? youtube,
    String? showall,
    String? showsome,
    String? activitynot,
    String? selectednot,
    String? btnresume1,
    String? btnresume2,}){
    _aboutme = aboutme;
    _aboutmedetail = aboutmedetail;
    _address = address;
    _appliedposition = appliedposition;
    _certificate = certificate;
    _contact = contact;
    _textdefault = textdefault;
    _description = description;
    _detail = detail;
    _district = district;
    _editinfomations = editinfomations;
    _education = education;
    _educationinfo = educationinfo;
    _email = email;
    _enddate = enddate;
    _experience = experience;
    _facebook = facebook;
    _instagram = instagram;
    _language = language;
    _lastname = lastname;
    _line = line;
    _moo = moo;
    _mypositions = mypositions;
    _n = n;
    _name = name;
    _number = number;
    _phone = phone;
    _pictuce = pictuce;
    _placeofstudy = placeofstudy;
    _position = position;
    _positions = positions;
    _prefix = prefix;
    _province = province;
    _ratio = ratio;
    _road = road;
    _select = select;
    _selectacolor = selectacolor;
    _selecttheinformation = selecttheinformation;
    _size = size;
    _sizepictuce = sizepictuce;
    _skill = skill;
    _soi = soi;
    _startdate = startdate;
    _subdistrict = subdistrict;
    _themecolor = themecolor;
    _title = title;
    _titlesetthemecolor = titlesetthemecolor;
    _twitter = twitter;
    _type = type;
    _value = value;
    _whcm = whcm;
    _zipcode = zipcode;
    _unkhown = unkhown;
    _viewpdf = viewpdf;
    _titleresumeinformation = titleresumeinformation;
    _hsc = hsc;
    _bd = bd;
    _md = md;
    _dd = dd;
    _hdd = hdd;
    _tapedit = tapedit;
    _save = save;
    _saveor = saveor;
    _youtube = youtube;
    _showall = showall;
    _showsome = showsome;
    _activitynot = activitynot;
    _selectednot = selectednot;
    _btnresume1 = btnresume1;
    _btnresume2 = btnresume2;
  }

  Screeninfo.fromJson(dynamic json) {
    _aboutme = json['aboutme'];
    _aboutmedetail = json['aboutmedetail'];
    _address = json['address'];
    _appliedposition = json['appliedposition'];
    _certificate = json['certificate'];
    _contact = json['contact'];
    _textdefault = json['textdefault'];
    _description = json['description'];
    _detail = json['detail'];
    _district = json['district'];
    _editinfomations = json['editinfomations'];
    _education = json['education'];
    _educationinfo = json['educationinfo'];
    _email = json['email'];
    _enddate = json['enddate'];
    _experience = json['experience'];
    _facebook = json['facebook'];
    _instagram = json['instagram'];
    _language = json['language'];
    _lastname = json['lastname'];
    _line = json['line'];
    _moo = json['moo'];
    _mypositions = json['mypositions'];
    _n = json['n'];
    _name = json['name'];
    _number = json['number'];
    _phone = json['phone'];
    _pictuce = json['pictuce'];
    _placeofstudy = json['placeofstudy'];
    _position = json['position'];
    _positions = json['positions'];
    _prefix = json['prefix'];
    _province = json['province'];
    _ratio = json['ratio'];
    _road = json['road'];
    _select = json['select'];
    _selectacolor = json['selectacolor'];
    _selecttheinformation = json['selecttheinformation'];
    _size = json['size'];
    _sizepictuce = json['sizepictuce'];
    _skill = json['skill'];
    _soi = json['soi'];
    _startdate = json['startdate'];
    _subdistrict = json['subdistrict'];
    _themecolor = json['themecolor'];
    _title = json['title'];
    _titlesetthemecolor = json['titlesetthemecolor'];
    _twitter = json['twitter'];
    _type = json['type'];
    _value = json['value'];
    _whcm = json['whcm'];
    _zipcode = json['zipcode'];
    _unkhown = json['unkhown'];
    _viewpdf = json['viewpdf'];
    _titleresumeinformation = json['titleresumeinformation'];
    _hsc = json['hsc'];
    _bd = json['bd'];
    _md = json['md'];
    _dd = json['dd'];
    _hdd = json['hdd'];
    _tapedit = json['tapedit'];
    _save = json['save'];
    _saveor = json['saveor'];
    _youtube = json['youtube'];
    _showall = json['showall'];
    _showsome = json['showsome'];
    _activitynot = json['activitynot'];
    _selectednot = json['selectednot'];
    _btnresume1 = json['btnresume1'];
    _btnresume2 = json['btnresume2'];
  }
  String? _aboutme;
  String? _aboutmedetail;
  String? _address;
  String? _appliedposition;
  String? _certificate;
  String? _contact;
  String? _textdefault;
  String? _description;
  String? _detail;
  String? _district;
  String? _editinfomations;
  String? _education;
  String? _educationinfo;
  String? _email;
  String? _enddate;
  String? _experience;
  String? _facebook;
  String? _instagram;
  String? _language;
  String? _lastname;
  String? _line;
  String? _moo;
  String? _mypositions;
  String? _n;
  String? _name;
  String? _number;
  String? _phone;
  String? _pictuce;
  String? _placeofstudy;
  String? _position;
  String? _positions;
  String? _prefix;
  String? _province;
  String? _ratio;
  String? _road;
  String? _select;
  String? _selectacolor;
  String? _selecttheinformation;
  String? _size;
  String? _sizepictuce;
  String? _skill;
  String? _soi;
  String? _startdate;
  String? _subdistrict;
  String? _themecolor;
  String? _title;
  String? _titlesetthemecolor;
  String? _twitter;
  String? _type;
  String? _value;
  String? _whcm;
  String? _zipcode;
  String? _unkhown;
  String? _viewpdf;
  String? _titleresumeinformation;
  String? _hsc;
  String? _bd;
  String? _md;
  String? _dd;
  String? _hdd;
  String? _tapedit;
  String? _save;
  String? _saveor;
  String? _youtube;
  String? _showall;
  String? _showsome;
  String? _activitynot;
  String? _selectednot;
  String? _btnresume1;
  String? _btnresume2;
  Screeninfo copyWith({  String? aboutme,
    String? aboutmedetail,
    String? address,
    String? appliedposition,
    String? certificate,
    String? contact,
    String? textdefault,
    String? description,
    String? detail,
    String? district,
    String? editinfomations,
    String? education,
    String? educationinfo,
    String? email,
    String? enddate,
    String? experience,
    String? facebook,
    String? instagram,
    String? language,
    String? lastname,
    String? line,
    String? moo,
    String? mypositions,
    String? n,
    String? name,
    String? number,
    String? phone,
    String? pictuce,
    String? placeofstudy,
    String? position,
    String? positions,
    String? prefix,
    String? province,
    String? ratio,
    String? road,
    String? select,
    String? selectacolor,
    String? selecttheinformation,
    String? size,
    String? sizepictuce,
    String? skill,
    String? soi,
    String? startdate,
    String? subdistrict,
    String? themecolor,
    String? title,
    String? titlesetthemecolor,
    String? twitter,
    String? type,
    String? value,
    String? whcm,
    String? zipcode,
    String? unkhown,
    String? viewpdf,
    String? titleresumeinformation,
    String? hsc,
    String? bd,
    String? md,
    String? dd,
    String? hdd,
    String? tapedit,
    String? save,
    String? saveor,
    String? youtube,
    String? showall,
    String? showsome,
    String? activitynot,
    String? selectednot,
    String? btnresume1,
    String? btnresume2,
  }) => Screeninfo(  aboutme: aboutme ?? _aboutme,
    aboutmedetail: aboutmedetail ?? _aboutmedetail,
    address: address ?? _address,
    appliedposition: appliedposition ?? _appliedposition,
    certificate: certificate ?? _certificate,
    contact: contact ?? _contact,
    textdefault: textdefault ?? _textdefault,
    description: description ?? _description,
    detail: detail ?? _detail,
    district: district ?? _district,
    editinfomations: editinfomations ?? _editinfomations,
    education: education ?? _education,
    educationinfo: educationinfo ?? _educationinfo,
    email: email ?? _email,
    enddate: enddate ?? _enddate,
    experience: experience ?? _experience,
    facebook: facebook ?? _facebook,
    instagram: instagram ?? _instagram,
    language: language ?? _language,
    lastname: lastname ?? _lastname,
    line: line ?? _line,
    moo: moo ?? _moo,
    mypositions: mypositions ?? _mypositions,
    n: n ?? _n,
    name: name ?? _name,
    number: number ?? _number,
    phone: phone ?? _phone,
    pictuce: pictuce ?? _pictuce,
    placeofstudy: placeofstudy ?? _placeofstudy,
    position: position ?? _position,
    positions: positions ?? _positions,
    prefix: prefix ?? _prefix,
    province: province ?? _province,
    ratio: ratio ?? _ratio,
    road: road ?? _road,
    select: select ?? _select,
    selectacolor: selectacolor ?? _selectacolor,
    selecttheinformation: selecttheinformation ?? _selecttheinformation,
    size: size ?? _size,
    sizepictuce: sizepictuce ?? _sizepictuce,
    skill: skill ?? _skill,
    soi: soi ?? _soi,
    startdate: startdate ?? _startdate,
    subdistrict: subdistrict ?? _subdistrict,
    themecolor: themecolor ?? _themecolor,
    title: title ?? _title,
    titlesetthemecolor: titlesetthemecolor ?? _titlesetthemecolor,
    twitter: twitter ?? _twitter,
    type: type ?? _type,
    value: value ?? _value,
    whcm: whcm ?? _whcm,
    zipcode: zipcode ?? _zipcode,
    unkhown: unkhown ?? _unkhown,
    viewpdf: viewpdf ?? _viewpdf,
    titleresumeinformation: titleresumeinformation ?? _titleresumeinformation,
    hsc: hsc ?? _hsc,
    bd: bd ?? _bd,
    md: md ?? _md,
    dd: dd ?? _dd,
    hdd: hdd ?? _hdd,
    tapedit: tapedit ?? _tapedit,
    save: save ?? _save,
    saveor: saveor ?? _saveor,
    youtube: youtube ?? _youtube,
    showall: showall ?? _showall,
    showsome: showsome ?? _showsome,
    activitynot: activitynot ?? _activitynot,
    selectednot: selectednot ?? _selectednot,
    btnresume1: btnresume1 ?? _btnresume1,
    btnresume2: btnresume2 ?? _btnresume2,
  );
  String? get aboutme => _aboutme;
  String? get aboutmedetail => _aboutmedetail;
  String? get address => _address;
  String? get appliedposition => _appliedposition;
  String? get certificate => _certificate;
  String? get contact => _contact;
  String? get textdefault => _textdefault;
  String? get description => _description;
  String? get detail => _detail;
  String? get district => _district;
  String? get editinfomations => _editinfomations;
  String? get education => _education;
  String? get educationinfo => _educationinfo;
  String? get email => _email;
  String? get enddate => _enddate;
  String? get experience => _experience;
  String? get facebook => _facebook;
  String? get instagram => _instagram;
  String? get language => _language;
  String? get lastname => _lastname;
  String? get line => _line;
  String? get moo => _moo;
  String? get mypositions => _mypositions;
  String? get n => _n;
  String? get name => _name;
  String? get number => _number;
  String? get phone => _phone;
  String? get pictuce => _pictuce;
  String? get placeofstudy => _placeofstudy;
  String? get position => _position;
  String? get positions => _positions;
  String? get prefix => _prefix;
  String? get province => _province;
  String? get ratio => _ratio;
  String? get road => _road;
  String? get select => _select;
  String? get selectacolor => _selectacolor;
  String? get selecttheinformation => _selecttheinformation;
  String? get size => _size;
  String? get sizepictuce => _sizepictuce;
  String? get skill => _skill;
  String? get soi => _soi;
  String? get startdate => _startdate;
  String? get subdistrict => _subdistrict;
  String? get themecolor => _themecolor;
  String? get title => _title;
  String? get titlesetthemecolor => _titlesetthemecolor;
  String? get twitter => _twitter;
  String? get type => _type;
  String? get value => _value;
  String? get whcm => _whcm;
  String? get zipcode => _zipcode;
  String? get unkhown => _unkhown;
  String? get viewpdf => _viewpdf;
  String? get titleresumeinformation => _titleresumeinformation;
  String? get hsc => _hsc;
  String? get bd => _bd;
  String? get md => _md;
  String? get dd => _dd;
  String? get hdd => _hdd;
  String? get tapedit => _tapedit;
  String? get save => _save;
  String? get saveor => _saveor;
  String? get youtube => _youtube;
  String? get showall => _showall;
  String? get showsome => _showsome;
  String? get activitynot => _activitynot;
  String? get selectednot => _selectednot;
  String? get btnresume1 => _btnresume1;
  String? get btnresume2 => _btnresume2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aboutme'] = _aboutme;
    map['aboutmedetail'] = _aboutmedetail;
    map['address'] = _address;
    map['appliedposition'] = _appliedposition;
    map['certificate'] = _certificate;
    map['contact'] = _contact;
    map['textdefault'] = _textdefault;
    map['description'] = _description;
    map['detail'] = _detail;
    map['district'] = _district;
    map['editinfomations'] = _editinfomations;
    map['education'] = _education;
    map['educationinfo'] = _educationinfo;
    map['email'] = _email;
    map['enddate'] = _enddate;
    map['experience'] = _experience;
    map['facebook'] = _facebook;
    map['instagram'] = _instagram;
    map['language'] = _language;
    map['lastname'] = _lastname;
    map['line'] = _line;
    map['moo'] = _moo;
    map['mypositions'] = _mypositions;
    map['n'] = _n;
    map['name'] = _name;
    map['number'] = _number;
    map['phone'] = _phone;
    map['pictuce'] = _pictuce;
    map['placeofstudy'] = _placeofstudy;
    map['position'] = _position;
    map['positions'] = _positions;
    map['prefix'] = _prefix;
    map['province'] = _province;
    map['ratio'] = _ratio;
    map['road'] = _road;
    map['select'] = _select;
    map['selectacolor'] = _selectacolor;
    map['selecttheinformation'] = _selecttheinformation;
    map['size'] = _size;
    map['sizepictuce'] = _sizepictuce;
    map['skill'] = _skill;
    map['soi'] = _soi;
    map['startdate'] = _startdate;
    map['subdistrict'] = _subdistrict;
    map['themecolor'] = _themecolor;
    map['title'] = _title;
    map['titlesetthemecolor'] = _titlesetthemecolor;
    map['twitter'] = _twitter;
    map['type'] = _type;
    map['value'] = _value;
    map['whcm'] = _whcm;
    map['zipcode'] = _zipcode;
    map['unkhown'] = _unkhown;
    map['viewpdf'] = _viewpdf;
    map['titleresumeinformation'] = _titleresumeinformation;
    map['hsc'] = _hsc;
    map['bd'] = _bd;
    map['md'] = _md;
    map['dd'] = _dd;
    map['hdd'] = _hdd;
    map['tapedit'] = _tapedit;
    map['save'] = _save;
    map['saveor'] = _saveor;
    map['youtube'] = _youtube;
    map['showall'] = _showall;
    map['showsome'] = _showsome;
    map['activitynot'] = _activitynot;
    map['selectednot'] = _selectednot;
    map['btnresume1'] = _btnresume1;
    map['btnresume2'] = _btnresume2;
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