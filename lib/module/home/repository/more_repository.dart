import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../main_route/main_route_bloc/main_route_bloc.dart';
import '../../../utils/dio.dart';

class MoreRepository {
  Future<Response> getScreenMoreInfo() async {
    // return await MyDio.createDioTest().post("/v1/api/modules/home/more",
    return await MyDio.createDioServer().post("/api/home/morescreen", data: jsonEncode({}));
  }

  Future<Response> getMoreListGen() async {
    return await MyDio.createDioServer().post("/api/home/morelistnamegen", data: jsonEncode({

        "gen": "string",
        "genname": "string"

    }));
  }

  // Future<Response> getScreenMoreBoardStudent() async {
  //   return await MyDio.createDioServer().post("ServiceTest/api/home/morelistnamegen", data: jsonEncode({}));
  // }

  Future<Response> getScreenMoreBoardDetailStudent(String? studentCode) async {
    return await MyDio.createDioServer()
        .post("/api/home/morenisitdetail", data: jsonEncode({"studentcode": studentCode}));
  }

  Future<Response> getMoreBoardListStudent(String gen) async {
    return await MyDio.createDioServer()
        .post("/api/home/morelistnisit", data: jsonEncode(
        {"gen": gen,
      "studentid": "string",
      "studentname": "string",
      "studentlastname": "string"
        }));
  }

  Future<Response> getScreenMoreBoardTeacher() async {
    return await MyDio.createDioServer().post("/api/home/morelistteacher", data: jsonEncode({}));
  }

  Future<Response> getScreenMoreContactUs() async {
    return await MyDio.createDioServer().post("/api/home/morecontactus", data: jsonEncode({}));
  }

  Future<Response> getScreenMoreFAQ({required String module}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    if (module =='login'){
      return await MyDio.createDioServer().post("/api/home/morefaq", data: jsonEncode({
        "userlanguage": userLanguage
      }));
    } else {

      return await MyDio.createDioServer().post("/api/home/morefaq", data: jsonEncode({
        "userlanguage": userLanguage
      }));
    }
  }

  Future<Response> getScreenMorePDPA() async {
    return await MyDio.createDioServer().post("/api/home/morepdpa", data: jsonEncode({}));
  }

  Future<Response> sentProfileImage({required userid, required String base64Image}) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServer().post("/api/home/imageupload",
        data: jsonEncode({
          "tccode": userid,
          "base64": base64Image,
        }));
  }
}
