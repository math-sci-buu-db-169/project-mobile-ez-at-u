part of 'resume_bloc.dart';

// @immutable
abstract class ResumeEvent {}

class ChangePhotoRequest extends ResumeEvent {}

class ChangeLanguageResumeRequest extends ResumeEvent {}

class EditChangePhotoRequest extends ResumeEvent {}

class EditChangeLanguageResumeRequest extends ResumeEvent {}

class GetPreviewResumeEvent extends ResumeEvent {}

class GetSetPreviewResumeEvent extends ResumeEvent {}

class GetEditScreenPreviewResumeEvent extends ResumeEvent {}

class ResumeInnitEvent extends ResumeEvent {}

class SentEditAboutResumeEvent extends ResumeEvent {
  String detailsTH;
  String detailsEN;
  SentEditAboutResumeEvent({required this.detailsTH, required this.detailsEN});
}

class GetEditScreenUserInfoResumeEvent extends ResumeEvent {}

class SentEditUserInfoResumeEvent extends ResumeEvent {
  String prefix;
  String name;
  String lastName;
  String prefixEN;
  String nameEN;
  String lastNameEN;

  SentEditUserInfoResumeEvent(
      {required this.prefix,
      required this.name,
      required this.lastName,
      required this.prefixEN,
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

class GetEditScreenPositionsResumeEvent extends ResumeEvent {}

class SentEditPositionsResumeEvent extends ResumeEvent {
  String positionControllerTH;
  String positionControllerEN;
  String officeControllerTH;
  String officeControllerEN;

  SentEditPositionsResumeEvent(
      {required this.positionControllerTH,
      required this.positionControllerEN,
      required this.officeControllerTH,
      required this.officeControllerEN});
}

class GetEditScreenEducationResumeEvent extends ResumeEvent {}

class SentEditEducationResumeEvent extends ResumeEvent {
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

class GetEditScreenExperienceResumeEvent extends ResumeEvent {}

class SentEditExperienceResumeEvent extends ResumeEvent {
  int id;
  int orderChoose;
  String startDate;
  String endDate;
  String positionTH;
  String positionEN;
  String detailTH;
  String detailEN;

  SentEditExperienceResumeEvent(
      {required this.id,
      required this.orderChoose,
      required this.startDate,
      required this.endDate,
      required this.positionTH,
      required this.positionEN,
      required this.detailTH,
      required this.detailEN});
}

class GetEditScreenCertificateResumeEvent extends ResumeEvent {}

class SentEditCertificateResumeEvent extends ResumeEvent {
  int id;
  int orderChoose;
  String titleTH;
  String titleEN;
  String detailTH;
  String detailEN;

  SentEditCertificateResumeEvent(
      {required this.id,
      required this.orderChoose,
      required this.titleTH,
      required this.titleEN,
      required this.detailTH,
      required this.detailEN});
}

class GetEditScreenSkillLanguageResumeEvent extends ResumeEvent {}

class SentEditSkillLanguageResumeEvent extends ResumeEvent {
  int id;
  int orderChoose;
  String languageTH;
  String languageEN;
  String detailTH;
  String detailEN;
  String valueLanguage;

  SentEditSkillLanguageResumeEvent(
      {required this.id,
      required this.orderChoose,
      required this.languageTH,
      required this.languageEN,
      required this.detailTH,
      required this.detailEN,
      required this.valueLanguage});
}
class GetEditScreenSkillResumeEvent extends ResumeEvent {}

class SentEditSkillResumeEvent extends ResumeEvent {
  int id;
  int orderChoose;
  String skillTH;
  String skillEN;
  String detailTH;
  String detailEN;
  String valueSkill;

  SentEditSkillResumeEvent(
      {required this.id,
        required this.orderChoose,
        required this.skillTH,
        required this.skillEN,
        required this.detailTH,
        required this.detailEN,
        required this.valueSkill});
}
