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
  Future<Response> sentEditUserInfoResume({required String prefix,
    required String name,
    required String lastName,
    required String prefixEN,
    required String nameEN,
    required String lastNameEN,}) async {
    return await MyDio.createDioServer().post("/api/Resume/edituserinforesume",
        data: jsonEncode({
          "prefix": prefix,
          "name": name,
          "lastname": lastName,
          "prefixen": prefixEN,
          "nameen": nameEN,
          "lastnameen": lastNameEN
        })
    );
  }

  Future<Response> sentEditPositionResume({required String positionTH,required String positionEN,}) async {
    return await MyDio.createDioServer().post("/api/Resume/editpositionresume",
        data: jsonEncode({

            "position": positionTH,
            "positionen": positionEN

        })
    );
  }
  Future<Response> sentEditContactResume({
    required String email,
    required String phone,
    required String facebook,
    required String line,
    required String instagram,
    required String twitter,}) async {
    return await MyDio.createDioServer().post("/api/Resume/editcontactresume",
        data: jsonEncode({

          "email": email,
          "phone": phone,
          "facebook": facebook,
          "line": line,
          "instagram": instagram,
          "twitter": twitter

        })
    );
  }
  Future<Response> sentEditAddressResume({
    required String role,
    required String number,
    required String moo,
    required String soi,
    required String road,
    required String subDistrict,
    required String district,
    required String province,
    required String soiEN,
    required String roadEN,
    required String subDistrictEN,
    required String districtEN,
    required String provinceEN,
    required String zipcode,}) async {
    return await MyDio.createDioServer().post("/api/Resume/editaddressresume",
        data: jsonEncode({

          "role": role,
          "number": number,
          "moo": moo,
          "soi": soi,
          "road": road,
          "subdistrict": subDistrict,
          "district": district,
          "province": province,
          "soien": soiEN,
          "roaden": roadEN,
          "subdisteicten": subDistrictEN,
          "districten": districtEN,
          "provinceen": provinceEN,
          "zipcode": zipcode

        })
    );
  }Future<Response> sentEditCertificateResume({
    required int id,
    required int orderChoose,
    required String title,
    required String titleEN,
    required String description,
    required String descriptionEN}) async {
    return await MyDio.createDioServer().post("/api/Resume/editcertificateresume",
        data: jsonEncode({

          "id": id,
          "title": title,
          "titleen": titleEN,
          "description": description,
          "descriptionen": descriptionEN,
          "orderchoose": orderChoose

        })
    );
  }Future<Response> sentEditSkillResume({
    required int id,
    required int orderChoose,
    required String skill,
    required String skillEN,
    required String value}) async {
    return await MyDio.createDioServer().post("/api/Resume/editskillresume",
        data: jsonEncode({

          "id": id,
          "skill": skill,
          "skillen": skillEN,
          "value": value,
          "orderchoose": orderChoose

        })
    );
  }Future<Response> sentEditSkillLanguageResume({
    required int id,
    required int orderChoose,
    required String language,
    required String languageEN,
    required String value}) async {
    return await MyDio.createDioServer().post("/api/Resume/editskilllanguageresume",
        data: jsonEncode({

          "id": id,
          "language": language,
          "languageen": languageEN,
          "value": value,
          "orderchoose": orderChoose

        })
    );
  }Future<Response> sentEditExperienceResume({
    required int id,
    required int orderChoose,
    required String startDate,
    required String endDate,
    required String positionTH,
    required String positionEN,
    required String detailTH,
    required String detailEN}) async {
    return await MyDio.createDioServer().post("/api/Resume/editexperienceresume",
        data: jsonEncode({

          "id": id,
          "orderchoose": orderChoose,
          "startdate": startDate,
          "enddate": endDate,
          "position_th": positionTH,
          "position_en": positionEN,
          "detail_th": detailTH,
          "detail_en": detailEN

        })
    );
  }Future<Response> sentEditEducationResume({
    required int id,
    required int orderChoose,
    required String startDate,
    required String endDate,
    required String type,
    required String placeOfStudy,
    required String placeOfStudyEN,
    required String detailTH,
    required String detailEN}) async {
    return await MyDio.createDioServer().post("/api/Resume/editeducationresume",
        data: jsonEncode({

          "id": id,
          "orderchoose": orderChoose,
          "startdate": startDate,
          "enddate": endDate,
          "type": type,
          "placeofstudy": placeOfStudy,
          "placeogstudyen": placeOfStudyEN,
          "detail": detailTH,
          "detailen": detailEN

        })
    );
  }Future<Response> sentScreenAboutResume() async {
    return await MyDio.createDioServer().post("/api/Resume/aboutmeresume",
        data: jsonEncode({
          "languageresume": "string"
        })
    );
  }
  Future<Response> sentScreenUserInfoResume() async {
    return await MyDio.createDioServer().post("/api/Resume/userinforesume",
        data: jsonEncode({
          "languageresume": "string"
        })
    );
  }

  Future<Response> sentScreenPositionResume() async {
    return await MyDio.createDioServer().post("/api/Resume/positionresume",
        data: jsonEncode({
          "languageresume": "string"

        })
    );
  }
  Future<Response> sentScreenContactResume() async {
    return await MyDio.createDioServer().post("/api/Resume/contactresume",
        data: jsonEncode({
          "languageresume": "string"

        })
    );
  }
  Future<Response> sentScreenEducationResume() async {
    return await MyDio.createDioServer().post("/api/Resume/educationresume",
        data: jsonEncode({
          "languageresume": "string"

        })
    );
  }
  Future<Response> sentScreenAddressResume() async {
    return await MyDio.createDioServer().post("/api/Resume/addressresume",
        data: jsonEncode({

          "languageresume": "string"

        })
    );
  }Future<Response> sentScreenCertificateResume() async {
    return await MyDio.createDioServer().post("/api/Resume/certificateresume",
        data: jsonEncode({

          "languageresume": "string"

        })
    );
  }Future<Response> sentScreenSkillResume() async {
    return await MyDio.createDioServer().post("/api/Resume/skillresume",
        data: jsonEncode({

          "languageresume": "string"
        })
    );
  }Future<Response> sentScreenSkillLanguageResume() async {
    return await MyDio.createDioServer().post("/api/Resume/skilllanguageresume",
        data: jsonEncode({
          "languageresume": "string"

        })
    );
  }Future<Response> sentScreenExperienceResume() async {
    return await MyDio.createDioServer().post("/api/Resume/experienceresume",
        data: jsonEncode({
          "languageresume": "string"

        })
    );
  }
}
