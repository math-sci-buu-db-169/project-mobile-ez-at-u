part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordEndLoading extends ForgotPasswordState {}

class ScreenInfoForgotPasswordSuccessState extends ForgotPasswordState {
  ScreenForgotPasswordResponse responseForgotPassword;
  ScreenInfoForgotPasswordSuccessState({required this.responseForgotPassword});
}

class SubmitForgotPasswordSuccessState extends ForgotPasswordState {
  SubmitForgotPasswordResponse responseSubmitForgotPassword;
  String emailForgotPassword;
  String userIDForgotPassword;
  SubmitForgotPasswordSuccessState(
      {required this.responseSubmitForgotPassword,
      required this.emailForgotPassword,
      required this.userIDForgotPassword});
}

class ForgotPasswordError extends ForgotPasswordState {
  String message;
  ForgotPasswordError({required this.message});
}

class SetNewForgotPasswordLoading extends ForgotPasswordState {}

class SetNewForgotPasswordEndLoading extends ForgotPasswordState {}

class ScreenInfoSetNewForgotPasswordSuccessState extends ForgotPasswordState {
  ScreenForgotPasswordResponse responseSetNewForgotPassword;
  ScreenInfoSetNewForgotPasswordSuccessState({required this.responseSetNewForgotPassword});
}

class SubmitSetNewForgotPasswordSuccessState extends ForgotPasswordState {
  SubmitForgotSetNewForgotPasswordResponse responseSetNewSubmitForgotPassword;

  SubmitSetNewForgotPasswordSuccessState({required this.responseSetNewSubmitForgotPassword});
}

class SetNewForgotPasswordError extends ForgotPasswordState {
  String message;
  SetNewForgotPasswordError({required this.message});
}

class ReSentOTPSetNewForgotPasswordError extends ForgotPasswordState {
  String message;
  ReSentOTPSetNewForgotPasswordError({required this.message});
}

class ReSentOTPSetNewForgotPasswordSuccessState extends ForgotPasswordState {
  ReSendOtpForgotPasswordResponse responseReSendOtpForgotPasswordResponse;
  String emailForgotPassword;
  String userIDForgotPassword;
  ReSentOTPSetNewForgotPasswordSuccessState(
      {required this.responseReSendOtpForgotPasswordResponse,
      required this.emailForgotPassword,
      required this.userIDForgotPassword});
}
