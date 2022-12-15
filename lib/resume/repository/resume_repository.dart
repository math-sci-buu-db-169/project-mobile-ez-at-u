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
  Future<Response> sentEditAboutMeResume({required String detailsTH,required String detailsEN,}) async {
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
  Future<Response> sentEditUserInfoResume({
    required String prefixId,
    required String name,
    required String lastName,
    required String nameEN,
    required String lastNameEN,}) async {
print("sentEditUserInfoResume");
    print(" prefix: $prefixId ,name: $name,lastName: $lastName,nameEN: $nameEN,lastNameEN: $lastNameEN");

    return await MyDio.createDioServer().post("/api/Resume/edituserinforesume",
        data: jsonEncode({
          "prefixid": prefixId,
          "name_th": name,
          "lastname_th": lastName,
          "name_en": nameEN,
          "lastname_en": lastNameEN
        })
    );
  }

  Future<Response> sentEditPositionResume({required String positionTH,required String positionEN,
    required String officeTH,required String officeEN,}) async {
    return await MyDio.createDioServer().post("/api/Resume/editpositionresume",
        data: jsonEncode({

            "position_th": positionTH,
            "position_en": positionEN,
            "office_th": officeTH,
            "office_en":officeEN

        })
    );
  }
  Future<Response> sentEditContactResume({
    required String email,
    required String phone,
    required String facebook,
    required String line,
    required String instagram,
    required String twitter,
    required String youtube,}) async {
    return await MyDio.createDioServer().post("/api/Resume/editcontactresume",
        data: jsonEncode({

          "email": email,
          "phone": phone,
          "facebook": facebook,
          "line": line,
          "instagram": instagram,
          "twitter": twitter,
          "youtube": youtube

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
          "edit": true,
          "id": id ,
          "orderchoose": orderChoose,
          "title_th": title,
          "title_en": titleEN,
          "description_th": description,
          "description_en": descriptionEN

        })
    );
  }Future<Response> sentEditSkillResume({
    required int id,
    required int orderChoose,
    required String skill,
    required String skillEN,
    required String descriptionTH,
    required String descriptionEN,
    required String value}) async {
    return await MyDio.createDioServer().post("/api/Resume/editskillresume",
        data: jsonEncode({

          "edit": true,
          "id": id,
          "orderchoose": orderChoose,
          "value": value,
          "skill_th": skill,
          "skill_en": skillEN,
          "description_th": descriptionTH,
          "description_en": descriptionEN

        })
    );
  }Future<Response> sentEditSkillLanguageResume({
    required int id,
    required int orderChoose,
    required String language,
    required String languageEN,
    required String descriptionTH,
    required String descriptionEN,
    required String value}) async {
    return await MyDio.createDioServer().post("/api/Resume/editskilllanguageresume",
        data: jsonEncode({

          "edit": true,
          "id": id,
          "orderchoose": orderChoose,
          "value": value,
          "language_th": language,
          "language_en": languageEN,
          "description_th": descriptionTH,
          "description_en": descriptionEN

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

          "edit": true,
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

          "edit": true,
          "id": id,
          "orderchoose": orderChoose,
          "startdate": startDate,
          "enddate": endDate,
          "type": type,
          "placeofstudy_th": placeOfStudy,
          "placeofstudy_en": placeOfStudyEN,
          "detail_th": detailTH,
          "detail_en": detailEN

        })
    );
  }Future<Response> sentScreenAboutResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/aboutmeresume",
        data: jsonEncode({
          "languageresume": userLanguage
        })
    );
  }
  Future<Response> sentScreenUserInfoResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/userinforesume",
        data: jsonEncode({
          "languageresume": userLanguage
        })
    );
  }

  Future<Response> sentScreenPositionResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/positionresume",
        data: jsonEncode({
          "languageresume": userLanguage

        })
    );
  }
  Future<Response> sentScreenContactResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/contactresume",
        data: jsonEncode({
          "languageresume": userLanguage

        })
    );
  }
  Future<Response> sentScreenEducationResume({required int eduId ,required String type}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/educationresume",
        data: jsonEncode({
          "languageresume": userLanguage,
            "edu_id": eduId,
            "type": type

        })
    );
  }
  Future<Response> sentScreenAddressResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/addressresume",
        data: jsonEncode({
          "languageresume": userLanguage

        })
    );
  }Future<Response> sentScreenCertificateResume({required int certificateId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/certificateresume",
        data: jsonEncode({
          "certificate_id": certificateId,
          "languageresume": userLanguage
        })
    );
  }Future<Response> sentScreenSkillResume({required int skillId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/skillresume",
        data: jsonEncode({
          "skill_id":skillId,
          "languageresume": userLanguage
        })
    );
  }Future<Response> sentScreenSkillLanguageResume({required int skillLanguageId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/skilllanguageresume",
        data: jsonEncode({
          "skillanguage_id": skillLanguageId,
          "languageresume": userLanguage

        })
    );
  }Future<Response> sentScreenExperienceResume({required int experienceId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/Resume/experienceresume",
        data: jsonEncode({

          "experience_id": experienceId,
          "languageresume": userLanguage

        })
    );
  }
}
