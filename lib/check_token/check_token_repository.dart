import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ez_at_u/utils/dio.dart';

class CheckTokenRepository {
  Future<Response> getCheckTokenRefreshToken({required String refreshToken}) async {
    return await MyDio.createDioServer().post("/login/refresh/token",
        data: jsonEncode({
          "refreshToken": refreshToken
        })
    );
  }Future<Response> getCheckTokenExpired() async {
    return await MyDio.createDioServer().post("/api/home/checktokenexpired",
        data: jsonEncode({
        })
    );
  }

}