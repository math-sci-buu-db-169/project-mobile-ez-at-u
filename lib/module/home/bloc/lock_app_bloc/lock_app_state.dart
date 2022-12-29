part of 'lock_app_bloc.dart';

// @immutable
abstract class LockAppState {}

class LockAppInitial extends LockAppState {}

class ScreenInfoLockAppSuccessState extends LockAppState {
  LockAppScreenResponse lockAppScreenResponse;

  ScreenInfoLockAppSuccessState({required this.lockAppScreenResponse});
}


class LockAppLoading extends LockAppState {}

class LockAppEndLoading extends LockAppState {}

class LockAppError extends LockAppState {
  String errorMessage;
  LockAppError({required this.errorMessage});
}
class TokenExpiredState extends LockAppState {

  String errorMessage;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({required this.errorMessage, required this.checkrefreshtokenmessage});

}
class CheckTokenError extends LockAppState {

  String errorMessage;
  CheckTokenError({required this.errorMessage});
}