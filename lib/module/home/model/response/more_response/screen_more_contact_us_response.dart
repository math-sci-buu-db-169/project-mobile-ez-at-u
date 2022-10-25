import 'dart:convert';

/// head : {"status":"200","message":"success","module":"home"}
/// body : {"screeninfo":{"texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"}}

ScreenMoreContactUsResponse screenMoreContactUsResponseFromJson(String str) =>
    ScreenMoreContactUsResponse.fromJson(json.decode(str));
String screenMoreContactUsResponseToJson(ScreenMoreContactUsResponse data) => json.encode(data.toJson());

class ScreenMoreContactUsResponse {
  ScreenMoreContactUsResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreContactUsResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreContactUsResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreContactUsResponse(
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

/// screeninfo : {"titlecontactus":"ติดต่อเรา","subtitlecontactus":"ช่องทางการติดต่อ","texttel":"โทร","textfax":"แฟกซ์","textemail":"อิเมล","textfacebook":"เฟสบุ็ค","texttwitter":"ทวิตเตอร์","textinstagram":"อินสตาแกรม","textline":"ไลน์","textunittime":"น."}
/// datamain : {"contactname":"คณะวิทยาศาสตร์  มหาวิทยาลัยบูรพา","phone":"0-3810-3011","fax":"0-3839-3496","email":"scibuu.pr@gmail.com","startperiod":"จันทร์","endtperiod":"ศุกร์","starttime":"08:00","endtime":"16:00","address":"มหาวิทยาลัยบูรพา 169  ถ.ลงหาดบางแสน ต.แสนสุข อ.เมือง จ.ชลบุรี 20131","twitter":"https://twitter.com/scibuu","instagram":"https://www.instagram.com/scibuu/?__coig_restricted=1","facebook":"https://www.facebook.com/scibuu.pr/","line":"https://line.me/R/ti/p/%40ffy9217v","lineid":"@ffy9217v"}
/// data : {"contactname":"ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ ","phone":"0-3810-3078","fax":"0-3839-3496","email":"math_sci@buu.ac.th","startperiod":"จันทร์","endtperiod":"ศุกร์","starttime":"08:00","endtime":"16:00","address":"มหาวิทยาลัยบูรพา 169  ถ.ลงหาดบางแสน ต.แสนสุข อ.เมือง จ.ชลบุรี 20131","twitter":"-","instagram":"-","facebook":"https://www.facebook.com/SciMathBUU","line":null,"lineid":null}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    Datamain? datamain,
    Data? data,
  }) {
    _screeninfo = screeninfo;
    _datamain = datamain;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _datamain = json['datamain'] != null ? Datamain.fromJson(json['datamain']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Screeninfo? _screeninfo;
  Datamain? _datamain;
  Data? _data;
  Body copyWith({
    Screeninfo? screeninfo,
    Datamain? datamain,
    Data? data,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        datamain: datamain ?? _datamain,
        data: data ?? _data,
      );
  Screeninfo? get screeninfo => _screeninfo;
  Datamain? get datamain => _datamain;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_datamain != null) {
      map['datamain'] = _datamain?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// contactname : "ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ "
/// phone : "0-3810-3078"
/// fax : "0-3839-3496"
/// email : "math_sci@buu.ac.th"
/// startperiod : "จันทร์"
/// endtperiod : "ศุกร์"
/// starttime : "08:00"
/// endtime : "16:00"
/// address : "มหาวิทยาลัยบูรพา 169  ถ.ลงหาดบางแสน ต.แสนสุข อ.เมือง จ.ชลบุรี 20131"
/// twitter : "-"
/// instagram : "-"
/// facebook : "https://www.facebook.com/SciMathBUU"
/// line : null
/// lineid : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? contactname,
    String? phone,
    String? fax,
    String? email,
    String? startperiod,
    String? endtperiod,
    String? starttime,
    String? endtime,
    String? address,
    String? twitter,
    String? instagram,
    String? facebook,
    dynamic line,
    dynamic lineid,
  }) {
    _contactname = contactname;
    _phone = phone;
    _fax = fax;
    _email = email;
    _startperiod = startperiod;
    _endtperiod = endtperiod;
    _starttime = starttime;
    _endtime = endtime;
    _address = address;
    _twitter = twitter;
    _instagram = instagram;
    _facebook = facebook;
    _line = line;
    _lineid = lineid;
  }

  Data.fromJson(dynamic json) {
    _contactname = json['contactname'];
    _phone = json['phone'];
    _fax = json['fax'];
    _email = json['email'];
    _startperiod = json['startperiod'];
    _endtperiod = json['endtperiod'];
    _starttime = json['starttime'];
    _endtime = json['endtime'];
    _address = json['address'];
    _twitter = json['twitter'];
    _instagram = json['instagram'];
    _facebook = json['facebook'];
    _line = json['line'];
    _lineid = json['lineid'];
  }
  String? _contactname;
  String? _phone;
  String? _fax;
  String? _email;
  String? _startperiod;
  String? _endtperiod;
  String? _starttime;
  String? _endtime;
  String? _address;
  String? _twitter;
  String? _instagram;
  String? _facebook;
  dynamic _line;
  dynamic _lineid;
  Data copyWith({
    String? contactname,
    String? phone,
    String? fax,
    String? email,
    String? startperiod,
    String? endtperiod,
    String? starttime,
    String? endtime,
    String? address,
    String? twitter,
    String? instagram,
    String? facebook,
    dynamic line,
    dynamic lineid,
  }) =>
      Data(
        contactname: contactname ?? _contactname,
        phone: phone ?? _phone,
        fax: fax ?? _fax,
        email: email ?? _email,
        startperiod: startperiod ?? _startperiod,
        endtperiod: endtperiod ?? _endtperiod,
        starttime: starttime ?? _starttime,
        endtime: endtime ?? _endtime,
        address: address ?? _address,
        twitter: twitter ?? _twitter,
        instagram: instagram ?? _instagram,
        facebook: facebook ?? _facebook,
        line: line ?? _line,
        lineid: lineid ?? _lineid,
      );
  String? get contactname => _contactname;
  String? get phone => _phone;
  String? get fax => _fax;
  String? get email => _email;
  String? get startperiod => _startperiod;
  String? get endtperiod => _endtperiod;
  String? get starttime => _starttime;
  String? get endtime => _endtime;
  String? get address => _address;
  String? get twitter => _twitter;
  String? get instagram => _instagram;
  String? get facebook => _facebook;
  dynamic get line => _line;
  dynamic get lineid => _lineid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactname'] = _contactname;
    map['phone'] = _phone;
    map['fax'] = _fax;
    map['email'] = _email;
    map['startperiod'] = _startperiod;
    map['endtperiod'] = _endtperiod;
    map['starttime'] = _starttime;
    map['endtime'] = _endtime;
    map['address'] = _address;
    map['twitter'] = _twitter;
    map['instagram'] = _instagram;
    map['facebook'] = _facebook;
    map['line'] = _line;
    map['lineid'] = _lineid;
    return map;
  }
}

/// contactname : "คณะวิทยาศาสตร์  มหาวิทยาลัยบูรพา"
/// phone : "0-3810-3011"
/// fax : "0-3839-3496"
/// email : "scibuu.pr@gmail.com"
/// startperiod : "จันทร์"
/// endtperiod : "ศุกร์"
/// starttime : "08:00"
/// endtime : "16:00"
/// address : "มหาวิทยาลัยบูรพา 169  ถ.ลงหาดบางแสน ต.แสนสุข อ.เมือง จ.ชลบุรี 20131"
/// twitter : "https://twitter.com/scibuu"
/// instagram : "https://www.instagram.com/scibuu/?__coig_restricted=1"
/// facebook : "https://www.facebook.com/scibuu.pr/"
/// line : "https://line.me/R/ti/p/%40ffy9217v"
/// lineid : "@ffy9217v"

Datamain datamainFromJson(String str) => Datamain.fromJson(json.decode(str));
String datamainToJson(Datamain data) => json.encode(data.toJson());

class Datamain {
  Datamain({
    String? contactname,
    String? phone,
    String? fax,
    String? email,
    String? startperiod,
    String? endtperiod,
    String? starttime,
    String? endtime,
    String? address,
    String? twitter,
    String? instagram,
    String? facebook,
    String? line,
    String? lineid,
  }) {
    _contactname = contactname;
    _phone = phone;
    _fax = fax;
    _email = email;
    _startperiod = startperiod;
    _endtperiod = endtperiod;
    _starttime = starttime;
    _endtime = endtime;
    _address = address;
    _twitter = twitter;
    _instagram = instagram;
    _facebook = facebook;
    _line = line;
    _lineid = lineid;
  }

  Datamain.fromJson(dynamic json) {
    _contactname = json['contactname'];
    _phone = json['phone'];
    _fax = json['fax'];
    _email = json['email'];
    _startperiod = json['startperiod'];
    _endtperiod = json['endtperiod'];
    _starttime = json['starttime'];
    _endtime = json['endtime'];
    _address = json['address'];
    _twitter = json['twitter'];
    _instagram = json['instagram'];
    _facebook = json['facebook'];
    _line = json['line'];
    _lineid = json['lineid'];
  }
  String? _contactname;
  String? _phone;
  String? _fax;
  String? _email;
  String? _startperiod;
  String? _endtperiod;
  String? _starttime;
  String? _endtime;
  String? _address;
  String? _twitter;
  String? _instagram;
  String? _facebook;
  String? _line;
  String? _lineid;
  Datamain copyWith({
    String? contactname,
    String? phone,
    String? fax,
    String? email,
    String? startperiod,
    String? endtperiod,
    String? starttime,
    String? endtime,
    String? address,
    String? twitter,
    String? instagram,
    String? facebook,
    String? line,
    String? lineid,
  }) =>
      Datamain(
        contactname: contactname ?? _contactname,
        phone: phone ?? _phone,
        fax: fax ?? _fax,
        email: email ?? _email,
        startperiod: startperiod ?? _startperiod,
        endtperiod: endtperiod ?? _endtperiod,
        starttime: starttime ?? _starttime,
        endtime: endtime ?? _endtime,
        address: address ?? _address,
        twitter: twitter ?? _twitter,
        instagram: instagram ?? _instagram,
        facebook: facebook ?? _facebook,
        line: line ?? _line,
        lineid: lineid ?? _lineid,
      );
  String? get contactname => _contactname;
  String? get phone => _phone;
  String? get fax => _fax;
  String? get email => _email;
  String? get startperiod => _startperiod;
  String? get endtperiod => _endtperiod;
  String? get starttime => _starttime;
  String? get endtime => _endtime;
  String? get address => _address;
  String? get twitter => _twitter;
  String? get instagram => _instagram;
  String? get facebook => _facebook;
  String? get line => _line;
  String? get lineid => _lineid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contactname'] = _contactname;
    map['phone'] = _phone;
    map['fax'] = _fax;
    map['email'] = _email;
    map['startperiod'] = _startperiod;
    map['endtperiod'] = _endtperiod;
    map['starttime'] = _starttime;
    map['endtime'] = _endtime;
    map['address'] = _address;
    map['twitter'] = _twitter;
    map['instagram'] = _instagram;
    map['facebook'] = _facebook;
    map['line'] = _line;
    map['lineid'] = _lineid;
    return map;
  }
}

/// titlecontactus : "ติดต่อเรา"
/// subtitlecontactus : "ช่องทางการติดต่อ"
/// texttel : "โทร"
/// textfax : "แฟกซ์"
/// textemail : "อิเมล"
/// textfacebook : "เฟสบุ็ค"
/// texttwitter : "ทวิตเตอร์"
/// textinstagram : "อินสตาแกรม"
/// textline : "ไลน์"
/// textunittime : "น."

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titlecontactus,
    String? subtitlecontactus,
    String? texttel,
    String? textfax,
    String? textemail,
    String? textfacebook,
    String? texttwitter,
    String? textinstagram,
    String? textline,
    String? textunittime,
  }) {
    _titlecontactus = titlecontactus;
    _subtitlecontactus = subtitlecontactus;
    _texttel = texttel;
    _textfax = textfax;
    _textemail = textemail;
    _textfacebook = textfacebook;
    _texttwitter = texttwitter;
    _textinstagram = textinstagram;
    _textline = textline;
    _textunittime = textunittime;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlecontactus = json['titlecontactus'];
    _subtitlecontactus = json['subtitlecontactus'];
    _texttel = json['texttel'];
    _textfax = json['textfax'];
    _textemail = json['textemail'];
    _textfacebook = json['textfacebook'];
    _texttwitter = json['texttwitter'];
    _textinstagram = json['textinstagram'];
    _textline = json['textline'];
    _textunittime = json['textunittime'];
  }
  String? _titlecontactus;
  String? _subtitlecontactus;
  String? _texttel;
  String? _textfax;
  String? _textemail;
  String? _textfacebook;
  String? _texttwitter;
  String? _textinstagram;
  String? _textline;
  String? _textunittime;
  Screeninfo copyWith({
    String? titlecontactus,
    String? subtitlecontactus,
    String? texttel,
    String? textfax,
    String? textemail,
    String? textfacebook,
    String? texttwitter,
    String? textinstagram,
    String? textline,
    String? textunittime,
  }) =>
      Screeninfo(
        titlecontactus: titlecontactus ?? _titlecontactus,
        subtitlecontactus: subtitlecontactus ?? _subtitlecontactus,
        texttel: texttel ?? _texttel,
        textfax: textfax ?? _textfax,
        textemail: textemail ?? _textemail,
        textfacebook: textfacebook ?? _textfacebook,
        texttwitter: texttwitter ?? _texttwitter,
        textinstagram: textinstagram ?? _textinstagram,
        textline: textline ?? _textline,
        textunittime: textunittime ?? _textunittime,
      );
  String? get titlecontactus => _titlecontactus;
  String? get subtitlecontactus => _subtitlecontactus;
  String? get texttel => _texttel;
  String? get textfax => _textfax;
  String? get textemail => _textemail;
  String? get textfacebook => _textfacebook;
  String? get texttwitter => _texttwitter;
  String? get textinstagram => _textinstagram;
  String? get textline => _textline;
  String? get textunittime => _textunittime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlecontactus'] = _titlecontactus;
    map['subtitlecontactus'] = _subtitlecontactus;
    map['texttel'] = _texttel;
    map['textfax'] = _textfax;
    map['textemail'] = _textemail;
    map['textfacebook'] = _textfacebook;
    map['texttwitter'] = _texttwitter;
    map['textinstagram'] = _textinstagram;
    map['textline'] = _textline;
    map['textunittime'] = _textunittime;
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
    int? status,
    String? message,
    String? modulename,
  }) {
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
  Head copyWith({
    int? status,
    String? message,
    String? modulename,
  }) =>
      Head(
        status: status ?? _status,
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
