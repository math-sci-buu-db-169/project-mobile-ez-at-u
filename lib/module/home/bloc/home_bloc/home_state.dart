part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeAlertLoading extends HomeState {}

class HomeEndLoading extends HomeState {}

class HomeError extends HomeState {
  String message;
  HomeError({required this.message});
}

class ScreenInfoHomeSuccessState extends HomeState {
  ScreenHomeResponse responseScreenInfoHome;
  ApiProfileResponse responseProfile;
  ScreenStatusActivityStudentResponse responseActivity;
  // AlertNoActivityResponse  responseNoActivity;
  ScreenInfoHomeSuccessState({
    required this.responseScreenInfoHome,
    required this.responseProfile,
    required this.responseActivity,
    // required this.responseNoActivity
  });
}
class ScreenInfoHomeSettingSuccessState extends HomeState {
  SettingScreenResponse settingScreenResponse;
  ScreenInfoHomeSettingSuccessState({
    required this.settingScreenResponse,
  });
}

class ScreenInfoHomeNoActivityStudentSuccessState extends HomeState {
  ScreenHomeResponse responseScreenInfoHome;
  ApiProfileResponse responseProfile;
  // ScreenStatusActivityResponse responseActivity;
  AlertNoActivityStudentResponse responseNoActivity;
  ScreenInfoHomeNoActivityStudentSuccessState({
    required this.responseScreenInfoHome,
    required this.responseProfile,
    required this.responseNoActivity,
    // required this.responseNoActivity
  });
}

class OnClickChangeLanguageHomeSuccessState extends HomeState {
  String userLanguage;
  OnClickChangeLanguageHomeSuccessState({required this.userLanguage});
}

class OnClickHomeLogoutState extends HomeState {
  AlertLogoutHomeResponse responseAlertLogoutHome;
  OnClickHomeLogoutState({required this.responseAlertLogoutHome});
}

class HomeLogoutState extends HomeState {
  SubmitLogoutResponse responseSubmitLogoutResponse;
  HomeLogoutState({required this.responseSubmitLogoutResponse});
}

class OnClickConfirmDeleteAccountState extends HomeState {}
class RefreshTokenSuccessState extends HomeState{
  String? token;
  String? refreshToken;
  RefreshTokenSuccessState({
    required this.token,
    required this.refreshToken,
  });
}

class TokenExpiredState extends HomeState{
  String message;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({
    required this.message,
    required this.checkrefreshtokenmessage,
  });
}