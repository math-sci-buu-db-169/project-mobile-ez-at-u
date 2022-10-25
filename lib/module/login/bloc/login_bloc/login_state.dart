part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class ScreenInfoLoginSuccessState extends LoginState {
  ScreenLoginResponse responseScreenInfoLogin;

  ScreenInfoLoginSuccessState({required this.responseScreenInfoLogin});
}

class OnClickLanguageLoginScreenInfoSuccessState extends LoginState {
  ScreenLoginResponse responseLanguageLoginscreen;

  OnClickLanguageLoginScreenInfoSuccessState({required this.responseLanguageLoginscreen});
}

class SubmitLoginState extends LoginState {
  SubmitLoginResponse responseSubmitLoginScreen;

  SubmitLoginState({required this.responseSubmitLoginScreen});
}

class LoginLoading extends LoginState {}

class LoginEndLoading extends LoginState {}

class LoginError extends LoginState {
  String message;
  LoginError({required this.message});
}
