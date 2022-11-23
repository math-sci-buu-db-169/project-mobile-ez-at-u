import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ez_at_u/utils/dio.dart';
import 'package:flutter/foundation.dart';

class ActivityRepository  {
  // Future<Response> getScreenActivity() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? globalKey = prefs.getString("globalKey");
  //   return await MyDio.createDioTest().post("/v1/api/modules/activity/wording/add_edit_activity",
  //   data: jsonEncode({
  //     "token": globalKey
  //   })
  //   );
  // }
  Future<Response> getScreenActivity() async {
    return await MyDio.createDioServer().post("/activity/addeditactivityscreen",
    data: jsonEncode({

    })
    );
  }
  Future<Response> submitAddEditActivity(
      int id,
      String activityName,
      String year,
      String term,
      String sDate,
      String fDate,
      String totalTimeHours,
      String totalTimeMinutes,
      String venue,
      String approver,
      String detail,
      ) async {
    return await MyDio.createDioServer().post("/activity/submitaddeditactivity",
    data: jsonEncode({
      "activityid": id,
      "activityname": activityName,
      "year": year,
      "term": term,
      "startdate": sDate,
      "finishdate": fDate,
      "timehours": totalTimeHours,
      "timeminutes": totalTimeMinutes,
      "venue": venue,
      "approver": approver,
      "detail": detail,
      "isdelete": "false"
    })
    );
  }
  Future<Response> submitDeleteActivity(
      int id,
      ) async {
    if (kDebugMode) {
      print("id ที่จะลบคือ$id");
    }
    return await MyDio.createDioServer().post("/activity/submitaddeditactivity",
    data: jsonEncode({
      "activityid": id,
      "isdelete": "true"
    })
    );
  }

// Future<Response> getScreenForgotPassword2() async {
//   return await MyDio.createDio().post("/v1/api/modules/login/wording/forgotpassword");
// }

  Future<Response> getRefreshToken({required String refreshToken}) async {
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