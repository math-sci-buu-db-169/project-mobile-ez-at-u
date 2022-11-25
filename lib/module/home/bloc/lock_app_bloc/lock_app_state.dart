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
  String message;
  LockAppError({required this.message});
}
class TokenExpiredState extends LockAppState {

  String message;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({required this.message, required this.checkrefreshtokenmessage});

}
class CheckTokenError extends LockAppState {

  String message;
  CheckTokenError({required this.message});
}