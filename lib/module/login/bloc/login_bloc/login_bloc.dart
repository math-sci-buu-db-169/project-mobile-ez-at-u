import 'package:ez_at_u/utils/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_at_u/module/login/model/response/screen_login_response.dart';
import 'package:ez_at_u/module/login/model/response/submit_login_response.dart';
import 'package:ez_at_u/module/login/repository/login_repository.dart';

import '../../../../customs/common/api/device_info_api.dart';
import '../../../../customs/common/api/package_info_api.dart';
import '../../model/response/log_sessions/log_sessions_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with LoginRepository {
  LoginBloc() : super(LoginInitial()) {
    on<LoginScreenInfoEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        // if (kDebugMode) {
        //   print("Step   1 :  LoginLoading");
        // }
        Response response = await getScreenLogin(event.userLanguage);
        // if (kDebugMode) {
        //   print("Step   2 :  getScreenLogin");
        // }
        emit(LoginEndLoading());
        // if (kDebugMode) {
        //   print("Step   3 :  LoginEndLoading");
        // }
        if (response.statusCode == 200) {
          ScreenLoginResponse screenLoginResponse = ScreenLoginResponse.fromJson(response.data);
          // if (kDebugMode) {
          //   print("Step   4 :  statusCode == 200");
          // }
          if (screenLoginResponse.head?.status == 200) {
            // if (kDebugMode) {
            //   print("Step   5 :  status == 200");
            // }
            await setButton(
                buttonOkAPI: screenLoginResponse.body?.screeninfo?.errorbutton?.buttonok,
                buttonConfirmAPI: screenLoginResponse.body?.screeninfo?.errorbutton?.buttonconfirm,
                buttonYesAPI: screenLoginResponse.body?.screeninfo?.errorbutton?.buttonyes,
                buttonNoAPI: screenLoginResponse.body?.screeninfo?.errorbutton?.buttonno,
                buttonCancelAPI: screenLoginResponse.body?.screeninfo?.errorbutton?.buttoncancel);
            emit(ScreenInfoLoginSuccessState(responseScreenInfoLogin: screenLoginResponse));
            // if (kDebugMode) {
            //   print("Step   6 : responseScreenInfoLogin");
            // }
          } else {
            emit(LoginError(message: screenLoginResponse.head?.message ?? ""));
            // if (kDebugMode) {
            //   print("Step   7 : LoginError  screenLoginResponse");
            // }
          }
        } else {
          emit(LoginError(message: response.statusMessage ?? ""));
          // if (kDebugMode) {
          //   print("Step   8 : LoginError  message");
          // }
        }
      } on DioError catch (e) {
        emit(LoginError(message: e.response?.statusMessage ?? ""));
        // if (kDebugMode) {
        //   print("Step   9 : catch  message");
        // }
      }
    });
    on<OnClickLanguageEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        Response response = await getScreenLogin(event.userLanguage);
        emit(LoginEndLoading());
        if (response.statusCode == 200) {
          ScreenLoginResponse screenLoginResponse = ScreenLoginResponse.fromJson(response.data);

          if (screenLoginResponse.head?.status == 200) {
            emit(OnClickLanguageLoginScreenInfoSuccessState(responseLanguageLoginscreen: screenLoginResponse));
          } else {
            emit(LoginError(message: screenLoginResponse.head?.message ?? ""));
          }
        } else {
          emit(LoginError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(LoginError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<LoginSubmitEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        Response responseLoginSubmit = await getSubmitLogin(event.userID, event.password);
        if (responseLoginSubmit.statusCode == 200) {
          SubmitLoginResponse submitLoginResponse = SubmitLoginResponse.fromJson(responseLoginSubmit.data);
          if (submitLoginResponse.head?.status == 200) {

            final packageName = await PackageInfoApi.getPackageName();
            final appVersion = await PackageInfoApi.getAppVersion();
            // final ipAddress = await IpInfoApi.getIPAddress();
            final phone = await DeviceInfoApi.getPhoneInfo();
            final phoneVersion = await DeviceInfoApi.getPhoneVersion();
            final operatingSystem = await DeviceInfoApi.getOperatingSystem();
            final screenResolution = await DeviceInfoApi.getScreenResolution();
          print(packageName);
          print(appVersion);
          print(phone);
          print(operatingSystem);
          print(phoneVersion);
            Response responseSendSubmitLogSessions = await sendSubmitLogSessions(
                userid:event.userID,
                phone: phone,
                phoneVersionOS: phoneVersion,
                operatingSystem: operatingSystem,
                screenResolution: screenResolution,
                appVersion: appVersion,
                packageName: packageName,
                option: true);

            if (responseSendSubmitLogSessions.statusCode == 200) {
              LogSessionsResponse logSessionsResponse = LogSessionsResponse.fromJson(responseSendSubmitLogSessions.data);
              if (logSessionsResponse.head?.status == 200) {
                setIsLogSessions(
                    sessionsID: logSessionsResponse.body?.id?.toInt()?? 0,
                    sessions: logSessionsResponse.body?.sessions??''
                    , myUserID: event.userID
                );
              }
            }
            await setUserKeyAndRefreshKey(
              globalKey: submitLoginResponse.body?.token ?? "",
              refreshKey: submitLoginResponse.body?.refreshtoken ?? "",
              isRole: submitLoginResponse.body?.role ?? "TC",
              userLanguage: submitLoginResponse.body?.language ?? "TH",
            );

            emit(LoginEndLoading());
            emit(SubmitLoginState(responseSubmitLoginScreen: submitLoginResponse));
          } else {
            emit(LoginEndLoading());
            emit(LoginError(message: submitLoginResponse.head?.message ?? ""));
          }
        } else {
          emit(LoginEndLoading());
          emit(LoginError(message: responseLoginSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(LoginEndLoading());
        emit(LoginError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
