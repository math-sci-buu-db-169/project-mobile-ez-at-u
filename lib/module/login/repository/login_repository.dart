import 'package:ez_at_u/utils/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/dio.dart';

class LoginRepository {
  Future<Response> getRefreshToken({required String refreshToken}) async {
    return await MyDio.createDioServer().post("/login/refresh/token",
        data: jsonEncode({
          "refreshToken": refreshToken
        })
    );
  }Future<Response> getCheckTokenExpired() async {
    return await MyDio.createDioServer().post("/login/checktokenexpired",
        data: jsonEncode({
        })
    );
  }
  Future<Response> getScreenLogin(String userLanguage) async {
    return await MyDio.createDioServer().post("/login/loginscreen",
        data: jsonEncode({"language": userLanguage}) //for post
        );
  }

  Future<Response> getSubmitLogin(String userID, String password) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/loginsubmit",
        // queryParameters: {"Language": userLanguage} // for get
        data: jsonEncode({
          "language": userLanguage,
          "userID": userID,
          "password": password
        }) //for post
        );
  }

  Future<Response> sendSubmitLogSessions({
    required String userid,
    required String phone,
    required String phoneVersionOS,
    required String operatingSystem,
    required  String screenResolution,
    required String appVersion,
    required  String packageName,
    required bool option,}

  ) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/logsessions",
        // queryParameters: {"Language": userLanguage} // for get
        data: jsonEncode({
          "id": 0,
          "userid": userid,
          "sessions": "",
          "phone": phone,
          "phoneversionos": phoneVersionOS,
          "operatingsystem": operatingSystem,
          "screenresolution": screenResolution,
          "appversion": appVersion,
          "packagename": packageName,
          "option": option
        }) //for post
        );
  }
// }
}
