import 'package:ez_at_u/utils/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_at_u/module/login/model/response/screen_pdpa_response.dart';
import 'package:ez_at_u/module/login/repository/pdpa_repository.dart';

part 'pdpa_event.dart';
part 'pdpa_state.dart';

class PdpaBloc extends Bloc<PdpaEvent, PdpaState> with PDPARepository {
  PdpaBloc() : super(PdpaInitial()) {
    on<PdpaEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ScreenInfoPDPAEvent>((event, emit) async {
      try {
        emit(PDPALoading());
        Response response = await getScreenPDPA();
        emit(PDPAEndLoading());
        if (response.statusCode == 200) {
          ScreenPDPAResponse screenForgotPasswordResponse = ScreenPDPAResponse.fromJson(response.data);
          if (screenForgotPasswordResponse.head?.status == 200) {
            await setVersionPDPA(versionPDPA: screenForgotPasswordResponse.body?.versionpdpa);
            emit(ScreenInfoPDPASuccessState(response: screenForgotPasswordResponse));
          } else {
            emit(PDPAError(message: screenForgotPasswordResponse.head?.message ?? ""));
          }
        } else {
          emit(PDPAError(message: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PDPAError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<OnClickPDPAEvent>((event, emit) {
      if (event.accept == true) {
        emit(PDPAAccept());
      } else {
        emit(PDPADecline());
      }
    });
  }
}
