import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/dio.dart';

late SharedPreferences prefs;

class PDPARepository {
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
  Future<Response> getScreenPDPA() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');

    return await MyDio.createDioServer().post("/login/pdpascreen",
        data: jsonEncode({
          "language": "$userLanguage"
        }));
  }
}
