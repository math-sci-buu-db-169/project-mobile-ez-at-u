part of 'change_password_bloc.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ScreenInfoChangePasswordSuccessState extends ChangePasswordState {
  ScreenChangePasswordResponse responseChangePasswordScreenInfo;

  ScreenInfoChangePasswordSuccessState({required this.responseChangePasswordScreenInfo});
}

class SubmitChangePasswordSuccessState extends ChangePasswordState {
  ChangePasswordResponse? responseChangePasswordResponse;

  SubmitChangePasswordSuccessState({required this.responseChangePasswordResponse});
}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordEndLoading extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState {
  String message;
  ChangePasswordError({required this.message});
}
class TokenExpiredState extends ChangePasswordState {

  String message;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({required this.message, required this.checkrefreshtokenmessage});

}
class CheckTokenError extends ChangePasswordState {

  String message;
  CheckTokenError({required this.message});
}