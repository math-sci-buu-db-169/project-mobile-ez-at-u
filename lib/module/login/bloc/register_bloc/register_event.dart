part of 'register_bloc.dart';

abstract class RegisterEvent {}

class ScreenInfoRegisterEvent extends RegisterEvent {}

class ScreenInfoConfirmRegisterEvent extends RegisterEvent {}

class SubmitRegisterEvent extends RegisterEvent {
  String userID;
  String emailRegister;
  String phone;
  String name;
  String lastName;
  String password;
  String confirmPassword;

  SubmitRegisterEvent({
    required this.userID,
    required this.emailRegister,
    required this.phone,
    required this.name,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
  });
}

class ReSentOTPConfirmRegisterEvent extends RegisterEvent {
  String email;
  String userID;
  String phone;
  String name;
  String lastName;
  String password;
  String confirmPassword;

  ReSentOTPConfirmRegisterEvent({
    required this.userID,
    required this.email,
    required this.phone,
    required this.name,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
  });
}

class SubmitConfirmRegisterEvent extends RegisterEvent {
  String email;
  String userID;
  String phone;
  String name;
  String lastName;
  String password;
  String confirmPassword;
  String oTP;
  String refOTP;

  SubmitConfirmRegisterEvent({
    required this.userID,
    required this.email,
    required this.phone,
    required this.name,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
    required this.oTP,
    required this.refOTP,
  });
}
