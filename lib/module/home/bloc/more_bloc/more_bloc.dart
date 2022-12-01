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
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main_route/main_route_bloc/main_route_bloc.dart';
import '../../../../main_route/main_route_bloc_model/check_token_expired_response.dart';
import '../../../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../../../utils/shared_preferences.dart';
import '../../model/response/more_response/courses_screen_response.dart';
import '../../model/response/more_response/related_links_response.dart';
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

late SharedPreferences prefs;
class MoreBloc extends Bloc<MoreEvent, MoreState> with MoreRepository {
  bool isFetching = false;
  MoreBloc() : super(MoreInitial()) {
    on<MoreEvent>((event, emit) {
      // TODO: implement event handler
    });
    getRefMoreEventInitial(event, emit) async {

      prefs = await SharedPreferences.getInstance();
      isMainRouteRefresh =  prefs.getString('refreshKey');
      isMainRouteKey =  prefs.getString('UserKey');
      Response response = await getRefreshToken(
          refreshToken: isMainRouteRefresh.toString());
      if (response.statusCode == 200) {
        RefreshTokenResponse refreshTokenResponse =
        RefreshTokenResponse.fromJson(response.data);
        if (refreshTokenResponse.head?.status == 200) {
          await setUserKeyAndRefreshKey(
              globalKey: refreshTokenResponse.body?.token ?? "",
              refreshKey: refreshTokenResponse.body?.refreshtoken ?? "",
              isRole: refreshTokenResponse.body?.role ??"TC",
              userLanguage: refreshTokenResponse.body?.language ??"TH",
          );
        }
        else if (refreshTokenResponse.head?.status == 400) {
          emit(TokenExpiredState(message: response.statusMessage ?? "", checkrefreshtokenmessage : refreshTokenResponse));
        }
        else {
          emit(MoreError(
              message: refreshTokenResponse.head?.message ?? ""));
        }
      }  else {
        emit(MoreError(message: response.statusMessage ?? ""));
      }
    }


    checkMoreEventInitial(event, emit) async {
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(
            responseCheckTokenExpiredResponse.data);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {
            print(
                "CheckMore 1  false============checkMore======CheckTokenExpired========== ${checkTokenExpiredResponse
                    .head?.timeexpire}");
            print(checkTokenExpiredResponse.body?.expiremessage);
            print(checkTokenExpiredResponse.body?.timenow);
            print(checkTokenExpiredResponse.body?.timeexpir);
            // emit(MoreEndLoading());
          }
          else {

            print("CheckMore  2 == checkTokenExpiredResponse.head?.timeexpire == true");
            await getRefMoreEventInitial(event, emit);
          }
        }
        else if (checkTokenExpiredResponse.head?.status == 401) {
          print("CheckMore 3 == checkTokenExpiredResponse.head?.status == 401");
          await getRefMoreEventInitial(event, emit);
        }
        else {
          emit(MoreError(
              message: checkTokenExpiredResponse.head?.message ?? ""));
        }
      }

      else if (responseCheckTokenExpiredResponse.statusCode == 401) {

        print("CheckMore 4 == checkTokenExpiredResponse.head?.status == 401");
        await getRefMoreEventInitial(event, emit);
      }
      else {
        emit(MoreError(
            message: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }



    on<MoreScreenInfoEvent>((event, emit) async {
      try {
        emit(MoreLoading());
        print("CheckMore 5 == MoreScreenInfoEvent");
        await  checkMoreEventInitial(event, emit) ;
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
        print("CheckMore 6 == MorePDPAEvent");
        await  checkMoreEventInitial(event, emit) ;
        Response responseMorePDPA = await getScreenMorePDPA(versionPDPA:event.versionPDPA,usabilityScreen:event.usabilityScreen);
        emit(MorePDPAEndLoading());
        if (responseMorePDPA.statusCode == 200) {
          ScreenMorePDPAResponse screenMorePDPAResponse = ScreenMorePDPAResponse.fromJson(responseMorePDPA.data);
          if (screenMorePDPAResponse.head?.status == 200) {

            await setVersionPDPA(versionPDPA: screenMorePDPAResponse.body?.data?.versionuse);
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
        print("CheckMore 7 == MoreFAQEvent");
        if(event.module !='login' ) {
       await  checkMoreEventInitial(event, emit) ;}
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
        print("CheckMore 8 == MoreContactUsEvent");
        await  checkMoreEventInitial(event, emit) ;
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
        print("CheckMore 9 == MoreBoardDetailStudentEvent");
        await  checkMoreEventInitial(event, emit) ;
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
        print("CheckMore 10 == MoreBoardListStudentEvent");
        await  checkMoreEventInitial(event, emit) ;
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

        print("CheckMore 10 == MoreBoardListStudentSearchEvent");
        await  checkMoreEventInitial(event, emit) ;
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

        print("CheckMore 11 == MoreBoardListGenStudentEvent");
        await  checkMoreEventInitial(event, emit) ;
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
        print("CheckMore 12 == MoreBoardListGenStudentSearchEvent");
        await  checkMoreEventInitial(event, emit) ;
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
        print("CheckMore 13 == MoreBoardTeacherEvent");
        await  checkMoreEventInitial(event, emit) ;
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

      print("CheckMore 14 == ChangeAvatarRequest");
      await  checkMoreEventInitial(event, emit) ;
      emit(ChooseAvatarSuccess(avatarImage: imageTemp, base64img: base64Image));
    });
    on<SubmitChangeAvatarRequest>((event, emit) async {
      try {
        emit(MoreBoardTeacherLoading());
        print("CheckMore 15 == SubmitChangeAvatarRequest");
        await  checkMoreEventInitial(event, emit) ;
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
    on<MoreRelatedLinksEvent>((event, emit) async {
      try {
        emit(MoreRelatedLinksLoading());
        print("CheckMore 13 == MoreBoardTeacherEvent");
        await  checkMoreEventInitial(event, emit) ;
        Response responseRelatedLinksScreen = await getRelatedLinksScreen();
        emit(MoreRelatedLinksEndLoading());
        if (responseRelatedLinksScreen.statusCode == 200) {
          RelatedLinksResponse relatedLinksResponse =
          RelatedLinksResponse.fromJson(responseRelatedLinksScreen.data);
          if (relatedLinksResponse.head?.status == 200) {
            emit(MoreRelatedLinksScreenInfoSuccessState(relatedLinksResponse: relatedLinksResponse));
          } else {
            emit(MoreRelatedLinksError(message: relatedLinksResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreRelatedLinksError(message: responseRelatedLinksScreen.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreRelatedLinksError(message: e.response?.statusMessage ?? ""));
      }
    });
    on<MoreCoursesScreenEvent>((event, emit) async {
      try {
        emit(MoreCoursesLoading());
        print("CheckMore 14 == MoreCoursesScreenEvent");
        await  checkMoreEventInitial(event, emit) ;
        Response responseCoursesScreen = await getMoreCourseScreen();
        emit(MoreCoursesEndLoading());
        if (responseCoursesScreen.statusCode == 200) {
          CoursesScreenResponse coursesScreenResponse =
          CoursesScreenResponse.fromJson(responseCoursesScreen.data);
          if (coursesScreenResponse.head?.status == 200) {
            emit(MoreCoursesScreenInfoSuccessState(coursesScreenResponse: coursesScreenResponse));
          } else {
            emit(MoreCoursesError(message: coursesScreenResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreCoursesError(message: responseCoursesScreen.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreCoursesError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<MoreSrarchNisitNinitEvent>((event, emit) async {
      try {
        emit(MoreSrarchNisitLoading());
        print("CheckMore 14 == MoreSrarchNisitNinitEvent");
        await  checkMoreEventInitial(event, emit) ;
        Response responseMoreBoardListStudent = await getMoreBoardListStudent(event.gen,event.studentID,event.studentName,event.studentLastname,);
        emit(MoreSrarchNisitEndLoading());
        if (responseMoreBoardListStudent.statusCode == 200) {
          ScreenMoreBoardStudentListResponse screenMoreBoardStudentListResponse =
          ScreenMoreBoardStudentListResponse.fromJson(responseMoreBoardListStudent.data);
          if (screenMoreBoardStudentListResponse.head?.status == 200) {
            emit(MoreSrarchNisitNinitSuccessState(responseBoardListStudent: screenMoreBoardStudentListResponse));
          } else {
            emit(MoreSrarchNisitError(message: screenMoreBoardStudentListResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreSrarchNisitError(message: responseMoreBoardListStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreSrarchNisitError(message: e.response?.statusMessage ?? ""));
      }
    });

    on<MoreSrarchNisitEvent>((event, emit) async {
      try {
        // emit(MoreSrarchNisitLoading());
        print("CheckMore 15 == MoreSrarchNisitEvent");
        await  checkMoreEventInitial(event, emit) ;
        Response responseMoreBoardListStudent = await getMoreBoardListStudent(event.gen,event.studentID,event.studentName,event.studentLastname,);
        // emit(MoreSrarchNisitEndLoading());
        if (responseMoreBoardListStudent.statusCode == 200) {
          ScreenMoreBoardStudentListResponse screenMoreBoardStudentListResponse =
          ScreenMoreBoardStudentListResponse.fromJson(responseMoreBoardListStudent.data);
          if (screenMoreBoardStudentListResponse.head?.status == 200) {
            emit(MoreSrarchNisitSuccessState(responseBoardListStudent: screenMoreBoardStudentListResponse));
          } else {
            emit(MoreSrarchNisitError(message: screenMoreBoardStudentListResponse.head?.message ?? ""));
          }
        } else {
          emit(MoreSrarchNisitError(message: responseMoreBoardListStudent.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(MoreSrarchNisitError(message: e.response?.statusMessage ?? ""));
      }
    });
  }
}
