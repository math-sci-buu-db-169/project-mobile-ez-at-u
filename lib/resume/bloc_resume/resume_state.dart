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

class  ResumeLoading extends  ResumeState {}

class  ResumeEndLoading extends  ResumeState {}
class PreviewResumeError extends  ResumeState {
  String errorMessage;
  PreviewResumeError({required this.errorMessage});
}class SkillLanguageResumeError extends  ResumeState {
  String errorMessage;
  SkillLanguageResumeError({required this.errorMessage});
}

class  PreviewResumeLoading extends  ResumeState {}

class  PreviewResumeEndLoading extends  ResumeState {}

class  SkillLanguageResumeLoading extends  ResumeState {}

class  SkillLanguageResumeEndLoading extends  ResumeState {}
class PreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  PreviewResumeSuccessState({required this.isPreViewResumeResponse});
}
class OnSelectedAndPreviewResumeSuccessState extends  ResumeState {
  PreViewResumeResponse isPreViewResumeResponse;
  GetOnSelectedResume isGetOnSelectedResume;

  OnSelectedAndPreviewResumeSuccessState({required this.isPreViewResumeResponse , required this.isGetOnSelectedResume});
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
class GetEditScreenUserInfoResumeSuccessState extends  ResumeState {
  GetUserInformationResumeResponse isGetUserInformationResumeResponse;
  GetEditScreenUserInfoResumeSuccessState({required this.isGetUserInformationResumeResponse});
}class SentEditUserInfoResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditUserInfoResumeSuccessState({required this.apiEditResumeResponseHead});
}
class GetEditScreenAboutMeResumeSuccessState extends  ResumeState {
  GetAboutMeResumeResponse isGetEducationResumeResponse;
  GetEditScreenAboutMeResumeSuccessState({required this.isGetEducationResumeResponse});
}class SentEditAboutMeResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditAboutMeResumeSuccessState({required this.apiEditResumeResponseHead});
}
class GetEditScreenPositionResumeSuccessState extends  ResumeState {
  GetPositionResumeResponse isGetPositionResumeResponse;
  GetEditScreenPositionResumeSuccessState({required this.isGetPositionResumeResponse});
}class SentEditPositionResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditPositionResumeSuccessState({required this.apiEditResumeResponseHead});
}
class GetEditScreenEducationResumeSuccessState extends  ResumeState {
  GetEducationResumeResponse isGetEducationResumeResponse;
  GetEditScreenEducationResumeSuccessState({required this.isGetEducationResumeResponse});
}class SentEditEducationResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditEducationResumeSuccessState({required this.apiEditResumeResponseHead});
}
class GetEditScreenExperienceResumeSuccessState extends  ResumeState {
  GetExperienceResumeResponse isGetExperienceResumeResponse;
  GetEditScreenExperienceResumeSuccessState({required this.isGetExperienceResumeResponse});
}class SentEditExperienceResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditExperienceResumeSuccessState({required this.apiEditResumeResponseHead});
}
class SentEditContactResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditContactResumeSuccessState({required this.apiEditResumeResponseHead});
}
class SentEditCertificateResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditCertificateResumeSuccessState({required this.apiEditResumeResponseHead});
}

class GetEditScreenCertificateResumeSuccessState extends  ResumeState {
  GetCertificateResumeResponse isGetCertificateResumeResponse;

  GetEditScreenCertificateResumeSuccessState(
      {required this.isGetCertificateResumeResponse});
}class SentEditSkillLanguageResumeSuccessState extends  ResumeState {
  ApiEditResumeResponseHead apiEditResumeResponseHead;
  SentEditSkillLanguageResumeSuccessState({required this.apiEditResumeResponseHead});
}

class GetEditScreenSkillLanguageResumeSuccessState extends  ResumeState {
  GetSkillLanguageResumeResponse isGetSkillLanguageResumeResponse;

  GetEditScreenSkillLanguageResumeSuccessState(
      {required this.isGetSkillLanguageResumeResponse});
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
