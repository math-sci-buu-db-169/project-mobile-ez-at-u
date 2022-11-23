import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../../../main_route/main_route_bloc/main_route_bloc.dart';
import '../../../main_route/main_route_bloc_model/CheckTokenExpiredRespomse.dart';
import '../../../main_route/main_route_bloc_model/refresh_token_response.dart';
import '../../../utils/shared_preferences.dart';
import '../model/response/address.dart';
import '../model/response/api_profile_response.dart';
import '../model/response/career.dart';
import '../model/response/contact.dart';
import '../model/response/education.dart';
import '../model/response/general.dart';
import '../model/response/submit_image_response.dart';
import '../repository/profile_repository.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> with ProfileRepository {
  ProfileBloc() : super(ProfileInitial()) {
    ProfileEventInitial() async {

      emit(ProfileLoading());
      Response responseCheckTokenExpiredResponse = await getCheckTokenExpired();
      if (responseCheckTokenExpiredResponse.statusCode == 200) {
        CheckTokenExpiredResponse checkTokenExpiredResponse =
        CheckTokenExpiredResponse.fromJson(responseCheckTokenExpiredResponse.data);
        print("checkTokenExpiredResponse ============================ false");
        print(checkTokenExpiredResponse.body?.expiremessage);
        print(checkTokenExpiredResponse.head?.timeexpire);
        if (checkTokenExpiredResponse.head?.status == 200) {
          if (checkTokenExpiredResponse.head?.timeexpire == false) {

            emit(ProfileLoadingSuccess());
          }
          else{

            print("checkTokenExpiredResponse ============================ true");
            Response responseRefreshTokenResponse = await getRefreshToken(
                refreshToken: isMainRouteRefresh.toString());
            emit(ProfileLoadingSuccess());
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
                emit(ProfileError(
                    errorMessage: refreshTokenResponse.head?.message ?? ""));
              }
            }  else {
              emit(ProfileError(errorMessage: responseRefreshTokenResponse.statusMessage ?? ""));
            }
          }

        }
        else {
          emit(ProfileError(
              errorMessage: checkTokenExpiredResponse.head?.message ?? ""));
        }
      }  else {
        emit(ProfileError(errorMessage: responseCheckTokenExpiredResponse.statusMessage ?? ""));
      }
    };


    on<ProfileApiEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        // await ProfileEventInitial() ;
        Response response = await getApiProfile();
        emit(ProfileLoadingSuccess());
        if (response.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          ApiProfileResponse apiProfileResponse = ApiProfileResponse.fromJson(response.data);
          if (apiProfileResponse.head?.status == 200) {
            emit(ProfileApiSuccessState(response: apiProfileResponse));
          } else {
            emit(ProfileError(errorMessage: apiProfileResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: response.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }

    }
    );
    on<ChangeAvatarRequest>((event, emit) async{
      if (event is ChangeAvatarRequest) {
        if (kDebugMode) {
          print('Change avatar request');
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
        Response responseBase64Img = await sentProfileImage(base64Image);
        if(responseBase64Img.statusCode == 200){
          SubmitImageResponse submitImageResponse = SubmitImageResponse.fromJson(responseBase64Img.data);
          if(submitImageResponse.head?.status == 200){
            emit(ChooseAvatarSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
          }
        }
      }
    }
    );
    on<GeneralSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        // await ProfileEventInitial() ;
        Response responseGeneralSubmit = await sentProfileGeneralData(
            event.name,
            event.surname,
            event.nickname);
        emit(ProfileLoadingSuccess());
        if (responseGeneralSubmit.statusCode == 200) {
          GeneralResponse generalResponse = GeneralResponse.fromJson(responseGeneralSubmit.data);
          if (generalResponse.head?.status == 200) {
            emit(GeneralSubmitSuccessState(responseGeneral: generalResponse));
          } else {
            emit(ProfileError(errorMessage: generalResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseGeneralSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<EducationSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        // await ProfileEventInitial() ;
        Response responseEducationSubmit = await sentProfileEducationData(
            event.gpaJh,
            event.gpaSh,
            event.gpaBd);
        emit(ProfileLoadingSuccess());
        if (responseEducationSubmit.statusCode == 200) {
          EducationResponse educationResponse = EducationResponse.fromJson(responseEducationSubmit.data);
          if (educationResponse.head?.status == 200) {
            emit(EducationSubmitSuccessState(responseEducation: educationResponse));
          } else {
            emit(ProfileError(errorMessage: educationResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseEducationSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<AddressSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        // await ProfileEventInitial() ;
        Response responseAddressSubmit = await sentProfileAddressData(
            event.number,
            event.moo,
            event.soi,
            event.road,
            event.subDistrict,
            event.district,
            event.province,
            event.zipcode
        );
        emit(ProfileLoadingSuccess());
        if (responseAddressSubmit.statusCode == 200) {
          AddressResponse addressResponse = AddressResponse.fromJson(responseAddressSubmit.data);
          if (addressResponse.head?.status == 200) {
            emit(AddressSubmitSuccessState(responseAddress: addressResponse));
          } else {
            emit(ProfileError(errorMessage: addressResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseAddressSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
    on<ContactSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        // await ProfileEventInitial() ;
        Response responseContactSubmit = await sentProfileContactData(
            event.phone,
            event.line,
            event.facebook,
            event.instagram,
            event.twitter,
            event.youtube
        );
        emit(ProfileLoadingSuccess());
        if (responseContactSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
          ContactResponse contactResponse = ContactResponse.fromJson(responseContactSubmit.data);
          if (contactResponse.head?.status == 200) {
            emit(ContactSubmitSuccessState(responseContact: contactResponse));
          } else {
            emit(ProfileError(errorMessage: contactResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseContactSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );

    on<CareerSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        // await ProfileEventInitial() ;
        Response responseCareerSubmit = await sentProfileCareerData(
            event.attention,
            event.status,
            event.jobType,
            event.career,
            event.company,
            event.workplace
        );
        emit(ProfileLoadingSuccess());
        if (responseCareerSubmit.statusCode == 200) {
          CareerResponse careerResponse = CareerResponse.fromJson(responseCareerSubmit.data);
          if (careerResponse.head?.status == 200) {
            emit(CareerSubmitSuccessState(responseCareer: careerResponse));
          } else {
            emit(ProfileError(errorMessage: careerResponse.head?.message ?? ""));
          }
        } else {
          emit(ProfileError(errorMessage: responseCareerSubmit.statusMessage ?? ""));
        }
      } on DioError catch (e) {
        emit(ProfileError(errorMessage: e.response?.statusMessage ?? ""));
      }
    }
    );
  }
}
