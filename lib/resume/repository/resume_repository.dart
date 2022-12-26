import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ez_at_u/utils/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/components_resume.dart';
import '../examples/content_design_resume.dart';

late SharedPreferences prefs;

class ResumeRepository {
  Future<Response> getPreviewResumeDataAndScreen() async {
    prefs = await SharedPreferences.getInstance();
    String resumeLanguage = prefs.getString('userLanguageResume') ?? "";
    print(
        "resumeLanguage  getPreviewResumeDataAndScreen ============ $resumeLanguage");
    return await MyDio.createDioServer().post("/resume/previewresume",
        data: jsonEncode({"userlanguage": resumeLanguage}));
  }

  Future<Response> getRefreshToken({required String refreshToken}) async {
    return await MyDio.createDioServer().post("/login/refresh/token",
        data: jsonEncode({"refreshToken": refreshToken}));
  }

  Future<Response> getCheckTokenExpired() async {
    return await MyDio.createDioServer()
        .post("/login/checktokenexpired", data: jsonEncode({}));
  }

  Future<Response> setResumeImage({required String base64Image}) async {
    return await MyDio.createDioServer().post("/resume/imageuploadresume",
        data: jsonEncode({"base64": base64Image}));
  }

  Future<Response> setEditAboutMeResume({
    required String detailsTH,
    required String detailsEN,
  }) async {
    print("object");
    print(detailsTH);
    print(detailsEN);
    return await MyDio.createDioServer().post("/resume/editaboutmeresume",
        data: jsonEncode({"detailsth": detailsTH, "detailsen": detailsEN}));
  }

  Future<Response> setEditUserInfoResume({
    required String prefixId,
    required String name,
    required String lastName,
    required String nameEN,
    required String lastNameEN,
  }) async {
    print("sentEditUserInfoResume");
    print(
        " prefix: $prefixId ,name: $name,lastName: $lastName,nameEN: $nameEN,lastNameEN: $lastNameEN");

    return await MyDio.createDioServer().post("/resume/edituserinforesume",
        data: jsonEncode({
          "prefixid": prefixId,
          "name_th": name,
          "lastname_th": lastName,
          "name_en": nameEN,
          "lastname_en": lastNameEN
        }));
  }

  Future<Response> setEditPositionResume({
    required String positionTH,
    required String positionEN,
    required bool edit,
    required int id,
    required int orderChoose,
    required String officeTH,
    required String officeEN,
  }) async {
    print(edit);
    print(id);
    print(orderChoose);
    print(positionTH);
    print(positionEN);
    print(officeTH);
    print(officeEN);
    return await MyDio.createDioServer().post("/resume/editpositionresume",
        data: jsonEncode({
          "edit": edit,
          "id": id,
          "orderchoose": orderChoose,
          "position_th": positionTH,
          "position_en": positionEN,
          "office_th": officeTH,
          "office_en": officeEN,
          "detail_th": "string",
          "detail_en": "string"
        }));
  }

  Future<Response> setEditContactResume({
    required String email,
    required String phone,
    required String facebook,
    required String line,
    required String instagram,
    required String twitter,
    required String youtube,
  }) async {
    return await MyDio.createDioServer().post("/resume/editcontactresume",
        data: jsonEncode({
          "email": email,
          "phone": phone,
          "facebook": facebook,
          "line": line,
          "instagram": instagram,
          "twitter": twitter,
          "youtube": youtube
        }));
  }

  Future<Response> setEditAddressResume({
    required String house,
    required String moo,
    required String soiTH,
    required String roadTH,
    required String soiEN,
    required String roadEN,
    required String subDistrictID,
    required String districtID,
    required String provinceID,
    required String zipcode,
  }) async {
    print(jsonEncode({
      "number": house,
      "moo": moo,
      "soi_th": soiTH,
      "soi_en": soiEN,
      "road_th": roadTH,
      "road_en": roadEN,
      "subdistrict_id": subDistrictID,
      "district_id": districtID,
      "province_id": provinceID,
      "zipcode": zipcode
    }));
    return await MyDio.createDioServer().post("/resume/editaddressresume",
        data: jsonEncode({
          "number": house,
          "moo": moo,
          "soi_th": soiTH,
          "soi_en": soiEN,
          "road_th": roadTH,
          "road_en": roadEN,
          "subdistrict_id": subDistrictID,
          "district_id": districtID,
          "province_id": provinceID,
          "zipcode": zipcode
        }));
  }

  Future<Response> setEditCertificateResume(
      {required bool edit,
      required int id,
      required int orderChoose,
      required String title,
      required String titleEN,
      required String description,
      required String descriptionEN}) async {
    return await MyDio.createDioServer().post("/resume/editcertificateresume",
        data: jsonEncode({
          "edit": edit,
          "id": id,
          "orderchoose": orderChoose,
          "title_th": title,
          "title_en": titleEN,
          "description_th": description,
          "description_en": descriptionEN
        }));
  }

  Future<Response> setEditSkillResume(
      {required bool edit,
      required int id,
      required int orderChoose,
      required String skill,
      required String skillEN,
      required String descriptionTH,
      required String descriptionEN,
      required String value}) async {
    return await MyDio.createDioServer().post("/resume/editskillresume",
        data: jsonEncode({
          "edit": edit,
          "id": id,
          "orderchoose": orderChoose,
          "value": value,
          "skill_th": skill,
          "skill_en": skillEN,
          "description_th": descriptionTH,
          "description_en": descriptionEN
        }));
  }

  Future<Response> setEditSkillLanguageResume(
      {required bool edit,
      required int id,
      required int orderChoose,
      required String language,
      required String languageEN,
      required String descriptionTH,
      required String descriptionEN,
      required String value}) async {
    return await MyDio.createDioServer().post("/resume/editskilllanguageresume",
        data: jsonEncode({
          "edit": edit,
          "id": id,
          "orderchoose": orderChoose,
          "value": value,
          "language_th": language,
          "language_en": languageEN,
          "description_th": descriptionTH,
          "description_en": descriptionEN
        }));
  }

  Future<Response> setEditExperienceResume(
      {required bool edit,
      required int id,
      required int orderChoose,
      required String startDate,
      required String endDate,
      required String positionTH,
      required String positionEN,
      required String detailTH,
      required String detailEN}) async {
    return await MyDio.createDioServer().post("/resume/editexperienceresume",
        data: jsonEncode({
          "edit": edit,
          "id": id,
          "orderchoose": orderChoose,
          "startdate": startDate,
          "enddate": endDate,
          "position_th": positionTH,
          "position_en": positionEN,
          "detail_th": detailTH,
          "detail_en": detailEN
        }));
  }

  Future<Response> setEditEducationResume(
      {required bool edit,
      required int id,
      required int orderChoose,
      required String startDate,
      required String endDate,
      required String type,
      required String placeOfStudy,
      required String placeOfStudyEN,
      required String detailTH,
      required String detailEN}) async {
    return await MyDio.createDioServer().post("/resume/editeducationresume",
        data: jsonEncode({
          "edit": edit,
          "id": id,
          "orderchoose": orderChoose,
          "startdate": startDate,
          "enddate": endDate,
          "type": type,
          "placeofstudy_th": placeOfStudy,
          "placeofstudy_en": placeOfStudyEN,
          "detail_th": detailTH,
          "detail_en": detailEN
        }));
  }

  Future<Response> setScreenAboutResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/aboutmeresume",
        data: jsonEncode({"languageresume": userLanguage}));
  }

  Future<Response> setScreenUserInfoResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/userinforesume",
        data: jsonEncode({"languageresume": userLanguage}));
  }

  Future<Response> setScreenPositionResume({required int positionID}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/positionresume",
        data: jsonEncode(
            {"position_id": positionID, "languageresume": userLanguage}));
  }

  Future<Response> setScreenContactResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/contactresume",
        data: jsonEncode({"languageresume": userLanguage}));
  }

  Future<Response> setScreenEducationResume(
      {required int eduId, required String type}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/educationresume",
        data: jsonEncode(
            {"languageresume": userLanguage, "edu_id": eduId, "type": type}));
  }

  Future<Response> setScreenAddressResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/addressresume",
        data: jsonEncode({"languageresume": userLanguage}));
  }

  Future<Response> setScreenDistrictListAddressResume(
      {required String provinceId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/addressdistrictlist",
        data: jsonEncode(
            {"languageresume": userLanguage, "province_id": provinceId}));
  }

  Future<Response> setScreenTamBonListAddressResume(
      {required String districtId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/addresstambonlist",
        data: jsonEncode(
            {"languageresume": userLanguage, "district_id": districtId}));
  }

  Future<Response> setScreenZipCodeAddressResume(
      {required String subDistrictId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/addresszipcode",
        data: jsonEncode({
          "languageresume": userLanguage,
          "sub_district_id": subDistrictId
        }));
  }

  Future<Response> setScreenProvinceAddressResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/addressprovincelist",
        data: jsonEncode({"languageresume": userLanguage}));
  }

  Future<Response> setScreenCertificateResume(
      {required int certificateId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/certificateresume",
        data: jsonEncode(
            {"certificate_id": certificateId, "languageresume": userLanguage}));
  }

  Future<Response> setScreenSkillResume({required int skillId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/skillresume",
        data:
            jsonEncode({"skill_id": skillId, "languageresume": userLanguage}));
  }

  Future<Response> setScreenSkillLanguageResume(
      {required int skillLanguageId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/skilllanguageresume",
        data: jsonEncode({
          "skillanguage_id": skillLanguageId,
          "languageresume": userLanguage
        }));
  }

  Future<Response> setScreenExperienceResume(
      {required int experienceId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/resume/experienceresume",
        data: jsonEncode(
            {"experience_id": experienceId, "languageresume": userLanguage}));
  }

  Future<Response> getOnSelectedResume() async {
    return await MyDio.createDioServer()
        .post("/resume/onselectresume", data: jsonEncode({}));
  }

  Future<Response> setOnSelectedResume({
    required List<OnSelect> positionOnSelect,
    required List<OnSelect> educationHSCOnSelect,
    required List<OnSelect> educationBDOnSelect,
    required List<OnSelect> educationMDOnSelect,
    required List<OnSelect> educationDDOnSelect,
    required List<OnSelect> educationHDDOnSelect,
    required List<OnSelect> socialOnSelect,
    required List<OnSelect> addressOnSelect,
    required List<OnSelect> experienceOnSelect,
    required List<OnSelect> certificateOnSelect,
    required List<OnSelect> skillOnSelect,
    required List<OnSelect> languageOnSelect,
  }) async {
    print(jsonEncode({
      "data_on_select": {
        "position_on_select": positionOnSelect,
        "experience_on_select": experienceOnSelect,
        "education_on_select": {
          "hsc_on_select": educationHSCOnSelect,
          "bd_on_select": educationBDOnSelect,
          "md_on_select": educationMDOnSelect,
          "dd_on_select": educationDDOnSelect,
          "hdd_on_select": educationHDDOnSelect
        },
        "skill_on_select": skillOnSelect,
        "certificate_on_select": certificateOnSelect,
        "language_on_select": languageOnSelect,
        "social_on_select": {
          "onselected_email": socialOnSelect[0].onselect,
          "onselected_phone": socialOnSelect[1].onselect,
          "onselected_facebook": socialOnSelect[2].onselect,
          "onselected_line": socialOnSelect[3].onselect,
          "onselected_instagram": socialOnSelect[4].onselect,
          "onselected_twitter": socialOnSelect[5].onselect,
          "onselected_youtube": socialOnSelect[6].onselect,
        },
        "address_on_select": {
          "onselected_number": addressOnSelect[0].onselect,
          "onselected_moo": addressOnSelect[1].onselect,
          "onselected_soi": addressOnSelect[2].onselect,
          "onselected_road": addressOnSelect[3].onselect,
          "onselected_subdistrict": addressOnSelect[4].onselect,
          "onselected_district": addressOnSelect[5].onselect,
          "onselected_province": addressOnSelect[6].onselect,
          "onselected_zipcode": addressOnSelect[7].onselect,
        }
      }
    }));
    return await MyDio.createDioServer().post("/resume/setonselectresume",
        data: jsonEncode({
          "data_on_select": {
            "position_on_select": positionOnSelect,
            "experience_on_select": experienceOnSelect,
            "education_on_select": {
              "hsc_on_select": educationHSCOnSelect,
              "bd_on_select": educationBDOnSelect,
              "md_on_select": educationMDOnSelect,
              "dd_on_select": educationDDOnSelect,
              "hdd_on_select": educationHDDOnSelect
            },
            "skill_on_select": skillOnSelect,
            "certificate_on_select": certificateOnSelect,
            "language_on_select": languageOnSelect,
            "social_on_select": {
              "onselected_email": socialOnSelect[0].onselect,
              "onselected_phone": socialOnSelect[1].onselect,
              "onselected_facebook": socialOnSelect[2].onselect,
              "onselected_line": socialOnSelect[3].onselect,
              "onselected_instagram": socialOnSelect[4].onselect,
              "onselected_twitter": socialOnSelect[5].onselect,
              "onselected_youtube": socialOnSelect[6].onselect,
            },
            "address_on_select": {
              "onselected_number": addressOnSelect[0].onselect,
              "onselected_moo": addressOnSelect[1].onselect,
              "onselected_soi": addressOnSelect[2].onselect,
              "onselected_road": addressOnSelect[3].onselect,
              "onselected_subdistrict": addressOnSelect[4].onselect,
              "onselected_district": addressOnSelect[5].onselect,
              "onselected_province": addressOnSelect[6].onselect,
              "onselected_zipcode": addressOnSelect[7].onselect,
            }
          }
        }));
  }

  Future<Response> sendColorResume(
      {required SendOnSelectColorListResume sendOnSelectColorSet}) async {
    print("jsonEncode(sendOnSelectColorSet )");
    print(jsonEncode(sendOnSelectColorSet));
    return await MyDio.createDioServer()
        .post("/resume/colorresume", data: jsonEncode(sendOnSelectColorSet));
  }
  Future<Response> generatePdfTestResume() async {
    return await MyDio.createDioServer()
        .post("/resume/generatepdftest?id=62030340",
        data: jsonEncode({
        }));
  }
}
