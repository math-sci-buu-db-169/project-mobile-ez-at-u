import 'package:dio/dio.dart';
import 'package:ez_at_u/utils/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class MyDio {
  // static final _optionsBinary = BaseOptions(
  //   baseUrl: 'https://webzbinaryz.web.app/',
  //   connectTimeout: 5000,
  //   receiveTimeout: 3000,
  // );
  //
  // static Dio createDioTest() {
  //   Dio dio = Dio(_optionsBinary);
  //   dio.interceptors.add(MyInterceptors());
  //   return dio;
  // }

  // static final _optionsServerTest = BaseOptions(
  //   baseUrl: 'http://msd.buu.ac.th/',
  //   connectTimeout: 5000,
  //   receiveTimeout: 3000,
  // );
  //
  // static Dio createDioServerTest() {
  //   Dio dio = Dio(_optionsServerTest);
  //   dio.interceptors.add(MyInterceptors());
  //   return dio;
  // }



  // /ServiceTest
  static final _optionsServer = BaseOptions(
    baseUrl: 'http://msd.buu.ac.th/ServiceTest',
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );

  static Dio createDioServer() {
    Dio dio = Dio(_optionsServer);
    dio.interceptors.add(MyInterceptors());
    return dio;
  }
}

class MyInterceptors extends Interceptor {
  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await getUserKey() ?? "";
    // String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiVE9OVEMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImUzZTI5NjVlLTQ1ZGEtNDU0MC1hMzI4LTMxOWU5NDgzNzYwNiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjI1LzAxLzIwMjMtMTE6MDg6MzEgQU0iLCJleHAiOjE2NzQ2MTk3MTEsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjQ0MzkwIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzOTAifQ.gydR8vR_dJxzRWyzwZ-dqXWKAFEIKYoCW4jOAlu9vm4";
    if (kDebugMode) {
      print(" token : $token");
    } String refToken = await getUserRefKey() ?? "";
    if (kDebugMode) {
      print(" refToken : $refToken");
    }
    options.headers["Authorization"] = "Bearer $token";

    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }
}
