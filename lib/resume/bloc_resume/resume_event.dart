part of 'resume_bloc.dart';

// @immutable
abstract class ResumeEvent {}

// class ChangePhotoRequest extends ResumeEvent {}

class ChangeLanguageResumeRequest extends ResumeEvent {}

class EditChangePhotoRequest extends ResumeEvent {}

class EditChangeLanguageResumeRequest extends ResumeEvent {}

// class GetPreviewResumeEvent extends ResumeEvent {}
class GetOnSelectedAndPreviewResumeEvent extends ResumeEvent {}
class SetOnSelectedAndPreviewResumeEvent extends ResumeEvent {
  List<OnSelect> positionOnSelect;
  List<OnSelect> educationHSCOnSelect;
  List<OnSelect> educationBDOnSelect ;
  List<OnSelect> educationMDOnSelect ;
  List<OnSelect> educationDDOnSelect ;
  List<OnSelect> educationHDDOnSelect ;
  List<OnSelect> socialOnSelect ;
  List<OnSelect> addressOnSelect;
  List<OnSelect> experienceOnSelect ;
  List<OnSelect> certificateOnSelect ;
  List<OnSelect> skillOnSelect ;
  List<OnSelect> languageOnSelect ;
  SendOnSelectColorListResume sendOnSelectColorSet ;
  SetOnSelectedAndPreviewResumeEvent({
    required  this.positionOnSelect,
    required  this.educationHSCOnSelect,
    required  this.educationBDOnSelect ,
    required  this.educationMDOnSelect ,
    required  this.educationDDOnSelect ,
    required  this.educationHDDOnSelect ,
    required  this.socialOnSelect ,
    required  this.addressOnSelect,
    required  this.experienceOnSelect ,
    required  this.certificateOnSelect ,
    required  this.skillOnSelect ,
    required  this.languageOnSelect,
    required  this. sendOnSelectColorSet ,});
}class SetOnSelectedAndGenPreviewResumeEvent extends ResumeEvent {
  List<OnSelect> positionOnSelect;
  List<OnSelect> educationHSCOnSelect;
  List<OnSelect> educationBDOnSelect ;
  List<OnSelect> educationMDOnSelect ;
  List<OnSelect> educationDDOnSelect ;
  List<OnSelect> educationHDDOnSelect ;
  List<OnSelect> socialOnSelect ;
  List<OnSelect> addressOnSelect;
  List<OnSelect> experienceOnSelect ;
  List<OnSelect> certificateOnSelect ;
  List<OnSelect> skillOnSelect ;
  List<OnSelect> languageOnSelect ;
  SendOnSelectColorListResume sendOnSelectColorSet ;
  SetOnSelectedAndGenPreviewResumeEvent({
    required  this.positionOnSelect,
    required  this.educationHSCOnSelect,
    required  this.educationBDOnSelect ,
    required  this.educationMDOnSelect ,
    required  this.educationDDOnSelect ,
    required  this.educationHDDOnSelect ,
    required  this.socialOnSelect ,
    required  this.addressOnSelect,
    required  this.experienceOnSelect ,
    required  this.certificateOnSelect ,
    required  this.skillOnSelect ,
    required  this.languageOnSelect,
    required  this. sendOnSelectColorSet ,});
}

class GetSetPreviewResumeEvent extends ResumeEvent {}
class GeneratePdfTestResumeEvent extends ResumeEvent {}

class GetEditScreenPreviewResumeEvent extends ResumeEvent {}
class GetEditScreenAddressResumeEvent extends ResumeEvent {}
class GetEditScreenDistrictAddressResumeEvent extends ResumeEvent {
  String provinceId;
  GetEditScreenDistrictAddressResumeEvent({required this.provinceId});
}
class GetEditScreenTamBonAddressResumeEvent extends ResumeEvent {
  String tamBonId;
  GetEditScreenTamBonAddressResumeEvent({required this.tamBonId});
}
class GetEditScreenZipCodeAddressResumeEvent extends ResumeEvent {
  String subDistrictID;
  GetEditScreenZipCodeAddressResumeEvent({required this.subDistrictID});
}
class SendEditAddressResumeEvent extends ResumeEvent {
   String house;
   String moo;
   String soiTH;
   String roadTH;
   String soiEN;
   String roadEN;
   String subDistrictID;
   String districtID;
   String provinceID;
   String zipcode;
   SendEditAddressResumeEvent({
     required this. house,
     required this. moo,
     required this. soiTH,
     required this. roadTH,
     required this. soiEN,
     required this. roadEN,
     required this. subDistrictID,
     required this. districtID,
     required this. provinceID,
     required this. zipcode,});
}
class ResumeInnitEvent extends ResumeEvent {}

class SentEditAboutResumeEvent extends ResumeEvent {
  String detailsTH;
  String detailsEN;
  SentEditAboutResumeEvent({required this.detailsTH, required this.detailsEN});
}

class GetEditScreenUserInfoResumeEvent extends ResumeEvent {}

class SentEditUserInfoResumeEvent extends ResumeEvent {
  String prefixId;
  String name;
  String lastName;
  String nameEN;
  String lastNameEN;

  SentEditUserInfoResumeEvent(
      {required this.prefixId,
      required this.name,
      required this.lastName,
      required this.nameEN,
      required this.lastNameEN});
}

class GetEditScreenAboutMeResumeEvent extends ResumeEvent {}

class SentEditAboutMeResumeEvent extends ResumeEvent {
  String aboutMeControllerTH;
  String aboutMeControllerEN;

  SentEditAboutMeResumeEvent(
      {required this.aboutMeControllerTH, required this.aboutMeControllerEN});
}

class GetEditScreenPositionsResumeEvent extends ResumeEvent {

  int positionID;

  GetEditScreenPositionsResumeEvent(
      {required this.positionID});
}

class SentEditPositionsResumeEvent extends ResumeEvent {
  bool edit;
  int positionsId;
  int orderChoose;
  String positionControllerTH;
  String positionControllerEN;
  String officeControllerTH;
  String officeControllerEN;

  SentEditPositionsResumeEvent(
      {required this.edit,
        required this.positionsId,
        required this.orderChoose,
        required this.positionControllerTH,
      required this.positionControllerEN,
      required this.officeControllerTH,
      required this.officeControllerEN});
}

class GetEditScreenEducationResumeEvent extends ResumeEvent {
int eduId;
String type;

GetEditScreenEducationResumeEvent({
  required this.eduId,
  required this.type,
});
}

class SentEditEducationResumeEvent extends ResumeEvent {
  bool edit;
  int id;
  int orderChoose;
  String startDate;
  String endDate;
  String type;
  String placeOfStudy;
  String placeOfStudyEN;
  String detailTH;
  String detailEN;

  SentEditEducationResumeEvent({
    required this.edit,
    required this.id,
    required this.orderChoose,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.placeOfStudy,
    required this.placeOfStudyEN,
    required this.detailTH,
    required this.detailEN,
  });
}

class SentEditContactResumeEvent extends ResumeEvent {
  String email;
  String phone;
  String facebook;
  String line;
  String instagram;
  String twitter;
  String youtube;

  SentEditContactResumeEvent({
    required this.email,
    required this.phone,
    required this.facebook,
    required this.line,
    required this.instagram,
    required this.twitter,
    required this.youtube,
  });
}

class GetEditScreenExperienceResumeEvent extends ResumeEvent {
  int id;
  GetEditScreenExperienceResumeEvent(
      {required this.id,});
}

class SentEditExperienceResumeEvent extends ResumeEvent {
  bool edit;
  int id;
  int orderChoose;
  String startDate;
  String endDate;
  String positionTH;
  String positionEN;
  String detailTH;
  String detailEN;

  SentEditExperienceResumeEvent(
      {required this.edit,
      required this.id,
      required this.orderChoose,
      required this.startDate,
      required this.endDate,
      required this.positionTH,
      required this.positionEN,
      required this.detailTH,
      required this.detailEN});
}

class GetEditScreenCertificateResumeEvent extends ResumeEvent {
  int id;
  GetEditScreenCertificateResumeEvent(
      {required this.id,});
}


class SentEditCertificateResumeEvent extends ResumeEvent {
  bool edit;
  int id;
  int orderChoose;
  String titleTH;
  String titleEN;
  String detailTH;
  String detailEN;

  SentEditCertificateResumeEvent(
      {required this.edit,
        required this.id,
      required this.orderChoose,
      required this.titleTH,
      required this.titleEN,
      required this.detailTH,
      required this.detailEN});
}

class GetEditScreenSkillLanguageResumeEvent extends ResumeEvent {
  int id;
  GetEditScreenSkillLanguageResumeEvent(
      {required this.id,});
}

class SentEditSkillLanguageResumeEvent extends ResumeEvent {
  bool edit;
  int id;
  int orderChoose;
  String languageTH;
  String languageEN;
  String detailTH;
  String detailEN;
  String valueLanguage;

  SentEditSkillLanguageResumeEvent(
      {required this.edit,
        required this.id,
      required this.orderChoose,
      required this.languageTH,
      required this.languageEN,
      required this.detailTH,
      required this.detailEN,
      required this.valueLanguage});
}
class GetEditScreenSkillResumeEvent extends ResumeEvent {
  int id;
  GetEditScreenSkillResumeEvent(
      {required this.id,});
}

class SentEditSkillResumeEvent extends ResumeEvent {
  bool edit;
  int id;
  int orderChoose;
  String skillTH;
  String skillEN;
  String detailTH;
  String detailEN;
  String valueSkill;

  SentEditSkillResumeEvent(
      {required this.edit,
        required this.id,
        required this.orderChoose,
        required this.skillTH,
        required this.skillEN,
        required this.detailTH,
        required this.detailEN,
        required this.valueSkill});
}

class SendColorResumeEvent extends ResumeEvent {
  int id;
  SendColorResumeEvent(
      {required this.id,});
}
