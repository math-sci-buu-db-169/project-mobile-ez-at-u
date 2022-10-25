import 'dart:convert';

/// head : {"status":"200","message":"success","module":"home"}
/// body : {"screeninfo":{"titlenisit":"Board of Study"},"user_gen":{"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"r","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"65"},"data_gen_list":[{"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"#FF0000","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"65"},{"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"r","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"64"},{"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"r","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"58"}]}

ScreenMoreBoardStudentResponse screenMoreBoardStudentResponseFromJson(String str) =>
    ScreenMoreBoardStudentResponse.fromJson(json.decode(str));
String screenMoreBoardStudentResponseToJson(ScreenMoreBoardStudentResponse data) => json.encode(data.toJson());

class ScreenMoreBoardStudentResponse {
  ScreenMoreBoardStudentResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreBoardStudentResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreBoardStudentResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreBoardStudentResponse(
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

/// screeninfo : {"titlenisit":"Board of Study"}
/// user_gen : {"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"r","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"65"}
/// data_gen_list : [{"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"#FF0000","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"65"},{"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"r","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"64"},{"namegen1":" name university","namegen2":" name faculty","namegen3":" name department ","colorgen":"r","textteacher1":"teacher","textteacher2":"teacher","textteacher3":"teacher","numgen":"58"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    UserGen? userGen,
    List<DataGenList>? dataGenList,
  }) {
    _screeninfo = screeninfo;
    _userGen = userGen;
    _dataGenList = dataGenList;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _userGen = json['user_gen'] != null ? UserGen.fromJson(json['user_gen']) : null;
    if (json['data_gen_list'] != null) {
      _dataGenList = [];
      json['data_gen_list'].forEach((v) {
        _dataGenList?.add(DataGenList.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  UserGen? _userGen;
  List<DataGenList>? _dataGenList;
  Body copyWith({
    Screeninfo? screeninfo,
    UserGen? userGen,
    List<DataGenList>? dataGenList,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        userGen: userGen ?? _userGen,
        dataGenList: dataGenList ?? _dataGenList,
      );
  Screeninfo? get screeninfo => _screeninfo;
  UserGen? get userGen => _userGen;
  List<DataGenList>? get dataGenList => _dataGenList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_userGen != null) {
      map['user_gen'] = _userGen?.toJson();
    }
    if (_dataGenList != null) {
      map['data_gen_list'] = _dataGenList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// namegen1 : " name university"
/// namegen2 : " name faculty"
/// namegen3 : " name department "
/// colorgen : "#FF0000"
/// textteacher1 : "teacher"
/// textteacher2 : "teacher"
/// textteacher3 : "teacher"
/// numgen : "65"

DataGenList dataGenListFromJson(String str) => DataGenList.fromJson(json.decode(str));
String dataGenListToJson(DataGenList data) => json.encode(data.toJson());

class DataGenList {
  DataGenList({
    String? namegen1,
    String? namegen2,
    String? namegen3,
    String? colorgen,
    String? textteacher1,
    String? textteacher2,
    String? textteacher3,
    String? numgen,
  }) {
    _namegen1 = namegen1;
    _namegen2 = namegen2;
    _namegen3 = namegen3;
    _colorgen = colorgen;
    _textteacher1 = textteacher1;
    _textteacher2 = textteacher2;
    _textteacher3 = textteacher3;
    _numgen = numgen;
  }

  DataGenList.fromJson(dynamic json) {
    _namegen1 = json['namegen1'];
    _namegen2 = json['namegen2'];
    _namegen3 = json['namegen3'];
    _colorgen = json['colorgen'];
    _textteacher1 = json['textteacher1'];
    _textteacher2 = json['textteacher2'];
    _textteacher3 = json['textteacher3'];
    _numgen = json['numgen'];
  }
  String? _namegen1;
  String? _namegen2;
  String? _namegen3;
  String? _colorgen;
  String? _textteacher1;
  String? _textteacher2;
  String? _textteacher3;
  String? _numgen;
  DataGenList copyWith({
    String? namegen1,
    String? namegen2,
    String? namegen3,
    String? colorgen,
    String? textteacher1,
    String? textteacher2,
    String? textteacher3,
    String? numgen,
  }) =>
      DataGenList(
        namegen1: namegen1 ?? _namegen1,
        namegen2: namegen2 ?? _namegen2,
        namegen3: namegen3 ?? _namegen3,
        colorgen: colorgen ?? _colorgen,
        textteacher1: textteacher1 ?? _textteacher1,
        textteacher2: textteacher2 ?? _textteacher2,
        textteacher3: textteacher3 ?? _textteacher3,
        numgen: numgen ?? _numgen,
      );
  String? get namegen1 => _namegen1;
  String? get namegen2 => _namegen2;
  String? get namegen3 => _namegen3;
  String? get colorgen => _colorgen;
  String? get textteacher1 => _textteacher1;
  String? get textteacher2 => _textteacher2;
  String? get textteacher3 => _textteacher3;
  String? get numgen => _numgen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namegen1'] = _namegen1;
    map['namegen2'] = _namegen2;
    map['namegen3'] = _namegen3;
    map['colorgen'] = _colorgen;
    map['textteacher1'] = _textteacher1;
    map['textteacher2'] = _textteacher2;
    map['textteacher3'] = _textteacher3;
    map['numgen'] = _numgen;
    return map;
  }
}

/// namegen1 : " name university"
/// namegen2 : " name faculty"
/// namegen3 : " name department "
/// colorgen : "r"
/// textteacher1 : "teacher"
/// textteacher2 : "teacher"
/// textteacher3 : "teacher"
/// numgen : "65"

UserGen userGenFromJson(String str) => UserGen.fromJson(json.decode(str));
String userGenToJson(UserGen data) => json.encode(data.toJson());

class UserGen {
  UserGen({
    String? namegen1,
    String? namegen2,
    String? namegen3,
    String? colorgen,
    String? textteacher1,
    String? textteacher2,
    String? textteacher3,
    String? numgen,
  }) {
    _namegen1 = namegen1;
    _namegen2 = namegen2;
    _namegen3 = namegen3;
    _colorgen = colorgen;
    _textteacher1 = textteacher1;
    _textteacher2 = textteacher2;
    _textteacher3 = textteacher3;
    _numgen = numgen;
  }

  UserGen.fromJson(dynamic json) {
    _namegen1 = json['namegen1'];
    _namegen2 = json['namegen2'];
    _namegen3 = json['namegen3'];
    _colorgen = json['colorgen'];
    _textteacher1 = json['textteacher1'];
    _textteacher2 = json['textteacher2'];
    _textteacher3 = json['textteacher3'];
    _numgen = json['numgen'];
  }
  String? _namegen1;
  String? _namegen2;
  String? _namegen3;
  String? _colorgen;
  String? _textteacher1;
  String? _textteacher2;
  String? _textteacher3;
  String? _numgen;
  UserGen copyWith({
    String? namegen1,
    String? namegen2,
    String? namegen3,
    String? colorgen,
    String? textteacher1,
    String? textteacher2,
    String? textteacher3,
    String? numgen,
  }) =>
      UserGen(
        namegen1: namegen1 ?? _namegen1,
        namegen2: namegen2 ?? _namegen2,
        namegen3: namegen3 ?? _namegen3,
        colorgen: colorgen ?? _colorgen,
        textteacher1: textteacher1 ?? _textteacher1,
        textteacher2: textteacher2 ?? _textteacher2,
        textteacher3: textteacher3 ?? _textteacher3,
        numgen: numgen ?? _numgen,
      );
  String? get namegen1 => _namegen1;
  String? get namegen2 => _namegen2;
  String? get namegen3 => _namegen3;
  String? get colorgen => _colorgen;
  String? get textteacher1 => _textteacher1;
  String? get textteacher2 => _textteacher2;
  String? get textteacher3 => _textteacher3;
  String? get numgen => _numgen;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['namegen1'] = _namegen1;
    map['namegen2'] = _namegen2;
    map['namegen3'] = _namegen3;
    map['colorgen'] = _colorgen;
    map['textteacher1'] = _textteacher1;
    map['textteacher2'] = _textteacher2;
    map['textteacher3'] = _textteacher3;
    map['numgen'] = _numgen;
    return map;
  }
}

/// titlenisit : "Board of Study"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titlenisit,
  }) {
    _titlenisit = titlenisit;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlenisit = json['titlenisit'];
  }
  String? _titlenisit;
  Screeninfo copyWith({
    String? titlenisit,
  }) =>
      Screeninfo(
        titlenisit: titlenisit ?? _titlenisit,
      );
  String? get titlenisit => _titlenisit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlenisit'] = _titlenisit;
    return map;
  }
}

/// status : "200"
/// message : "success"
/// module : "home"

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());

class Head {
  Head({
    String? status,
    String? message,
    String? module,
  }) {
    _status = status;
    _message = message;
    _module = module;
  }

  Head.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _module = json['module'];
  }
  String? _status;
  String? _message;
  String? _module;
  Head copyWith({
    String? status,
    String? message,
    String? module,
  }) =>
      Head(
        status: status ?? _status,
        message: message ?? _message,
        module: module ?? _module,
      );
  String? get status => _status;
  String? get message => _message;
  String? get module => _module;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['module'] = _module;
    return map;
  }
}
