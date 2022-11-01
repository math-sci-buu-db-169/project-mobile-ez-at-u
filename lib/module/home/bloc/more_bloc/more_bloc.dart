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

    on<MoreScreenInfoEvent>((event, emit) async {
      try {
        emit(MoreLoading());
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
        Response responseMoreFAQ = await getScreenMoreFAQ();
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
        Response responseMoreBoardListStudent = await getMoreBoardListStudent(event.gen);
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
    on<MoreBoardListGenStudentEvent>((event, emit) async {
      try {
        emit(ListGenStudentLoading());
        Response responseListGenStudent = await getMoreListGen();
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
    on<MoreBoardTeacherEvent>((event, emit) async {
      try {
        emit(MoreBoardTeacherLoading());
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
      emit(ChooseAvatarSuccess(avatarImage: imageTemp, base64img: base64Image));
    });
    on<SubmitChangeAvatarRequest>((event, emit) async {
      try {
        emit(MoreBoardTeacherLoading());
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
