import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"login"}
/// body : null

SubmitDeleteAccountResponse submitDeleteAccountResponseFromJson(String str) =>
    SubmitDeleteAccountResponse.fromJson(json.decode(str));
String submitDeleteAccountResponseToJson(SubmitDeleteAccountResponse data) => json.encode(data.toJson());

class SubmitDeleteAccountResponse {
  SubmitDeleteAccountResponse({
    Head? head,
    dynamic body,
  }) {
    _head = head;
    _body = body;
  }

  SubmitDeleteAccountResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
    _body = json['body'];
  }
  Head? _head;
  dynamic _body;
  SubmitDeleteAccountResponse copyWith({
    Head? head,
    dynamic body,
  }) =>
      SubmitDeleteAccountResponse(
        head: head ?? _head,
        body: body ?? _body,
      );
  Head? get head => _head;
  dynamic get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_head != null) {
      map['head'] = _head?.toJson();
    }
    map['body'] = _body;
    return map;
  }
}

/// status : 200
/// message : "success"
/// modulename : "login"

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