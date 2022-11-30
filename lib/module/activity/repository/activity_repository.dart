import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ez_at_u/utils/dio.dart';
import 'package:flutter/foundation.dart';

class ActivityRepository  {
  Future<Response> getScreenActivity() async {
    return await MyDio.createDioServer().post("/activity/addeditactivityscreen",
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
  //----------------------------------------------------------------------------
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
  //----------------------------------------------------------------------------
  Future<Response> SubmitApproveActivityTeacherEvent(
      int activityid,
      String status,
      ) async {
    return await MyDio.createDioServer().post("/activity/submitaddeditactivity",
        data: jsonEncode({
          "activityid": activityid,
          "status": status,
        })
    );
  }
  //----------------------------------------------------------------------------

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
  //----------------------------------------------------------------------------
  Future<Response> getScreenAddEditDeleteActivityByTeacher(
      ) async {
    return await MyDio.createDioServer().post("/activity/addeditdeleteactivitybyteacherscreen",
        data: jsonEncode({
        })
    );
  }
  //----------------------------------------------------------------------------
  Future<Response> submitAddEditDeleteActivityByTeacher({
      required int id,
    required String activityNameByTeacher,
    required String objectives,
    required String sDate,
    required String fDate,
}) async {
    return await MyDio.createDioServer().post("/activity/addeditdeleteactivitybyteacher",
        data: jsonEncode({
          "activityid": id,
          "activityname": activityNameByTeacher,
          "objectives": objectives,
          "startdate": sDate,
          "finishdate": fDate,
          "isdelete": "false"
        })
    );
  }
//----------------------------------------------------------------------------
}