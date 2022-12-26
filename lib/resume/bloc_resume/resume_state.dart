part of 'resume_bloc.dart';

// @immutable
abstract class ResumeState {}

class ResumeInitial extends ResumeState {}
class ResumeInitialState  extends ResumeState {}
// class ChangPhotoResumeSuccess extends ResumeState {
//
//   final File avatarImage;
//   final String base64img;
//   ChangPhotoResumeSuccess({required this.avatarImage,required this.base64img});
// }
class ResumeError extends  ResumeState {
  String errorMessage;
  ResumeError({required this.errorMessage});
}
class   AboutMePreviewResumeLoading extends  ResumeState {}

class   AboutMePreviewResumeEndLoading extends  ResumeState {}
class  AboutMeResumeError extends  ResumeState {
  String errorMessage;
  AboutMeResumeError({required this.errorMessage});
}

class GetEditScreenAboutMeResumeSuccessState extends  ResumeState {
  GetAboutMeResumeResponse isGetAboutMeResumeResponse;
  GetEditScreenAboutMeResumeSuccessState({required this.isGetAboutMeResumeResponse});
}class SentEditAboutMeResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditAboutMeResumeSuccessState({required this.apiEditResumeResponseHead});
}
//************************************  AboutMe ******************************

class  UserInfoPreviewResumeLoading extends  ResumeState {}

class  UserInfoPreviewResumeEndLoading extends  ResumeState {}
class UserInfoResumeError extends  ResumeState {
  String errorMessage;
  UserInfoResumeError({required this.errorMessage});
}
class GetEditScreenUserInfoResumeSuccessState extends  ResumeState {
  GetUserInformationResumeResponse isGetUserInformationResumeResponse;
  GetEditScreenUserInfoResumeSuccessState({required this.isGetUserInformationResumeResponse});
}class SentEditUserInfoResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditUserInfoResumeSuccessState({required this.apiEditResumeResponseHead});
}
//************************************  UserInfo ******************************
class  AddressPreviewResumeLoading extends  ResumeState {}

class  AddressPreviewResumeEndLoading extends  ResumeState {}
class AddressResumeError extends  ResumeState {
  String errorMessage;
  AddressResumeError({required this.errorMessage});
}

class GetEditScreenAddressResumeSuccessState extends  ResumeState {
  GetAddressResumeResponse isGetAddressResumeResponse;
  GetProvinceAddressResumeResponse isGetProvinceAddressResumeResponse;
  GetEditScreenAddressResumeSuccessState({required this.isGetAddressResumeResponse , required this.isGetProvinceAddressResumeResponse});
}

class GetEditScreenDistrictAddressResumeSuccessState extends  ResumeState {
  GetDistrictListAddressResumeResponse isGetDistrictListAddressResumeResponse;
  GetEditScreenDistrictAddressResumeSuccessState({required this.isGetDistrictListAddressResumeResponse });
}

class GetEditScreenSubDistrictAddressResumeSuccessState extends  ResumeState {
  GetSubDistrictListAddressResumeResponse isGetSubDistrictListAddressResumeResponse;
  GetEditScreenSubDistrictAddressResumeSuccessState({required this.isGetSubDistrictListAddressResumeResponse });
}

class GetEditScreenZipCodeAddressResumeSuccessState extends  ResumeState {
  GetZipCodeAddressResumeResponse isGetZipCodeAddressResumeResponse;
  GetEditScreenZipCodeAddressResumeSuccessState({required this.isGetZipCodeAddressResumeResponse });
}

class SentEditAddressResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditAddressResumeSuccessState({required this.apiEditResumeResponseHead});
}

//************************************  Address ******************************
class CertificatePreviewResumeLoading extends  ResumeState {}

class CertificatePreviewResumeEndLoading extends  ResumeState {}
class CertificateResumeError extends  ResumeState {
String errorMessage;
CertificateResumeError({required this.errorMessage});
}

class SentEditCertificateResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditCertificateResumeSuccessState({required this.apiEditResumeResponseHead});
}

class GetEditScreenCertificateResumeSuccessState extends  ResumeState {
  GetCertificateResumeResponse isGetCertificateResumeResponse;

  GetEditScreenCertificateResumeSuccessState(
      {required this.isGetCertificateResumeResponse});
}
//************************************  Certificate ******************************
class EducationPreviewResumeLoading extends  ResumeState {}

class EducationPreviewResumeEndLoading extends  ResumeState {}
class EducationResumeError extends  ResumeState {
String errorMessage;
EducationResumeError({required this.errorMessage});
}

class GetEditScreenEducationResumeSuccessState extends  ResumeState {
  GetEducationResumeResponse isGetEducationResumeResponse;
  GetEditScreenEducationResumeSuccessState({required this.isGetEducationResumeResponse});
}class SentEditEducationResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditEducationResumeSuccessState({required this.apiEditResumeResponseHead});
}

//************************************  Education ******************************
class  ExperiencePreviewResumeLoading extends  ResumeState {}

class  ExperiencePreviewResumeEndLoading extends  ResumeState {}
class ExperienceResumeError extends  ResumeState {
  String errorMessage;
  ExperienceResumeError({required this.errorMessage});
}

class GetEditScreenExperienceResumeSuccessState extends  ResumeState {
  GetExperienceResumeResponse isGetExperienceResumeResponse;
  GetEditScreenExperienceResumeSuccessState({required this.isGetExperienceResumeResponse});
}class SentEditExperienceResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditExperienceResumeSuccessState({required this.apiEditResumeResponseHead});
}
//************************************  Experience ******************************
class   PositionPreviewResumeLoading extends  ResumeState {}

class   PositionPreviewResumeEndLoading extends  ResumeState {}
class  PositionResumeError extends  ResumeState {
  String errorMessage;
  PositionResumeError({required this.errorMessage});
}

class GetEditScreenPositionResumeSuccessState extends  ResumeState {
  GetPositionResumeResponse isGetPositionResumeResponse;
  GetEditScreenPositionResumeSuccessState({required this.isGetPositionResumeResponse});
}class SentEditPositionResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditPositionResumeSuccessState({required this.apiEditResumeResponseHead});
}
//************************************  Position ******************************
class    SkillPreviewResumeLoading extends  ResumeState {}

class    SkillPreviewResumeEndLoading extends  ResumeState {}
class   SkillResumeError extends  ResumeState {
  String errorMessage;
  SkillResumeError({required this.errorMessage});
}
class SentEditSkillResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditSkillResumeSuccessState({required this.apiEditResumeResponseHead});
}

class GetEditScreenSkillResumeSuccessState extends  ResumeState {
  GetSkillResumeResponse isGetSkillResumeResponse;

  GetEditScreenSkillResumeSuccessState(
      {required this.isGetSkillResumeResponse});
}


//************************************  Skill ******************************
class    SkillLanguagePreviewResumeLoading extends  ResumeState {}

class    SkillLanguagePreviewResumeEndLoading extends  ResumeState {}
class   SkillLanguageResumeError extends  ResumeState {
  String errorMessage;
  SkillLanguageResumeError({required this.errorMessage});
}
class SentEditSkillLanguageResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditSkillLanguageResumeSuccessState({required this.apiEditResumeResponseHead});
}

class GetEditScreenSkillLanguageResumeSuccessState extends  ResumeState {
  GetSkillLanguageResumeResponse isGetSkillLanguageResumeResponse;

  GetEditScreenSkillLanguageResumeSuccessState(
      {required this.isGetSkillLanguageResumeResponse});
}

//************************************  SkillLanguage ******************************




class  ResumeLoading extends  ResumeState {}

class  ResumeEndLoading extends  ResumeState {}
class PreviewResumeError extends  ResumeState {
  String errorMessage;
  PreviewResumeError({required this.errorMessage});
}
class  PreviewResumeLoading extends  ResumeState {}

class  PreviewResumeEndLoading extends  ResumeState {}
class PreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  PreviewResumeSuccessState({required this.isPreViewResumeResponse});
}
class OnSelectedAndPreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  // GetOnSelectedResume isGetOnSelectedResume;

  OnSelectedAndPreviewResumeSuccessState({required this.isPreViewResumeResponse});
}

class SetPreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  SetPreviewResumeSuccessState({required this.isPreViewResumeResponse});
}

class ChangeLanguagePreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  ChangeLanguagePreviewResumeSuccessState({required this.isPreViewResumeResponse});
}

// class ChooseImageUpLoadResumeSuccess extends ResumeState {
//   final File avatarImage;
//   final String base64img;
//   ChooseImageUpLoadResumeSuccess({required this.avatarImage,required this.base64img});
// }

class  EditPreviewResumeLoading extends  ResumeState {}

class  EditPreviewResumeEndLoading extends  ResumeState {}
class  EditAboutResumeSuccessState extends  ResumeState {}

class EditPreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  EditPreviewResumeSuccessState({required this.isPreViewResumeResponse});
}

class EditChangeLanguagePreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  EditChangeLanguagePreviewResumeSuccessState({required this.isPreViewResumeResponse});
}
class EditPreviewResumeError extends  ResumeState {
  String errorMessage;
  EditPreviewResumeError({required this.errorMessage});
}

class EditChooseImageUpLoadResumeSuccess extends ResumeState {
  final File avatarImage;
  final String base64img;
  EditChooseImageUpLoadResumeSuccess({required this.avatarImage,required this.base64img});
}
class SentEditContactResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditContactResumeSuccessState({required this.apiEditResumeResponseHead});
}
class SetOnSelectedResumeSuccessState extends  ResumeState {
  SetOnSelectedResume isSetOnSelectedResume;
  SetOnSelectedResumeSuccessState({required this.isSetOnSelectedResume});
}
class SetOnSelectedAndGenResumeSuccessState extends  ResumeState {
  SetOnSelectedResume isSetOnSelectedResume;
  SetOnSelectedAndGenResumeSuccessState({required this.isSetOnSelectedResume});
}
