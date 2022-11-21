import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"home"}
/// body : {"screeninfo":{"titleboardnisit":"Board of Student"},"user_gen":{"namegen":"กรีนทีมัทฉะลาเต้","colorgen":"#6BCB77","numgen":"65"},"list_gen":[{"namegen":"อำพันรัตติกาล","colorgen":"#FFD93D","numgen":"66"},{"namegen":"กรีนทีมัทฉะลาเต้","colorgen":"#6BCB77","numgen":"65"},{"namegen":"ธารไพลิน เมฆินปัณฑูร","colorgen":"#4D96FF","numgen":"64"},{"namegen":"ทินกรซ้อนเมฆา","colorgen":"#FF6B6B","numgen":"63"},{"namegen":"รัตติกาลสานตะวัน","colorgen":"#FFD93D","numgen":"62"},{"namegen":"อินทร์อัศนีฤทธิ์จักรกฤษณ์มรกต","colorgen":"#6BCB77","numgen":"61"},{"namegen":"รัตนภูวดินทร์","colorgen":"#4D96FF","numgen":"60"},{"namegen":"สตรอเบอร์รี่ ซันเดย์","colorgen":"#FF6B6B","numgen":"59"},{"namegen":"บูรพธุวดารา","colorgen":"#FFD93D","numgen":"58"},{"namegen":"พัชรนิลปัทม์","colorgen":"#6BCB77","numgen":"57"},{"namegen":"มุกรัตน์ธารา","colorgen":"#4D96FF","numgen":"56"},{"namegen":"กษิรชาด","colorgen":"#FF6B6B","numgen":"55"},{"namegen":"กิตติกวินประภัสศิลป์มธุกร","colorgen":"#FFD93D","numgen":"54"},{"namegen":"นาคินบดินทร์ขจรกลิ่น","colorgen":"#6BCB77","numgen":"53"},{"namegen":"บูรไพลิน หัสดินทร์นราธิป","colorgen":"#4D96FF","numgen":"52"},{"namegen":"รังสิมารุจี นทีคุณารักษ์","colorgen":"#FF6B6B","numgen":"51"},{"namegen":"ทศวชิรชลธี","colorgen":"#FFD93D","numgen":"50"},{"namegen":"วนพิชญภากร","colorgen":"#6BCB77","numgen":"49"},{"namegen":"กาญจนกันทร","colorgen":"#4D96FF","numgen":"48"},{"namegen":"วริช ชโลทร","colorgen":"#FF6B6B","numgen":"47"},{"namegen":"สัตตนิลบุษย์","colorgen":"#FFD93D","numgen":"46"},{"namegen":"นรินทราทิตย์","colorgen":"#6BCB77","numgen":"45"},{"namegen":"วิลินกร","colorgen":"#4D96FF","numgen":"44"},{"namegen":"เศวตชาดชลทิศ","colorgen":"#FF6B6B","numgen":"43"},{"namegen":"เอกภัทร์ภุมรินทร์","colorgen":"#FFD93D","numgen":"42"},{"namegen":"ธีรวรการ","colorgen":"#6BCB77","numgen":"41"},{"namegen":"สัตประพัทธ์","colorgen":"#4D96FF","numgen":"40"},{"namegen":"กฤติกา","colorgen":"#FF6B6B","numgen":"39"},{"namegen":"เก็จทรายแก้ว","colorgen":"#FFD93D","numgen":"38"},{"namegen":"เคนกรี","colorgen":"#6BCB77","numgen":"37"},{"namegen":"อติทีน","colorgen":"#4D96FF","numgen":"36"},{"namegen":"ณัลลกัณฑ์","colorgen":"#FF6B6B","numgen":"35"},{"namegen":"พิหเคนทร์","colorgen":"#FFD93D","numgen":"34"},{"namegen":"ทวิชากร","colorgen":"#6BCB77","numgen":"33"},{"namegen":"มธุกร","colorgen":"#4D96FF","numgen":"32"},{"namegen":"นเคศวร","colorgen":"#FF6B6B","numgen":"31"},{"namegen":"ศฤคาล","colorgen":"#FFD93D","numgen":"30"},{"namegen":"ชฎายุ","colorgen":"#6BCB77","numgen":"29"},{"namegen":"ภุมรินทร์","colorgen":"#4D96FF","numgen":"28"},{"namegen":"พณิณธร","colorgen":"#FF6B6B","numgen":"27"},{"namegen":"มฤคมาศ","colorgen":"#FFD93D","numgen":"26"},{"namegen":"ตฤณสีห์","colorgen":"#6BCB77","numgen":"25"},{"namegen":"เหมราช","colorgen":"#4D96FF","numgen":"24"},{"namegen":"ฉัททันต์","colorgen":"#FF6B6B","numgen":"23"},{"namegen":"บัวขาว","colorgen":"#FFD93D","numgen":"22"},{"namegen":"กรกฎ","colorgen":"#6BCB77","numgen":"21"},{"namegen":"นางนวล","colorgen":"#4D96FF","numgen":"20"},{"namegen":"จามรี","colorgen":"#FF6B6B","numgen":"19"},{"namegen":"เสือดาว","colorgen":"#FFD93D","numgen":"18"},{"namegen":"หงส์ขาว","colorgen":"#6BCB77","numgen":"17"},{"namegen":"พิราบขาว","colorgen":"#4D96FF","numgen":"16"},{"namegen":"เห่าไฟ","colorgen":"#FF6B6B","numgen":"15"},{"namegen":"กระทิงดำ","colorgen":"#FFD93D","numgen":"14"},{"namegen":"เอราวัณ","colorgen":"#6BCB77","numgen":"13"},{"namegen":"ยูงทอง","colorgen":"#4D96FF","numgen":"12"},{"namegen":"จงอางขาว","colorgen":"#FF6B6B","numgen":"11"},{"namegen":"พยัคฆราช","colorgen":"#FFD93D","numgen":"10"},{"namegen":"อินทรีผงาด","colorgen":"#6BCB77","numgen":"9"},{"namegen":"สิงห์ผยอง","colorgen":"#4D96FF","numgen":"8"},{"namegen":"ผึ้งหลวง","colorgen":"#FF6B6B","numgen":"7"},{"namegen":"มดทอง","colorgen":"#FFD93D","numgen":"6"},{"namegen":"ฉลามขาว","colorgen":"#6BCB77","numgen":"5"},{"namegen":"ช้างเผือก","colorgen":"#4D96FF","numgen":"4"},{"namegen":"อรชร","colorgen":"#FF6B6B","numgen":"3"},{"namegen":"ศรอนงค์","colorgen":"#FFD93D","numgen":"2"},{"namegen":"ม้าสีหมอก","colorgen":"#8B8B8B","numgen":"1"}]}

ScreenMoreListNameGenResponse screenMoreListNameGenResponseFromJson(String str) =>
    ScreenMoreListNameGenResponse.fromJson(json.decode(str));
String screenMoreListNameGenResponseToJson(ScreenMoreListNameGenResponse data) => json.encode(data.toJson());

class ScreenMoreListNameGenResponse {
  ScreenMoreListNameGenResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreListNameGenResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreListNameGenResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreListNameGenResponse(
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

/// screeninfo : {"titleboardnisit":"Board of Student"}
/// user_gen : {"namegen":"กรีนทีมัทฉะลาเต้","colorgen":"#6BCB77","numgen":"65"}
/// list_gen : [{"namegen":"อำพันรัตติกาล","colorgen":"#FFD93D","numgen":"66"},{"namegen":"กรีนทีมัทฉะลาเต้","colorgen":"#6BCB77","numgen":"65"},{"namegen":"ธารไพลิน เมฆินปัณฑูร","colorgen":"#4D96FF","numgen":"64"},{"namegen":"ทินกรซ้อนเมฆา","colorgen":"#FF6B6B","numgen":"63"},{"namegen":"รัตติกาลสานตะวัน","colorgen":"#FFD93D","numgen":"62"},{"namegen":"อินทร์อัศนีฤทธิ์จักรกฤษณ์มรกต","colorgen":"#6BCB77","numgen":"61"},{"namegen":"รัตนภูวดินทร์","colorgen":"#4D96FF","numgen":"60"},{"namegen":"สตรอเบอร์รี่ ซันเดย์","colorgen":"#FF6B6B","numgen":"59"},{"namegen":"บูรพธุวดารา","colorgen":"#FFD93D","numgen":"58"},{"namegen":"พัชรนิลปัทม์","colorgen":"#6BCB77","numgen":"57"},{"namegen":"มุกรัตน์ธารา","colorgen":"#4D96FF","numgen":"56"},{"namegen":"กษิรชาด","colorgen":"#FF6B6B","numgen":"55"},{"namegen":"กิตติกวินประภัสศิลป์มธุกร","colorgen":"#FFD93D","numgen":"54"},{"namegen":"นาคินบดินทร์ขจรกลิ่น","colorgen":"#6BCB77","numgen":"53"},{"namegen":"บูรไพลิน หัสดินทร์นราธิป","colorgen":"#4D96FF","numgen":"52"},{"namegen":"รังสิมารุจี นทีคุณารักษ์","colorgen":"#FF6B6B","numgen":"51"},{"namegen":"ทศวชิรชลธี","colorgen":"#FFD93D","numgen":"50"},{"namegen":"วนพิชญภากร","colorgen":"#6BCB77","numgen":"49"},{"namegen":"กาญจนกันทร","colorgen":"#4D96FF","numgen":"48"},{"namegen":"วริช ชโลทร","colorgen":"#FF6B6B","numgen":"47"},{"namegen":"สัตตนิลบุษย์","colorgen":"#FFD93D","numgen":"46"},{"namegen":"นรินทราทิตย์","colorgen":"#6BCB77","numgen":"45"},{"namegen":"วิลินกร","colorgen":"#4D96FF","numgen":"44"},{"namegen":"เศวตชาดชลทิศ","colorgen":"#FF6B6B","numgen":"43"},{"namegen":"เอกภัทร์ภุมรินทร์","colorgen":"#FFD93D","numgen":"42"},{"namegen":"ธีรวรการ","colorgen":"#6BCB77","numgen":"41"},{"namegen":"สัตประพัทธ์","colorgen":"#4D96FF","numgen":"40"},{"namegen":"กฤติกา","colorgen":"#FF6B6B","numgen":"39"},{"namegen":"เก็จทรายแก้ว","colorgen":"#FFD93D","numgen":"38"},{"namegen":"เคนกรี","colorgen":"#6BCB77","numgen":"37"},{"namegen":"อติทีน","colorgen":"#4D96FF","numgen":"36"},{"namegen":"ณัลลกัณฑ์","colorgen":"#FF6B6B","numgen":"35"},{"namegen":"พิหเคนทร์","colorgen":"#FFD93D","numgen":"34"},{"namegen":"ทวิชากร","colorgen":"#6BCB77","numgen":"33"},{"namegen":"มธุกร","colorgen":"#4D96FF","numgen":"32"},{"namegen":"นเคศวร","colorgen":"#FF6B6B","numgen":"31"},{"namegen":"ศฤคาล","colorgen":"#FFD93D","numgen":"30"},{"namegen":"ชฎายุ","colorgen":"#6BCB77","numgen":"29"},{"namegen":"ภุมรินทร์","colorgen":"#4D96FF","numgen":"28"},{"namegen":"พณิณธร","colorgen":"#FF6B6B","numgen":"27"},{"namegen":"มฤคมาศ","colorgen":"#FFD93D","numgen":"26"},{"namegen":"ตฤณสีห์","colorgen":"#6BCB77","numgen":"25"},{"namegen":"เหมราช","colorgen":"#4D96FF","numgen":"24"},{"namegen":"ฉัททันต์","colorgen":"#FF6B6B","numgen":"23"},{"namegen":"บัวขาว","colorgen":"#FFD93D","numgen":"22"},{"namegen":"กรกฎ","colorgen":"#6BCB77","numgen":"21"},{"namegen":"นางนวล","colorgen":"#4D96FF","numgen":"20"},{"namegen":"จามรี","colorgen":"#FF6B6B","numgen":"19"},{"namegen":"เสือดาว","colorgen":"#FFD93D","numgen":"18"},{"namegen":"หงส์ขาว","colorgen":"#6BCB77","numgen":"17"},{"namegen":"พิราบขาว","colorgen":"#4D96FF","numgen":"16"},{"namegen":"เห่าไฟ","colorgen":"#FF6B6B","numgen":"15"},{"namegen":"กระทิงดำ","colorgen":"#FFD93D","numgen":"14"},{"namegen":"เอราวัณ","colorgen":"#6BCB77","numgen":"13"},{"namegen":"ยูงทอง","colorgen":"#4D96FF","numgen":"12"},{"namegen":"จงอางขาว","colorgen":"#FF6B6B","numgen":"11"},{"namegen":"พยัคฆราช","colorgen":"#FFD93D","numgen":"10"},{"namegen":"อินทรีผงาด","colorgen":"#6BCB77","numgen":"9"},{"namegen":"สิงห์ผยอง","colorgen":"#4D96FF","numgen":"8"},{"namegen":"ผึ้งหลวง","colorgen":"#FF6B6B","numgen":"7"},{"namegen":"มดทอง","colorgen":"#FFD93D","numgen":"6"},{"namegen":"ฉลามขาว","colorgen":"#6BCB77","numgen":"5"},{"namegen":"ช้างเผือก","colorgen":"#4D96FF","numgen":"4"},{"namegen":"อรชร","colorgen":"#FF6B6B","numgen":"3"},{"namegen":"ศรอนงค์","colorgen":"#FFD93D","numgen":"2"},{"namegen":"ม้าสีหมอก","colorgen":"#8B8B8B","numgen":"1"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    UserGen? userGen,
    List<ListGen>? listGen,
  }) {
    _screeninfo = screeninfo;
    _userGen = userGen;
    _listGen = listGen;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _userGen = json['user_gen'] != null ? UserGen.fromJson(json['user_gen']) : null;
    if (json['list_gen'] != null) {
      _listGen = [];
      json['list_gen'].forEach((v) {
        _listGen?.add(ListGen.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  UserGen? _userGen;
  List<ListGen>? _listGen;
  Body copyWith({
    Screeninfo? screeninfo,
    UserGen? userGen,
    List<ListGen>? listGen,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        userGen: userGen ?? _userGen,
        listGen: listGen ?? _listGen,
      );
  Screeninfo? get screeninfo => _screeninfo;
  UserGen? get userGen => _userGen;
  List<ListGen>? get listGen => _listGen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_userGen != null) {
      map['user_gen'] = _userGen?.toJson();
    }
    if (_listGen != null) {
      map['list_gen'] = _listGen?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// namegen : "อำพันรัตติกาล"
/// colorgen : "#FFD93D"
/// numgen : "66"

ListGen listGenFromJson(String str) => ListGen.fromJson(json.decode(str));
String listGenToJson(ListGen data) => json.encode(data.toJson());

class ListGen {
  ListGen({
    String? namegen,
    String? colorgen,
    String? numgen,
  }) {
    _namegen = namegen;
    _colorgen = colorgen;
    _numgen = numgen;
  }

  ListGen.fromJson(dynamic json) {
    _namegen = json['namegen'];
    _colorgen = json['colorgen'];
    _numgen = json['numgen'];
  }
  String? _namegen;
  String? _colorgen;
  String? _numgen;
  ListGen copyWith({
    String? namegen,
    String? colorgen,
    String? numgen,
  }) =>
      ListGen(
        namegen: namegen ?? _namegen,
        colorgen: colorgen ?? _colorgen,
        numgen: numgen ?? _numgen,
      );
  String? get namegen => _namegen;
  String? get colorgen => _colorgen;
  String? get numgen => _numgen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namegen'] = _namegen;
    map['colorgen'] = _colorgen;
    map['numgen'] = _numgen;
    return map;
  }
}

/// namegen : "กรีนทีมัทฉะลาเต้"
/// colorgen : "#6BCB77"
/// numgen : "65"

UserGen userGenFromJson(String str) => UserGen.fromJson(json.decode(str));
String userGenToJson(UserGen data) => json.encode(data.toJson());

class UserGen {
  UserGen({
    String? namegen,
    String? colorgen,
    String? numgen,
  }) {
    _namegen = namegen;
    _colorgen = colorgen;
    _numgen = numgen;
  }

  UserGen.fromJson(dynamic json) {
    _namegen = json['namegen'];
    _colorgen = json['colorgen'];
    _numgen = json['numgen'];
  }
  String? _namegen;
  String? _colorgen;
  String? _numgen;
  UserGen copyWith({
    String? namegen,
    String? colorgen,
    String? numgen,
  }) =>
      UserGen(
        namegen: namegen ?? _namegen,
        colorgen: colorgen ?? _colorgen,
        numgen: numgen ?? _numgen,
      );
  String? get namegen => _namegen;
  String? get colorgen => _colorgen;
  String? get numgen => _numgen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namegen'] = _namegen;
    map['colorgen'] = _colorgen;
    map['numgen'] = _numgen;
    return map;
  }
}

/// titleboardnisit : "Board of Student"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titleboardnisit,
  }) {
    _titleboardnisit = titleboardnisit;
  }

  Screeninfo.fromJson(dynamic json) {
    _titleboardnisit = json['titleboardnisit'];
  }
  String? _titleboardnisit;
  Screeninfo copyWith({
    String? titleboardnisit,
  }) =>
      Screeninfo(
        titleboardnisit: titleboardnisit ?? _titleboardnisit,
      );
  String? get titleboardnisit => _titleboardnisit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleboardnisit'] = _titleboardnisit;
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