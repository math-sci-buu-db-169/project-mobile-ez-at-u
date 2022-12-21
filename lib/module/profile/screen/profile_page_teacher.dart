import 'dart:convert';
import 'dart:io' show File;
import 'package:ez_at_u/module/profile/components/contact_data_tab_teacher.dart';
import 'package:ez_at_u/module/profile/components/education_data_tab_teacher.dart';
import 'package:ez_at_u/module/profile/components/general_data_tab_teacher.dart';
import 'package:ez_at_u/module/profile/components/generaldatatab.dart';
import 'package:ez_at_u/module/profile/model/response/api_profile_response.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:ez_at_u/module/profile/bloc/profile_bloc.dart';
import 'package:ez_at_u/module/profile/components/addressdatatab.dart';
import 'package:ez_at_u/module/profile/components/careerdatatab.dart';
import 'package:ez_at_u/module/profile/components/contactdatatab.dart';
import 'package:ez_at_u/module/profile/components/educationdatatab.dart';
import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../customs/dialog/dialog_widget.dart';
import '../../../customs/message/text_profile.dart';
import '../../../customs/progress_dialog.dart';
import '../../../customs/size/size.dart';

class ProfileScreenTeacher extends StatelessWidget {
  const ProfileScreenTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileBloc(),
    child: const ProfilePageTeacher(),
    );
  }
}



class ProfilePageTeacher extends StatefulWidget {
  const ProfilePageTeacher({Key? key}) : super(key: key);

  @override
  State<ProfilePageTeacher> createState() => _ProfilePageTeacherState();
}

class _ProfilePageTeacherState extends State<ProfilePageTeacher> with ProgressDialog {
  ProfileTeacherScreenApi? _apiProfileResponse;
  File? image;
  ChooseAvatarSuccess? avatarImage;
  String? base64img;
  String phimg = "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAAXNSR0IArs4c6QAAA1lJREFUeF7t3GtyqkAQBWBchmzD/e8Al6Euw1tTKXONAvPqxzlD8ydUAtM954PBoiqelmV5ns/nKTb/BB6Px3S63W7PtHO5XPw7OnAH1+t1muf5ByTtpF8Eis8V8cr+9w5JIGkLFHuQ98y/QALFFuTzBlgFCRQblLXVaBMkUHRRth4NuyCBooOy95zOggSKLEruQ1MRSKDIoOQwUpVikEDpQynBqAYJlDaUUowmkECpQ6nBaAYJlDKUWowukEDZR2nB6AYJlHWUVgwRkED5i9KDIQYSKD8ovRiiIFINlT0u8Y6SwBAHOSqKFIYKyNFQJDHUQI6CIo2hCjI6igaGOsioKFoYJiCjoWhimIGMgqKNYQrCjmKBYQ7CimKF4QLChmKJ4QbCgmKN4QqCjuKB4Q6CiuKFAQGChuKJAQOCguKNAQXijYKAAQfihYKCAQlijYKEAQtihYKGAQ2ijYKIAQ+ihYKKQQEijYKMQQMihYKOQQXSi8KAQQfSisKCQQlSi8KEQQtSisKGQQ2SQ2HEoAfZQmHFGALkE4UZYxiQF0r6yf71UlX/p54mjLqlOyNAQHTel6lYspxR1gCYUaiXrL3gWVFoQUoCLznG+Qb/Kk8JUhN0zbEIOHQgLQG3nOOFQwXSE2zPuZY4NCASgUqMoY1DASIZpORYGjjwIBoBaowphQMNohmc5tg9OLAgFoFZ1KjFgQSxDMqyVgkOHIhHQB41t3CgQDyD8az9jgMDghAIQg8QIAhBvK5S717cQbwDWFvLPXtyBfGceO4Tj1dvbiBeE85BvP/do0cXEI+J1kB4opiDMGF4POhNQRgxrFHMQJgxLFFMQEbAsEJRBxkJwwJFFWREDG0UNZCRMTRRVECOgKGFIg5yJAwNFFGQI2JIo4iBHBlDEkUEJDD+v/3qzaIbpLeB1pd+yOf1ZNIF0lMYOVCJ3lqzaQZpLSgxWZYxWjJqAmkpxBKidJ+1WVWD1BaQniDjeDWZVYHUDMwYnGbPpdkVg5QOqDkp9rFLMiwCKRmIPSyr/nNZZkFyA1hNZKQ6e5nuggSG3mWwle0mSGDoYey9+1oFCQx9jC2UL5DAsMNYQ/kDEhj2GJ8ovyBph/3Lv/zilKmcboh5nqfTsizPtBObfwL3+336B07+3Sny7gNQAAAAAElFTkSuQmCC";
  late String roleFromApi;
  late SharedPreferences prefs;
  @override
  void initState() {
    _initRole();
    super.initState();
    if (kDebugMode) {
      print('เรียก initState');
    }
    context.read<ProfileBloc>().add(ProfileApiTeacherEvent());
  }
  void _initRole()  async{

    prefs = await SharedPreferences.getInstance();
    setState(()  {
      roleFromApi = prefs.getString('Role')??"TC";
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state is ProfileTeacherLoading) {
        showProgressDialog(context);
      }
      if (state is ProfileTeacherLoadingSuccess) {
        hideProgressDialog(context);
      }
      if (state is ProfileTeacherError) {
        // print(state.errorMessage);
        dialogOneLineOneBtn(context, '${state.errorMessage}\n ', "OK", onClickBtn: () {
        // dialogOneLineOneBtn(context, state.errorMessage + '\n ', "OK", onClickBtn: () {
          Navigator.of(context).pop();
        });
      }
      if (state is GeneralSubmitSuccessState) {
        // print("TEST general");
        // print(state.responseGeneral.toJson());
        // print("TEST general");
        context.read<ProfileBloc>().add(ProfileApiTeacherEvent());
      }
      if (state is EducationSubmitSuccessState) {
        // print("TEST edu");
        // print(state.responseEducation.toJson());
        // print("TEST edu");
        context.read<ProfileBloc>().add(ProfileApiTeacherEvent());
      }
      if (state is AddressSubmitSuccessState) {
        // print("TEST address");
        // print(state.responseAddress.toJson());
        // print("TEST address");
        context.read<ProfileBloc>().add(ProfileApiTeacherEvent());
      }
      if (state is ContactSubmitSuccessState) {
        // print("TEST contact");
        // print(state.responseContact.toJson());
        // print("TEST contact");
        context.read<ProfileBloc>().add(ProfileApiTeacherEvent());
      }
      if (state is CareerSubmitSuccessState) {
        // print("TEST Career");
        // print(state.responseCareer.toJson());
        // print("TEST Career");
        context.read<ProfileBloc>().add(ProfileApiTeacherEvent());
      }
      if (state is ChooseAvatarSuccess) {
        // print("TEST Career");
        // print(state.responseCareer.toJson());
        // print("TEST Career");
        context.read<ProfileBloc>().add(ProfileApiTeacherEvent());
      }
    },
      builder: (context, state) {
        if (state is ProfileTeacherScreenSuccessState) {
          _apiProfileResponse = state.response;
          return buildContent(context, _apiProfileResponse, image, base64img);
        }
        // else if (state is ChooseAvatarSuccess) {
        //   return buildContent(context, _apiProfileResponse, state.avatarImage, state.base64img);
        // }
        return Scaffold(body: Container());
      },
      buildWhen: (context, state){
      return state is ProfileTeacherScreenSuccessState;
      // return state is ProfileApiSuccessState || state is ChooseAvatarSuccess;

      },
    );
  }

  Widget buildContent(BuildContext context,
      ProfileTeacherScreenApi? apiProfileTeacherScreenResponse, File? image, String? base64img) {
    Color? textColor = Theme.of(context).bottomAppBarColor;
    Color? dataTabColor = Theme.of(context).appBarTheme.backgroundColor;
    Color? dataTabColorRO = Theme.of(context).appBarTheme.foregroundColor;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return WillPopScope(onWillPop: ()async{return false;},
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
// Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Theme.of(context).bottomAppBarColor,
            ),
          ),
          title: Text(
            apiProfileTeacherScreenResponse?.body?.screeninfo?.titleprofile??profileTitleProfile
// '+$global_key'
            ,
// 'ทดสอบ bloc',
            style: TextStyle(
              color: Theme.of(context).bottomAppBarColor,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
// MaterialButton(
//     color: Colors.blue,
//     child: Text('Pick image'),
//     onPressed: (){
//       pickImage();
// }),
                    Container(
                        height: height * 0.3,
                        width: width,
                        color: Theme.of(context).splashColor,
                        child: (apiProfileTeacherScreenResponse?.body?.profileGeneralTH?.img
                            == "" ||
                            apiProfileTeacherScreenResponse?.body?.profileGeneralTH?.img == null)
                            ?
// Icon(
//         Icons.account_circle,
//         size: 100,
//       )
                        Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<ProfileBloc>()
                                  .add(ChangeAvatarRequest());
// pickImage();
                            },
                            child: CircleAvatar(
                              radius: 40,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.orange,
                                      Colors.yellow,
                                      Colors.green,
                                      Colors.blue,
                                      Colors.purple,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                            : Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: MemoryImage(base64Decode(base64.normalize(
                                  apiProfileTeacherScreenResponse?.body?.profileGeneralTH?.img ??
                                      base64.normalize(phimg)))),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.1),
                                  BlendMode.dstATop),
                            ),
                          ),
                          child: InkWell(
                              onTap: () =>
                                  context
                                      .read<ProfileBloc>()
                                      .add(ChangeAvatarRequest()),
// onTap: () => pickImage(),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: MemoryImage(base64Decode(base64.normalize(
                                        apiProfileTeacherScreenResponse?.body?.profileGeneralTH?.img ??
                                            base64.normalize(phimg)))),
                                  ),
                                ),
                              )
                          ),
                        )
                    ),
                  ],
                ),
// Container(child: Image.memory(base64Decode(base64img??phimg))),
                ProfileGeneralDataHeadTeacher
                  (dataFromAPI: apiProfileTeacherScreenResponse, userRole: roleFromApi,
                    textColor: textColor, dataTabColor:dataTabColor, dataTabColorRO: dataTabColorRO),
                ProfileEducationDataHeadTeacher(dataFromAPI: apiProfileTeacherScreenResponse, userRole: roleFromApi,
                    textColor: textColor, dataTabColor:dataTabColor, dataTabColorRO: dataTabColorRO),
                ProfileContactDataHeadTeacher(dataFromAPI: apiProfileTeacherScreenResponse, userRole: roleFromApi,
                    textColor: textColor, dataTabColor:dataTabColor, dataTabColorRO: dataTabColorRO),
                const SizedBox(height: 60)
              ],
            ),
          ),
        )) );
  }
}

