part of 'profile_bloc.dart';

// @immutable
abstract class ProfileState {
  const ProfileState();
}
class ProfileApiSuccessState extends ProfileState{
  ApiProfileResponse  response;
  ProfileApiSuccessState({required this.response});
}
class ChangeAvatarProcress extends ProfileState {}
class ChooseAvatarSuccess extends ProfileState {
  final File avatarImage;
  final String base64img;
  ChooseAvatarSuccess({required this.avatarImage,required this.base64img});
}
class ProfileError extends ProfileState{
  String errorMessage;
  ProfileError({required this.errorMessage});
}
class ProfileInitial extends ProfileState {
  @override
  String toString() => 'ProfileInitial';
}
class ProfileLoading extends ProfileState {}
class ProfileLoadingSuccess extends ProfileState {}
class ProfileStatusState extends ProfileState {
  bool statuscheck  ;
  ProfileStatusState({required this.statuscheck});
}
class GeneralSubmitSuccessState extends ProfileState{
  GeneralResponse responseGeneral;
  GeneralSubmitSuccessState({required this.responseGeneral});
}
class EducationSubmitSuccessState extends ProfileState{
  EducationResponse responseEducation;
  EducationSubmitSuccessState({required this.responseEducation});
}
class AddressSubmitSuccessState extends ProfileState{
  AddressResponse responseAddress;
  AddressSubmitSuccessState({required this.responseAddress});
}
class ContactSubmitSuccessState extends ProfileState{
  ContactResponse responseContact;
  ContactSubmitSuccessState({required this.responseContact});
}
class CareerSubmitSuccessState extends ProfileState{
  CareerResponse responseCareer;
  CareerSubmitSuccessState({required this.responseCareer});
}
class RefreshTokenSuccessState extends ProfileState{
  String? token;
  String? refreshToken;
  RefreshTokenSuccessState({
    required this.token,
    required this.refreshToken,
  });
}
class TokenExpiredState extends ProfileState{
  String message;
  RefreshTokenResponse checkrefreshtokenmessage;
  TokenExpiredState({
    required this.message,
    required this.checkrefreshtokenmessage,
  });
}
class ProfileTeacherScreenSuccessState extends ProfileState{
  ProfileTeacherScreenApi  response;
  ProfileTeacherScreenSuccessState({required this.response});
}
class ProfileTeacherError extends ProfileState{
  String errorMessage;
  ProfileTeacherError({required this.errorMessage});
}
class ProfileTeacherLoading extends ProfileState {}
class ProfileTeacherLoadingSuccess extends ProfileState {}