import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preferences.dart';

part 'resume_event.dart';
part 'resume_state.dart';
late SharedPreferences prefs;
class ResumeBloc extends Bloc<ResumeEvent, ResumeState> {
  ResumeBloc() : super(ResumeInitial()) {
    on<ResumeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ResumeInnitEvent>((event, emit) async {
      prefs = await SharedPreferences.getInstance();
      var isPhotoResume = prefs.getString('ResumePhoto') ?? '';
      await setResumePhoto(resumePhoto: isPhotoResume);
      emit(ResumeInitialState ());
    });
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

      await setResumePhoto(resumePhoto: base64Image??'');
      emit(ChangPhotoResumeSuccess(avatarImage: imageCroppedTemp,base64img: base64Image));
    }
    );
  }
}
