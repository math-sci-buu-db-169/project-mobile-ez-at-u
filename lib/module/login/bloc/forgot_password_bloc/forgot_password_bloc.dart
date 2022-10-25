import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_u/module/login/model/response/re_send_otp_forgot_password_response.dart';
import 'package:ez_u/module/login/model/response/screen_forgot_password_response.dart';
import 'package:ez_u/module/login/model/response/submit_forgot_password_response.dart';
import 'package:ez_u/module/login/model/response/submit_forgot_setnew_forgotpassword_response.dart';
import 'package:ez_u/module/login/repository/forgot_password_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> with ForgotPasswordRepository {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ScreenInfoForgotPasswordEvent>((event, emit) async {
      try {
        emit(ForgotPasswordLoading());
        Response response = await getScreenForgotPassword();
        emit(ForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ScreenForgotPasswordResponse screenForgotPasswordResponse =
              ScreenForgotPasswordResponse.fromJson(response.data);
          if (screenForgotPasswordResponse.head?.status == 200) {
            emit(ScreenInfoForgotPasswordSuccessState(responseForgotPassword: screenForgotPasswordResponse));
          } else {
            emit(ForgotPasswordError(message: screenForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(ForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<ScreenInfoSetNewForgotPasswordEvent>((event, emit) async {
      try {
        emit(SetNewForgotPasswordLoading());
        Response response = await getScreenForgotPassword();
        emit(SetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ScreenForgotPasswordResponse screenSetNewForgotPasswordResponse =
              ScreenForgotPasswordResponse.fromJson(response.data);
          if (screenSetNewForgotPasswordResponse.head?.status == 200) {
            emit(ScreenInfoSetNewForgotPasswordSuccessState(
                responseSetNewForgotPassword: screenSetNewForgotPasswordResponse));
          } else {
            emit(SetNewForgotPasswordError(message: screenSetNewForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(SetNewForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(SetNewForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<SubmitForgotPasswordEvent>((event, emit) async {
      try {
        emit(ForgotPasswordLoading());
        Response response = await getSubmitForgotPassword(email: event.email, userID: event.userID);
        emit(ForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          SubmitForgotPasswordResponse submitForgotPasswordResponse =
              SubmitForgotPasswordResponse.fromJson(response.data);
          if (submitForgotPasswordResponse.head?.status == 200) {
            emit(SubmitForgotPasswordSuccessState(
                responseSubmitForgotPassword: submitForgotPasswordResponse,
                userIDForgotPassword: event.userID,
                emailForgotPassword: event.email));
          } else {
            emit(ForgotPasswordError(message: submitForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(ForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<SubmitSetNewForgotPasswordEvent>((event, emit) async {
      try {
        emit(SetNewForgotPasswordLoading());
        Response response = await getSubmitSetNewForgotPassword(
            newPassword: event.newPassword,
            userID: event.userID,
            confirmPassword: event.confirmPassword,
            email: event.email,
            otp: event.otp,
            refValueText: event.refValueText);
        emit(SetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          SubmitForgotSetNewForgotPasswordResponse submitForgotSetNewForgotPasswordResponse =
              SubmitForgotSetNewForgotPasswordResponse.fromJson(response.data);
          if (submitForgotSetNewForgotPasswordResponse.head?.status == 200) {
            emit(SubmitSetNewForgotPasswordSuccessState(
                responseSetNewSubmitForgotPassword: submitForgotSetNewForgotPasswordResponse));
          } else {
            emit(SetNewForgotPasswordError(message: submitForgotSetNewForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(ForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<ReSentOTPSetNewForgotPasswordEvent>((event, emit) async {
      try {
        emit(SetNewForgotPasswordLoading());
        // Response response = await getReSendOTPSetNewForgotPassword(event.email, event.userID);
        Response response = await getReSendOTPSetNewForgotPassword(email: event.email, userID: event.userID);
        emit(SetNewForgotPasswordEndLoading());

        if (response.statusCode == 200) {
          ReSendOtpForgotPasswordResponse reSendOtpForgotPasswordResponse =
              ReSendOtpForgotPasswordResponse.fromJson(response.data);
          if (reSendOtpForgotPasswordResponse.head?.status == 200) {
            emit(ReSentOTPSetNewForgotPasswordSuccessState(
                responseReSendOtpForgotPasswordResponse: reSendOtpForgotPasswordResponse,
                userIDForgotPassword: event.userID,
                emailForgotPassword: event.email));
          } else {
            emit(ReSentOTPSetNewForgotPasswordError(message: reSendOtpForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(SetNewForgotPasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(SetNewForgotPasswordError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
