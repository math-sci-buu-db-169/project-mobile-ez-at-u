import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home/resume","timeexpire":false}
/// body : {"screenInfo":{"aboutme":"เกี่ยวกับฉัน","aboutmedetail":"เกี่ยวกับฉัน รายละเอียด","address":"ที่อยู่","appliedposition":"ตำแหน่งที่สมัคร","certificate":"ใบรับรอง","contact":"ติดต่อ","textdefault":"ค่าเริ่มต้น","description":"คำอธิบาย","detail":"รายละเอียด","district":"อำเภอ","editinfomations":"แก้ไขข้อมูล","education":"การศึกษา","educationinfo":"ข้อมูลการศึกษา","email":"อีเมล","enddate":"วันสิ้นสุด","experience":"ประสบการณ์","facebook":"เฟคบุ๊ค","instagram":"อินสตาแกรม","language":"ภาษา","lastname":"นามสกุล","line":"ไลน์","moo":"หมู่","mypositions":"ตำแหน่งของฉัน","n":"นิ้ว","name":"ชื่อ","number":"ตัวเลข","phone":"โทรศัพท์","pictuce":"รูปภาพ","placeofstudy":"สถานศึกษา","position":"ตำแหน่ง","positions":"ตำแหน่ง","prefix":"คำนำหน้า","province":"จังหวัด","ratio":"อัตราส่วนภาพต้องเป็น 3:4","road":"ถนน","select":"เลือก","selectacolor":"โปรดเลือกสี","selecttheinformation":"โปรดเลือกข้อมูล ","size":"ขนาด","sizepictuce":"ขนาดไฟล์ไม่เกิน 5 MB","skill":"ทักษะ","soi":"ซอย","startdate":"วันเริ่มต้น","subdistrict":"ตำบล","themecolor":"สีธีม","title":"หัวเรื่อง","titlesetthemecolor":"ตั้งค่าธีมและสี","twitter":"ทวิตเตอร์","type":"ประเภทการศึกษา","value":"ระดับ","whcm":"(กxส) ซม","zipcode":"รหัสไปรษณีย์","unkhown":"ไม่ทราบ","viewpdf":"PDF","titleresumeinformation":"ข้อมูลเรซูเม่","hsc":"ประกาศนียบัตรมัธยมศึกษาตอนปลาย","bd":"ระดับปริญญาตรี","md":"ปริญญาโท    ","dd":"ปริญญาเอก","hdd":"ปริญญาดุษฎีบัณฑิตกิตติมศักดิ์","tapedit":"แตะเพื่อแก้ไข้ข้อมูล","save":"บันทึก","saveor":"Save/บันทึก","youtube":"ยูทูป"},"data":{"userinfo":{"prefixid":"P1","prefix":"นาง","name":"ธาราดล","lastname":"ชินโน"},"position":[{"id":4,"orderchoose":8,"position":"พา","office":"เช","detail":"string"}],"aboutme":"วิศวกรซอฟต์แวร์มากประสบการณ์ที่มีความกระตือรือร้นในการพัฒนาโปรแกรมนวัตกรรมที่ช่วยเร่งประสิทธิภาพและประสิทธิผลของความสำเร็จขององค์กร เชี่ยวชาญด้านเทคโนโลยีและการเขียนโค้ดเพื่อสร้างระบบที่เชื่อถือได้และเป็นมิตรกับผู้ใs","personinfo":{"email":"emaill3","phone":"phonel3","facebook":"feacbookl3","line":"@0930582335l3","instagram":"instagraml3","twitter":"twitterl3","youtube":"you"},"address":{"number":"169","moo":"","soi":"","road":"string","subdistrict":"ลงหาดบางแสน แสนสุข","district":"เมือง","province":"ชลบุรี","zipcode":"20131"},"experience":[{"id":2,"orderchoose":5,"startdate":"Jun 2015 ","enddate":"Jun 2018","position":"วิศวกรรมซอฟต์แวร์99","detail":"ฟรีวิลล์ โซลูชั่นส์ จํากัด99"},{"id":4,"orderchoose":4,"startdate":"Jun 2015 ","enddate":"Jun 2018","position":"วิศวกรรมซอฟต์แวร์+3.3","detail":"ฟรีวิลล์ โซลูชั่นส์ จํากัด.3"}],"education":{"hsc":[{"id":4,"orderchoose":0,"startdate":"string","enddate":"string","type":"HSC","placeofstudy":"string","detail":"string"}],"bd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}],"md":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}],"dd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"DD","placeofstudy":null,"detail":null}],"hdd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"HDD","placeofstudy":null,"detail":null}]},"skill":[{"id":2,"orderchoose":4,"skill":"ทักษะกินdd","value":"39","detail":"wine dd"},{"id":3,"orderchoose":2,"skill":"skill_thde","value":"50","detail":"description_thgood"},{"id":4,"orderchoose":3,"skill":"good","value":"88","detail":"depp"},{"id":5,"orderchoose":5,"skill":"","value":"50","detail":""}],"certificate":[{"id":1,"orderchoose":4,"title":"go","description":"go"},{"id":2,"orderchoose":1,"title":"string16","description":"string36"}],"languge":[{"id":1,"orderchoose":5,"language":"language_thd","value":"62","detail":"description_thg"}],"image":"/9j/4AAQSkZ"}}

Image imageFromJson(String str) => Image.fromJson(json.decode(str));
String imageToJson(Image data) => json.encode(data.toJson());
class Image {
  Image({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  Image.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
Image copyWith({  Head? head,
  Body? body,
}) => Image(  head: head ?? _head,
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

/// screenInfo : {"aboutme":"เกี่ยวกับฉัน","aboutmedetail":"เกี่ยวกับฉัน รายละเอียด","address":"ที่อยู่","appliedposition":"ตำแหน่งที่สมัคร","certificate":"ใบรับรอง","contact":"ติดต่อ","textdefault":"ค่าเริ่มต้น","description":"คำอธิบาย","detail":"รายละเอียด","district":"อำเภอ","editinfomations":"แก้ไขข้อมูล","education":"การศึกษา","educationinfo":"ข้อมูลการศึกษา","email":"อีเมล","enddate":"วันสิ้นสุด","experience":"ประสบการณ์","facebook":"เฟคบุ๊ค","instagram":"อินสตาแกรม","language":"ภาษา","lastname":"นามสกุล","line":"ไลน์","moo":"หมู่","mypositions":"ตำแหน่งของฉัน","n":"นิ้ว","name":"ชื่อ","number":"ตัวเลข","phone":"โทรศัพท์","pictuce":"รูปภาพ","placeofstudy":"สถานศึกษา","position":"ตำแหน่ง","positions":"ตำแหน่ง","prefix":"คำนำหน้า","province":"จังหวัด","ratio":"อัตราส่วนภาพต้องเป็น 3:4","road":"ถนน","select":"เลือก","selectacolor":"โปรดเลือกสี","selecttheinformation":"โปรดเลือกข้อมูล ","size":"ขนาด","sizepictuce":"ขนาดไฟล์ไม่เกิน 5 MB","skill":"ทักษะ","soi":"ซอย","startdate":"วันเริ่มต้น","subdistrict":"ตำบล","themecolor":"สีธีม","title":"หัวเรื่อง","titlesetthemecolor":"ตั้งค่าธีมและสี","twitter":"ทวิตเตอร์","type":"ประเภทการศึกษา","value":"ระดับ","whcm":"(กxส) ซม","zipcode":"รหัสไปรษณีย์","unkhown":"ไม่ทราบ","viewpdf":"PDF","titleresumeinformation":"ข้อมูลเรซูเม่","hsc":"ประกาศนียบัตรมัธยมศึกษาตอนปลาย","bd":"ระดับปริญญาตรี","md":"ปริญญาโท    ","dd":"ปริญญาเอก","hdd":"ปริญญาดุษฎีบัณฑิตกิตติมศักดิ์","tapedit":"แตะเพื่อแก้ไข้ข้อมูล","save":"บันทึก","saveor":"Save/บันทึก","youtube":"ยูทูป"}
/// data : {"userinfo":{"prefixid":"P1","prefix":"นาง","name":"ธาราดล","lastname":"ชินโน"},"position":[{"id":4,"orderchoose":8,"position":"พา","office":"เช","detail":"string"}],"aboutme":"วิศวกรซอฟต์แวร์มากประสบการณ์ที่มีความกระตือรือร้นในการพัฒนาโปรแกรมนวัตกรรมที่ช่วยเร่งประสิทธิภาพและประสิทธิผลของความสำเร็จขององค์กร เชี่ยวชาญด้านเทคโนโลยีและการเขียนโค้ดเพื่อสร้างระบบที่เชื่อถือได้และเป็นมิตรกับผู้ใs","personinfo":{"email":"emaill3","phone":"phonel3","facebook":"feacbookl3","line":"@0930582335l3","instagram":"instagraml3","twitter":"twitterl3","youtube":"you"},"address":{"number":"169","moo":"","soi":"","road":"string","subdistrict":"ลงหาดบางแสน แสนสุข","district":"เมือง","province":"ชลบุรี","zipcode":"20131"},"experience":[{"id":2,"orderchoose":5,"startdate":"Jun 2015 ","enddate":"Jun 2018","position":"วิศวกรรมซอฟต์แวร์99","detail":"ฟรีวิลล์ โซลูชั่นส์ จํากัด99"},{"id":4,"orderchoose":4,"startdate":"Jun 2015 ","enddate":"Jun 2018","position":"วิศวกรรมซอฟต์แวร์+3.3","detail":"ฟรีวิลล์ โซลูชั่นส์ จํากัด.3"}],"education":{"hsc":[{"id":4,"orderchoose":0,"startdate":"string","enddate":"string","type":"HSC","placeofstudy":"string","detail":"string"}],"bd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}],"md":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}],"dd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"DD","placeofstudy":null,"detail":null}],"hdd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"HDD","placeofstudy":null,"detail":null}]},"skill":[{"id":2,"orderchoose":4,"skill":"ทักษะกินdd","value":"39","detail":"wine dd"},{"id":3,"orderchoose":2,"skill":"skill_thde","value":"50","detail":"description_thgood"},{"id":4,"orderchoose":3,"skill":"good","value":"88","detail":"depp"},{"id":5,"orderchoose":5,"skill":"","value":"50","detail":""}],"certificate":[{"id":1,"orderchoose":4,"title":"go","description":"go"},{"id":2,"orderchoose":1,"title":"string16","description":"string36"}],"languge":[{"id":1,"orderchoose":5,"language":"language_thd","value":"62","detail":"description_thg"}],"image":"/9j/4AAQSkZ"}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      ScreenInfo? screenInfo, 
      Data? data,}){
    _screenInfo = screenInfo;
    _data = data;
}

  Body.fromJson(dynamic json) {
    _screenInfo = json['screenInfo'] != null ? ScreenInfo.fromJson(json['screenInfo']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  ScreenInfo? _screenInfo;
  Data? _data;
Body copyWith({  ScreenInfo? screenInfo,
  Data? data,
}) => Body(  screenInfo: screenInfo ?? _screenInfo,
  data: data ?? _data,
);
  ScreenInfo? get screenInfo => _screenInfo;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screenInfo != null) {
      map['screenInfo'] = _screenInfo?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// userinfo : {"prefixid":"P1","prefix":"นาง","name":"ธาราดล","lastname":"ชินโน"}
/// position : [{"id":4,"orderchoose":8,"position":"พา","office":"เช","detail":"string"}]
/// aboutme : "วิศวกรซอฟต์แวร์มากประสบการณ์ที่มีความกระตือรือร้นในการพัฒนาโปรแกรมนวัตกรรมที่ช่วยเร่งประสิทธิภาพและประสิทธิผลของความสำเร็จขององค์กร เชี่ยวชาญด้านเทคโนโลยีและการเขียนโค้ดเพื่อสร้างระบบที่เชื่อถือได้และเป็นมิตรกับผู้ใs"
/// personinfo : {"email":"emaill3","phone":"phonel3","facebook":"feacbookl3","line":"@0930582335l3","instagram":"instagraml3","twitter":"twitterl3","youtube":"you"}
/// address : {"number":"169","moo":"","soi":"","road":"string","subdistrict":"ลงหาดบางแสน แสนสุข","district":"เมือง","province":"ชลบุรี","zipcode":"20131"}
/// experience : [{"id":2,"orderchoose":5,"startdate":"Jun 2015 ","enddate":"Jun 2018","position":"วิศวกรรมซอฟต์แวร์99","detail":"ฟรีวิลล์ โซลูชั่นส์ จํากัด99"},{"id":4,"orderchoose":4,"startdate":"Jun 2015 ","enddate":"Jun 2018","position":"วิศวกรรมซอฟต์แวร์+3.3","detail":"ฟรีวิลล์ โซลูชั่นส์ จํากัด.3"}]
/// education : {"hsc":[{"id":4,"orderchoose":0,"startdate":"string","enddate":"string","type":"HSC","placeofstudy":"string","detail":"string"}],"bd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}],"md":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}],"dd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"DD","placeofstudy":null,"detail":null}],"hdd":[{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"HDD","placeofstudy":null,"detail":null}]}
/// skill : [{"id":2,"orderchoose":4,"skill":"ทักษะกินdd","value":"39","detail":"wine dd"},{"id":3,"orderchoose":2,"skill":"skill_thde","value":"50","detail":"description_thgood"},{"id":4,"orderchoose":3,"skill":"good","value":"88","detail":"depp"},{"id":5,"orderchoose":5,"skill":"","value":"50","detail":""}]
/// certificate : [{"id":1,"orderchoose":4,"title":"go","description":"go"},{"id":2,"orderchoose":1,"title":"string16","description":"string36"}]
/// languge : [{"id":1,"orderchoose":5,"language":"language_thd","value":"62","detail":"description_thg"}]
/// image : "/9j/4AAQSkZ"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Userinfo? userinfo, 
      List<Position>? position, 
      String? aboutme, 
      Personinfo? personinfo, 
      Address? address, 
      List<Experience>? experience, 
      Education? education, 
      List<Skill>? skill, 
      List<Certificate>? certificate, 
      List<Languge>? languge, 
      String? image,}){
    _userinfo = userinfo;
    _position = position;
    _aboutme = aboutme;
    _personinfo = personinfo;
    _address = address;
    _experience = experience;
    _education = education;
    _skill = skill;
    _certificate = certificate;
    _languge = languge;
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
    _personinfo = json['personinfo'] != null ? Personinfo.fromJson(json['personinfo']) : null;
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
    if (json['languge'] != null) {
      _languge = [];
      json['languge'].forEach((v) {
        _languge?.add(Languge.fromJson(v));
      });
    }
    _image = json['image'];
  }
  Userinfo? _userinfo;
  List<Position>? _position;
  String? _aboutme;
  Personinfo? _personinfo;
  Address? _address;
  List<Experience>? _experience;
  Education? _education;
  List<Skill>? _skill;
  List<Certificate>? _certificate;
  List<Languge>? _languge;
  String? _image;
Data copyWith({  Userinfo? userinfo,
  List<Position>? position,
  String? aboutme,
  Personinfo? personinfo,
  Address? address,
  List<Experience>? experience,
  Education? education,
  List<Skill>? skill,
  List<Certificate>? certificate,
  List<Languge>? languge,
  String? image,
}) => Data(  userinfo: userinfo ?? _userinfo,
  position: position ?? _position,
  aboutme: aboutme ?? _aboutme,
  personinfo: personinfo ?? _personinfo,
  address: address ?? _address,
  experience: experience ?? _experience,
  education: education ?? _education,
  skill: skill ?? _skill,
  certificate: certificate ?? _certificate,
  languge: languge ?? _languge,
  image: image ?? _image,
);
  Userinfo? get userinfo => _userinfo;
  List<Position>? get position => _position;
  String? get aboutme => _aboutme;
  Personinfo? get personinfo => _personinfo;
  Address? get address => _address;
  List<Experience>? get experience => _experience;
  Education? get education => _education;
  List<Skill>? get skill => _skill;
  List<Certificate>? get certificate => _certificate;
  List<Languge>? get languge => _languge;
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
    if (_personinfo != null) {
      map['personinfo'] = _personinfo?.toJson();
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
    if (_languge != null) {
      map['languge'] = _languge?.map((v) => v.toJson()).toList();
    }
    map['image'] = _image;
    return map;
  }

}

/// id : 1
/// orderchoose : 5
/// language : "language_thd"
/// value : "62"
/// detail : "description_thg"

Languge langugeFromJson(String str) => Languge.fromJson(json.decode(str));
String langugeToJson(Languge data) => json.encode(data.toJson());
class Languge {
  Languge({
      int? id, 
      int? orderchoose, 
      String? language, 
      String? value, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _language = language;
    _value = value;
    _detail = detail;
}

  Languge.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _language = json['language'];
    _value = json['value'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  String? _language;
  String? _value;
  String? _detail;
Languge copyWith({  int? id,
  int? orderchoose,
  String? language,
  String? value,
  String? detail,
}) => Languge(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  language: language ?? _language,
  value: value ?? _value,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get language => _language;
  String? get value => _value;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['language'] = _language;
    map['value'] = _value;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 1
/// orderchoose : 4
/// title : "go"
/// description : "go"

Certificate certificateFromJson(String str) => Certificate.fromJson(json.decode(str));
String certificateToJson(Certificate data) => json.encode(data.toJson());
class Certificate {
  Certificate({
      int? id, 
      int? orderchoose, 
      String? title, 
      String? description,}){
    _id = id;
    _orderchoose = orderchoose;
    _title = title;
    _description = description;
}

  Certificate.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _title = json['title'];
    _description = json['description'];
  }
  int? _id;
  int? _orderchoose;
  String? _title;
  String? _description;
Certificate copyWith({  int? id,
  int? orderchoose,
  String? title,
  String? description,
}) => Certificate(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  title: title ?? _title,
  description: description ?? _description,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}

/// id : 2
/// orderchoose : 4
/// skill : "ทักษะกินdd"
/// value : "39"
/// detail : "wine dd"

Skill skillFromJson(String str) => Skill.fromJson(json.decode(str));
String skillToJson(Skill data) => json.encode(data.toJson());
class Skill {
  Skill({
      int? id, 
      int? orderchoose, 
      String? skill, 
      String? value, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _skill = skill;
    _value = value;
    _detail = detail;
}

  Skill.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _skill = json['skill'];
    _value = json['value'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  String? _skill;
  String? _value;
  String? _detail;
Skill copyWith({  int? id,
  int? orderchoose,
  String? skill,
  String? value,
  String? detail,
}) => Skill(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  skill: skill ?? _skill,
  value: value ?? _value,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get skill => _skill;
  String? get value => _value;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['skill'] = _skill;
    map['value'] = _value;
    map['detail'] = _detail;
    return map;
  }

}

/// hsc : [{"id":4,"orderchoose":0,"startdate":"string","enddate":"string","type":"HSC","placeofstudy":"string","detail":"string"}]
/// bd : [{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}]
/// md : [{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"BD","placeofstudy":null,"detail":null}]
/// dd : [{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"DD","placeofstudy":null,"detail":null}]
/// hdd : [{"id":0,"orderchoose":0,"startdate":null,"enddate":null,"type":"HDD","placeofstudy":null,"detail":null}]

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

/// id : 0
/// orderchoose : 0
/// startdate : null
/// enddate : null
/// type : "HDD"
/// placeofstudy : null
/// detail : null

Hdd hddFromJson(String str) => Hdd.fromJson(json.decode(str));
String hddToJson(Hdd data) => json.encode(data.toJson());
class Hdd {
  Hdd({
      int? id, 
      int? orderchoose, 
      dynamic startdate, 
      dynamic enddate, 
      String? type, 
      dynamic placeofstudy, 
      dynamic detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Hdd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  dynamic _startdate;
  dynamic _enddate;
  String? _type;
  dynamic _placeofstudy;
  dynamic _detail;
Hdd copyWith({  int? id,
  int? orderchoose,
  dynamic startdate,
  dynamic enddate,
  String? type,
  dynamic placeofstudy,
  dynamic detail,
}) => Hdd(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  dynamic get startdate => _startdate;
  dynamic get enddate => _enddate;
  String? get type => _type;
  dynamic get placeofstudy => _placeofstudy;
  dynamic get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 0
/// orderchoose : 0
/// startdate : null
/// enddate : null
/// type : "DD"
/// placeofstudy : null
/// detail : null

Dd ddFromJson(String str) => Dd.fromJson(json.decode(str));
String ddToJson(Dd data) => json.encode(data.toJson());
class Dd {
  Dd({
      int? id, 
      int? orderchoose, 
      dynamic startdate, 
      dynamic enddate, 
      String? type, 
      dynamic placeofstudy, 
      dynamic detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Dd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  dynamic _startdate;
  dynamic _enddate;
  String? _type;
  dynamic _placeofstudy;
  dynamic _detail;
Dd copyWith({  int? id,
  int? orderchoose,
  dynamic startdate,
  dynamic enddate,
  String? type,
  dynamic placeofstudy,
  dynamic detail,
}) => Dd(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  dynamic get startdate => _startdate;
  dynamic get enddate => _enddate;
  String? get type => _type;
  dynamic get placeofstudy => _placeofstudy;
  dynamic get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 0
/// orderchoose : 0
/// startdate : null
/// enddate : null
/// type : "BD"
/// placeofstudy : null
/// detail : null

Md mdFromJson(String str) => Md.fromJson(json.decode(str));
String mdToJson(Md data) => json.encode(data.toJson());
class Md {
  Md({
      int? id, 
      int? orderchoose, 
      dynamic startdate, 
      dynamic enddate, 
      String? type, 
      dynamic placeofstudy, 
      dynamic detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Md.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  dynamic _startdate;
  dynamic _enddate;
  String? _type;
  dynamic _placeofstudy;
  dynamic _detail;
Md copyWith({  int? id,
  int? orderchoose,
  dynamic startdate,
  dynamic enddate,
  String? type,
  dynamic placeofstudy,
  dynamic detail,
}) => Md(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  dynamic get startdate => _startdate;
  dynamic get enddate => _enddate;
  String? get type => _type;
  dynamic get placeofstudy => _placeofstudy;
  dynamic get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 0
/// orderchoose : 0
/// startdate : null
/// enddate : null
/// type : "BD"
/// placeofstudy : null
/// detail : null

Bd bdFromJson(String str) => Bd.fromJson(json.decode(str));
String bdToJson(Bd data) => json.encode(data.toJson());
class Bd {
  Bd({
      int? id, 
      int? orderchoose, 
      dynamic startdate, 
      dynamic enddate, 
      String? type, 
      dynamic placeofstudy, 
      dynamic detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Bd.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  dynamic _startdate;
  dynamic _enddate;
  String? _type;
  dynamic _placeofstudy;
  dynamic _detail;
Bd copyWith({  int? id,
  int? orderchoose,
  dynamic startdate,
  dynamic enddate,
  String? type,
  dynamic placeofstudy,
  dynamic detail,
}) => Bd(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  dynamic get startdate => _startdate;
  dynamic get enddate => _enddate;
  String? get type => _type;
  dynamic get placeofstudy => _placeofstudy;
  dynamic get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 4
/// orderchoose : 0
/// startdate : "string"
/// enddate : "string"
/// type : "HSC"
/// placeofstudy : "string"
/// detail : "string"

Hsc hscFromJson(String str) => Hsc.fromJson(json.decode(str));
String hscToJson(Hsc data) => json.encode(data.toJson());
class Hsc {
  Hsc({
      int? id, 
      int? orderchoose, 
      String? startdate, 
      String? enddate, 
      String? type, 
      String? placeofstudy, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _type = type;
    _placeofstudy = placeofstudy;
    _detail = detail;
}

  Hsc.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _type = json['type'];
    _placeofstudy = json['placeofstudy'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  String? _startdate;
  String? _enddate;
  String? _type;
  String? _placeofstudy;
  String? _detail;
Hsc copyWith({  int? id,
  int? orderchoose,
  String? startdate,
  String? enddate,
  String? type,
  String? placeofstudy,
  String? detail,
}) => Hsc(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  type: type ?? _type,
  placeofstudy: placeofstudy ?? _placeofstudy,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get type => _type;
  String? get placeofstudy => _placeofstudy;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['type'] = _type;
    map['placeofstudy'] = _placeofstudy;
    map['detail'] = _detail;
    return map;
  }

}

/// id : 2
/// orderchoose : 5
/// startdate : "Jun 2015 "
/// enddate : "Jun 2018"
/// position : "วิศวกรรมซอฟต์แวร์99"
/// detail : "ฟรีวิลล์ โซลูชั่นส์ จํากัด99"

Experience experienceFromJson(String str) => Experience.fromJson(json.decode(str));
String experienceToJson(Experience data) => json.encode(data.toJson());
class Experience {
  Experience({
      int? id, 
      int? orderchoose, 
      String? startdate, 
      String? enddate, 
      String? position, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _startdate = startdate;
    _enddate = enddate;
    _position = position;
    _detail = detail;
}

  Experience.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _startdate = json['startdate'];
    _enddate = json['enddate'];
    _position = json['position'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  String? _startdate;
  String? _enddate;
  String? _position;
  String? _detail;
Experience copyWith({  int? id,
  int? orderchoose,
  String? startdate,
  String? enddate,
  String? position,
  String? detail,
}) => Experience(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  startdate: startdate ?? _startdate,
  enddate: enddate ?? _enddate,
  position: position ?? _position,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get startdate => _startdate;
  String? get enddate => _enddate;
  String? get position => _position;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['startdate'] = _startdate;
    map['enddate'] = _enddate;
    map['position'] = _position;
    map['detail'] = _detail;
    return map;
  }

}

/// number : "169"
/// moo : ""
/// soi : ""
/// road : "string"
/// subdistrict : "ลงหาดบางแสน แสนสุข"
/// district : "เมือง"
/// province : "ชลบุรี"
/// zipcode : "20131"

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
      String? zipcode,}){
    _number = number;
    _moo = moo;
    _soi = soi;
    _road = road;
    _subdistrict = subdistrict;
    _district = district;
    _province = province;
    _zipcode = zipcode;
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
  }
  String? _number;
  String? _moo;
  String? _soi;
  String? _road;
  String? _subdistrict;
  String? _district;
  String? _province;
  String? _zipcode;
Address copyWith({  String? number,
  String? moo,
  String? soi,
  String? road,
  String? subdistrict,
  String? district,
  String? province,
  String? zipcode,
}) => Address(  number: number ?? _number,
  moo: moo ?? _moo,
  soi: soi ?? _soi,
  road: road ?? _road,
  subdistrict: subdistrict ?? _subdistrict,
  district: district ?? _district,
  province: province ?? _province,
  zipcode: zipcode ?? _zipcode,
);
  String? get number => _number;
  String? get moo => _moo;
  String? get soi => _soi;
  String? get road => _road;
  String? get subdistrict => _subdistrict;
  String? get district => _district;
  String? get province => _province;
  String? get zipcode => _zipcode;

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
    return map;
  }

}

/// email : "emaill3"
/// phone : "phonel3"
/// facebook : "feacbookl3"
/// line : "@0930582335l3"
/// instagram : "instagraml3"
/// twitter : "twitterl3"
/// youtube : "you"

Personinfo personinfoFromJson(String str) => Personinfo.fromJson(json.decode(str));
String personinfoToJson(Personinfo data) => json.encode(data.toJson());
class Personinfo {
  Personinfo({
      String? email, 
      String? phone, 
      String? facebook, 
      String? line, 
      String? instagram, 
      String? twitter, 
      String? youtube,}){
    _email = email;
    _phone = phone;
    _facebook = facebook;
    _line = line;
    _instagram = instagram;
    _twitter = twitter;
    _youtube = youtube;
}

  Personinfo.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
    _facebook = json['facebook'];
    _line = json['line'];
    _instagram = json['instagram'];
    _twitter = json['twitter'];
    _youtube = json['youtube'];
  }
  String? _email;
  String? _phone;
  String? _facebook;
  String? _line;
  String? _instagram;
  String? _twitter;
  String? _youtube;
Personinfo copyWith({  String? email,
  String? phone,
  String? facebook,
  String? line,
  String? instagram,
  String? twitter,
  String? youtube,
}) => Personinfo(  email: email ?? _email,
  phone: phone ?? _phone,
  facebook: facebook ?? _facebook,
  line: line ?? _line,
  instagram: instagram ?? _instagram,
  twitter: twitter ?? _twitter,
  youtube: youtube ?? _youtube,
);
  String? get email => _email;
  String? get phone => _phone;
  String? get facebook => _facebook;
  String? get line => _line;
  String? get instagram => _instagram;
  String? get twitter => _twitter;
  String? get youtube => _youtube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['facebook'] = _facebook;
    map['line'] = _line;
    map['instagram'] = _instagram;
    map['twitter'] = _twitter;
    map['youtube'] = _youtube;
    return map;
  }

}

/// id : 4
/// orderchoose : 8
/// position : "พา"
/// office : "เช"
/// detail : "string"

Position positionFromJson(String str) => Position.fromJson(json.decode(str));
String positionToJson(Position data) => json.encode(data.toJson());
class Position {
  Position({
      int? id, 
      int? orderchoose, 
      String? position, 
      String? office, 
      String? detail,}){
    _id = id;
    _orderchoose = orderchoose;
    _position = position;
    _office = office;
    _detail = detail;
}

  Position.fromJson(dynamic json) {
    _id = json['id'];
    _orderchoose = json['orderchoose'];
    _position = json['position'];
    _office = json['office'];
    _detail = json['detail'];
  }
  int? _id;
  int? _orderchoose;
  String? _position;
  String? _office;
  String? _detail;
Position copyWith({  int? id,
  int? orderchoose,
  String? position,
  String? office,
  String? detail,
}) => Position(  id: id ?? _id,
  orderchoose: orderchoose ?? _orderchoose,
  position: position ?? _position,
  office: office ?? _office,
  detail: detail ?? _detail,
);
  int? get id => _id;
  int? get orderchoose => _orderchoose;
  String? get position => _position;
  String? get office => _office;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['orderchoose'] = _orderchoose;
    map['position'] = _position;
    map['office'] = _office;
    map['detail'] = _detail;
    return map;
  }

}

/// prefixid : "P1"
/// prefix : "นาง"
/// name : "ธาราดล"
/// lastname : "ชินโน"

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
/// number : "ตัวเลข"
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

ScreenInfo screenInfoFromJson(String str) => ScreenInfo.fromJson(json.decode(str));
String screenInfoToJson(ScreenInfo data) => json.encode(data.toJson());
class ScreenInfo {
  ScreenInfo({
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
      String? youtube,}){
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
}

  ScreenInfo.fromJson(dynamic json) {
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
ScreenInfo copyWith({  String? aboutme,
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
}) => ScreenInfo(  aboutme: aboutme ?? _aboutme,
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