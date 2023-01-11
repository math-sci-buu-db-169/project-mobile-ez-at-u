import 'package:ez_at_u/module/login/model/response/change_password_response/change_password_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_at_u/module/login/model/response/screen_change_password_response.dart';
import 'package:ez_at_u/module/login/repository/change_password_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../check_token/token_bloc.dart';
import '../../../../main_route/main_route_bloc_model/check_token_expired_response.dart';
import '../../../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../../../utils/shared_preferences.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

late SharedPreferences prefs;
class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> with ChangePasswordRepository {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {
      // TODO: implement event handler
    });

    getRefChangePasswordEventInitial(event, emit) async {

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
          emit(ChangePasswordError(
              message: refreshTokenResponse.head?.message ?? ""));
        }
      }  else {
        emit(ChangePasswordError(message: response.statusMessage ?? ""));
      }
    }


    checkChangePasswordEventInitial(event, emit) async {
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(
            responseCheckTokenExpiredResponse.data);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {
            print(
                "CheckChangePassword 1  false============checkChangePassword======CheckTokenExpired========== ${checkTokenExpiredResponse
                    .head?.timeexpire}");
            print(checkTokenExpiredResponse.body?.expiremessage);
            print(checkTokenExpiredResponse.body?.timenow);
            print(checkTokenExpiredResponse.body?.timeexpir);
            // emit(ChangePasswordEndLoading());
          }
          else {

            print("CheckChangePassword  2 == checkTokenExpiredResponse.head?.timeexpire == true");
            await getRefChangePasswordEventInitial(event, emit);

          }
        }
        else if (checkTokenExpiredResponse.head?.status == 401) {
          print("CheckChangePassword 3 == checkTokenExpiredResponse.head?.status == 401");
          await getRefChangePasswordEventInitial(event, emit);

        }
        else {
          emit(ChangePasswordError(
              message: checkTokenExpiredResponse.head?.message ?? ""));
        }
      }

      else if (responseCheckTokenExpiredResponse.statusCode == 401) {

        print("CheckChangePassword 4 == checkTokenExpiredResponse.head?.status == 401");
        await getRefChangePasswordEventInitial(event, emit);
      }
      else {
        emit(ChangePasswordError(
            message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }




    on<ChangePasswordScreenInfoEvent>((event, emit) async {
      try {
        emit(ChangePasswordLoading());
        print("CheckChangePassword  5 == ChangePasswordScreenInfoEvent");
        await checkChangePasswordEventInitial(event, emit);
        Response response = await getScreenChangePassword();
        emit(ChangePasswordEndLoading());
        if (response.statusCode == 200) {
          ScreenChangePasswordResponse screenChangePasswordResponse =
              ScreenChangePasswordResponse.fromJson(response.data);
          if (screenChangePasswordResponse.head?.status == 200) {
            emit(ScreenInfoChangePasswordSuccessState(responseChangePasswordScreenInfo: screenChangePasswordResponse));
          } else {
            emit(ChangePasswordError(message: screenChangePasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(ChangePasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ChangePasswordError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<SubmitChangePasswordEvent>((event, emit) async {
      try {
        emit(ChangePasswordLoading());
        print("CheckChangePassword  6 == SubmitChangePasswordEvent");
        await checkChangePasswordEventInitial(event, emit);
        Response response = await submitScreenChangePassword(
          currentPassword: event.currentPassword,
          newPassword: event.newPassword,
          confirmPassword: event.confirmPassword,
        );
        emit(ChangePasswordEndLoading());
        if (response.statusCode == 200) {
          ChangePasswordResponse changePasswordResponse = ChangePasswordResponse.fromJson(response.data);
          if (changePasswordResponse.head?.status == 200) {
            emit(SubmitChangePasswordSuccessState(responseChangePasswordResponse: changePasswordResponse));
          } else {
            emit(ChangePasswordError(message: changePasswordResponse.head?.message ?? ""));
          }
          print("refresh token ================================");
          print(changePasswordResponse?.body?.refreshtoken);
          print("refresh token ================================");
        } else {
          emit(ChangePasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ChangePasswordError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
