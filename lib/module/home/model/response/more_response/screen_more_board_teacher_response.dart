import 'dart:convert';

ScreenMoreBoardTeacherResponse screenMoreBoardTeacherResponseFromJson(String str) =>
    ScreenMoreBoardTeacherResponse.fromJson(json.decode(str));
String screenMoreBoardTeacherResponseToJson(ScreenMoreBoardTeacherResponse data) => json.encode(data.toJson());

class ScreenMoreBoardTeacherResponse {
  ScreenMoreBoardTeacherResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreBoardTeacherResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreBoardTeacherResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreBoardTeacherResponse(
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

/// screeninfo : {"titileboardpersonal":"ทำเนียบบุคลากร","textmath":"คณิตศาสตร์","textstats":"สถิติ","textadvisor":"อาจารย์","textacademicstaff":"เจ้าหน้าที่","textname":"ชื่อ","textpositon":"ตำแหน่ง","texttel":"โทร","textemail":"อีเมล","textgotoweb":"ไปยังเว็บไซต์"}
/// teacher : {"teachermath":[{"name":"อภิสิทธิ์","lastname":"ภคพงศ์พันธุ์","position":"รองศาสตราจารย์ ดร.","phone":"038103038","email":"apisit.buu@gmail.com","img":"666666","website":"https://sites.google.com/go.buu.ac.th/apisitp"},{"name":"ดวงกมล","lastname":"ผลเต็ม","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103099","email":"duangkamolp@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/duangkamolp"},{"name":"เดชชาติ","lastname":"สามารถ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103046","email":"detchat.sa@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/detchats"},{"name":"ชาติไทย","lastname":"ไทยประยูร","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103038","email":"chatthai@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/chatthait"},{"name":"บุญยงค์","lastname":"ศรีพลแผ้ว","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103048","email":"boonyong@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/sboonyong"},{"name":"รักพร","lastname":"ดอกจันทร์","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103047","email":"rakporn@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/rakpornd"},{"name":"วรวิมล","lastname":"เจริญทัมมะสถิต","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103049","email":"ankana@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/worrawimolc"},{"name":"วริน","lastname":"วิพิศมากูล","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103037","email":"wasinv@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/warinv"},{"name":"สมคิด","lastname":"อินเทพ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103176","email":"intep@buu.ac.th","img":"666666","website":"-"},{"name":"สหัทยา","lastname":"รัตนะมงคลกุล","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103099","email":"sahattay@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/sahattayar"},{"name":"สาธินี","lastname":"เลิศประไพ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103099","email":"satineel@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/satineelertprapai"},{"name":"สินีนาฏ","lastname":"ศรีมงคล","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103176","email":"sineenart@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/sineenarts"},{"name":"เสาวรส","lastname":"ศรีสุข","position":"ผู้ช่วยศาสตราจารย์","phone":"038103046","email":"saowaros@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/saowaros"},{"name":"อรรณพ","lastname":"แก้วขาว","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103036","email":"tor_idin@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/annopkaewkhao"},{"name":"อารยา","lastname":"วิวัฒน์วานิช","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103176","email":"arayawi@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/arayaw"},{"name":"อารีรักษ์","lastname":"ชัยวร","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103047","email":"areerak@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/areerak"},{"name":"จุฑารัตน์","lastname":"คงสอน","position":"อาจารย์ ดร.","phone":"038103037","email":"jutarat_k@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/jutaratk"},{"name":"บัณฑิตา","lastname":"ฉัตรเท","position":"อาจารย์ ดร.","phone":"038103048","email":"bunthita@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/bunthita"},{"name":"ปรียานุช","lastname":"เชื้อสุข","position":"อาจารย์ ดร.","phone":"038103048","email":"preeyanuch.ch@buu.ac.th","img":"666666","website":"-"},{"name":"พัชรวดี","lastname":"พูลสำราญ","position":"อาจารย์ ดร.","phone":"038103048","email":"patcharp@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/poolsamran"},{"name":"ภคินกร","lastname":"พูนพายัพ","position":"อาจารย์ ดร.","phone":"038103099","email":"phakhinkon.ph@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/phakhinkonp"},{"name":"ลี","lastname":"ศาสนพิทักษ์","position":"อาจารย์ ดร.","phone":"038103037","email":"Lee.sa@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/leesass"}],"teacherstats":[{"name":"กิดาการ","lastname":"สายธนู","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103080","email":"ksaithan@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/kidakans"},{"name":"คณินทร์","lastname":"ธีรภาพโอฬาร","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103049","email":"kanint@buu.ac.th","img":"666666","website":"http://dbsrv.lib.buu.ac.th/epfolionew/?p=148"},{"name":"จตุภัทร","lastname":"เมฆพายัพ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103080","email":"jatupat@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/jatupatm"},{"name":"บำรุงศักดิ์","lastname":"เผื่อนอารีย์","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103081","email":"bumrungsak@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/bumrungsak"},{"name":"ปรียารัตน์","lastname":"นาคสุวรรณ์","position":"ผู้ช่วยศาสตราจารย์","phone":"038103080","email":"preeyarat@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/preeyaratn"},{"name":"พัชรี","lastname":"วงษ์เกษม","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103049","email":"patchareewongkasem@yahoo.com","img":"666666","website":"http://dbsrv.lib.buu.ac.th/epfolionew/?p=1163"},{"name":"วนิดา","lastname":"พงษ์ศักดิ์ชาติ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103046","email":"vanida@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/vanida-p"},{"name":"อภิศักดิ์","lastname":"ไชยโรจน์วัฒนา","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103047","email":"apisak@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/apisakc"},{"name":"นพรัตน์","lastname":"แป้นงาม","position":"อาจารย์","phone":"038103038","email":"noparatk@buu.ac.th","img":"666666","website":"-"},{"name":"ภัทราภรณ์","lastname":"กิจผลเจริญ","position":"อาจารย์","phone":"038103036","email":"pattara@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/pattarapornk"},{"name":"ลภัสรดา","lastname":"สิงห์สมบูรณ์","position":"อาจารย์ ดร.","phone":"038103036","email":"lapasrada.si@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/lapasradas"}]}
/// staff : [{"name":"รศ. ดร.อภิสิทธิ์","lastname":"ภคพงศ์พันธุ์","position":"หัวหน้าภาควิชาา","phone":"038103038","email":"apisit.buu@gmail.com","img":"666666"},{"name":"คุณ กฤติกา","lastname":"วัฒนพันธุ์","position":"เจ้าหน้าที่ธุรการร","phone":"038103078","email":"krittika@buu.ac.th","img":"666666"},{"name":"คุณ ศุภกฤต","lastname":"นาวิน","position":"เจ้าหน้าที่ห้องปฎิบัติการ","phone":"038103078","email":"supakit@buu.ac.th","img":"666666"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    Teacher? teacher,
    List<Staff>? staff,
  }) {
    _screeninfo = screeninfo;
    _teacher = teacher;
    _staff = staff;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _teacher = json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    if (json['staff'] != null) {
      _staff = [];
      json['staff'].forEach((v) {
        _staff?.add(Staff.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  Teacher? _teacher;
  List<Staff>? _staff;
  Body copyWith({
    Screeninfo? screeninfo,
    Teacher? teacher,
    List<Staff>? staff,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        teacher: teacher ?? _teacher,
        staff: staff ?? _staff,
      );
  Screeninfo? get screeninfo => _screeninfo;
  Teacher? get teacher => _teacher;
  List<Staff>? get staff => _staff;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_teacher != null) {
      map['teacher'] = _teacher?.toJson();
    }
    if (_staff != null) {
      map['staff'] = _staff?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "รศ. ดร.อภิสิทธิ์"
/// lastname : "ภคพงศ์พันธุ์"
/// position : "หัวหน้าภาควิชาา"
/// phone : "038103038"
/// email : "apisit.buu@gmail.com"
/// img : "666666"

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));
String staffToJson(Staff data) => json.encode(data.toJson());

class Staff {
  Staff({
    String? name,
    String? lastname,
    String? position,
    String? phone,
    String? email,
    String? img,
  }) {
    _name = name;
    _lastname = lastname;
    _position = position;
    _phone = phone;
    _email = email;
    _img = img;
  }

  Staff.fromJson(dynamic json) {
    _name = json['name'];
    _lastname = json['lastname'];
    _position = json['position'];
    _phone = json['phone'];
    _email = json['email'];
    _img = json['img'];
  }
  String? _name;
  String? _lastname;
  String? _position;
  String? _phone;
  String? _email;
  String? _img;
  Staff copyWith({
    String? name,
    String? lastname,
    String? position,
    String? phone,
    String? email,
    String? img,
  }) =>
      Staff(
        name: name ?? _name,
        lastname: lastname ?? _lastname,
        position: position ?? _position,
        phone: phone ?? _phone,
        email: email ?? _email,
        img: img ?? _img,
      );
  String? get name => _name;
  String? get lastname => _lastname;
  String? get position => _position;
  String? get phone => _phone;
  String? get email => _email;
  String? get img => _img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['lastname'] = _lastname;
    map['position'] = _position;
    map['phone'] = _phone;
    map['email'] = _email;
    map['img'] = _img;
    return map;
  }
}

/// teachermath : [{"name":"อภิสิทธิ์","lastname":"ภคพงศ์พันธุ์","position":"รองศาสตราจารย์ ดร.","phone":"038103038","email":"apisit.buu@gmail.com","img":"666666","website":"https://sites.google.com/go.buu.ac.th/apisitp"},{"name":"ดวงกมล","lastname":"ผลเต็ม","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103099","email":"duangkamolp@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/duangkamolp"},{"name":"เดชชาติ","lastname":"สามารถ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103046","email":"detchat.sa@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/detchats"},{"name":"ชาติไทย","lastname":"ไทยประยูร","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103038","email":"chatthai@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/chatthait"},{"name":"บุญยงค์","lastname":"ศรีพลแผ้ว","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103048","email":"boonyong@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/sboonyong"},{"name":"รักพร","lastname":"ดอกจันทร์","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103047","email":"rakporn@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/rakpornd"},{"name":"วรวิมล","lastname":"เจริญทัมมะสถิต","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103049","email":"ankana@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/worrawimolc"},{"name":"วริน","lastname":"วิพิศมากูล","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103037","email":"wasinv@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/warinv"},{"name":"สมคิด","lastname":"อินเทพ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103176","email":"intep@buu.ac.th","img":"666666","website":"-"},{"name":"สหัทยา","lastname":"รัตนะมงคลกุล","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103099","email":"sahattay@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/sahattayar"},{"name":"สาธินี","lastname":"เลิศประไพ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103099","email":"satineel@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/satineelertprapai"},{"name":"สินีนาฏ","lastname":"ศรีมงคล","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103176","email":"sineenart@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/sineenarts"},{"name":"เสาวรส","lastname":"ศรีสุข","position":"ผู้ช่วยศาสตราจารย์","phone":"038103046","email":"saowaros@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/saowaros"},{"name":"อรรณพ","lastname":"แก้วขาว","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103036","email":"tor_idin@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/annopkaewkhao"},{"name":"อารยา","lastname":"วิวัฒน์วานิช","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103176","email":"arayawi@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/arayaw"},{"name":"อารีรักษ์","lastname":"ชัยวร","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103047","email":"areerak@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/areerak"},{"name":"จุฑารัตน์","lastname":"คงสอน","position":"อาจารย์ ดร.","phone":"038103037","email":"jutarat_k@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/jutaratk"},{"name":"บัณฑิตา","lastname":"ฉัตรเท","position":"อาจารย์ ดร.","phone":"038103048","email":"bunthita@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/bunthita"},{"name":"ปรียานุช","lastname":"เชื้อสุข","position":"อาจารย์ ดร.","phone":"038103048","email":"preeyanuch.ch@buu.ac.th","img":"666666","website":"-"},{"name":"พัชรวดี","lastname":"พูลสำราญ","position":"อาจารย์ ดร.","phone":"038103048","email":"patcharp@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/poolsamran"},{"name":"ภคินกร","lastname":"พูนพายัพ","position":"อาจารย์ ดร.","phone":"038103099","email":"phakhinkon.ph@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/phakhinkonp"},{"name":"ลี","lastname":"ศาสนพิทักษ์","position":"อาจารย์ ดร.","phone":"038103037","email":"Lee.sa@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/leesass"}]
/// teacherstats : [{"name":"กิดาการ","lastname":"สายธนู","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103080","email":"ksaithan@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/kidakans"},{"name":"คณินทร์","lastname":"ธีรภาพโอฬาร","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103049","email":"kanint@buu.ac.th","img":"666666","website":"http://dbsrv.lib.buu.ac.th/epfolionew/?p=148"},{"name":"จตุภัทร","lastname":"เมฆพายัพ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103080","email":"jatupat@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/jatupatm"},{"name":"บำรุงศักดิ์","lastname":"เผื่อนอารีย์","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103081","email":"bumrungsak@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/bumrungsak"},{"name":"ปรียารัตน์","lastname":"นาคสุวรรณ์","position":"ผู้ช่วยศาสตราจารย์","phone":"038103080","email":"preeyarat@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/preeyaratn"},{"name":"พัชรี","lastname":"วงษ์เกษม","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103049","email":"patchareewongkasem@yahoo.com","img":"666666","website":"http://dbsrv.lib.buu.ac.th/epfolionew/?p=1163"},{"name":"วนิดา","lastname":"พงษ์ศักดิ์ชาติ","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103046","email":"vanida@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/vanida-p"},{"name":"อภิศักดิ์","lastname":"ไชยโรจน์วัฒนา","position":"ผู้ช่วยศาสตราจารย์ ดร.","phone":"038103047","email":"apisak@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/apisakc"},{"name":"นพรัตน์","lastname":"แป้นงาม","position":"อาจารย์","phone":"038103038","email":"noparatk@buu.ac.th","img":"666666","website":"-"},{"name":"ภัทราภรณ์","lastname":"กิจผลเจริญ","position":"อาจารย์","phone":"038103036","email":"pattara@go.buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/pattarapornk"},{"name":"ลภัสรดา","lastname":"สิงห์สมบูรณ์","position":"อาจารย์ ดร.","phone":"038103036","email":"lapasrada.si@buu.ac.th","img":"666666","website":"https://sites.google.com/go.buu.ac.th/lapasradas"}]

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));
String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  Teacher({
    List<Teachermath>? teachermath,
    List<Teacherstats>? teacherstats,
  }) {
    _teachermath = teachermath;
    _teacherstats = teacherstats;
  }

  Teacher.fromJson(dynamic json) {
    if (json['teachermath'] != null) {
      _teachermath = [];
      json['teachermath'].forEach((v) {
        _teachermath?.add(Teachermath.fromJson(v));
      });
    }
    if (json['teacherstats'] != null) {
      _teacherstats = [];
      json['teacherstats'].forEach((v) {
        _teacherstats?.add(Teacherstats.fromJson(v));
      });
    }
  }
  List<Teachermath>? _teachermath;
  List<Teacherstats>? _teacherstats;
  Teacher copyWith({
    List<Teachermath>? teachermath,
    List<Teacherstats>? teacherstats,
  }) =>
      Teacher(
        teachermath: teachermath ?? _teachermath,
        teacherstats: teacherstats ?? _teacherstats,
      );
  List<Teachermath>? get teachermath => _teachermath;
  List<Teacherstats>? get teacherstats => _teacherstats;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_teachermath != null) {
      map['teachermath'] = _teachermath?.map((v) => v.toJson()).toList();
    }
    if (_teacherstats != null) {
      map['teacherstats'] = _teacherstats?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "กิดาการ"
/// lastname : "สายธนู"
/// position : "ผู้ช่วยศาสตราจารย์ ดร."
/// phone : "038103080"
/// email : "ksaithan@buu.ac.th"
/// img : "666666"
/// website : "https://sites.google.com/go.buu.ac.th/kidakans"

Teacherstats teacherstatsFromJson(String str) => Teacherstats.fromJson(json.decode(str));
String teacherstatsToJson(Teacherstats data) => json.encode(data.toJson());

class Teacherstats {
  Teacherstats({
    String? name,
    String? lastname,
    String? position,
    String? phone,
    String? email,
    String? img,
    String? website,
  }) {
    _name = name;
    _lastname = lastname;
    _position = position;
    _phone = phone;
    _email = email;
    _img = img;
    _website = website;
  }

  Teacherstats.fromJson(dynamic json) {
    _name = json['name'];
    _lastname = json['lastname'];
    _position = json['position'];
    _phone = json['phone'];
    _email = json['email'];
    _img = json['img'];
    _website = json['website'];
  }
  String? _name;
  String? _lastname;
  String? _position;
  String? _phone;
  String? _email;
  String? _img;
  String? _website;
  Teacherstats copyWith({
    String? name,
    String? lastname,
    String? position,
    String? phone,
    String? email,
    String? img,
    String? website,
  }) =>
      Teacherstats(
        name: name ?? _name,
        lastname: lastname ?? _lastname,
        position: position ?? _position,
        phone: phone ?? _phone,
        email: email ?? _email,
        img: img ?? _img,
        website: website ?? _website,
      );
  String? get name => _name;
  String? get lastname => _lastname;
  String? get position => _position;
  String? get phone => _phone;
  String? get email => _email;
  String? get img => _img;
  String? get website => _website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['lastname'] = _lastname;
    map['position'] = _position;
    map['phone'] = _phone;
    map['email'] = _email;
    map['img'] = _img;
    map['website'] = _website;
    return map;
  }
}

/// name : "อภิสิทธิ์"
/// lastname : "ภคพงศ์พันธุ์"
/// position : "รองศาสตราจารย์ ดร."
/// phone : "038103038"
/// email : "apisit.buu@gmail.com"
/// img : "666666"
/// website : "https://sites.google.com/go.buu.ac.th/apisitp"

Teachermath teachermathFromJson(String str) => Teachermath.fromJson(json.decode(str));
String teachermathToJson(Teachermath data) => json.encode(data.toJson());

class Teachermath {
  Teachermath({
    String? name,
    String? lastname,
    String? position,
    String? phone,
    String? email,
    String? img,
    String? website,
  }) {
    _name = name;
    _lastname = lastname;
    _position = position;
    _phone = phone;
    _email = email;
    _img = img;
    _website = website;
  }

  Teachermath.fromJson(dynamic json) {
    _name = json['name'];
    _lastname = json['lastname'];
    _position = json['position'];
    _phone = json['phone'];
    _email = json['email'];
    _img = json['img'];
    _website = json['website'];
  }
  String? _name;
  String? _lastname;
  String? _position;
  String? _phone;
  String? _email;
  String? _img;
  String? _website;
  Teachermath copyWith({
    String? name,
    String? lastname,
    String? position,
    String? phone,
    String? email,
    String? img,
    String? website,
  }) =>
      Teachermath(
        name: name ?? _name,
        lastname: lastname ?? _lastname,
        position: position ?? _position,
        phone: phone ?? _phone,
        email: email ?? _email,
        img: img ?? _img,
        website: website ?? _website,
      );
  String? get name => _name;
  String? get lastname => _lastname;
  String? get position => _position;
  String? get phone => _phone;
  String? get email => _email;
  String? get img => _img;
  String? get website => _website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['lastname'] = _lastname;
    map['position'] = _position;
    map['phone'] = _phone;
    map['email'] = _email;
    map['img'] = _img;
    map['website'] = _website;
    return map;
  }
}

/// titileboardpersonal : "ทำเนียบบุคลากร"
/// textmath : "คณิตศาสตร์"
/// textstats : "สถิติ"
/// textadvisor : "อาจารย์"
/// textacademicstaff : "เจ้าหน้าที่"
/// textname : "ชื่อ"
/// textpositon : "ตำแหน่ง"
/// texttel : "โทร"
/// textemail : "อีเมล"
/// textgotoweb : "ไปยังเว็บไซต์"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titileboardpersonal,
    String? textmath,
    String? textstats,
    String? textadvisor,
    String? textacademicstaff,
    String? textname,
    String? textpositon,
    String? texttel,
    String? textemail,
    String? textgotoweb,
  }) {
    _titileboardpersonal = titileboardpersonal;
    _textmath = textmath;
    _textstats = textstats;
    _textadvisor = textadvisor;
    _textacademicstaff = textacademicstaff;
    _textname = textname;
    _textpositon = textpositon;
    _texttel = texttel;
    _textemail = textemail;
    _textgotoweb = textgotoweb;
  }

  Screeninfo.fromJson(dynamic json) {
    _titileboardpersonal = json['titileboardpersonal'];
    _textmath = json['textmath'];
    _textstats = json['textstats'];
    _textadvisor = json['textadvisor'];
    _textacademicstaff = json['textacademicstaff'];
    _textname = json['textname'];
    _textpositon = json['textpositon'];
    _texttel = json['texttel'];
    _textemail = json['textemail'];
    _textgotoweb = json['textgotoweb'];
  }
  String? _titileboardpersonal;
  String? _textmath;
  String? _textstats;
  String? _textadvisor;
  String? _textacademicstaff;
  String? _textname;
  String? _textpositon;
  String? _texttel;
  String? _textemail;
  String? _textgotoweb;
  Screeninfo copyWith({
    String? titileboardpersonal,
    String? textmath,
    String? textstats,
    String? textadvisor,
    String? textacademicstaff,
    String? textname,
    String? textpositon,
    String? texttel,
    String? textemail,
    String? textgotoweb,
  }) =>
      Screeninfo(
        titileboardpersonal: titileboardpersonal ?? _titileboardpersonal,
        textmath: textmath ?? _textmath,
        textstats: textstats ?? _textstats,
        textadvisor: textadvisor ?? _textadvisor,
        textacademicstaff: textacademicstaff ?? _textacademicstaff,
        textname: textname ?? _textname,
        textpositon: textpositon ?? _textpositon,
        texttel: texttel ?? _texttel,
        textemail: textemail ?? _textemail,
        textgotoweb: textgotoweb ?? _textgotoweb,
      );
  String? get titileboardpersonal => _titileboardpersonal;
  String? get textmath => _textmath;
  String? get textstats => _textstats;
  String? get textadvisor => _textadvisor;
  String? get textacademicstaff => _textacademicstaff;
  String? get textname => _textname;
  String? get textpositon => _textpositon;
  String? get texttel => _texttel;
  String? get textemail => _textemail;
  String? get textgotoweb => _textgotoweb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titileboardpersonal'] = _titileboardpersonal;
    map['textmath'] = _textmath;
    map['textstats'] = _textstats;
    map['textadvisor'] = _textadvisor;
    map['textacademicstaff'] = _textacademicstaff;
    map['textname'] = _textname;
    map['textpositon'] = _textpositon;
    map['texttel'] = _texttel;
    map['textemail'] = _textemail;
    map['textgotoweb'] = _textgotoweb;
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