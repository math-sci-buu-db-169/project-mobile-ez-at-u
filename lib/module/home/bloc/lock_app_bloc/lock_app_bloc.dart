import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../check_token/token_bloc.dart';
import '../../../../main_route/main_route_bloc_model/check_token_expired_response.dart';
import '../../../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../../../utils/shared_preferences.dart';
import '../../model/response/home_response/lock_app_screen_response.dart';
import '../../repository/home_repository.dart';

part 'lock_app_event.dart';
part 'lock_app_state.dart';

late SharedPreferences prefs;
class LockAppBloc extends Bloc<LockAppEvent, LockAppState> with HomeRepository {
  LockAppBloc() : super(LockAppInitial()) {
    on<LockAppEvent>((event, emit) {
      // TODO: implement event handler
    });

    getRefLockAppEventInitial(event, emit) async {

      prefs = await SharedPreferences.getInstance();
      isMainRouteRefresh =  prefs.getString('refreshKey');
      isMainRouteKey =  prefs.getString('UserKey');
      Response response = await getRefreshToken(
          refreshToken: isMainRouteRefresh.toString());
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
        }
        else if (refreshTokenResponse.head?.status == 400) {
          emit(TokenExpiredState(message: response.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
        }
        else {
          emit(LockAppError(
              message: refreshTokenResponse.head?.message ?? ""));
        }
      }  else {
        emit(LockAppError(message: response.statusMessage ?? ""));
      }
    }


    checkLockAppEventInitial(event, emit) async {
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(
            responseCheckTokenExpiredResponse.data);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {
            print(
                "CheckLockApp 1  false============checkLockApp======CheckTokenExpired========== ${checkTokenExpiredResponse
                    .head?.timeexpire}");
            print(checkTokenExpiredResponse.body?.expiremessage);
            print(checkTokenExpiredResponse.body?.timenow);
            print(checkTokenExpiredResponse.body?.timeexpir);
            // emit(LockAppEndLoading());
          }
          else {

            print("CheckLockApp  2 == checkTokenExpiredResponse.head?.timeexpire == true");
            await getRefLockAppEventInitial(event, emit);

          }
        }
        else if (checkTokenExpiredResponse.head?.status == 401) {
          print("CheckLockApp 3 == checkTokenExpiredResponse.head?.status == 401");
          await getRefLockAppEventInitial(event, emit);

        }
        else {
          emit(LockAppError(
              message: checkTokenExpiredResponse.head?.message ?? ""));
        }
      }

      else if (responseCheckTokenExpiredResponse.statusCode == 401) {

        print("CheckLockApp 4 == checkTokenExpiredResponse.head?.status == 401");
        await getRefLockAppEventInitial(event, emit);
      }
      else {
        emit(LockAppError(
            message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }

    on<LockAppScreenInfoEvent>((event, emit) async {
      try {
        emit(LockAppLoading());
        print("CheckLockApp  5 == LockAppScreenInfoEvent");
        await checkLockAppEventInitial(event, emit);
        Response response = await getLockPinScreen();
        emit(LockAppEndLoading());
        if (response.statusCode == 200) {
          LockAppScreenResponse lockAppScreenResponse =
          LockAppScreenResponse.fromJson(response.data);
          if (lockAppScreenResponse.head?.status == 200) {
            setTextPinScreen(
                enterPin: lockAppScreenResponse.body?.enterpin,
                hello: lockAppScreenResponse.body?.hello,
                niceDay: lockAppScreenResponse.body?.niceday,
              enterConfirmPin: lockAppScreenResponse.body?.enterconfirmpin,
              enterNewPin: lockAppScreenResponse.body?.enternewpin,
            );
            emit(ScreenInfoLockAppSuccessState(lockAppScreenResponse: lockAppScreenResponse));
          } else {
            emit(LockAppError(message: lockAppScreenResponse.head?.message ?? ""));
          }
        } else {
          emit(LockAppError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(LockAppError(message: e.response?.statusMessage ?? ""));
      }
    });

  }
}
