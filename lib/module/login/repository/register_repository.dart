import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/dio.dart';

late SharedPreferences prefs;

class RegisterRepository {
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
  Future<Response> getScreenRegister() async {
    final prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/registerscreen",
        data: jsonEncode({
          "language": "$userLanguage"
        }));
  }

  Future<Response> getSubmitRegister(
      {required String userID,
        required String phone,
        required String email,
        required String name,
        required String lastName,
        required String password,
        required String confirmPassword}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/registersubmit",
        data: jsonEncode({
          "userid": userID,
          "firstname": name,
          "lastname": lastName,
          "email": email,
          "phone": phone,
          "password": password,
          "confirmpassword": confirmPassword,
          "language": userLanguage
        }));
  }

  Future<Response> getReSendOTPConfirmRegister(
      {required String userID,
        required String phone,
        required String email,
        required String name,
        required String lastName,
        required String password,
        required String confirmPassword}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/registersubmit",
        data: jsonEncode({
          "userid": userID,
          "firstname": name,
          "lastname": lastName,
          "email": email,
          "phone": phone,
          "password": password,
          "confirmpassword": confirmPassword,
          "language": userLanguage
        }));
  }

  Future<Response> geSubmitConfirmRegister(
      {required String userID,
        required String phone,
        required String email,
        required String name,
        required String lastName,
        required String password,
        required String confirmPassword,
        required String oTP,
        required String refOTP}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    String? versionPDPA = prefs.getString('VersionPDPA');
    return await MyDio.createDioServer().post("/login/registersubmitotp",
        data: jsonEncode({
          "versionpdpa": versionPDPA,
          "userid": userID,
          "firstname": name,
          "lastname": lastName,
          "email": email,
          "phone": phone,
          "password": password,
          "confirmpassword": confirmPassword,
          "otp": oTP,
          "refvaluetext": refOTP,
          "language": userLanguage
        }));
  }
}
