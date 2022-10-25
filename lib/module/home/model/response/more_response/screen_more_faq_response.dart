import 'dart:convert';

/// head : {"status":"200","message":"success","module":"home"}
/// body : {"screeninfo":{"titleafq":"FAQ","textquestion":"Question","textanswer":"Answer"},"faq":[{"question":"Question","answer":"Answer"},{"question":"Question","answer":"Answer"},{"question":"Question","answer":"Answer"}]}

ScreenMoreFAQResponse screenMoreFAQResponseFromJson(String str) => ScreenMoreFAQResponse.fromJson(json.decode(str));
String screenMoreFAQResponseToJson(ScreenMoreFAQResponse data) => json.encode(data.toJson());

class ScreenMoreFAQResponse {
  ScreenMoreFAQResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreFAQResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreFAQResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreFAQResponse(
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

/// screeninfo : {"titlefaq":"คำถามที่พบบ่อย","textquestion":"คำถาม","textanswer":"คำตอบ"}
/// faq : [{"question":"เกี่ยวข้องกับการจัดการข้อมูลต่างๆของนิสิต ยกตัวอย่างเช่น การค้นหาข้อมูลของนิสิตรุ่นต่างๆ อาจารย์ของภาควิชา ข้อมูลของภาควิชา เป็นต้น","answer":"แอปพลิเคชัน \"จัดการฐานข้อมูลนิสิต\" หรือ Student \"database management\" เกี่ยวกับอะไร"},{"question":"แอปพลิเคชันนี้ถูกพัฒนาโดย นักศึกษาสหกิจมหาวิทยาลัยบูรพา ณ บริษัทฟรีวิลล์โซลูชั่น","answer":"แอปพลิเคชัน \"จัดการฐานข้อมูลนิสิต\" พัฒนาโดยใคร มีความน่าเชื่อถือหรือไม่"},{"question":"ios 15.0 หรือ Android 10.0 ขึ้นไป","answer":"แอปพลิเคชัน \"จัดการฐานข้อมูลนิสิต\" รองรับระบบปฏิบัติการขั้นต่ำอะไรบ้าง"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    List<Faq>? faq,
  }) {
    _screeninfo = screeninfo;
    _faq = faq;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['faq'] != null) {
      _faq = [];
      json['faq'].forEach((v) {
        _faq?.add(Faq.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Faq>? _faq;
  Body copyWith({
    Screeninfo? screeninfo,
    List<Faq>? faq,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        faq: faq ?? _faq,
      );
  Screeninfo? get screeninfo => _screeninfo;
  List<Faq>? get faq => _faq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_faq != null) {
      map['faq'] = _faq?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// question : "เกี่ยวข้องกับการจัดการข้อมูลต่างๆของนิสิต ยกตัวอย่างเช่น การค้นหาข้อมูลของนิสิตรุ่นต่างๆ อาจารย์ของภาควิชา ข้อมูลของภาควิชา เป็นต้น"
/// answer : "แอปพลิเคชัน \"จัดการฐานข้อมูลนิสิต\" หรือ Student \"database management\" เกี่ยวกับอะไร"

Faq faqFromJson(String str) => Faq.fromJson(json.decode(str));
String faqToJson(Faq data) => json.encode(data.toJson());

class Faq {
  Faq({
    String? question,
    String? answer,
  }) {
    _question = question;
    _answer = answer;
  }

  Faq.fromJson(dynamic json) {
    _question = json['question'];
    _answer = json['answer'];
  }
  String? _question;
  String? _answer;
  Faq copyWith({
    String? question,
    String? answer,
  }) =>
      Faq(
        question: question ?? _question,
        answer: answer ?? _answer,
      );
  String? get question => _question;
  String? get answer => _answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['answer'] = _answer;
    return map;
  }
}

/// titlefaq : "คำถามที่พบบ่อย"
/// textquestion : "คำถาม"
/// textanswer : "คำตอบ"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titlefaq,
    String? textquestion,
    String? textanswer,
  }) {
    _titlefaq = titlefaq;
    _textquestion = textquestion;
    _textanswer = textanswer;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlefaq = json['titlefaq'];
    _textquestion = json['textquestion'];
    _textanswer = json['textanswer'];
  }
  String? _titlefaq;
  String? _textquestion;
  String? _textanswer;
  Screeninfo copyWith({
    String? titlefaq,
    String? textquestion,
    String? textanswer,
  }) =>
      Screeninfo(
        titlefaq: titlefaq ?? _titlefaq,
        textquestion: textquestion ?? _textquestion,
        textanswer: textanswer ?? _textanswer,
      );
  String? get titlefaq => _titlefaq;
  String? get textquestion => _textquestion;
  String? get textanswer => _textanswer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlefaq'] = _titlefaq;
    map['textquestion'] = _textquestion;
    map['textanswer'] = _textanswer;
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
