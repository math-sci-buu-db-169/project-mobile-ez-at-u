import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../check_token/token_bloc.dart';
import '../../main_route/main_route_bloc_model/check_token_expired_response.dart';
import '../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../utils/shared_preferences.dart';
import '../components/components_resume.dart';
import '../examples/content_design_resume.dart';
import '../model/response/api_edit_resume_response_head.dart';
import '../model/response/get_address_resume_response.dart';
import '../model/response/get_certificate_resume_response.dart';
import '../model/response/get_about_me_resume_response.dart';
import '../model/response/get_district_list_address_resume_response.dart';
import '../model/response/get_education_resume_response.dart';
import '../model/response/get_experience_resume_response.dart';
import '../model/response/get_position_resume_response.dart';
import '../model/response/get_province_address_resume_response.dart';
import '../model/response/get_skill_language_resume_response.dart';
import '../model/response/get_skill_resume_response.dart';
import '../model/response/get_sub_district_list_address_resume_response.dart';
import '../model/response/get_user_infomartion_resume_response.dart';
import '../model/response/get_zip_code_address_resume_response.dart';
import '../model/response/image_up_load_resume_response.dart';
import '../model/response/pre_view_resume_response.dart';
import '../model/response/set_on_selected_resume.dart';
import '../repository/resume_repository.dart';

part 'resume_event.dart';
part 'resume_state.dart';

late SharedPreferences prefs;

class ResumeBloc extends Bloc<ResumeEvent, ResumeState> with ResumeRepository {
  ResumeBloc() : super(ResumeInitial()) {
    on<ResumeEvent>((event, emit) {
      // TODO: implement event handler
    });
    getRefHomeEventInitial(event, emit) async {
      prefs = await SharedPreferences.getInstance();
      isMainRouteRefresh = prefs.getString('refreshKey');
      isMainRouteKey = prefs.getString('UserKey');
      Response response =
          await getRefreshToken(refreshToken: isMainRouteRefresh.toString());
      if (response.statusCode == 200) {
        RefreshTokenResponse refreshTokenResponse =
            RefreshTokenResponse.fromJson(response.data);
        if (refreshTokenResponse.head?.status == 200) {
          await setUserKeyAndRefreshKey(
            globalKey: refreshTokenResponse.body?.token ?? "",
            refreshKey: refreshTokenResponse.body?.refreshtoken ?? "",
            isRole: refreshTokenResponse.body?.role ?? "TC",
            userLanguage: refreshTokenResponse.body?.language ?? "TH",
          );
        } else if (refreshTokenResponse.head?.status == 400) {
          emit(TokenExpiredState(
              message: response.statusMessage ?? "",
              checkrefreshtokenmessage: refreshTokenResponse));
        } else {
          emit(ResumeError(
              errorMessage: refreshTokenResponse.head?.message ?? ""));
        }
      } else {
        emit(ResumeError(errorMessage: response.statusMessage ?? ""));
      }
    }

    checkPreviewResumeEventInitial(event, emit) async {
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
            CheckTokenExpiredResponse.fromJson(
                responseCheckTokenExpiredResponse.data);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {
            print(
                "CheckHome 1  false============checkHome======CheckTokenExpired========== ${checkTokenExpiredResponse.head?.timeexpire}");
            print(checkTokenExpiredResponse.body?.expiremessage);
            print(checkTokenExpiredResponse.body?.timenow);
            print(checkTokenExpiredResponse.body?.timeexpir);
            // emit(HomeEndLoading());
          } else {
            print(
                "CheckHome  2 == checkTokenExpiredResponse.head?.timeexpire == true");
            await getRefHomeEventInitial(event, emit);
          }
        } else if (checkTokenExpiredResponse.head?.status == 401) {
          print("CheckHome 3 == checkTokenExpiredResponse.head?.status == 401");
          await getRefHomeEventInitial(event, emit);
        } else {
          emit(ResumeError(
              errorMessage: checkTokenExpiredResponse.head?.message ?? ""));
        }
      } else if (responseCheckTokenExpiredResponse.statusCode == 401) {
        print("CheckHome 4 == checkTokenExpiredResponse.head?.status == 401");
        await getRefHomeEventInitial(event, emit);
        // print(
        //     "checkTokenExpiredResponse ============checkMainRouteEventInitial=======RefreshTokenResponse 401 ========= responseCheckTokenExpiredResponse.statusCode ");
        //
        // Response responseRefreshTokenResponse = await getRefreshToken(
        //     refreshToken: isMainRouteRefresh.toString());
        // // emit(HomeEndLoading());
        // if (responseRefreshTokenResponse.statusCode == 200) {
        //   RefreshTokenResponse refreshTokenResponse =
        //   RefreshTokenResponse.fromJson(responseRefreshTokenResponse.data);
        //   if (refreshTokenResponse.head?.status == 200) {
        //     await setUserKeyAndRefreshKey(
        //         globalKey: refreshTokenResponse.body?.token ?? "",
        //         refreshKey: refreshTokenResponse.body?.refreshtoken ?? ""
        //
        //     );
        //   }
        //   else if (refreshTokenResponse.head?.status == 401) {
        //     emit(TokenExpiredState(
        //         message: responseRefreshTokenResponse.statusMessage ?? "",
        //         checkrefreshtokenmessage: refreshTokenResponse));
        //   }
        //   else {
        //     emit(MainRouteError(
        //         message: refreshTokenResponse.head?.message ?? ""));
        //   }
        // } else {
        //   emit(MainRouteError(
        //       message: responseRefreshTokenResponse.statusMessage ?? ""));
        // }
      } else {
        emit(ResumeError(
            errorMessage:
                responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }

    // on<GetPreviewResumeEvent>((event, emit) async {
    //   try {
    //     emit(PreviewResumeLoading());
    //     print("CheckProfile 5 == ProfileApiEvent");
    //
    //     await checkPreviewResumeEventInitial(event, emit);
    //     Response responsePreViewResume = await getPreviewResumeDataAndScreen();
    //     emit(PreviewResumeEndLoading());
    //     if (responsePreViewResume.statusCode == 200) {
    //       PreViewResumeResponse preViewResumeResponse =
    //           PreViewResumeResponse.fromJson(responsePreViewResume.data);
    //       if (preViewResumeResponse.head?.status == 200) {
    //         emit(PreviewResumeSuccessState(
    //             isPreViewResumeResponse: preViewResumeResponse));
    //       } else {
    //         emit(PreviewResumeError(
    //             errorMessage: preViewResumeResponse.head?.message ?? ""));
    //       }
    //     } else {
    //       emit(PreviewResumeError(
    //           errorMessage: responsePreViewResume.statusMessage ?? ""));
    //     }
    //   } on DioError catch (e) {
    //     emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
    //   }
    // });
    on<GetOnSelectedAndPreviewResumeEvent>((event, emit) async {
      try {
        emit(PreviewResumeLoading());
        print(
            "GetOnSelectedAndPreviewResumeEvent 56 == GetOnSelectedAndPreviewResumeEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(PreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse =
              PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(OnSelectedAndPreviewResumeSuccessState(
              isPreViewResumeResponse: preViewResumeResponse,
            ));
          } else {
            emit(PreviewResumeError(
                errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetSetPreviewResumeEvent>((event, emit) async {
      try {
        emit(PreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(PreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse =
              PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(PreviewResumeSuccessState(
                isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SetOnSelectedAndPreviewResumeEvent>((event, emit) async {
      try {
        emit(PreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSetOnSelectedResume = await setOnSelectedResume(
          positionOnSelect: event.positionOnSelect,
          educationHSCOnSelect: event.educationHSCOnSelect,
          educationBDOnSelect: event.educationBDOnSelect,
          educationMDOnSelect: event.educationMDOnSelect,
          educationDDOnSelect: event.educationDDOnSelect,
          educationHDDOnSelect: event.educationHDDOnSelect,
          socialOnSelect: event.socialOnSelect,
          addressOnSelect: event.addressOnSelect,
          experienceOnSelect: event.experienceOnSelect,
          certificateOnSelect: event.certificateOnSelect,
          skillOnSelect: event.skillOnSelect,
          languageOnSelect: event.languageOnSelect,
        );
        emit(PreviewResumeEndLoading());
        if (responseSetOnSelectedResume.statusCode == 200) {
          SetOnSelectedResume setOnSelectedResume =
              SetOnSelectedResume.fromJson(responseSetOnSelectedResume.data);
          if (setOnSelectedResume.head?.status == 200) {
            emit(SetOnSelectedResumeSuccessState(
                isSetOnSelectedResume: setOnSelectedResume));
          } else {
            emit(PreviewResumeError(
                errorMessage: setOnSelectedResume.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage: responseSetOnSelectedResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<ChangeLanguageResumeRequest>((event, emit) async {
      try {
        emit(PreviewResumeLoading());
        print("CheckProfile99 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(PreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse =
              PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(ChangeLanguagePreviewResumeSuccessState(
                isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    // on<ChangePhotoRequest>((event, emit) async {
    //   if (kDebugMode) {
    //     print('Change avatar 999');
    //   }
    //   final image = await ImagePicker()
    //       .pickImage(source: ImageSource.gallery, imageQuality: 100);
    //   if (image == null) return;
    //   final imageTemp = image.path;
    //   final cropImage = await ImageCropper().cropImage(sourcePath: imageTemp);
    //   if (cropImage == null) return;
    //   final imageCroppedTemp = File(cropImage.path);
    //   final bytes = File(cropImage.path).readAsBytesSync();
    //   String base64Image = base64Encode(bytes);
    //   log("img_pan : $base64Image");
    //   emit(PreviewResumeLoading());
    //   print("CheckProfile 66 == ChangePhotoRequest");
    //   await setResumePhoto(resumePhoto: base64Image ?? '');
    //   await checkPreviewResumeEventInitial(event, emit);
    //   Response responseBase64Img =
    //       await sentResumeImage(base64Image: base64Image);
    //   emit(PreviewResumeEndLoading());
    //   if (responseBase64Img.statusCode == 200) {
    //     ImageUpLoadResumeResponse imageUpLoadResumeResponse =
    //         ImageUpLoadResumeResponse.fromJson(responseBase64Img.data);
    //     if (imageUpLoadResumeResponse.head?.status == 200) {
    //       emit(ChooseImageUpLoadResumeSuccess(
    //           avatarImage: imageCroppedTemp, base64img: base64Image));
    //     }
    //   }
    //
    //   // emit(ChangPhotoResumeSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
    // });

    on<EditChangePhotoRequest>((event, emit) async {
      if (kDebugMode) {
        print('Change avatar 999');
      }
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (image == null) return;
      final imageTemp = image.path;
      final cropImage = await ImageCropper().cropImage(sourcePath: imageTemp);
      if (cropImage == null) return;
      final imageCroppedTemp = File(cropImage.path);
      final bytes = File(cropImage.path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      log("img_pan : $base64Image");
      emit(EditPreviewResumeLoading());
      print("CheckProfile 66 == ChangePhotoRequest");
      await setResumePhoto(resumePhoto: base64Image ?? '');
      await checkPreviewResumeEventInitial(event, emit);
      Response responseBase64Img =
          await sentResumeImage(base64Image: base64Image);
      emit(EditPreviewResumeEndLoading());
      if (responseBase64Img.statusCode == 200) {
        ImageUpLoadResumeResponse imageUpLoadResumeResponse =
            ImageUpLoadResumeResponse.fromJson(responseBase64Img.data);
        if (imageUpLoadResumeResponse.head?.status == 200) {
          emit(EditChooseImageUpLoadResumeSuccess(
              avatarImage: imageCroppedTemp, base64img: base64Image));
        }
      }

      // emit(ChangPhotoResumeSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
    });
    on<ResumeInnitEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      var isPhotoResume = prefs.getString('ResumePhoto') ?? '';
      await setResumePhoto(resumePhoto: isPhotoResume);
      emit(ResumeInitialState());
    });

    on<GetEditScreenPreviewResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(EditPreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse =
              PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(EditPreviewResumeSuccessState(
                isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenAddressResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("GetEditScreenAddressResumeEventsentScreenProvinceAddressResume  5+6 == GetEditScreenAddressResumeEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseScreenAddressResume = await sentScreenAddressResume();
        Response responseScreenProvinceAddressResume = await sentScreenProvinceAddressResume();
        emit(EditPreviewResumeEndLoading());
        if (responseScreenAddressResume.statusCode == 200) {
          GetAddressResumeResponse getAddressResumeResponse =
              GetAddressResumeResponse.fromJson(
                  responseScreenAddressResume.data);
          if (getAddressResumeResponse.head?.status == 200) {
            if (responseScreenProvinceAddressResume.statusCode == 200) {
              GetProvinceAddressResumeResponse
                  getProvinceAddressResumeResponse =
                  GetProvinceAddressResumeResponse.fromJson(
                      responseScreenProvinceAddressResume.data);
              if (getAddressResumeResponse.head?.status == 200) {
                emit(GetEditScreenAddressResumeSuccessState(
                  isGetAddressResumeResponse: getAddressResumeResponse,
                  isGetProvinceAddressResumeResponse:
                      getProvinceAddressResumeResponse,
                ));
              } else {
                emit(EditPreviewResumeError(
                    errorMessage:
                        getAddressResumeResponse.head?.message ?? ""));
              }
            }
          } else {
            emit(EditPreviewResumeError(
                errorMessage: getAddressResumeResponse.head?.message ?? ""));
          }
        }
        else {
          emit(EditPreviewResumeError(
              errorMessage: responseScreenAddressResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenDistrictAddressResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("GetEditScreenDistrictAddressResumeEvent 5+2 == GetEditScreenDistrictAddressResumeEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetDistrictListAddressResumeResponse = await sentScreenDistrictListAddressResume(provinceId: event.provinceId);
        emit(EditPreviewResumeEndLoading());
        if (responseGetDistrictListAddressResumeResponse.statusCode == 200) {
          GetDistrictListAddressResumeResponse
              getDistrictListAddressResumeResponse =
              GetDistrictListAddressResumeResponse.fromJson(
                  responseGetDistrictListAddressResumeResponse.data);
          if (getDistrictListAddressResumeResponse.head?.status == 200) {

            emit(GetEditScreenDistrictAddressResumeSuccessState(
              isGetDistrictListAddressResumeResponse:
                  getDistrictListAddressResumeResponse,
            ));
          } else {
            emit(EditPreviewResumeError(
                errorMessage:
                    getDistrictListAddressResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage: responseGetDistrictListAddressResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<GetEditScreenZipCodeAddressResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("GetEditScreenDistrictAddressResumeEvent 5+2 == GetEditScreenDistrictAddressResumeEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetZipCodeAddressResumeResponse = await sentScreenZipCodeAddressResume(subDistrictId: event.subDistrictID);
        emit(EditPreviewResumeEndLoading());
        if (responseGetZipCodeAddressResumeResponse.statusCode == 200) {
          GetZipCodeAddressResumeResponse
          getZipCodeAddressResumeResponse =
          GetZipCodeAddressResumeResponse.fromJson(
              responseGetZipCodeAddressResumeResponse.data);
          if (getZipCodeAddressResumeResponse.head?.status == 200) {

            emit(GetEditScreenZipCodeAddressResumeSuccessState(
              isGetZipCodeAddressResumeResponse: getZipCodeAddressResumeResponse,
            ));
          } else {
            emit(EditPreviewResumeError(
                errorMessage:
                getZipCodeAddressResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage: responseGetZipCodeAddressResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<GetEditScreenTamBonAddressResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("GetEditScreenTamBonAddressResumeEvent 5+3 == GetEditScreenTamBonAddressResumeEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetSubDistrictListAddressResumeResponse = await sentScreenTamBonListAddressResume(districtId: event.tamBonId);
        emit(EditPreviewResumeEndLoading());
        if (responseGetSubDistrictListAddressResumeResponse.statusCode == 200) {
          GetSubDistrictListAddressResumeResponse
          getSubDistrictListAddressResumeResponse =
          GetSubDistrictListAddressResumeResponse.fromJson(
              responseGetSubDistrictListAddressResumeResponse.data);
          if (getSubDistrictListAddressResumeResponse.head?.status == 200) {

            emit(GetEditScreenSubDistrictAddressResumeSuccessState(
              isGetSubDistrictListAddressResumeResponse:
              getSubDistrictListAddressResumeResponse
            ));
          } else {
            emit(EditPreviewResumeError(
                errorMessage:
                getSubDistrictListAddressResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage: responseGetSubDistrictListAddressResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<SendEditAddressResumeEvent>((event, emit) async {
        try {
          print("SendEditAddressResumeEvent 5 +3 == SendEditAddressResumeEvent");

          await checkPreviewResumeEventInitial(event, emit);
          Response responseSentEditSkillResume = await sentEditAddressResume(
            house: event.house ,
            moo:  event.moo ,
            soiTH: event.soiTH ,
            soiEN:event.soiEN ,
            roadTH:event.roadTH ,
            roadEN: event.roadEN ,
            subDistrictID: event.subDistrictID ,
            districtID: event.districtID ,
            provinceID: event.provinceID ,
            zipcode:event.zipcode ,
          );
          if (responseSentEditSkillResume.statusCode == 200) {
            ApiEditResumeResponseHead sentEditContactResumeResponse =
            ApiEditResumeResponseHead.fromJson(
                responseSentEditSkillResume.data);
            if (sentEditContactResumeResponse.head?.status == 200) {
              emit(SentEditAddressResumeSuccessState(
                  apiEditResumeResponseHead: sentEditContactResumeResponse));
            } else {
              emit(PreviewResumeError(
                  errorMessage:
                  sentEditContactResumeResponse.head?.message ?? ""));
            }
          } else {
            emit(PreviewResumeError(
                errorMessage: responseSentEditSkillResume.statusMessage ?? ""));
          }
        } on DioError catch (e) {
          emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
        }
      });
    on<EditChangeLanguageResumeRequest>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile99 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(EditPreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse =
              PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(EditChangeLanguagePreviewResumeSuccessState(
                isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditAboutMeResumeEvent>((event, emit) async {
      try {
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditAboutResume = await sentEditAboutMeResume(
            detailsTH: event.aboutMeControllerTH,
            detailsEN: event.aboutMeControllerEN);
        if (responseSentEditAboutResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditAboutResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditAboutResume.data);
          if (sentEditAboutResumeResponse.head?.status == 200) {
            emit(SentEditAboutMeResumeSuccessState(
                apiEditResumeResponseHead: sentEditAboutResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage: sentEditAboutResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage: responseSentEditAboutResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenAboutMeResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetAboutMeResumeResponse =
            await sentScreenAboutResume();
        emit(EditPreviewResumeEndLoading());
        if (responseGetAboutMeResumeResponse.statusCode == 200) {
          GetAboutMeResumeResponse getAboutMeResumeResponse =
              GetAboutMeResumeResponse.fromJson(
                  responseGetAboutMeResumeResponse.data);
          if (getAboutMeResumeResponse.head?.status == 200) {
            emit(GetEditScreenAboutMeResumeSuccessState(
                isGetEducationResumeResponse: getAboutMeResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: getAboutMeResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseGetAboutMeResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenUserInfoResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetUserInformationResume =
            await sentScreenUserInfoResume();
        emit(EditPreviewResumeEndLoading());
        if (responseGetUserInformationResume.statusCode == 200) {
          GetUserInformationResumeResponse getUserInformationResumeResponse =
              GetUserInformationResumeResponse.fromJson(
                  responseGetUserInformationResume.data);
          if (getUserInformationResumeResponse.head?.status == 200) {
            emit(GetEditScreenUserInfoResumeSuccessState(
                isGetUserInformationResumeResponse:
                    getUserInformationResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage:
                    getUserInformationResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseGetUserInformationResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenPositionsResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetAboutMeResumeResponse =
            await sentScreenPositionResume(positionID: event.positionID);
        emit(EditPreviewResumeEndLoading());
        if (responseGetAboutMeResumeResponse.statusCode == 200) {
          GetPositionResumeResponse getPositionResumeResponse =
              GetPositionResumeResponse.fromJson(
                  responseGetAboutMeResumeResponse.data);
          if (getPositionResumeResponse.head?.status == 200) {
            emit(GetEditScreenPositionResumeSuccessState(
                isGetPositionResumeResponse: getPositionResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: getPositionResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseGetAboutMeResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenEducationResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetAboutMeResumeResponse =
            await sentScreenEducationResume(
                eduId: event.eduId, type: event.type);
        emit(EditPreviewResumeEndLoading());
        if (responseGetAboutMeResumeResponse.statusCode == 200) {
          GetEducationResumeResponse getEducationResumeResponse =
              GetEducationResumeResponse.fromJson(
                  responseGetAboutMeResumeResponse.data);
          if (getEducationResumeResponse.head?.status == 200) {
            emit(GetEditScreenEducationResumeSuccessState(
                isGetEducationResumeResponse: getEducationResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: getEducationResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseGetAboutMeResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenExperienceResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetAboutMeResumeResponse =
            await sentScreenExperienceResume(experienceId: event.id);
        emit(EditPreviewResumeEndLoading());
        if (responseGetAboutMeResumeResponse.statusCode == 200) {
          GetExperienceResumeResponse getExperienceResumeResponse =
              GetExperienceResumeResponse.fromJson(
                  responseGetAboutMeResumeResponse.data);
          if (getExperienceResumeResponse.head?.status == 200) {
            emit(GetEditScreenExperienceResumeSuccessState(
                isGetExperienceResumeResponse: getExperienceResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: getExperienceResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseGetAboutMeResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<GetEditScreenCertificateResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetCertificateResumeResponse =
            await sentScreenCertificateResume(certificateId: event.id);
        emit(EditPreviewResumeEndLoading());
        if (responseGetCertificateResumeResponse.statusCode == 200) {
          GetCertificateResumeResponse getCertificateResumeResponse =
              GetCertificateResumeResponse.fromJson(
                  responseGetCertificateResumeResponse.data);
          if (getCertificateResumeResponse.head?.status == 200) {
            emit(GetEditScreenCertificateResumeSuccessState(
                isGetCertificateResumeResponse: getCertificateResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage:
                    getCertificateResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseGetCertificateResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<GetEditScreenSkillLanguageResumeEvent>((event, emit) async {
      try {
        emit(SkillLanguageResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetSkillLanguageResumeResponse =
            await sentScreenSkillLanguageResume(skillLanguageId: event.id);
        emit(SkillLanguageResumeEndLoading());
        if (responseGetSkillLanguageResumeResponse.statusCode == 200) {
          GetSkillLanguageResumeResponse getSkillLanguageResumeResponse =
              GetSkillLanguageResumeResponse.fromJson(
                  responseGetSkillLanguageResumeResponse.data);
          if (getSkillLanguageResumeResponse.head?.status == 200) {
            emit(GetEditScreenSkillLanguageResumeSuccessState(
                isGetSkillLanguageResumeResponse:
                    getSkillLanguageResumeResponse));
          } else {
            emit(SkillLanguageResumeError(
                errorMessage:
                    getSkillLanguageResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(SkillLanguageResumeError(
              errorMessage:
                  responseGetSkillLanguageResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(SkillLanguageResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<GetEditScreenSkillResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseGetSkillResumeResponse =
            await sentScreenSkillResume(skillId: event.id);
        emit(EditPreviewResumeEndLoading());
        if (responseGetSkillResumeResponse.statusCode == 200) {
          GetSkillResumeResponse getSkillResumeResponse =
              GetSkillResumeResponse.fromJson(
                  responseGetSkillResumeResponse.data);
          if (getSkillResumeResponse.head?.status == 200) {
            emit(GetEditScreenSkillResumeSuccessState(
                isGetSkillResumeResponse: getSkillResumeResponse));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: getSkillResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseGetSkillResumeResponse.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditEducationResumeEvent>((event, emit) async {
      try {
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditEducationResume =
            await sentEditEducationResume(
          edit: event.edit,
          id: event.id,
          orderChoose: event.orderChoose,
          startDate: event.startDate,
          endDate: event.endDate,
          type: event.type,
          placeOfStudy: event.placeOfStudy,
          placeOfStudyEN: event.placeOfStudyEN,
          detailTH: event.detailTH,
          detailEN: event.detailEN,
        );
        if (responseSentEditEducationResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditAboutResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditEducationResume.data);
          if (sentEditAboutResumeResponse.head?.status == 200) {
            emit(SentEditEducationResumeSuccessState(
                apiEditResumeResponseHead: sentEditAboutResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage: sentEditAboutResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage:
                  responseSentEditEducationResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });

    on<SentEditContactResumeEvent>((event, emit) async {
      try {
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditPositionsResume = await sentEditContactResume(
          email: event.email,
          phone: event.phone,
          facebook: event.facebook,
          line: event.line,
          instagram: event.instagram,
          twitter: event.twitter,
          youtube: event.youtube,
        );
        if (responseSentEditPositionsResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditContactResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditPositionsResume.data);
          if (sentEditContactResumeResponse.head?.status == 200) {
            emit(SentEditContactResumeSuccessState(
                apiEditResumeResponseHead: sentEditContactResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage:
                    sentEditContactResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage:
                  responseSentEditPositionsResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditExperienceResumeEvent>((event, emit) async {
      try {
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditPositionsResume =
            await sentEditExperienceResume(
          edit: event.edit,
          id: event.id,
          orderChoose: event.orderChoose,
          startDate: event.startDate,
          endDate: event.endDate,
          positionTH: event.positionTH,
          positionEN: event.positionEN,
          detailTH: event.detailTH,
          detailEN: event.detailEN,
        );
        if (responseSentEditPositionsResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditContactResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditPositionsResume.data);
          if (sentEditContactResumeResponse.head?.status == 200) {
            emit(SentEditExperienceResumeSuccessState(
                apiEditResumeResponseHead: sentEditContactResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage:
                    sentEditContactResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage:
                  responseSentEditPositionsResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditPositionsResumeEvent>((event, emit) async {
      try {
        print("SentEditPositionsResumeEvent 5 == SentEditPositionsResumeEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditPositionsResume = await sentEditPositionResume(
          id: event.positionsId,
          orderChoose: event.orderChoose,
          edit: event.edit,
          positionTH: event.positionControllerTH,
          positionEN: event.positionControllerEN,
          officeTH: event.officeControllerTH,
          officeEN: event.officeControllerEN,
        );
        if (responseSentEditPositionsResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditAboutResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditPositionsResume.data);
          if (sentEditAboutResumeResponse.head?.status == 200) {
            emit(SentEditPositionResumeSuccessState(
                apiEditResumeResponseHead: sentEditAboutResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage: sentEditAboutResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage:
                  responseSentEditPositionsResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditUserInfoResumeEvent>((event, emit) async {
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);

        print(
            " prefix: ${event.prefixId} ,name:  ${event.name} ,lastName: ${event.lastName}  ,nameEN:${event.nameEN} ,lastNameEN: ${event.lastNameEN} ");

        Response responseSentEditUserInfoResume = await sentEditUserInfoResume(
            prefixId: event.prefixId,
            name: event.name,
            lastName: event.lastName,
            nameEN: event.nameEN,
            lastNameEN: event.lastNameEN);
        emit(EditPreviewResumeEndLoading());
        if (responseSentEditUserInfoResume.statusCode == 200) {
          ApiEditResumeResponseHead apiEditResumeResponseHead =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditUserInfoResume.data);
          if (apiEditResumeResponseHead.head?.status == 200) {
            emit(SentEditUserInfoResumeSuccessState(
                apiEditResumeResponseHead: apiEditResumeResponseHead));
          } else {
            emit(EditPreviewResumeError(
                errorMessage: apiEditResumeResponseHead.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(
              errorMessage:
                  responseSentEditUserInfoResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(
            errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditCertificateResumeEvent>((event, emit) async {
      try {
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditCertificateResume =
            await sentEditCertificateResume(
          edit: event.edit,
          id: event.id,
          orderChoose: event.orderChoose,
          title: event.titleTH,
          titleEN: event.titleEN,
          description: event.detailTH,
          descriptionEN: event.detailEN,
        );
        if (responseSentEditCertificateResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditContactResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditCertificateResume.data);
          if (sentEditContactResumeResponse.head?.status == 200) {
            emit(SentEditCertificateResumeSuccessState(
                apiEditResumeResponseHead: sentEditContactResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage:
                    sentEditContactResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage:
                  responseSentEditCertificateResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditSkillLanguageResumeEvent>((event, emit) async {
      try {
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditSkillLanguageResume =
            await sentEditSkillLanguageResume(
          edit: event.edit,
          id: event.id,
          orderChoose: event.orderChoose,
          language: event.languageTH,
          languageEN: event.languageEN,
          descriptionTH: event.detailTH,
          descriptionEN: event.detailEN,
          value: event.valueLanguage,
        );
        if (responseSentEditSkillLanguageResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditContactResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditSkillLanguageResume.data);
          if (sentEditContactResumeResponse.head?.status == 200) {
            emit(SentEditSkillLanguageResumeSuccessState(
                apiEditResumeResponseHead: sentEditContactResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage:
                    sentEditContactResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage:
                  responseSentEditSkillLanguageResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
    on<SentEditSkillResumeEvent>((event, emit) async {
      try {
        print("CheckProfile 5 == ProfileApiEvent");

        await checkPreviewResumeEventInitial(event, emit);
        Response responseSentEditSkillResume = await sentEditSkillResume(
          edit: event.edit,
          id: event.id,
          orderChoose: event.orderChoose,
          skill: event.skillTH,
          skillEN: event.skillEN,
          descriptionTH: event.detailTH,
          descriptionEN: event.detailEN,
          value: event.valueSkill,
        );
        if (responseSentEditSkillResume.statusCode == 200) {
          ApiEditResumeResponseHead sentEditContactResumeResponse =
              ApiEditResumeResponseHead.fromJson(
                  responseSentEditSkillResume.data);
          if (sentEditContactResumeResponse.head?.status == 200) {
            emit(SentEditSkillResumeSuccessState(
                apiEditResumeResponseHead: sentEditContactResumeResponse));
          } else {
            emit(PreviewResumeError(
                errorMessage:
                    sentEditContactResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(
              errorMessage: responseSentEditSkillResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }
    });
  }
}
