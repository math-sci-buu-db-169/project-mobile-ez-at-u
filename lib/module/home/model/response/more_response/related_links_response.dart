import 'dart:convert';
/// head : {"status":200,"message":"success","modulename":"home","timeexpire":false}
/// body : {"screeninfo":{"titlerelatedlinks":"Related Links"},"datalink":[{"title":"Burapha University","link":"https://www.buu.ac.th/"},{"title":"Burapha Library","link":"https://www.lib.buu.ac.th/web/index.php/th/welcome-2/"},{"title":"e-leave system","link":"https://e-leave.buu.ac.th/login/frontend"},{"title":"Electronic Document System (eDocument)","link":"https://doc.buu.ac.th/DocClient/"},{"title":"Research and Innovation Administration Division Burapha University","link":"http://research.buu.ac.th/web2019/?page_id=898"},{"title":"computer office Burapha University","link":"https://ict.buu.ac.th/"},{"title":"Educational Registration and Processing Division","link":"https://reg.buu.ac.th/registrar/home.asp"},{"title":"graduate school Burapha University","link":"http://grd.buu.ac.th/wordpress/"},{"title":"Faculty of Science","link":"https://science.buu.ac.th/index.htm"},{"title":"internal communication system Faculty of Science ( intranet )","link":"https://science.buu.ac.th/intranet/pages/index.html"},{"title":"Online car booking system, Faculty of Science","link":"https://webapp.sci.buu.ac.th/bookingcar/"},{"title":"Faculty of Science project plan filling system","link":"https://webapp.sci.buu.ac.th/actionplans/"},{"title":"Faculty of Science","link":"https://science.buu.ac.th/index.htm"},{"title":"internal communication system Faculty of Science ( intranet )","link":"https://science.buu.ac.th/intranet/pages/index.html"},{"title":"Online car booking system, Faculty of Science","link":"https://webapp.sci.buu.ac.th/bookingcar/"},{"title":"Faculty of Science project plan filling system","link":"https://webapp.sci.buu.ac.th/actionplans/"}]}

RelatedLinksResponse relatedLinksResponseFromJson(String str) => RelatedLinksResponse.fromJson(json.decode(str));
String relatedLinksResponseToJson(RelatedLinksResponse data) => json.encode(data.toJson());
class RelatedLinksResponse {
  RelatedLinksResponse({
      Head? head, 
      Body? body,}){
    _head = head;
    _body = body;
}

  RelatedLinksResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Head? _head;
  Body? _body;
RelatedLinksResponse copyWith({  Head? head,
  Body? body,
}) => RelatedLinksResponse(  head: head ?? _head,
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

/// screeninfo : {"titlerelatedlinks":"Related Links"}
/// datalink : [{"title":"Burapha University","link":"https://www.buu.ac.th/"},{"title":"Burapha Library","link":"https://www.lib.buu.ac.th/web/index.php/th/welcome-2/"},{"title":"e-leave system","link":"https://e-leave.buu.ac.th/login/frontend"},{"title":"Electronic Document System (eDocument)","link":"https://doc.buu.ac.th/DocClient/"},{"title":"Research and Innovation Administration Division Burapha University","link":"http://research.buu.ac.th/web2019/?page_id=898"},{"title":"computer office Burapha University","link":"https://ict.buu.ac.th/"},{"title":"Educational Registration and Processing Division","link":"https://reg.buu.ac.th/registrar/home.asp"},{"title":"graduate school Burapha University","link":"http://grd.buu.ac.th/wordpress/"},{"title":"Faculty of Science","link":"https://science.buu.ac.th/index.htm"},{"title":"internal communication system Faculty of Science ( intranet )","link":"https://science.buu.ac.th/intranet/pages/index.html"},{"title":"Online car booking system, Faculty of Science","link":"https://webapp.sci.buu.ac.th/bookingcar/"},{"title":"Faculty of Science project plan filling system","link":"https://webapp.sci.buu.ac.th/actionplans/"},{"title":"Faculty of Science","link":"https://science.buu.ac.th/index.htm"},{"title":"internal communication system Faculty of Science ( intranet )","link":"https://science.buu.ac.th/intranet/pages/index.html"},{"title":"Online car booking system, Faculty of Science","link":"https://webapp.sci.buu.ac.th/bookingcar/"},{"title":"Faculty of Science project plan filling system","link":"https://webapp.sci.buu.ac.th/actionplans/"}]

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));
String bodyToJson(Body data) => json.encode(data.toJson());
class Body {
  Body({
      Screeninfo? screeninfo, 
      List<Datalink>? datalink,}){
    _screeninfo = screeninfo;
    _datalink = datalink;
}

  Body.fromJson(dynamic json) {
    _screeninfo = json['screeninfo'] != null ? Screeninfo.fromJson(json['screeninfo']) : null;
    if (json['datalink'] != null) {
      _datalink = [];
      json['datalink'].forEach((v) {
        _datalink?.add(Datalink.fromJson(v));
      });
    }
  }
  Screeninfo? _screeninfo;
  List<Datalink>? _datalink;
Body copyWith({  Screeninfo? screeninfo,
  List<Datalink>? datalink,
}) => Body(  screeninfo: screeninfo ?? _screeninfo,
  datalink: datalink ?? _datalink,
);
  Screeninfo? get screeninfo => _screeninfo;
  List<Datalink>? get datalink => _datalink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_screeninfo != null) {
      map['screeninfo'] = _screeninfo?.toJson();
    }
    if (_datalink != null) {
      map['datalink'] = _datalink?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "Burapha University"
/// link : "https://www.buu.ac.th/"

Datalink datalinkFromJson(String str) => Datalink.fromJson(json.decode(str));
String datalinkToJson(Datalink data) => json.encode(data.toJson());
class Datalink {
  Datalink({
      String? title, 
      String? link,}){
    _title = title;
    _link = link;
}

  Datalink.fromJson(dynamic json) {
    _title = json['title'];
    _link = json['link'];
  }
  String? _title;
  String? _link;
Datalink copyWith({  String? title,
  String? link,
}) => Datalink(  title: title ?? _title,
  link: link ?? _link,
);
  String? get title => _title;
  String? get link => _link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['link'] = _link;
    return map;
  }

}

/// titlerelatedlinks : "Related Links"

Screeninfo screeninfoFromJson(String str) => Screeninfo.fromJson(json.decode(str));
String screeninfoToJson(Screeninfo data) => json.encode(data.toJson());
class Screeninfo {
  Screeninfo({
      String? titlerelatedlinks,}){
    _titlerelatedlinks = titlerelatedlinks;
}

  Screeninfo.fromJson(dynamic json) {
    _titlerelatedlinks = json['titlerelatedlinks'];
  }
  String? _titlerelatedlinks;
Screeninfo copyWith({  String? titlerelatedlinks,
}) => Screeninfo(  titlerelatedlinks: titlerelatedlinks ?? _titlerelatedlinks,
);
  String? get titlerelatedlinks => _titlerelatedlinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['titlerelatedlinks'] = _titlerelatedlinks;
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