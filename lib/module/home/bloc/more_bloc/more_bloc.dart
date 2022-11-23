import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ez_at_u/module/home/model/response/more_response/up_img_teacher_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ez_at_u/module/home/model/response/more_response/screen_more_list_name_gen_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:ez_at_u/module/home/model/response/more_response/scree_more_pdpa_response.dart';
import 'package:ez_at_u/module/home/model/response/more_response/screen_more_board_student_list_detail_response.dart';
import 'package:ez_at_u/module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import 'package:ez_at_u/module/home/model/response/more_response/screen_more_contact_us_response.dart';
import 'package:ez_at_u/module/home/model/response/more_response/screen_more_faq_response.dart';
import 'package:ez_at_u/module/home/model/response/more_response/screen_more_response.dart';
import 'package:ez_at_u/module/home/repository/more_repository.dart';

import 'package:ez_at_u/module/home/model/response/more_response/screen_more_board_student_list_response.dart';

import '../../../../main_route/main_route_bloc/main_route_bloc.dart';
import '../../../../main_route/main_route_bloc_model/CheckTokenExpiredRespomse.dart';
import '../../../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../../../utils/shared_preferences.dart';
import '../../model/response/more_response/scree_more_pdpa_response.dart';
import '../../model/response/more_response/screen_more_board_student_list_detail_response.dart';
import '../../model/response/more_response/screen_more_board_student_list_response.dart';
import '../../model/response/more_response/screen_more_board_teacher_response.dart';
import '../../model/response/more_response/screen_more_contact_us_response.dart';
import '../../model/response/more_response/screen_more_faq_response.dart';
import '../../model/response/more_response/screen_more_list_name_gen_response.dart';
import '../../model/response/more_response/screen_more_response.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> with MoreRepository {
  bool isFetching = false;
  MoreBloc() : super(MoreInitial()) {
    on<MoreEvent>((event, emit) {
      // TODO: implement event handler
    });
    MoreEventInitial() async {

      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(responseCheckTokenExpiredResponse.data);
        print("checkTokenExpiredResponse ============================ false");
        print(checkTokenExpiredResponse.body?.expiremessage);
        print(checkTokenExpiredResponse.head?.timeexpire);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {

          }
          else{

            print("checkTokenExpiredResponse ============================ true");
            Response responseRefreshTokenResponse = await getRefreshToken(
                refreshToken: isMainRouteRefresh.toString());
            if (responseRefreshTokenResponse.statusCode == 200) {
              RefreshTokenResponse refreshTokenResponse =
              RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
              if (refreshTokenResponse.head?.status == 200) {
                await setUserKey(globalKey: refreshTokenResponse.body?.token?? "");
                await setUserRefreshKey(refreshKey: refreshTokenResponse.body?.refreshtoken?? "");
              }
              // else if (refreshTokenResponse.head?.status == 400) {
              //   emit(TokenExpiredState(message: responseRefreshTokenResponse.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
              // }
              else {
                emit(MoreError(message:refreshTokenResponse.head?.message ?? ""));
              }
            }  else {
              emit(MoreError(message: responseRefreshTokenResponse.statusMessage ?? ""));
            }
          }

        }
        else {
          emit(MoreError(message:checkTokenExpiredResponse.head?.message ?? ""));
        }
      }  else {
        emit(MoreError(message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    };


    on<MoreScreenInfoEvent>((event, emit) async {
      try {
        emit(MoreLoading());
        await  MoreEventInitial();
        Response responseMorePDPA = await getScreenMoreInfo();
        emit(MoreEndLoading());
        if (responseMorePDPA.statusCode == 200) {
          ScreenMoreResponse screenMoreResponse = ScreenMoreResponse.fromJson(responseMorePDPA.data);
          if (screenMoreResponse.head?.status == 200) {
            emit(MoreScreenInfoSuccessState(
              responseScreenMore: screenMoreResponse,
            ));
          } else {
            emit(MoreError(message: screenMoreResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreError(message: responseMorePDPA.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<MorePDPAEvent>((event, emit) async {
      try {
        emit(MorePDPALoading());
        await  MoreEventInitial();
        Response responseMorePDPA = await getScreenMorePDPA();
        emit(MorePDPAEndLoading());
        if (responseMorePDPA.statusCode == 200) {
          ScreenMorePDPAResponse screenMorePDPAResponse = ScreenMorePDPAResponse.fromJson(responseMorePDPA.data);
          if (screenMorePDPAResponse.head?.status == 200) {
            emit(MorePDPASuccessState(
              responsePDPA: screenMorePDPAResponse,
            ));
          } else {
            emit(MorePDPAError(message: screenMorePDPAResponse.head?.message ?? ""));
          }
        } else {
          emit(MorePDPAError(message: responseMorePDPA.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MorePDPAError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<MoreFAQEvent>((event, emit) async {
      try {
        emit(MoreFAQLoading());
        await   MoreEventInitial();
        Response responseMoreFAQ = await getScreenMoreFAQ(module :event.module);
        emit(MoreFAQEndLoading());
        if (responseMoreFAQ.statusCode == 200) {
          ScreenMoreFAQResponse screenMoreFAQResponse = ScreenMoreFAQResponse.fromJson(responseMoreFAQ.data);
          if (screenMoreFAQResponse.head?.status == 200) {
            emit(MoreFAQSuccessState(responseFAQ: screenMoreFAQResponse));
          } else {
            emit(MoreFAQError(message: screenMoreFAQResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreFAQError(message: responseMoreFAQ.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreFAQError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<MoreContactUsEvent>((event, emit) async {
      try {
        emit(MoreContactUsLoading());
        await  MoreEventInitial();
        Response responseMoreContactUs = await getScreenMoreContactUs();
        emit(MoreContactUsEndLoading());
        if (responseMoreContactUs.statusCode == 200) {
          ScreenMoreContactUsResponse screenMoreContactUsResponse =
              ScreenMoreContactUsResponse.fromJson(responseMoreContactUs.data);
          if (screenMoreContactUsResponse.head?.status == 200) {
            emit(MoreContactUsSuccessState(responseContactUs: screenMoreContactUsResponse));
          } else {
            emit(MoreContactUsError(message: screenMoreContactUsResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreContactUsError(message: responseMoreContactUs.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreContactUsError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<MoreBoardDetailStudentEvent>((event, emit) async {
      try {
        emit(MoreBoardDetailStudentLoading());
        await MoreEventInitial();
        Response responseMoreBoardDetailStudent = await getScreenMoreBoardDetailStudent(event.studentCode);
        emit(MoreBoardDetailStudentEndLoading());
        if (responseMoreBoardDetailStudent.statusCode == 200) {
          ScreenMoreBoardStudentDetailResponse screenMoreBoardStudentDetailResponse =
              ScreenMoreBoardStudentDetailResponse.fromJson(responseMoreBoardDetailStudent.data);
          if (screenMoreBoardStudentDetailResponse.head?.status == 200) {
            emit(MoreBoardDetailStudentSuccessState(responseBoardDetailStudent: screenMoreBoardStudentDetailResponse));
          } else {
            emit(MoreBoardDetailStudentError(message: screenMoreBoardStudentDetailResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreBoardDetailStudentError(message: responseMoreBoardDetailStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreBoardDetailStudentError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<MoreBoardListStudentEvent>((event, emit) async {
      try {
        emit(MoreBoardListStudentLoading());
        await MoreEventInitial();
        Response responseMoreBoardListStudent = await getMoreBoardListStudent(event.gen,event.studentID,event.studentName,event.studentLastname,);
        emit(MoreBoardListStudentEndLoading());
        if (responseMoreBoardListStudent.statusCode == 200) {
          ScreenMoreBoardStudentListResponse screenMoreBoardStudentListResponse =
              ScreenMoreBoardStudentListResponse.fromJson(responseMoreBoardListStudent.data);
          if (screenMoreBoardStudentListResponse.head?.status == 200) {
            emit(MoreBoardListStudentSuccessState(responseBoardListStudent: screenMoreBoardStudentListResponse));
          } else {
            emit(MoreBoardListStudentError(message: screenMoreBoardStudentListResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreBoardListStudentError(message: responseMoreBoardListStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreBoardListStudentError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<MoreBoardListStudentSearchEvent>((event, emit) async {
      try {

        await MoreEventInitial();
        Response responseMoreBoardListStudent = await getMoreBoardListStudent(event.gen,event.studentID,event.studentName,event.studentLastname,);
        if (responseMoreBoardListStudent.statusCode == 200) {
          ScreenMoreBoardStudentListResponse screenMoreBoardStudentListResponse =
              ScreenMoreBoardStudentListResponse.fromJson(responseMoreBoardListStudent.data);
          if (screenMoreBoardStudentListResponse.head?.status == 200) {
            emit(MoreBoardListStudentSearchSuccessState(responseBoardListStudent: screenMoreBoardStudentListResponse));
          } else {
            emit(MoreBoardListStudentError(message: screenMoreBoardStudentListResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreBoardListStudentError(message: responseMoreBoardListStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreBoardListStudentError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<MoreBoardListGenStudentEvent>((event, emit) async {
      try {
        emit(ListGenStudentLoading());

        await MoreEventInitial();
        Response responseListGenStudent = await getMoreListGen(gen: event.gen,genname: event.genname);
        emit(ListGenStudentEndLoading());
        if (responseListGenStudent.statusCode == 200) {
          ScreenMoreListNameGenResponse screenMoreListNameGenResponse =
              ScreenMoreListNameGenResponse.fromJson(responseListGenStudent.data);
          if (screenMoreListNameGenResponse.head?.status == 200) {
            emit(MoreBoardListGenStudentSuccessState(responseBoardListGenStudent: screenMoreListNameGenResponse));
          } else {
            emit(ListGenStudentError(message: screenMoreListNameGenResponse.head?.message ?? ""));
          }
        } else {
          emit(ListGenStudentError(message: responseListGenStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ListGenStudentError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<MoreBoardListGenStudentSearchEvent>((event, emit) async {
      try {
        await MoreEventInitial();
        Response responseListGenStudent = await getMoreListGen(gen: event.gen,genname: event.genname);
        if (responseListGenStudent.statusCode == 200) {
          ScreenMoreListNameGenResponse screenMoreListNameGenResponse =
              ScreenMoreListNameGenResponse.fromJson(responseListGenStudent.data);
          if (screenMoreListNameGenResponse.head?.status == 200) {
            emit(MoreBoardListGenStudentSearchSuccessState(responseBoardListGenStudent: screenMoreListNameGenResponse));
          } else {
            emit(ListGenStudentError(message: screenMoreListNameGenResponse.head?.message ?? ""));
          }
        } else {
          emit(ListGenStudentError(message: responseListGenStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ListGenStudentError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<MoreBoardTeacherEvent>((event, emit) async {
      try {
        emit(MoreBoardTeacherLoading());
        await MoreEventInitial();
        Response responseMoreBoardTeacher = await getScreenMoreBoardTeacher();
        emit(MoreBoardTeacherEndLoading());
        if (responseMoreBoardTeacher.statusCode == 200) {
          ScreenMoreBoardTeacherResponse screenMoreBoardTeacherResponse =
              ScreenMoreBoardTeacherResponse.fromJson(responseMoreBoardTeacher.data);
          if (screenMoreBoardTeacherResponse.head?.status == 200) {
            emit(MoreBoardTeacherSuccessState(responseBoardTeacher: screenMoreBoardTeacherResponse));
          } else {
            emit(MoreBoardTeacherError(message: screenMoreBoardTeacherResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreBoardTeacherError(message: responseMoreBoardTeacher.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreBoardTeacherError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<ChangeAvatarRequest>((event, emit) async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 20);
      if (image == null) return;
      final imageTemp = File(image.path);
      final bytes = File(image.path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      log("img_pan : $base64Image");

      await MoreEventInitial();
      emit(ChooseAvatarSuccess(avatarImage: imageTemp, base64img: base64Image));
    });
    on<SubmitChangeAvatarRequest>((event, emit) async {
      try {
        emit(MoreBoardTeacherLoading());
        await MoreEventInitial();
        Response responseBase64Img = await sentProfileImage(base64Image: event.base64Image, userid: event.userid);
        emit(MoreBoardTeacherEndLoading());
        if (responseBase64Img.statusCode == 200) {
          UpImgTeacherResponse upImgTeacherResponse = UpImgTeacherResponse.fromJson(responseBase64Img.data);
          if (upImgTeacherResponse.head?.status == 200) {
            emit(SubmitChooseAvatarSuccess());
          } else {
            emit(MoreBoardTeacherError(message: upImgTeacherResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreBoardTeacherError(message: responseBase64Img.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreBoardTeacherError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
