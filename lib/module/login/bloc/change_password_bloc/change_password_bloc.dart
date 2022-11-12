import 'package:ez_at_u/module/login/model/response/change_password_response/change_password_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_at_u/module/login/model/response/screen_change_password_response.dart';
import 'package:ez_at_u/module/login/repository/change_password_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> with ChangePasswordRepository {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangePasswordScreenInfoEvent>((event, emit) async {
      try {
        emit(ChangePasswordLoading());
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
        } else {
          emit(ChangePasswordError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ChangePasswordError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
