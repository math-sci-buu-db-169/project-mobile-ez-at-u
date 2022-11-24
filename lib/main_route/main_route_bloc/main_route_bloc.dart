import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_preferences.dart';
import '../main_route_bloc_model/check_token_expired_response.dart';
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
    getRefMainRouteEventInitial() async {

      Response response = await getRefreshToken(
          refreshToken: isMainRouteRefresh.toString());
      if (response.statusCode == 200) {
        RefreshTokenResponse refreshTokenResponse =
        RefreshTokenResponse.fromJson(response.data);
        if (refreshTokenResponse.head?.status == 200) {
          await setUserKeyAndRefreshKey(
              globalKey: refreshTokenResponse.body?.token ?? "",
              refreshKey: refreshTokenResponse.body?.refreshtoken ?? ""

          );

          emit(CheckTokenExpiredState());
        }
        else if (refreshTokenResponse.head?.status == 400) {
          emit(TokenExpiredState(message: response.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
        }
        else {
          emit(MainRouteError(
              message: refreshTokenResponse.head?.message ?? ""));
        }
      }  else {
        emit(MainRouteError(message: response.statusMessage ?? ""));
      }
    }


    checkMainRouteEventInitial() async {
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(
            responseCheckTokenExpiredResponse.data);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {
            print(
                "checkMainRoute 1 false============checkMainRouteEventInitial======CheckTokenExpired========== ${checkTokenExpiredResponse
                    .head?.timeexpire}");
            print(checkTokenExpiredResponse.body?.expiremessage);
            print(checkTokenExpiredResponse.body?.timenow);
            print(checkTokenExpiredResponse.body?.timeexpir);
            emit(CheckTokenExpiredState());
          }
          else {

            print("checkMainRoute2 == checkTokenExpiredResponse.head?.timeexpire == true");
            getRefMainRouteEventInitial();
            // print(
            //     "checkTokenExpiredResponse true ============checkMainRouteEventInitial=======RefreshTokenResponse========= ${checkTokenExpiredResponse
            //         .head?.timeexpire}");
            // print(checkTokenExpiredResponse.body?.expiremessage);
            // print(checkTokenExpiredResponse.body?.timenow);
            // print(checkTokenExpiredResponse.body?.timeexpir);
            // Response responseRefreshTokenResponse = await getRefreshToken(
            //     refreshToken: isMainRouteRefresh.toString());
            // // emit(HomeEndLoading());
            // if (responseRefreshTokenResponse.statusCode == 200) {
            //   RefreshTokenResponse refreshTokenResponse =
            //   RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
            //   if (refreshTokenResponse.head?.status == 200) {
            //     await setUserKeyAndRefreshKey(
            //         globalKey: refreshTokenResponse.body?.token ?? "",
            //         refreshKey: refreshTokenResponse.body?.refreshtoken ?? ""
            //
            //     );
            //   }
            //   else if (refreshTokenResponse.head?.status == 401) {
            //     emit(TokenExpiredState(
            //         message: responseRefreshTokenResponse.statusMessage ?? "",
            //         checkrefreshtokenmessage: refreshTokenResponse));
            //   }
            //   else {
            //     emit(MainRouteError(
            //         message: refreshTokenResponse.head?.message ?? ""));
            //   }
            // } else {
            //   emit(MainRouteError(
            //       message: responseRefreshTokenResponse.statusMessage ?? ""));
            // }
          }
        }
        else if (checkTokenExpiredResponse.head?.status == 401) {
          print("checkMainRoute 3 == checkTokenExpiredResponse.head?.status == 401");
          getRefMainRouteEventInitial();
          // print(
          //     "checkTokenExpiredResponse ============checkMainRouteEventInitial=======RefreshTokenResponse 401 ========= ${checkTokenExpiredResponse
          //         .head?.timeexpire}");
          // print(checkTokenExpiredResponse.body?.expiremessage);
          // print(checkTokenExpiredResponse.body?.timenow);
          // print(checkTokenExpiredResponse.body?.timeexpir);
          // Response responseRefreshTokenResponse = await getRefreshToken(
          //     refreshToken: isMainRouteRefresh.toString());
          // // emit(HomeEndLoading());
          // if (responseRefreshTokenResponse.statusCode == 200) {
          //   RefreshTokenResponse refreshTokenResponse =
          //   RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
          //   if (refreshTokenResponse.head?.status == 200) {
          //     await setUserKeyAndRefreshKey(
          //         globalKey: refreshTokenResponse.body?.token ?? "",
          //         refreshKey: refreshTokenResponse.body?.refreshtoken ?? ""
          //
          //     );
          //   }
          //   else if (refreshTokenResponse.head?.status == 400) {
          //     emit(TokenExpiredState(
          //         message: responseRefreshTokenResponse.statusMessage ?? "",
          //         checkrefreshtokenmessage: refreshTokenResponse));
          //   }
          //   else {
          //     emit(MainRouteError(
          //         message: refreshTokenResponse.head?.message ?? ""));
          //   }
          // } else {
          //   emit(MainRouteError(
          //       message: responseRefreshTokenResponse.statusMessage ?? ""));
          // }
        }
        else {
          emit(MainRouteError(
              message: checkTokenExpiredResponse.head?.message ?? ""));
        }
      }

      else if (responseCheckTokenExpiredResponse.statusCode == 401) {

        print("checkMainRoute 4 == checkTokenExpiredResponse.head?.status == 401");
        getRefMainRouteEventInitial();
        // print(
        //     "checkTokenExpiredResponse ============checkMainRouteEventInitial=======RefreshTokenResponse 401 ========= responseCheckTokenExpiredResponse.statusCode ");
        //
        // Response responseRefreshTokenResponse = await getRefreshToken(
        //     refreshToken: isMainRouteRefresh.toString());
        // // emit(HomeEndLoading());
        // if (responseRefreshTokenResponse.statusCode == 200) {
        //   RefreshTokenResponse refreshTokenResponse =
        //   RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
        //   if (refreshTokenResponse.head?.status == 200) {
        //     await setUserKeyAndRefreshKey(
        //         globalKey: refreshTokenResponse.body?.token ?? "",
        //         refreshKey: refreshTokenResponse.body?.refreshtoken ?? ""
        //
        //     );
        //   }
        //   else if (refreshTokenResponse.head?.status == 401) {
        //     emit(TokenExpiredState(
        //         message: responseRefreshTokenResponse.statusMessage ?? "",
        //         checkrefreshtokenmessage: refreshTokenResponse));
        //   }
        //   else {
        //     emit(MainRouteError(
        //         message: refreshTokenResponse.head?.message ?? ""));
        //   }
        // } else {
        //   emit(MainRouteError(
        //       message: responseRefreshTokenResponse.statusMessage ?? ""));
        // }
      }
      else {
        emit(MainRouteError(
            message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }



    on<IsMainRouteEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
       isMainRouteRefresh =  prefs.getString('refreshKey');
      isMainRouteKey =  prefs.getString('UserKey');
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
          await checkMainRouteEventInitial();
          emit(MainRouteEndLoading());

        } on DioError catch (e) {
          emit(MainRouteError(message: e.response?.statusMessage ?? ""));
        }
      }
    });
  }
}