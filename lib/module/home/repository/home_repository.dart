import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/dio.dart';

late SharedPreferences prefs;

class HomeRepository {
  Future<Response> getScreenHome() async {
    return await MyDio.createDioServer()
        .post("/api/home/homescreen", data: jsonEncode({}));
  }

  Future<Response> getApiProfile() async {
    return await MyDio.createDioServer()
        .post("/profile/profilescreen", data: jsonEncode({}));
  }

  Future<Response> getApiActivityStudent() async {
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

  Future<Response> getApiNoActivityStudent() async {
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
  Future<Response> getLockPinScreen() async {
    return await MyDio.createDioServer().post("/api/home/lockpinscreen",
        data: jsonEncode({
        })
    );
  }
  Future<Response> getSettingScreen() async {
    return await MyDio.createDioServer().post("/api/home/settingscreen",
        data: jsonEncode({
        })
    );
  }
  Future<Response> getScreenActivityListTeacher(String filterstatus, int? studentid, String studentname, String activityname) async {
    print(filterstatus);
    print(studentid);
    print(studentname);
    print(activityname);
    return await MyDio.createDioServer().post("/activity/activitylistteacher",
        data: jsonEncode({
          "filterstatus": filterstatus,
          "studentid": studentid,
          "studentname": studentname,
          "activityname": activityname
        })
    );
  }
  Future<Response> getUserRole() async {
    return await MyDio.createDioServer().post("/api/home/getuserrole",
        data: jsonEncode({
        })
    );
  }

}
