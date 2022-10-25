part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginScreenInfoEvent extends LoginEvent {
  String userLanguage;
  LoginScreenInfoEvent({required this.userLanguage});
}

class OnClickLanguageEvent extends LoginEvent {
  String userLanguage;
  OnClickLanguageEvent({required this.userLanguage});
}

class LoginSubmitEvent extends LoginEvent {
  String userID;
  String password;
  LoginSubmitEvent({required this.userID, required this.password});
}
