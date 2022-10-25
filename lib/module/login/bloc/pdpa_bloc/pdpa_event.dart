part of 'pdpa_bloc.dart';

abstract class PdpaEvent {}

class ScreenInfoPDPAEvent extends PdpaEvent {}

class OnClickPDPAEvent extends PdpaEvent {
  bool accept;
  OnClickPDPAEvent({required this.accept});
}
