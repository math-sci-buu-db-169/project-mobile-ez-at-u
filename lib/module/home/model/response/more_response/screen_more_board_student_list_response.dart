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

/// screeninfo : {"titleboardgen":"Board of Generation ","textsorryth":"ขออภัย ไม่พบข้อมูลในฐานข้อมูล !","textsorryen":"Sorry, no data found in the database !"}
/// data : [{"textstudentcode":"DM3","textstudentname":"แอคเค้าทดสอบและทดลองล็อคอินและดูข้อมูล","textstudentlastname":"แกสโซฮอล 95 ราคาเท่าไหร่","textstudentimg":"/9j/4QBqRXhpZgAATU0AKgAAAAgABAEAAAQAAAABAAAB2AEBAAQAAAABAAACxYdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAAAZIIAAQAAAABAAAAAAAAAAAAAQESAAMAAAABAAAAAAAAAAD/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAAAAIQAABtbnRyUkdCIFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAAHRyWFlaAAABZAAAABRnWFlaAAABeAAAABRiWFlaAAABjAAAABRyVFJDAAABoAAAAChnVFJDAAABoAAAAChiVFJDAAABoAAAACh3dHB0AAAByAAAABRjcHJ0AAAB3AAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAFgAAAAcAHMAUgBHAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z3BhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABYWVogAAAAAAAA9tYAAQAAAADTLW1sdWMAAAAAAAAAAQAAAAxlblVTAAAAIAAAABwARwBvAG8AZwBsAGUAIABJAG4AYwAuACAAMgAwADEANv/bAEMAKBweIx4ZKCMhIy0rKDA8ZEE8Nzc8e1hdSWSRgJmWj4CMiqC05sOgqtqtiozI/8va7vX///+bwf////r/5v3/+P/bAEMBKy0tPDU8dkFBdviljKX4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+P/AABEIAsUB2AMBIgACEQEDEQH/xAAaAAEBAAMBAQAAAAAAAAAAAAAAAQIDBQQG/8QANRABAQABAgUCAwUIAwADAAAAAAECAxEEEiExQQVRE2FxIiNCUsEyNGJygYKhsSSR4RQz0f/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAHREBAQEBAQEBAAMAAAAAAAAAAAECESExQQNRYf/aAAwDAQACEQMRAD8A7IAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA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"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    List<Data>? data,
  }) {
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
  Body copyWith({
    Screeninfo? screeninfo,
    List<Data>? data,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
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

/// textstudentcode : "DM3"
/// textstudentname : "แอคเค้าทดสอบและทดลองล็อคอินและดูข้อมูล"
/// textstudentlastname : "แกสโซฮอล 95 ราคาเท่าไหร่"
/// textstudentimg : "/9j/4QBqRXhpZgAATU0AKgAAAAgABAEAAAQAAAABAAAB2AEBAAQAAAABAAACxYdpAAQAAAABAAAAPgESAAMAAAABAAAAAAAAAAAAAZIIAAQAAAABAAAAAAAAAAAAAQESAAMAAAABAAAAAAAAAAD/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAAAAIQAABtbnRyUkdCIFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAAHRyWFlaAAABZAAAABRnWFlaAAABeAAAABRiWFlaAAABjAAAABRyVFJDAAABoAAAAChnVFJDAAABoAAAAChiVFJDAAABoAAAACh3dHB0AAAByAAAABRjcHJ0AAAB3AAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAFgAAAAcAHMAUgBHAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z3BhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABYWVogAAAAAAAA9tYAAQAAAADTLW1sdWMAAAAAAAAAAQAAAAxlblVTAAAAIAAAABwARwBvAG8AZwBsAGUAIABJAG4AYwAuACAAMgAwADEANv/bAEMAKBweIx4ZKCMhIy0rKDA8ZEE8Nzc8e1hdSWSRgJmWj4CMiqC05sOgqtqtiozI/8va7vX///+bwf////r/5v3/+P/bAEMBKy0tPDU8dkFBdviljKX4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+P/AABEIAsUB2AMBIgACEQEDEQH/xAAaAAEBAAMBAQAAAAAAAAAAAAAAAQIDBQQG/8QANRABAQABAgUCAwUIAwADAAAAAAECAxEEEiExQQVRE2FxIiNCUsEyNGJygYKhsSSR4RQz0f/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAHREBAQEBAQEBAAMAAAAAAAAAAAECESExQQNRYf/aAAwDAQACEQMRAD8A7IAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA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"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? textstudentcode,
    String? textstudentname,
    String? textstudentlastname,
    String? textstudentimg,
  }) {
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
  String? _textstudentimg;
  Data copyWith({
    String? textstudentcode,
    String? textstudentname,
    String? textstudentlastname,
    String? textstudentimg,
  }) =>
      Data(
        textstudentcode: textstudentcode ?? _textstudentcode,
        textstudentname: textstudentname ?? _textstudentname,
        textstudentlastname: textstudentlastname ?? _textstudentlastname,
        textstudentimg: textstudentimg ?? _textstudentimg,
      );
  String? get textstudentcode => _textstudentcode;
  String? get textstudentname => _textstudentname;
  String? get textstudentlastname => _textstudentlastname;
  String? get textstudentimg => _textstudentimg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textstudentcode'] = _textstudentcode;
    map['textstudentname'] = _textstudentname;
    map['textstudentlastname'] = _textstudentlastname;
    map['textstudentimg'] = _textstudentimg;
    return map;
  }
}

/// titleboardgen : "Board of Generation "
/// textsorryth : "ขออภัย ไม่พบข้อมูลในฐานข้อมูล !"
/// textsorryen : "Sorry, no data found in the database !"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titleboardgen,
    String? textsorryth,
    String? textsorryen,
  }) {
    _titleboardgen = titleboardgen;
    _textsorryth = textsorryth;
    _textsorryen = textsorryen;
  }

  Screeninfo.fromJson(dynamic json) {
    _titleboardgen = json['titleboardgen'];
    _textsorryth = json['textsorryth'];
    _textsorryen = json['textsorryen'];
  }
  String? _titleboardgen;
  String? _textsorryth;
  String? _textsorryen;
  Screeninfo copyWith({
    String? titleboardgen,
    String? textsorryth,
    String? textsorryen,
  }) =>
      Screeninfo(
        titleboardgen: titleboardgen ?? _titleboardgen,
        textsorryth: textsorryth ?? _textsorryth,
        textsorryen: textsorryen ?? _textsorryen,
      );
  String? get titleboardgen => _titleboardgen;
  String? get textsorryth => _textsorryth;
  String? get textsorryen => _textsorryen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titleboardgen'] = _titleboardgen;
    map['textsorryth'] = _textsorryth;
    map['textsorryen'] = _textsorryen;
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