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
    String resumeLanguage = prefs.getString('userLanguageResume')??"";
    print("resumeLanguage  getPreviewResumeDataAndScreen ============ $resumeLanguage");
    return await MyDio.createDioServer().post("/api/resume/previewresume",
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
  }

  Future<Response> getCheckTokenExpired() async {
    return await MyDio.createDioServer().post("/login/checktokenexpired",
        data: jsonEncode({
        })
    );
  }
  Future<Response> sentResumeImage({required String base64Image}) async {
    return await MyDio.createDioServer().post("/api/resume/imageuploadresume",
        data: jsonEncode({
          "base64": base64Image
        })
    );
  }
  Future<Response> sentEditAboutMeResume({required String detailsTH,required String detailsEN,}) async {
    print("object");
    print(detailsTH);
    print(detailsEN);
    return await MyDio.createDioServer().post("/api/resume/editaboutmeresume",
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

    return await MyDio.createDioServer().post("/api/resume/edituserinforesume",
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
    required bool edit,
    required int id,
    required int orderChoose,

    required String officeTH,required String officeEN,}) async {
    print(edit);
    print(id);
    print(orderChoose);
    print(positionTH);
    print(positionEN);
    print(officeTH);
    print(officeEN);
    return await MyDio.createDioServer().post("/api/resume/editpositionresume",
        data: jsonEncode({
          "edit": edit,
          "id": id,
          "orderchoose": orderChoose,
          "position_th": positionTH,
          "position_en": positionEN,
          "office_th": officeTH,
          "office_en":officeEN,
          "detail_th": "string",
          "detail_en": "string"

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
    return await MyDio.createDioServer().post("/api/resume/editcontactresume",
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
    required String house,
    required String moo,
    required String soiTH,
    required String roadTH,
    required String soiEN,
    required String roadEN,
    required String subDistrictID,
    required String districtID,
    required String provinceID,
    required String zipcode,}) async {
    print(
        jsonEncode({


          "number": house,
          "moo": moo,
          "soi_th": soiTH,
          "soi_en": soiEN,
          "road_th": roadTH,
          "road_en": roadEN,
          "subdistrict_id": subDistrictID,
          "district_id":districtID,
          "province_id": provinceID,
          "zipcode": zipcode


        })
    );
    return await MyDio.createDioServer().post("/api/resume/editaddressresume",


        data: jsonEncode({


            "number": house,
            "moo": moo,
            "soi_th": soiTH,
            "soi_en": soiEN,
            "road_th": roadTH,
            "road_en": roadEN,
            "subdistrict_id": subDistrictID,
            "district_id":districtID,
            "province_id": provinceID,
            "zipcode": zipcode


        })
    );
  }Future<Response> sentEditCertificateResume({
    required bool edit,
    required int id,
    required int orderChoose,
    required String title,
    required String titleEN,
    required String description,
    required String descriptionEN}) async {
    return await MyDio.createDioServer().post("/api/resume/editcertificateresume",
        data: jsonEncode({
          "edit": edit,
          "id": id ,
          "orderchoose": orderChoose,
          "title_th": title,
          "title_en": titleEN,
          "description_th": description,
          "description_en": descriptionEN

        })
    );
  }Future<Response> sentEditSkillResume({
    required bool edit,
    required int id,
    required int orderChoose,
    required String skill,
    required String skillEN,
    required String descriptionTH,
    required String descriptionEN,
    required String value}) async {
    return await MyDio.createDioServer().post("/api/resume/editskillresume",
        data: jsonEncode({

          "edit": edit,
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
    required bool edit,
    required int id,
    required int orderChoose,
    required String language,
    required String languageEN,
    required String descriptionTH,
    required String descriptionEN,
    required String value}) async {
    return await MyDio.createDioServer().post("/api/resume/editskilllanguageresume",
        data: jsonEncode({

          "edit": edit,
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
    required bool edit,
    required int id,
    required int orderChoose,
    required String startDate,
    required String endDate,
    required String positionTH,
    required String positionEN,
    required String detailTH,
    required String detailEN}) async {
    return await MyDio.createDioServer().post("/api/resume/editexperienceresume",
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

        })
    );
  }
  Future<Response> sentEditEducationResume({
    required bool edit,
    required int id,
    required int orderChoose,
    required String startDate,
    required String endDate,
    required String type,
    required String placeOfStudy,
    required String placeOfStudyEN,
    required String detailTH,
    required String detailEN}) async {
    return await MyDio.createDioServer().post("/api/resume/editeducationresume",
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

        })
    );
  }


  Future<Response> sentScreenAboutResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/aboutmeresume",
        data: jsonEncode({
          "languageresume": userLanguage
        })
    );
  }
  Future<Response> sentScreenUserInfoResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/userinforesume",
        data: jsonEncode({
          "languageresume": userLanguage
        })
    );
  }

  Future<Response> sentScreenPositionResume({required int positionID }) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/positionresume",
        data: jsonEncode({
          "position_id":positionID,
          "languageresume": userLanguage

        })
    );
  }
  Future<Response> sentScreenContactResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/contactresume",
        data: jsonEncode({
          "languageresume": userLanguage

        })
    );
  }
  Future<Response> sentScreenEducationResume({required int eduId ,required String type}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/educationresume",
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

    return await MyDio.createDioServer().post("/api/resume/addressresume",
        data: jsonEncode({
          "languageresume": userLanguage

        })
    );
  }
  Future<Response> sentScreenDistrictListAddressResume ({required String provinceId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/addressdistrictlist",
        data: jsonEncode({
          "languageresume": userLanguage,
            "province_id": provinceId

        })
    );
  }
  Future<Response> sentScreenTamBonListAddressResume ({required String districtId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/addresstambonlist",
        data: jsonEncode({
          "languageresume": userLanguage,
            "district_id": districtId

        })
    );
  }
  Future<Response> sentScreenZipCodeAddressResume ({required String subDistrictId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/addresszipcode",
        data: jsonEncode({
          "languageresume": userLanguage,
            "sub_district_id": subDistrictId

        })
    );
  }
  Future<Response> sentScreenProvinceAddressResume() async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/addressprovincelist",
        data: jsonEncode({
          "languageresume": userLanguage

        })
    );
  }
  Future<Response> sentScreenCertificateResume({required int certificateId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/certificateresume",
        data: jsonEncode({
          "certificate_id": certificateId,
          "languageresume": userLanguage
        })
    );
  }Future<Response> sentScreenSkillResume({required int skillId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/skillresume",
        data: jsonEncode({
          "skill_id":skillId,
          "languageresume": userLanguage
        })
    );
  }Future<Response> sentScreenSkillLanguageResume({required int skillLanguageId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/skilllanguageresume",
        data: jsonEncode({
          "skillanguage_id": skillLanguageId,
          "languageresume": userLanguage

        })
    );
  }Future<Response> sentScreenExperienceResume({required int experienceId}) async {
    prefs = await SharedPreferences.getInstance();
    String? userLanguage = prefs.getString('userLanguageResume');

    return await MyDio.createDioServer().post("/api/resume/experienceresume",
        data: jsonEncode({

          "experience_id": experienceId,
          "languageresume": userLanguage

        })
    );
  }
  Future<Response> getOnSelectedResume() async {
    return await MyDio.createDioServer().post("/api/resume/onselectresume",
        data: jsonEncode({
        })
    );
  }
  Future<Response> setOnSelectedResume({
  required List<OnSelect> positionOnSelect,
  required List<OnSelect> educationHSCOnSelect,
  required List<OnSelect> educationBDOnSelect ,
  required List<OnSelect> educationMDOnSelect ,
  required List<OnSelect> educationDDOnSelect ,
  required List<OnSelect> educationHDDOnSelect ,
  required List<OnSelect> socialOnSelect ,
  required List<OnSelect> addressOnSelect,
  required List<OnSelect> experienceOnSelect ,
  required List<OnSelect> certificateOnSelect ,
  required List<OnSelect> skillOnSelect ,
  required List<OnSelect> languageOnSelect ,

}) async {
    print(jsonEncode({
      "data_on_select": {
        "position_on_select": positionOnSelect,
        "experience_on_select": experienceOnSelect,
        "education_on_select": {
          "hsc_on_select": educationHSCOnSelect,
          "bd_on_select": educationBDOnSelect,
          "md_on_select": educationMDOnSelect,
          "dd_on_select":educationDDOnSelect,
          "hdd_on_select": educationHDDOnSelect
        },
        "skill_on_select": skillOnSelect,
        "certificate_on_select": certificateOnSelect,
        "language_on_select": languageOnSelect,
        "social_on_select": {
          "onselected_email": socialOnSelect[0].onselect,
          "onselected_phone":  socialOnSelect[1].onselect,
          "onselected_facebook":  socialOnSelect[2].onselect,
          "onselected_line": socialOnSelect[3].onselect,
          "onselected_instagram":  socialOnSelect[4].onselect,
          "onselected_twitter": socialOnSelect[5].onselect,
          "onselected_youtube":  socialOnSelect[6].onselect,
        },
        "address_on_select": {
          "onselected_number": addressOnSelect[0].onselect,
          "onselected_moo":  addressOnSelect[1].onselect,
          "onselected_soi":  addressOnSelect[2].onselect,
          "onselected_road": addressOnSelect[3].onselect,
          "onselected_subdistrict":  addressOnSelect[4].onselect,
          "onselected_district": addressOnSelect[5].onselect,
          "onselected_province":  addressOnSelect[6].onselect,
          "onselected_zipcode": addressOnSelect[7].onselect,
        }
      }
    }
    ));
    return await MyDio.createDioServer().post("/api/resume/setonselectresume",

        data: jsonEncode({
          "data_on_select": {
            "position_on_select": positionOnSelect,
            "experience_on_select": experienceOnSelect,
            "education_on_select": {
              "hsc_on_select": educationHSCOnSelect,
              "bd_on_select": educationBDOnSelect,
              "md_on_select": educationMDOnSelect,
              "dd_on_select":educationDDOnSelect,
              "hdd_on_select": educationHDDOnSelect
            },
            "skill_on_select": skillOnSelect,
            "certificate_on_select": certificateOnSelect,
            "language_on_select": languageOnSelect,
            "social_on_select": {
              "onselected_email": socialOnSelect[0].onselect,
              "onselected_phone":  socialOnSelect[1].onselect,
              "onselected_facebook":  socialOnSelect[2].onselect,
              "onselected_line": socialOnSelect[3].onselect,
              "onselected_instagram":  socialOnSelect[4].onselect,
              "onselected_twitter": socialOnSelect[5].onselect,
              "onselected_youtube":  socialOnSelect[6].onselect,
            },
            "address_on_select": {
              "onselected_number": addressOnSelect[0].onselect,
              "onselected_moo":  addressOnSelect[1].onselect,
              "onselected_soi":  addressOnSelect[2].onselect,
              "onselected_road": addressOnSelect[3].onselect,
              "onselected_subdistrict":  addressOnSelect[4].onselect,
              "onselected_district": addressOnSelect[5].onselect,
              "onselected_province":  addressOnSelect[6].onselect,
              "onselected_zipcode": addressOnSelect[7].onselect,
            }
          }
        }
        )
    );
  }
}
