part of 'main_route_bloc.dart';


abstract class MainRouteState {}

class MainRouteInitial extends MainRouteState {}
class MainRouteLogin extends MainRouteState {}
class MainRouteHome extends MainRouteState {}
class MainRouteLoading extends MainRouteState{}
class MainRouteEndLoading extends MainRouteState{}
class RefreshTokenSuccessState extends MainRouteState{
  String? token;
  String? refreshToken;
  RefreshTokenSuccessState({
    required this.token,
    required this.refreshToken,
  });
}

class TokenExpiredState extends MainRouteState{
  String message;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({
    required this.message,
    required this.checkrefreshtokenmessage,
  });
}
class MainRouteError extends MainRouteState{
  String message;
  MainRouteError({required this.message});
}
class CheckTokenExpiredState extends MainRouteState {}