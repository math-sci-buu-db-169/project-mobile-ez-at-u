part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {}

class ScreenInfoForgotPasswordEvent extends ForgotPasswordEvent {}

class ScreenInfoSetNewForgotPasswordEvent extends ForgotPasswordEvent {}

class SubmitForgotPasswordEvent extends ForgotPasswordEvent {
  String email;
  String userID;
  SubmitForgotPasswordEvent({required this.email, required this.userID});
}

class SentOTPSetNewForgotPasswordEvent extends ForgotPasswordEvent {
  String email;
  String userID;
  SentOTPSetNewForgotPasswordEvent({required this.email, required this.userID});
}

class SubmitSetNewForgotPasswordEvent extends ForgotPasswordEvent {
  String newPassword;
  String confirmPassword;
  String otp;
  String userID;
  String email;
  String refValueText;

  SubmitSetNewForgotPasswordEvent(
      {required this.newPassword,
      required this.confirmPassword,
      required this.otp,
      required this.userID,
      required this.email,
      required this.refValueText});
}

class ReSentOTPSetNewForgotPasswordEvent extends ForgotPasswordEvent {
  String email;
  String userID;
  ReSentOTPSetNewForgotPasswordEvent({required this.email, required this.userID});
}
