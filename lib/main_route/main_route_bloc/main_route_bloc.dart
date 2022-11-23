import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_preferences.dart';
import '../main_route_bloc_model/CheckTokenExpiredRespomse.dart';
import '../main_route_bloc_model/refresh_token_response.dart';
import '../main_route_repository/main_route_repository.dart';

part 'main_route_event.dart';

part 'main_route_state.dart';

late SharedPreferences prefs;
late String? isMainRouteRefresh;

late String? isMainRouteKey;

class MainRouteBloc extends Bloc<MainRouteEvent, MainRouteState>
    with MainRouteRepository {
  MainRouteBloc() : super(MainRouteInitial()) {
    on<MainRouteEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<IsMainRouteEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      isMainRouteRefresh = prefs.getString('refreshKey');
      isMainRouteKey = prefs.getString('UserKey');

      if (isMainRouteRefresh.toString() == '') {
        emit(MainRouteLogin());
      } else if (isMainRouteRefresh.toString() == 'null') {
        emit(MainRouteLogin());
      }
      if (isMainRouteKey.toString() == '') {
        emit(MainRouteLogin());
      } else if (isMainRouteKey.toString() == 'null') {
        emit(MainRouteLogin());
      } else {
        // emit(MainRouteHome());
        try {
          emit(MainRouteLoading());
          Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
          if (responseCheckTokenExpiredResponse.statusCode == 200) {
            CheckTokenExpiredResponse checkTokenExpiredResponse =
            CheckTokenExpiredResponse.fromJson(responseCheckTokenExpiredResponse.data);
            if (checkTokenExpiredResponse.head?.status == 200) {
              // await setUserKey(globalKey: refreshTokenResponse.body?.token?? "");
              // await setUserRefreshKey(refreshKey: refreshTokenResponse.body?.refreshtoken?? "");
              if (checkTokenExpiredResponse.head?.timeexpire == false) {


                print("checkTokenExpiredResponse ============MainRoute=======RefreshTokenResponse========= ${checkTokenExpiredResponse.head?.timeexpire}");
                print(checkTokenExpiredResponse.body?.expiremessage);
                print(checkTokenExpiredResponse.body?.timenow);
                print(checkTokenExpiredResponse.body?.timeexpir);
                emit(MainRouteEndLoading());
                emit(CheckTokenExpiredState());
              }
              else{


                print("checkTokenExpiredResponse ============MainRoute=======RefreshTokenResponse========= ${checkTokenExpiredResponse.head?.timeexpire}");
                print(checkTokenExpiredResponse.body?.expiremessage);
                print(checkTokenExpiredResponse.body?.timenow);
                print(checkTokenExpiredResponse.body?.timeexpir);
                Response responseRefreshTokenResponse = await getRefreshToken(
                    refreshToken: isMainRouteRefresh.toString());
                emit(MainRouteEndLoading());
                if (responseRefreshTokenResponse.statusCode == 200) {
                  RefreshTokenResponse refreshTokenResponse =
                  RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
                  print("RefreshTokenResponse ====================== 1");
                  if (refreshTokenResponse.head?.status == 200) {

                    print("RefreshTokenResponse ====================== 2");
                    await setUserKey(globalKey: refreshTokenResponse.body?.token?? "");

                    print("RefreshTokenResponse ====================== 3");
                    await setUserRefreshKey(refreshKey: refreshTokenResponse.body?.refreshtoken?? "");

                    print("RefreshTokenResponse ====================== 4");
                    emit(RefreshTokenSuccessState(
                      token: refreshTokenResponse.body?.token,
                      refreshToken: refreshTokenResponse.body?.refreshtoken,
                    ));

                    print("RefreshTokenResponse ====================== 4");
                  }
                  else if (refreshTokenResponse.head?.status == 400) {

                    print("RefreshTokenResponse ====================== 6");
                    emit(TokenExpiredState(message: responseRefreshTokenResponse.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
                  }
                  else {
                    emit(MainRouteError(
                        message: refreshTokenResponse.head?.message ?? ""));
                  }
                }  else {
                  emit(MainRouteError(message: responseRefreshTokenResponse.statusMessage ?? ""));
                }
              }

            }
            // else if (checkTokenExpiredResponse.head?.status == 400) {
            //   emit(TokenExpiredState(message: responseCheckTokenExpiredResponse.statusMessage ?? "", checkrefreshtokenmessage : checkTokenExpiredResponse));
            // }
            else {
              emit(MainRouteError(
                  message: checkTokenExpiredResponse.head?.message ?? ""));
            }
          }
          else if (responseCheckTokenExpiredResponse.statusCode == 401) {
            Response responseRefreshTokenResponse = await getRefreshToken(
                refreshToken: isMainRouteRefresh.toString());
            // emit(HomeEndLoading());
            if (responseRefreshTokenResponse.statusCode == 200) {
              RefreshTokenResponse refreshTokenResponse =
              RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
              if (refreshTokenResponse.head?.status == 200) {
                await setUserKey(globalKey: refreshTokenResponse.body?.token?? "");
                await setUserRefreshKey(refreshKey: refreshTokenResponse.body?.refreshtoken?? "");
                emit(MainRouteEndLoading());
              }
              else if (refreshTokenResponse.head?.status == 400) {
                emit(TokenExpiredState(message: responseRefreshTokenResponse.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
              }
              else {
                emit(MainRouteError(
                    message: refreshTokenResponse.head?.message ?? ""));
              }
            }  else {
              emit(MainRouteError(message: responseRefreshTokenResponse.statusMessage ?? ""));
            }
          }
          else {
            emit(MainRouteError(message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
          }
        } on DioError catch (e) {
          emit(MainRouteError(message: e.response?.statusMessage ?? ""));
        }
      }
    });
  }
}
