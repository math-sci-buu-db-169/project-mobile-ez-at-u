import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_preferences.dart';
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
          Response response = await getRefreshToken(
              refreshToken: isMainRouteRefresh.toString());
          emit(MainRouteEndLoading());
          if (response.statusCode == 200) {
            RefreshTokenResponse refreshTokenResponse =
                RefreshTokenResponse.fromJson(response.data);
            if (refreshTokenResponse.head?.status == 200) {
              await setUserKey(globalKey: refreshTokenResponse.body?.token?? "");
              await setUserRefreshKey(refreshKey: refreshTokenResponse.body?.refreshtoken?? "");
              emit(RefreshTokenSuccessState(
                token: refreshTokenResponse.body?.token,
                refreshToken: refreshTokenResponse.body?.refreshtoken,
              ));
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
        } on DioError catch (e) {
          emit(MainRouteError(message: e.response?.statusMessage ?? ""));
        }
      }
    });
  }
}
