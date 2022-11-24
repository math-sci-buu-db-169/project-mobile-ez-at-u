import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/dio.dart';

late SharedPreferences prefs;

class HomeRepository {
  Future<Response> getScreenHome() async {
    return await MyDio.createDioServer()
        .post("/api/home/drawerscreen", data: jsonEncode({}));
  }

  Future<Response> getApiProfile() async {
    return await MyDio.createDioServer()
        .post("/profile/profilescreen", data: jsonEncode({}));
  }

  Future<Response> getApiActivity() async {
    return await MyDio.createDioServer()
        .post("/api/home/activityscreen", data: jsonEncode({}));
  }

  Future<Response> getChangeLanguageHome({required String userLanguage}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/api/home/changelanguage",
        data: jsonEncode({"language": userLanguage}));
  }

  Future<Response> getLogout({String? refreshToken}) async {
    return await MyDio.createDioServer().post("/api/home/logout",
        data: jsonEncode({"refreshToken": refreshToken}));
  }

  Future<Response> getDeleteAccount({required String password}) async {
    prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refreshKey');
    return await MyDio.createDioServer().post("/api/home/deleteaccount",
        data: jsonEncode({"password": password, "refreshToken": refreshToken}));
  }

  Future<Response> getApiNoActivity() async {
    return await MyDio.createDioServer()
        .post("/api/home/noactivity", data: jsonEncode({}));
  }
  Future<Response> sendSubmitLogSessions({
    required bool option,}

      ) async {
    prefs = await SharedPreferences.getInstance();
    String? isUserID = prefs.getString('isUserID');
    int isSessionsID =  prefs.getInt('isSessionsID')??1;
    String? isSessions = prefs.getString('isSessions');
    return await MyDio.createDioServer().post("/login/logsessions",
        // queryParameters: {"Language": userLanguage} // for get
        data: jsonEncode({
          "id": isSessionsID,
          "userid": isUserID,
          "sessions": isSessions,
          "phone": '',
          "phoneversionos": '',
          "operatingsystem":'',
          "screenresolution": '',
          "appversion": '',
          "packagename": '',
          "option": false
        }) //for post
    );//for post
  }
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
}
