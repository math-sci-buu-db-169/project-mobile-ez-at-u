import 'package:ez_u/utils/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/dio.dart';

class LoginRepository {
  Future<Response> getScreenLogin(String userLanguage) async {
    return await MyDio.createDioServer().post("/login/loginscreen",
        data: jsonEncode({
          "language": userLanguage
        }) //for post
    );
  }

  Future<Response> getSubmitLogin(String userID, String password) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguage');
    return await MyDio.createDioServer().post("/login/loginsubmit",
        // queryParameters: {"Language": userLanguage} // for get
        data: jsonEncode({"language": userLanguage, "userID": userID, "password": password}) //for post
    );
  }
// }
}
