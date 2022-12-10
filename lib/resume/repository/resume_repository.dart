import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ez_at_u/utils/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';



late SharedPreferences prefs;
class ResumeRepository {

  Future<Response> getPreviewResumeDataAndScreen() async {

    prefs = await SharedPreferences.getInstance();
    String resumeLanguage = prefs.getString('userLanguageResume')??"";
print("resumeLanguage  getPreviewResumeDataAndScreen ============ $resumeLanguage");
    return await MyDio.createDioServer().post("/api/Resume/previewresume",
        data: jsonEncode({
          "userlanguage": resumeLanguage
        })
    );
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
  Future<Response> sentResumeImage({required String base64Image}) async {
    return await MyDio.createDioServer().post("/api/Resume/imageuploadresume",
        data: jsonEncode({
          "base64": base64Image
        })
    );
  }
  Future<Response> sentEditAboutResume({required String detailsTH,required String detailsEN,}) async {
    print("object");
    print(detailsTH);
    print(detailsEN);
    return await MyDio.createDioServer().post("/api/Resume/editaboutmeresume",
        data: jsonEncode({
          "detailsth": detailsTH,
          "detailsen": detailsEN
        })
    );
  }
}
