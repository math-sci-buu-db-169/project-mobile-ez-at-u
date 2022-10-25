part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {}

class ChangePasswordScreenInfoEvent extends ChangePasswordEvent {}

class SubmitChangePasswordEvent extends ChangePasswordEvent {
  String currentPassword;
  String newPassword;
  String confirmPassword;
  SubmitChangePasswordEvent({required this.currentPassword, required this.newPassword, required this.confirmPassword});
}
