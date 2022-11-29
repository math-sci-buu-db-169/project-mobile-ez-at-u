import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_route/main_route_bloc/main_route_bloc.dart';
import '../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../utils/shared_preferences.dart';
import 'check_token_repository.dart';

part 'token_event.dart';
part 'token_state.dart';
late SharedPreferences prefs;
late String? isMainRouteRefresh;

late String? isMainRouteKey;
class TokenBloc extends Bloc<TokenEvent, TokenState>  with CheckTokenRepository{
  TokenBloc() : super(TokenInitial()) {
    on<TokenEvent>((event, emit) async{
        prefs = await SharedPreferences.getInstance();
        isMainRouteRefresh = prefs.getString('refreshKey');
        isMainRouteKey = prefs.getString('UserKey');
        // try {
        //   emit(CheckTokenLoading());
        //   Response response = await getCheckTokenRefreshToken(
        //       refreshToken: isMainRouteRefresh.toString());
        //   emit(CheckTokenEndLoading());
        //   if (response.statusCode == 200) {
        //     RefreshTokenResponse refreshTokenResponse =
        //     RefreshTokenResponse.fromJson(response.data);
        //     if (refreshTokenResponse.head?.status == 200) {
        //       emit(CheckTokenSuccessState(
        //         token: refreshTokenResponse.body?.token,
        //         refreshToken: refreshTokenResponse.body?.refreshtoken,
        //       ));
        //     }
        //     else if (refreshTokenResponse.head?.status == 400) {
        //       emit(TokenExpiredState(message: response.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
        //     }
        //     else {
        //       emit(CheckTokenError(
        //           message: refreshTokenResponse.head?.message ?? ""));
        //     }
        //   }  else {
        //     emit(CheckTokenError(message: response.statusMessage ?? ""));
        //   }
        // } on DioError catch (e) {
        //   emit(CheckTokenError(message: e.response?.statusMessage ?? ""));
        // }
        if (isMainRouteRefresh.toString() == '') {
          emit(CheckTokenLogin());
        } else if (isMainRouteRefresh.toString() == 'null') {
          emit(CheckTokenLogin());
        }
        if (isMainRouteKey.toString() == '') {
          emit(CheckTokenLogin());
        } else if (isMainRouteKey.toString() == 'null') {
          emit(CheckTokenLogin());
        } else {
          // emit(MainRouteHome());
          try {
            emit(CheckTokenLoading());
            Response response = await getCheckTokenRefreshToken(
                refreshToken: isMainRouteRefresh.toString());
            emit(CheckTokenEndLoading());
            if (response.statusCode == 200) {
              RefreshTokenResponse refreshTokenResponse =
              RefreshTokenResponse.fromJson(response.data);
              if (refreshTokenResponse.head?.status == 200) {
                await setUserKeyAndRefreshKey(
                  globalKey: refreshTokenResponse.body?.token ?? "",
                  refreshKey: refreshTokenResponse.body?.refreshtoken ?? "",
                  isRole: refreshTokenResponse.body?.role ??"TC",
                  userLanguage: refreshTokenResponse.body?.language ??"TH",

                );
                emit(CheckTokenSuccessState(
                  token: refreshTokenResponse.body?.token,
                  refreshToken: refreshTokenResponse.body?.refreshtoken,
                ));
              }
              else if (refreshTokenResponse.head?.status == 400) {
                emit(TokenExpiredState(message: response.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
              }
              else {
                emit(CheckTokenError(
                    message: refreshTokenResponse.head?.message ?? ""));
              }
            }  else {
              emit(CheckTokenError(message: response.statusMessage ?? ""));
            }
          } on DioError catch (e) {
            emit(CheckTokenError(message: e.response?.statusMessage ?? ""));
          }
        }
      });
  }
}
