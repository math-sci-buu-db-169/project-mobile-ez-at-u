import 'dart:convert';

ScreenMoreBoardStudentListResponse screenMoreBoardStudentListResponseFromJson(String str) =>
    ScreenMoreBoardStudentListResponse.fromJson(json.decode(str));
String screenMoreBoardStudentListResponseToJson(ScreenMoreBoardStudentListResponse data) => json.encode(data.toJson());

class ScreenMoreBoardStudentListResponse {
  ScreenMoreBoardStudentListResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreBoardStudentListResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreBoardStudentListResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreBoardStudentListResponse(
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


// screeninfo : {"titleboardgen":"Generation ","textsorryth":"ขออภัย ไม่พบข้อมูลในฐานข้อมูล !","textsorryen":"Sorry, no data found in the database !"}
/// options : [{"title":"Student ID","value":"1"},{"title":"Name","value":"2"},{"title":"surname","value":"3"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
    Screeninfo? screeninfo,
    List<Options>? options,
    List<Data>? data,}){
    _screeninfo = screeninfo;
    _options = options;
    _data = data;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['options'] != null) {
      _options = [];
      json['options'].forEach((v) {
        _options?.add(Options.fromJson(v));
      });
    }
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Options>? _options;
  List<Data>? _data;
  Body copyWith({  Screeninfo? screeninfo,
    List<Options>? options,
    List<Data>? data,
  }) => Body(  screeninfo: screeninfo ?? _screeninfo,
    options: options ?? _options,
    data: data ?? _data,
  );
  Screeninfo? get screeninfo => _screeninfo;
  List<Options>? get options => _options;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_options != null) {
      map['options'] = _options?.map((v) => v.toJson()).toList();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// textstudentcode : "62030001"
/// textstudentname : "คุณจารุวรรณ"
/// textstudentlastname : "เกลาเกลี้ยง"
/// textstudentimg : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    String? textstudentcode,
    String? textstudentname,
    String? textstudentlastname,
    dynamic textstudentimg,}){
    _textstudentcode = textstudentcode;
    _textstudentname = textstudentname;
    _textstudentlastname = textstudentlastname;
    _textstudentimg = textstudentimg;
  }

  Data.fromJson(dynamic json) {
    _textstudentcode = json['textstudentcode'];
    _textstudentname = json['textstudentname'];
    _textstudentlastname = json['textstudentlastname'];
    _textstudentimg = json['textstudentimg'];
  }
  String? _textstudentcode;
  String? _textstudentname;
  String? _textstudentlastname;
  dynamic _textstudentimg;
  Data copyWith({  String? textstudentcode,
    String? textstudentname,
    String? textstudentlastname,
    dynamic textstudentimg,
  }) => Data(  textstudentcode: textstudentcode ?? _textstudentcode,
    textstudentname: textstudentname ?? _textstudentname,
    textstudentlastname: textstudentlastname ?? _textstudentlastname,
    textstudentimg: textstudentimg ?? _textstudentimg,
  );
  String? get textstudentcode => _textstudentcode;
  String? get textstudentname => _textstudentname;
  String? get textstudentlastname => _textstudentlastname;
  dynamic get textstudentimg => _textstudentimg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textstudentcode'] = _textstudentcode;
    map['textstudentname'] = _textstudentname;
    map['textstudentlastname'] = _textstudentlastname;
    map['textstudentimg'] = _textstudentimg;
    return map;
  }

}

/// title : "Student ID"
/// value : "1"

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));
String optionsToJson(Options data) => json.encode(data.toJson());
class Options {
  Options({
    String? title,
    String? value,}){
    _title = title;
    _value = value;
  }

  Options.fromJson(dynamic json) {
    _title = json['title'];
    _value = json['value'];
  }
  String? _title;
  String? _value;
  Options copyWith({  String? title,
    String? value,
  }) => Options(  title: title ?? _title,
    value: value ?? _value,
  );
  String? get title => _title;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['value'] = _value;
    return map;
  }

}


/// titleboardgen : "Generation "
/// search : "Search"
/// here : "here"
/// textsorryth : "ขออภัย ไม่พบข้อมูลในฐานข้อมูล !"
/// textsorryen : "Sorry, no data found in the database !"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
    String? titleboardgen,
    String? search,
    String? here,
    String? textsorryth,
    String? textsorryen,}){
    _titleboardgen = titleboardgen;
    _search = search;
    _here = here;
    _textsorryth = textsorryth;
    _textsorryen = textsorryen;
  }

  Screeninfo.fromJson(dynamic json) {
    _titleboardgen = json['titleboardgen'];
    _search = json['search'];
    _here = json['here'];
    _textsorryth = json['textsorryth'];
    _textsorryen = json['textsorryen'];
  }
  String? _titleboardgen;
  String? _search;
  String? _here;
  String? _textsorryth;
  String? _textsorryen;
  Screeninfo copyWith({  String? titleboardgen,
    String? search,
    String? here,
    String? textsorryth,
    String? textsorryen,
  }) => Screeninfo(  titleboardgen: titleboardgen ?? _titleboardgen,
    search: search ?? _search,
    here: here ?? _here,
    textsorryth: textsorryth ?? _textsorryth,
    textsorryen: textsorryen ?? _textsorryen,
  );
  String? get titleboardgen => _titleboardgen;
  String? get search => _search;
  String? get here => _here;
  String? get textsorryth => _textsorryth;
  String? get textsorryen => _textsorryen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleboardgen'] = _titleboardgen;
    map['search'] = _search;
    map['here'] = _here;
    map['textsorryth'] = _textsorryth;
    map['textsorryen'] = _textsorryen;
    return map;
  }

}


/// status : 200
/// message : "success"
/// modulename : "home"
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