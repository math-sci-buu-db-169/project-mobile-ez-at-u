part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeScreenInfoEvent extends HomeEvent {}

class ChangeLanguageHomeScreenInfoEvent extends HomeEvent {}

class OnClickChangeLanguageHomeEvent extends HomeEvent {
  final String userLanguage;
  OnClickChangeLanguageHomeEvent({required this.userLanguage});
}

class OnClickLogoutHomeEvent extends HomeEvent {}
class OnClickConfirmLogoutHomeEvent extends HomeEvent {}

class OnClickConfirmDeleteAccountHomeEvent extends HomeEvent {
  final String password;
  OnClickConfirmDeleteAccountHomeEvent({required this.password});
}
