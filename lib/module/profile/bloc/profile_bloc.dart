import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
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
    on<ProfileApiEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
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
        final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 20);
        if (image == null) return;
        final imageTemp = File(image.path);
        //--//
        // img.Image? imagee = img.decodeImage(pickedImage.readAsBytesSync());
        // var resized_image= img.copyResize(imagee, width: 120);
        // String base64Image = base64Encode(img.encodePng(resized_image));
        //--//
        // final originImage = img.decodeImage(imageTemp.readAsBytesSync());
        // final thumbnail = img.copyResize(originImage!, width: 150);
        // new File('out/thumbnail-test.png')..writeAsBytesSync(img.encodePng(thumbnail));
        // print("thumbnail is ${thumbnail}");
        final bytes = File(image.path).readAsBytesSync();
        String base64Image =  base64Encode(bytes);
        log("img_pan : $base64Image");
        //--//
        Response responseBase64Img = await sentProfileImage(base64Image);
        if(responseBase64Img.statusCode == 200){
          SubmitImageResponse submitImageResponse = SubmitImageResponse.fromJson(responseBase64Img.data);
          if(submitImageResponse.head?.status == 200){
            emit(ChooseAvatarSuccess(avatarImage: imageTemp,base64img: base64Image));
          }
        }
        // emit(ChooseAvatarSuccess(avatarImage: imageTemp,base64img: base64Image));
        // if (kDebugMode) {
        //   print(imageTemp);
        // }
        // emit(ChangeAvatarProcress());
      }


    }
    );
    on<GeneralSubmitEvent>((event, emit) async{
      try {
        emit(ProfileLoading());
        Response responseGeneralSubmit = await sentProfileGeneralData(
            event.name,
            event.surname,
            event.nickname);
        emit(ProfileLoadingSuccess());
        if (responseGeneralSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
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
        Response responseEducationSubmit = await sentProfileEducationData(
            event.gpaJh,
            event.gpaSh,
            event.gpaBd);
        emit(ProfileLoadingSuccess());
        if (responseEducationSubmit.statusCode == 200) {
          // print('aa = ' + '${response.data}');
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
          // print('aa = ' + '${response.data}');
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
          // print('aa = ' + '${response.data}');
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
