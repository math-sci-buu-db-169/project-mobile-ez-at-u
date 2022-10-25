import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ez_u/utils/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProfileRepository {
  /// มาจาก webbinaryz ///
  // Future<Response> getApiProfile(
  //     // String user,String password,
  //     ) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? globalKey = prefs.getString("globalKey");
  //   if (kDebugMode) {
  //     print(globalKey);
  //   }
  //   return await MyDio.createDioTest().post(
  //     "/v1/api/modules/profile/wording/profile",
  //     data: jsonEncode({
  //     })
  //   );
  // }
  /// มาจาก server ///
  Future<Response> getApiProfile(
      // String user,String password,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    String? globalKey = prefs.getString("globalKey");
    // if (kDebugMode) {
    //   print(globalKey);
    // }
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
  } Future<Response> sentProfileAddressData(
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
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    print("attention = ${attention}");
    print("status = ${status}");
    print("jobType = ${jobType}");
    print("career = ${career}");
    print("company = ${company}");
    print("workplace = ${workplace}");
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
    // final prefs = await SharedPreferences.getInstance();
    // String? globalKey = prefs.getString("globalKey");
    return await MyDio.createDioServer().post(
        "/profile/profileimage",
        data: jsonEncode(
            {
              "base64": getBase64Img
            }
        )
    );
  }
}
