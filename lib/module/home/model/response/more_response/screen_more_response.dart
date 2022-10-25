import 'dart:convert';

/// head : {"status":200,"message":"success","module":"home"}
/// body : {"screenInfo":{"textmore":"อื่นๆ","textboard":"ทำเนียบ","btnstd":"นิสิต","btntc":"อาจารย์","textabdepart":"เกี่ยวกับภาควิชา","btndeparthis":"ประวัติภาควิชา","btncou":"หลักสูตร","btnface":"เฟสบุ๊ค","btnweb":"เว็บไซต์","textsup":"สนับสนุน","btntermandcon":"เงื่อนไขและข้อตกลง","btnfaq":"คำถามที่พบบ่อย ","btnconus":"ติดต่อเรา","texturgo2":"You are going to","textright":"right ?","textyes":"Yes","textno":"No"},"pavat_url":"https://math.buu.ac.th/history/frontend/index","luksuit_url":"https://math.buu.ac.th/course/frontend/index","facebook_url":"https://www.facebook.com/SciMathBUU","website_url":"https://math.buu.ac.th/"}

ScreenMoreResponse screenMoreResponseFromJson(String str) => ScreenMoreResponse.fromJson(json.decode(str));
String screenMoreResponseToJson(ScreenMoreResponse data) => json.encode(data.toJson());

class ScreenMoreResponse {
  ScreenMoreResponse({
    Head? head,
    Body? body,
  }) {
    _head = head;
    _body = body;
  }

  ScreenMoreResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
  ScreenMoreResponse copyWith({
    Head? head,
    Body? body,
  }) =>
      ScreenMoreResponse(
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
// screeninfo : {"titlemore":"เพิ่มเติม","subtitileboard":"ทำเนียบ","btnstd":"นักเรียน","btntc":"อาจารย์","subtitiledepart":"เกี่ยวกับภาควิชา","btndeparthis":"ประวัติภาควิชา","btncou":"หลักสูตร","btnface":"เฟซบุ๊ก","btnweb":"เว็บไซต์","subtitilesup":"สนับสนุน","btntermandcon":"ข้อตกลงและเงื่อนไข","btnfaq":"คำถามที่พบบ่อย","btncontactus":"ติดต่อเรา"}
/// pavat_url : "https://math.buu.ac.th/history/frontend/index"
/// luksuit_url : "https://math.buu.ac.th/course/frontend/index"
/// facebook_url : "https://www.facebook.com/SciMathBUU"
/// website_url : "https://math.buu.ac.th/"

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    Screeninfo? screeninfo,
    String? pavatUrl,
    String? luksuitUrl,
    String? facebookUrl,
    String? websiteUrl,
  }) {
    _screeninfo = screeninfo;
    _pavatUrl = pavatUrl;
    _luksuitUrl = luksuitUrl;
    _facebookUrl = facebookUrl;
    _websiteUrl = websiteUrl;
  }

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    _pavatUrl = json['pavat_url'];
    _luksuitUrl = json['luksuit_url'];
    _facebookUrl = json['facebook_url'];
    _websiteUrl = json['website_url'];
  }
  Screeninfo? _screeninfo;
  String? _pavatUrl;
  String? _luksuitUrl;
  String? _facebookUrl;
  String? _websiteUrl;
  Body copyWith({
    Screeninfo? screeninfo,
    String? pavatUrl,
    String? luksuitUrl,
    String? facebookUrl,
    String? websiteUrl,
  }) =>
      Body(
        screeninfo: screeninfo ?? _screeninfo,
        pavatUrl: pavatUrl ?? _pavatUrl,
        luksuitUrl: luksuitUrl ?? _luksuitUrl,
        facebookUrl: facebookUrl ?? _facebookUrl,
        websiteUrl: websiteUrl ?? _websiteUrl,
      );
  Screeninfo? get screeninfo => _screeninfo;
  String? get pavatUrl => _pavatUrl;
  String? get luksuitUrl => _luksuitUrl;
  String? get facebookUrl => _facebookUrl;
  String? get websiteUrl => _websiteUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    map['pavat_url'] = _pavatUrl;
    map['luksuit_url'] = _luksuitUrl;
    map['facebook_url'] = _facebookUrl;
    map['website_url'] = _websiteUrl;
    return map;
  }
}

/// titlemore : "เพิ่มเติม"
/// subtitileboard : "ทำเนียบ"
/// btnstd : "นักเรียน"
/// btntc : "อาจารย์"
/// subtitiledepart : "เกี่ยวกับภาควิชา"
/// btndeparthis : "ประวัติภาควิชา"
/// btncou : "หลักสูตร"
/// btnface : "เฟซบุ๊ก"
/// btnweb : "เว็บไซต์"
/// subtitilesup : "สนับสนุน"
/// btntermandcon : "ข้อตกลงและเงื่อนไข"
/// btnfaq : "คำถามที่พบบ่อย"
/// btncontactus : "ติดต่อเรา"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());

class Screeninfo {
  Screeninfo({
    String? titlemore,
    String? subtitileboard,
    String? btnstd,
    String? btntc,
    String? subtitiledepart,
    String? btndeparthis,
    String? btncou,
    String? btnface,
    String? btnweb,
    String? subtitilesup,
    String? btntermandcon,
    String? btnfaq,
    String? btncontactus,
  }) {
    _titlemore = titlemore;
    _subtitileboard = subtitileboard;
    _btnstd = btnstd;
    _btntc = btntc;
    _subtitiledepart = subtitiledepart;
    _btndeparthis = btndeparthis;
    _btncou = btncou;
    _btnface = btnface;
    _btnweb = btnweb;
    _subtitilesup = subtitilesup;
    _btntermandcon = btntermandcon;
    _btnfaq = btnfaq;
    _btncontactus = btncontactus;
  }

  Screeninfo.fromJson(dynamic json) {
    _titlemore = json['titlemore'];
    _subtitileboard = json['subtitileboard'];
    _btnstd = json['btnstd'];
    _btntc = json['btntc'];
    _subtitiledepart = json['subtitiledepart'];
    _btndeparthis = json['btndeparthis'];
    _btncou = json['btncou'];
    _btnface = json['btnface'];
    _btnweb = json['btnweb'];
    _subtitilesup = json['subtitilesup'];
    _btntermandcon = json['btntermandcon'];
    _btnfaq = json['btnfaq'];
    _btncontactus = json['btncontactus'];
  }
  String? _titlemore;
  String? _subtitileboard;
  String? _btnstd;
  String? _btntc;
  String? _subtitiledepart;
  String? _btndeparthis;
  String? _btncou;
  String? _btnface;
  String? _btnweb;
  String? _subtitilesup;
  String? _btntermandcon;
  String? _btnfaq;
  String? _btncontactus;
  Screeninfo copyWith({
    String? titlemore,
    String? subtitileboard,
    String? btnstd,
    String? btntc,
    String? subtitiledepart,
    String? btndeparthis,
    String? btncou,
    String? btnface,
    String? btnweb,
    String? subtitilesup,
    String? btntermandcon,
    String? btnfaq,
    String? btncontactus,
  }) =>
      Screeninfo(
        titlemore: titlemore ?? _titlemore,
        subtitileboard: subtitileboard ?? _subtitileboard,
        btnstd: btnstd ?? _btnstd,
        btntc: btntc ?? _btntc,
        subtitiledepart: subtitiledepart ?? _subtitiledepart,
        btndeparthis: btndeparthis ?? _btndeparthis,
        btncou: btncou ?? _btncou,
        btnface: btnface ?? _btnface,
        btnweb: btnweb ?? _btnweb,
        subtitilesup: subtitilesup ?? _subtitilesup,
        btntermandcon: btntermandcon ?? _btntermandcon,
        btnfaq: btnfaq ?? _btnfaq,
        btncontactus: btncontactus ?? _btncontactus,
      );
  String? get titlemore => _titlemore;
  String? get subtitileboard => _subtitileboard;
  String? get btnstd => _btnstd;
  String? get btntc => _btntc;
  String? get subtitiledepart => _subtitiledepart;
  String? get btndeparthis => _btndeparthis;
  String? get btncou => _btncou;
  String? get btnface => _btnface;
  String? get btnweb => _btnweb;
  String? get subtitilesup => _subtitilesup;
  String? get btntermandcon => _btntermandcon;
  String? get btnfaq => _btnfaq;
  String? get btncontactus => _btncontactus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlemore'] = _titlemore;
    map['subtitileboard'] = _subtitileboard;
    map['btnstd'] = _btnstd;
    map['btntc'] = _btntc;
    map['subtitiledepart'] = _subtitiledepart;
    map['btndeparthis'] = _btndeparthis;
    map['btncou'] = _btncou;
    map['btnface'] = _btnface;
    map['btnweb'] = _btnweb;
    map['subtitilesup'] = _subtitilesup;
    map['btntermandcon'] = _btntermandcon;
    map['btnfaq'] = _btnfaq;
    map['btncontactus'] = _btncontactus;
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
