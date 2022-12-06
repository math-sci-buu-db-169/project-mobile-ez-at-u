import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../check_token/token_bloc.dart';
import '../../main_route/main_route_bloc_model/check_token_expired_response.dart';
import '../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../utils/shared_preferences.dart';
import '../model/response/image_up_load_resume_response.dart';
import '../model/response/pre_view_resume_response.dart';
import '../repository/resume_repository.dart';

part 'resume_event.dart';
part 'resume_state.dart';
late SharedPreferences prefs;
class ResumeBloc extends Bloc<ResumeEvent, ResumeState> with ResumeRepository{
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
          emit(ResumeError(errorMessage: refreshTokenResponse.head?.message ?? ""));
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
            errorMessage: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    }

    on<GetPreviewResumeEvent>((event, emit) async{
      try {
        emit(PreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await  checkPreviewResumeEventInitial(event, emit) ;
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(PreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse = PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(PreviewResumeSuccessState(isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(PreviewResumeError(errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }

    }
    );

    on<ChangeLanguageResumeRequest>((event, emit) async{
      try {
        emit(PreviewResumeLoading());
        print("CheckProfile99 == ProfileApiEvent");

        await  checkPreviewResumeEventInitial(event, emit) ;
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(PreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse = PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(ChangeLanguagePreviewResumeSuccessState(isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(PreviewResumeError(errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(PreviewResumeError(errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(PreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }

    }
    );
    on<ChangePhotoRequest>((event, emit) async{

      if (kDebugMode) {
        print('Change avatar 999');
      }
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 100);
      if (image == null) return;
      final imageTemp = image.path;
      final cropImage = await ImageCropper().cropImage(sourcePath: imageTemp);
      if (cropImage == null) return;
      final imageCroppedTemp = File(cropImage.path);
      final bytes = File(cropImage.path).readAsBytesSync();
      String base64Image =  base64Encode(bytes);
      log("img_pan : $base64Image");
      emit(PreviewResumeLoading());
      print("CheckProfile 66 == ChangePhotoRequest");
      await setResumePhoto(resumePhoto: base64Image??'');
      await  checkPreviewResumeEventInitial(event, emit) ;
      Response responseBase64Img = await sentResumeImage(base64Image:base64Image);
      emit(PreviewResumeEndLoading());
      if(responseBase64Img.statusCode == 200){
        ImageUpLoadResumeResponse imageUpLoadResumeResponse = ImageUpLoadResumeResponse.fromJson(responseBase64Img.data);
        if(imageUpLoadResumeResponse.head?.status == 200){
          emit(ChooseImageUpLoadResumeSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
        }
      }

      // emit(ChangPhotoResumeSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
    }
    );

    on<ResumeInnitEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      var isPhotoResume = prefs.getString('ResumePhoto') ?? '';
      await setResumePhoto(resumePhoto: isPhotoResume);
      emit(ResumeInitialState ());
    });

    on<GetEditScreenPreviewResumeEvent>((event, emit) async{
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile 5 == ProfileApiEvent");

        await  checkPreviewResumeEventInitial(event, emit) ;
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(EditPreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse = PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(EditPreviewResumeSuccessState(isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(EditPreviewResumeError(errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }

    }
    );
    on<EditChangePhotoRequest>((event, emit) async{

      if (kDebugMode) {
        print('Change avatar 999');
      }
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 100);
      if (image == null) return;
      final imageTemp = image.path;
      final cropImage = await ImageCropper().cropImage(sourcePath: imageTemp);
      if (cropImage == null) return;
      final imageCroppedTemp = File(cropImage.path);
      final bytes = File(cropImage.path).readAsBytesSync();
      String base64Image =  base64Encode(bytes);
      log("img_pan : $base64Image");
      emit(EditPreviewResumeLoading());
      print("CheckProfile 66 == ChangePhotoRequest");
      await setResumePhoto(resumePhoto: base64Image??'');
      await  checkPreviewResumeEventInitial(event, emit) ;
      Response responseBase64Img = await sentResumeImage(base64Image:base64Image);
      emit(EditPreviewResumeEndLoading());
      if(responseBase64Img.statusCode == 200){
        ImageUpLoadResumeResponse imageUpLoadResumeResponse = ImageUpLoadResumeResponse.fromJson(responseBase64Img.data);
        if(imageUpLoadResumeResponse.head?.status == 200){
          emit(EditChooseImageUpLoadResumeSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
        }
      }

      // emit(ChangPhotoResumeSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
    }
    );
    on<EditChangeLanguageResumeRequest>((event, emit) async{
      try {
        emit(EditPreviewResumeLoading());
        print("CheckProfile99 == ProfileApiEvent");

        await  checkPreviewResumeEventInitial(event, emit) ;
        Response responsePreViewResume = await getPreviewResumeDataAndScreen();
        emit(EditPreviewResumeEndLoading());
        if (responsePreViewResume.statusCode == 200) {
          PreViewResumeResponse preViewResumeResponse = PreViewResumeResponse.fromJson(responsePreViewResume.data);
          if (preViewResumeResponse.head?.status == 200) {
            emit(EditChangeLanguagePreviewResumeSuccessState(isPreViewResumeResponse: preViewResumeResponse));
          } else {
            emit(EditPreviewResumeError(errorMessage: preViewResumeResponse.head?.message ?? ""));
          }
        } else {
          emit(EditPreviewResumeError(errorMessage: responsePreViewResume.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(EditPreviewResumeError(errorMessage: e.response?.statusMessage ?? ""));
      }

    }
    );


  }
}
