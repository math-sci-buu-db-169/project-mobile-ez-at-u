part of 'token_bloc.dart';

@immutable
abstract class TokenState {}

class TokenInitial extends TokenState {}
class CheckTokenLogin extends TokenState {}
class CheckTokenLoading extends TokenState {}
class CheckTokenEndLoading extends TokenState {}
class CheckTokenSuccessState extends TokenState {
  String? token;
  String? refreshToken;
  CheckTokenSuccessState({
    required this.token,
    required this.refreshToken,
  });
}
class TokenExpiredState extends TokenState {

  String message;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({required this.message, required this.checkrefreshtokenmessage});

}
class CheckTokenError extends TokenState {

  String message;
  CheckTokenError({required this.message});
}
// class MainRouteInitial extends TokenState {}