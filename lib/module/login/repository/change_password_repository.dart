import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/dio.dart';

late SharedPreferences prefs;
late String? refreshToken;

class ChangePasswordRepository {
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
  Future<Response> getScreenChangePassword() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/api/home/changepasswordscreen",
        data: jsonEncode({
          "language": userLanguage
        }) //for post
    );
  }

  Future<Response> submitScreenChangePassword(
      {required String currentPassword, required String newPassword, required Object confirmPassword}) async {
    prefs = await SharedPreferences.getInstance();
    refreshToken = prefs.getString('refreshKey');
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/api/home/changepassword",
        data: jsonEncode({
          "currentpassword": currentPassword,
          "newpassword": newPassword,
          "confirmpassword": confirmPassword,
          "refreshtoken": refreshToken,
          "language": userLanguage
        }) //for post
    );
  }
}
