import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ez_at_u/utils/dio.dart';
import 'package:flutter/foundation.dart';
class ProfileRepository {
  Future<Response> getApiProfile(
      ) async {
    return await MyDio.createDioServer().post(
        "/profile/profilescreen",
        data: jsonEncode({
        })
    );
  }
  ////////////////////////////////////////
  Future<Response> sentProfileGeneralData(
      String name,
      String surname,
      String nickname,
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServer().post(
        "/profile/generalsubmit",
        data: jsonEncode({
          "name": name,
          "surname": surname,
          "nickname": nickname
        })
    );
  }
  Future<Response> sentProfileEducationData(
      String gpaJh,
      String gpaSh,
      String gpaBd
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServer().post(
        "/profile/educationsubmit",
        data: jsonEncode({
          "gpabd": gpaBd,
          "gpajhs": gpaJh,
          "gpashs": gpaSh
        })
    );
  }
  Future<Response> sentProfileAddressData(
      String number,
      String moo,
      String soi,
      String road,
      String subDistrict,
      String district,
      String province,
      String zipcode
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServer().post(
        "/profile/addresssubmit",
        data: jsonEncode(
            {
              "number": number,
              "moo": moo,
              "soi": soi,
              "road": road,
              "subdistrict": subDistrict,
              "district": district,
              "province": province,
              "zipcode": zipcode
            }
        )
    );
  }
  Future<Response> sentProfileContactData(
      String phone,
      String line,
      String facebook,
      String instagram,
      String twitter,
      String youtube
      ) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServer().post(
        "/profile/contactsubmit",
        data: jsonEncode(
            {
              "phone": phone,
              "line": line,
              "facebook": facebook,
              "instagram": instagram,
              "twitter": twitter,
              "youtube": youtube
            }
        )
    );
  }
  Future<Response> sentProfileCareerData(
      String attention,
      String status,
      String jobType,
      String career,
      String company,
      String workplace
      ) async {
    if (kDebugMode) {
      print("attention = $attention");
      print("status = $status");
      print("jobType = $jobType");
      print("career = $career");
      print("company = $company");
      print("workplace = $workplace");
    }
    return await MyDio.createDioServer().post(
        "/profile/careersubmit",
        data: jsonEncode(
            {
              "attention": attention,
              "status": status,
              "jobtype": jobType,
              "career": career,
              "company": company,
              "workplace" : workplace
            }
        )
    );
  }
  Future<Response> sentProfileImage(
      String getBase64Img,
      ) async {
    return await MyDio.createDioServer().post(
        "/profile/profileimage",
        data: jsonEncode(
            {
              "base64": getBase64Img
            }
        )
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
  Future<Response> profileTeacherScreen(
      // String user,String password,
      ) async {
    return await MyDio.createDioServer().post(
        "/profile/profilethscreen",
        data: jsonEncode({
        })
    );
  }
  Future<Response> sentProfileTeacherGeneralData(
      String teacherName,
      String teacherLastname,
      String teacherNickname,
      ) async {
    if (kDebugMode) {
      print("teacherName = $teacherName");
      print("teacherLastname = $teacherLastname");
      print("teacherNickname = $teacherNickname");
    }
    return await MyDio.createDioServer().post(
        "/profile/generalprofilethsubmit",
        data: jsonEncode(
            {
              "name": teacherName,
              "lastname": teacherLastname,
              "nickname": teacherNickname
            }
        )
    );
  }
  Future<Response> sentProfileTeacherEducationData(
      String teacherBachelorDegree,
      String teacherMasterDegree,
      String teacherPHD,
      String teacherReseachArea,
      String teacherUBD,
      String teacherUMD,
      String teacherUPHD,
      ) async {
    if (kDebugMode) {
      print("graduatedegree = $teacherBachelorDegree");
      print("masterdegree = $teacherMasterDegree");
      print("phd = $teacherPHD");
      print("reshercharea = $teacherReseachArea");
      print("univofgraduatedegree = $teacherUBD");
      print("univofmasterdegree = $teacherUMD");
      print("univofphd = $teacherUPHD");
    }
    return await MyDio.createDioServer().post(
        "/profile/acadamicprofilethsubmit",
        data: jsonEncode(
            {
              "graduatedegree": teacherBachelorDegree,
              "masterdegree": teacherMasterDegree,
              "phd": teacherPHD,
              "reshercharea": teacherReseachArea,
              "univofgraduatedegree": teacherUBD,
              "univofmasterdegree": teacherUMD,
              "univofphd": teacherUPHD
            }
        )
    );
  }
  Future<Response> sentProfileTeacherContactData(
      String teacherPhone,
      String teacherRoom,
      String teacherEmail,
      ) async {
    if (kDebugMode) {
      print("phone = $teacherPhone");
      print("workshop = $teacherRoom");
      print("email = $teacherEmail");
    }
    return await MyDio.createDioServer().post(
        "/profile/contactprofilethsubmit",
        data: jsonEncode(
            {
              "phone": teacherPhone,
              "workshop": teacherRoom,
              "email": teacherEmail
            }
        )
    );
  }
}
