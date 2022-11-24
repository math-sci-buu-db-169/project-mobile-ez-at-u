import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/dio.dart';

late SharedPreferences prefs;

class ForgotPasswordRepository {
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
  Future<Response> getScreenForgotPassword() async {
    final prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/forgotscreen",
        data: jsonEncode({
          "Language": "$userLanguage",
        }));
  }

  Future<Response> getSubmitForgotPassword({required String userID, required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/sendotpforgotpassword",
        data: jsonEncode({"userid": userID, "email": email, "language": userLanguage}));
  }

  Future<Response> getSubmitSetNewForgotPassword(
      {required String userID,
        required String email,
        required String newPassword,
        required String confirmPassword,
        required String otp,
        required String refValueText}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/submitotpforgotpassword",
        data: jsonEncode({
          "userid": userID,
          "email": email,
          "newpassword": newPassword,
          "confirmpassword": confirmPassword,
          "otp": otp,
          "refvaluetext": refValueText,
          "language": userLanguage
        }));
  }

  Future<Response> getReSendOTPSetNewForgotPassword({required String userID, required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/sendotpforgotpassword",
        data: jsonEncode({"userid": userID, "email": email, "language": userLanguage}));
  }
}
