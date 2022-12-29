part of 'more_bloc.dart';

abstract class MoreState {}

class MoreInitial extends MoreState {}

class MoreScreenInfoSuccessState extends MoreState {
  ScreenMoreResponse responseScreenMore;

  MoreScreenInfoSuccessState({required this.responseScreenMore});
}

class MoreError extends MoreState {
  String errorMessage;
  MoreError({required this.errorMessage});
}

class MoreLoading extends MoreState {}

class MoreEndLoading extends MoreState {}

class MorePDPALoading extends MoreState {}

class MorePDPAEndLoading extends MoreState {}

class MorePDPAError extends MoreState {
  String errorMessage;
  MorePDPAError({required this.errorMessage});
}

class MorePDPASuccessState extends MoreState {
  ScreenMorePDPAResponse responsePDPA;

  MorePDPASuccessState({required this.responsePDPA});
}
// ----------------------->

class MoreFAQLoading extends MoreState {}

class MoreFAQEndLoading extends MoreState {}

class MoreFAQError extends MoreState {
  String errorMessage;
  MoreFAQError({required this.errorMessage});
}

class MoreFAQSuccessState extends MoreState {
  ScreenMoreFAQResponse responseFAQ;

  MoreFAQSuccessState({required this.responseFAQ});
}
// ----------------------->

class MoreContactUsLoading extends MoreState {}

class MoreContactUsEndLoading extends MoreState {}

class MoreContactUsError extends MoreState {
  String errorMessage;
  MoreContactUsError({required this.errorMessage});
}

class MoreContactUsSuccessState extends MoreState {
  ScreenMoreContactUsResponse responseContactUs;
  MoreContactUsSuccessState({required this.responseContactUs});
}
// ----------------------->

class MoreBoardDetailStudentLoading extends MoreState {}

class MoreBoardDetailStudentEndLoading extends MoreState {}

class MoreBoardDetailStudentError extends MoreState {
  String errorMessage;
  MoreBoardDetailStudentError({required this.errorMessage});
}

class MoreBoardDetailStudentSuccessState extends MoreState {
  ScreenMoreBoardStudentDetailResponse responseBoardDetailStudent;

  MoreBoardDetailStudentSuccessState({required this.responseBoardDetailStudent});
}
// ----------------------->

class MoreBoardListStudentLoading extends MoreState {}

class MoreBoardListStudentEndLoading extends MoreState {}

class MoreBoardListStudentError extends MoreState {
  String errorMessage;
  MoreBoardListStudentError({required this.errorMessage});
}

class MoreBoardListStudentSuccessState extends MoreState {
  ScreenMoreBoardStudentListResponse responseBoardListStudent;

  MoreBoardListStudentSuccessState({required this.responseBoardListStudent});
}class MoreBoardListStudentSearchSuccessState extends MoreState {
  ScreenMoreBoardStudentListResponse responseBoardListStudent;

  MoreBoardListStudentSearchSuccessState({required this.responseBoardListStudent});
}

// ----------------------->
class ListGenStudentLoading extends MoreState {}

class ListGenStudentEndLoading extends MoreState {}

class ListGenStudentError extends MoreState {
  String errorMessage;
  ListGenStudentError({required this.errorMessage});
}

class MoreBoardListGenStudentSuccessState extends MoreState {
  ScreenMoreListNameGenResponse responseBoardListGenStudent;

  MoreBoardListGenStudentSuccessState({required this.responseBoardListGenStudent});
}
class MoreBoardListGenStudentSearchSuccessState extends MoreState {
  ScreenMoreListNameGenResponse responseBoardListGenStudent;

  MoreBoardListGenStudentSearchSuccessState({required this.responseBoardListGenStudent});
}

// ----------------------->
class MoreBoardTeacherLoading extends MoreState {}

class MoreBoardTeacherEndLoading extends MoreState {}

class MoreBoardTeacherError extends MoreState {
  String errorMessage;
  MoreBoardTeacherError({required this.errorMessage});
}

class MoreBoardTeacherSuccessState extends MoreState {
  ScreenMoreBoardTeacherResponse responseBoardTeacher;

  MoreBoardTeacherSuccessState({required this.responseBoardTeacher});
}

// ----------------------->

class ChooseAvatarSuccess extends MoreState {
  final File avatarImage;
  final String base64img;
  ChooseAvatarSuccess({required this.avatarImage, required this.base64img});
}

class SubmitChooseAvatarSuccess extends MoreState {}

class MoreImgUpLoading extends MoreState {}

class MoreImgUpEndLoading extends MoreState {}

class MoreImgUpError extends MoreState {
  String errorMessage;
  MoreImgUpError({required this.errorMessage});
}
class RefreshTokenSuccessState extends MoreState{
  String? token;
  String? refreshToken;
  RefreshTokenSuccessState({
    required this.token,
    required this.refreshToken,
  });
}

class TokenExpiredState extends MoreState{
  String errorMessage;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({
    required this.errorMessage,
    required this.checkrefreshtokenmessage,
  });
}

class MoreRelatedLinksScreenInfoSuccessState extends MoreState {
  RelatedLinksResponse relatedLinksResponse;
  MoreRelatedLinksScreenInfoSuccessState({required this.relatedLinksResponse});
}
class MoreRelatedLinksLoading extends MoreState {}

class MoreRelatedLinksEndLoading extends MoreState {}

class MoreRelatedLinksError extends MoreState {
  String errorMessage;
  MoreRelatedLinksError({required this.errorMessage});
}
class MoreCoursesScreenInfoSuccessState extends MoreState {
  CoursesScreenResponse coursesScreenResponse;
  MoreCoursesScreenInfoSuccessState({required this.coursesScreenResponse});
}
class MoreCoursesLoading extends MoreState {}

class MoreCoursesEndLoading extends MoreState {}

class MoreCoursesError extends MoreState {
  String errorMessage;
  MoreCoursesError({required this.errorMessage});
}
// ----------------------------------------->
class MoreSrarchNisitLoading extends MoreState {}

class MoreSrarchNisitEndLoading extends MoreState {}

class MoreSrarchNisitError extends MoreState {
  String errorMessage;
  MoreSrarchNisitError({required this.errorMessage});
}

class MoreSrarchNisitNinitSuccessState extends MoreState {
  ScreenMoreBoardStudentListResponse responseBoardListStudent;

  MoreSrarchNisitNinitSuccessState({required this.responseBoardListStudent});
}class MoreSrarchNisitSuccessState extends MoreState {
  ScreenMoreBoardStudentListResponse responseBoardListStudent;

  MoreSrarchNisitSuccessState({required this.responseBoardListStudent});
}