part of 'pdpa_bloc.dart';

abstract class PdpaState {}

class PdpaInitial extends PdpaState {}

class ScreenInfoPDPASuccessState extends PdpaState {
  ScreenPDPAResponse response;

  ScreenInfoPDPASuccessState({required this.response});
}

class PDPALoading extends PdpaState {}

class PDPAEndLoading extends PdpaState {}

class PDPAError extends PdpaState {
  String message;
  PDPAError({required this.message});
}

class PDPAAccept extends PdpaState {}

class PDPADecline extends PdpaState {}
