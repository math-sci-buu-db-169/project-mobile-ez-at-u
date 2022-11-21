import 'dart:convert';

/// head : {"status":200,"message":"success","modulename":"login"}

LogoutHomeResponse logoutHomeResponseFromJson(String str) => LogoutHomeResponse.fromJson(json.decode(str));
String logoutHomeResponseToJson(LogoutHomeResponse data) => json.encode(data.toJson());

class LogoutHomeResponse {
  LogoutHomeResponse({
    Head? head,
  }) {
    _head = head;
  }

  LogoutHomeResponse.fromJson(dynamic json) {
    _head = json['head'] != null ? Head.fromJson(json['head']) : null;
  }
  Head? _head;
  LogoutHomeResponse copyWith({
    Head? head,
  }) =>
      LogoutHomeResponse(
        head: head ?? _head,
      );
  Head? get head => _head;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_head != null) {
      map['head'] = _head?.toJson();
    }
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