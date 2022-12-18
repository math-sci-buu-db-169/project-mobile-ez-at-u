import 'dart:convert';
import 'dart:io' show File;

import 'package:dotted_border/dotted_border.dart';
import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../customs/color/color_const.dart';
import '../../customs/dialog/dialog_widget.dart';
import '../../customs/image_base_64.dart';
import '../../customs/message/text_button.dart';
import '../../customs/message/text_error.dart';
import '../../customs/progress_dialog.dart';
import '../../customs/size/gap.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../bloc_resume/resume_bloc.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../../utils/shared_preferences.dart';
import '../model/response/pre_view_resume_response.dart';
import '../screen_resume/edit_about_me_resume_screen.dart';
import '../screen_resume/edit_certificate_resume_screen.dart';
import '../screen_resume/edit_education_resume_screen.dart';
import '../screen_resume/edit_experience_resume_screen.dart';
import '../screen_resume/edit_position_resume_screen.dart';
import '../screen_resume/edit_skill_language_resume_screen.dart';
import '../screen_resume/edit_skill_resume_screen.dart';
import '../screen_resume/edit_user_info_resume_screen.dart';
import 'content_design_resume.dart';

class ContentDesignResumeEditScreen extends StatelessWidget {
  const ContentDesignResumeEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        ResumeBloc()..add(GetEditScreenPreviewResumeEvent()),
        child: const ContentDesignEditResume());
  }
}

class ContentDesignEditResume extends StatefulWidget {
  const ContentDesignEditResume({Key? key}) : super(key: key);

  @override
  State<ContentDesignEditResume> createState() =>
      _ContentDesignEditResumeState();
}

class _ContentDesignEditResumeState extends State<ContentDesignEditResume>
    with ProgressDialog {
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String isPhotoResume;

  late PreViewResumeResponse _preViewResumeResponse;

  @override
  void initState() {
    _isSessionUnauthorized();

    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired =
    _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
    _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is EditPreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is EditPreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is EditAboutResumeSuccessState) {

          context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
        }
        if (state is SentEditContactResumeSuccessState) {

          context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
        }
        if (state is EditPreviewResumeError) {
          if (state.errorMessage.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(
                context, textSessionExpired, textSubSessionExpired, _buttonOk,
                onClickBtn: () {
                  cleanDelete();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginScreen()));
                });
          } else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
                onClickBtn: () {
                  Navigator.of(context).pop();
                });
          }
        }
        if (state is EditPreviewResumeSuccessState) {
          _preViewResumeResponse = state.isPreViewResumeResponse;
          BodyEditPreviewResume(
              isPreViewResumeResponse: _preViewResumeResponse);
        }
        if (state is EditChooseImageUpLoadResumeSuccess) {
          context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
        }
      },
      builder: (context, state) {
        if (state is EditPreviewResumeSuccessState) {
          _preViewResumeResponse = state.isPreViewResumeResponse;
          return BodyEditPreviewResume(
              isPreViewResumeResponse: _preViewResumeResponse);
        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is EditPreviewResumeSuccessState;
      },
    );
  }
}

class BodyEditPreviewResume extends StatefulWidget {
  final PreViewResumeResponse isPreViewResumeResponse;
  const BodyEditPreviewResume({Key? key, required this.isPreViewResumeResponse})
      : super(key: key);

  @override
  State<BodyEditPreviewResume> createState() => _BodyEditPreviewResumeState();
}

class _BodyEditPreviewResumeState extends State<BodyEditPreviewResume> {
  @override
  void initState() {
    _isSelectLanguageThai();
    _isSessionUnauthorized();
    widgetPointerValue = 26;
    super.initState();
  }

  TextEditingController resumeAbout = TextEditingController();
  TextEditingController resumeName = TextEditingController();
  TextEditingController resumePositions = TextEditingController();
  TextEditingController resume = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController lineController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();
  bool isSelectLanguageThai = true;
  File? image;
  String? base64img;
  String isPhotoResume =
      "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAAXNSR0IArs4c6QAAA1lJREFUeF7t3GtyqkAQBWBchmzD/e8Al6Euw1tTKXONAvPqxzlD8ydUAtM954PBoiqelmV5ns/nKTb/BB6Px3S63W7PtHO5XPw7OnAH1+t1muf5ByTtpF8Eis8V8cr+9w5JIGkLFHuQ98y/QALFFuTzBlgFCRQblLXVaBMkUHRRth4NuyCBooOy95zOggSKLEruQ1MRSKDIoOQwUpVikEDpQynBqAYJlDaUUowmkECpQ6nBaAYJlDKUWowukEDZR2nB6AYJlHWUVgwRkED5i9KDIQYSKD8ovRiiIFINlT0u8Y6SwBAHOSqKFIYKyNFQJDHUQI6CIo2hCjI6igaGOsioKFoYJiCjoWhimIGMgqKNYQrCjmKBYQ7CimKF4QLChmKJ4QbCgmKN4QqCjuKB4Q6CiuKFAQGChuKJAQOCguKNAQXijYKAAQfihYKCAQlijYKEAQtihYKGAQ2ijYKIAQ+ihYKKQQEijYKMQQMihYKOQQXSi8KAQQfSisKCQQlSi8KEQQtSisKGQQ2SQ2HEoAfZQmHFGALkE4UZYxiQF0r6yf71UlX/p54mjLqlOyNAQHTel6lYspxR1gCYUaiXrL3gWVFoQUoCLznG+Qb/Kk8JUhN0zbEIOHQgLQG3nOOFQwXSE2zPuZY4NCASgUqMoY1DASIZpORYGjjwIBoBaowphQMNohmc5tg9OLAgFoFZ1KjFgQSxDMqyVgkOHIhHQB41t3CgQDyD8az9jgMDghAIQg8QIAhBvK5S717cQbwDWFvLPXtyBfGceO4Tj1dvbiBeE85BvP/do0cXEI+J1kB4opiDMGF4POhNQRgxrFHMQJgxLFFMQEbAsEJRBxkJwwJFFWREDG0UNZCRMTRRVECOgKGFIg5yJAwNFFGQI2JIo4iBHBlDEkUEJDD+v/3qzaIbpLeB1pd+yOf1ZNIF0lMYOVCJ3lqzaQZpLSgxWZYxWjJqAmkpxBKidJ+1WVWD1BaQniDjeDWZVYHUDMwYnGbPpdkVg5QOqDkp9rFLMiwCKRmIPSyr/nNZZkFyA1hNZKQ6e5nuggSG3mWwle0mSGDoYey9+1oFCQx9jC2UL5DAsMNYQ/kDEhj2GJ8ovyBph/3Lv/zilKmcboh5nqfTsizPtBObfwL3+336B07+3Sny7gNQAAAAAElFTkSuQmCC";
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).bottomAppBarColor;
  }

  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late double widgetPointerValue ;
  // bool isClickAbout = false;
  // bool isClickPosition = false;
  // bool isClickInformation = false;
  // bool isClickName = false;
  // bool isClickEducation = false;
  bool isClickContactReadOnly = true;
  // int isCountClickContactReadOnly = 0;
  // bool isClickAddress = false;
  // bool isClickExperience = false;
  // bool isClickCertificate = false;
  // bool isClickSkill = false;
  // bool isClickLanguage = false;
  Future<void> _isSelectLanguageThai() async {
    prefs = await SharedPreferences.getInstance();
    isSelectLanguageThai =
    (prefs.getString('ResumePhoto') ?? '') == 'EN' ? false : true;
    setState(() {});
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired =
    _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
    _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  returnResumeEdit(){
    setState(() {
      context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
    });
  }
  @override
  Widget build(BuildContext context) {
    var isPreViewResumeResponse = widget.isPreViewResumeResponse;
    String prefix = isPreViewResumeResponse.body?.data?.userinfo?.prefix ?? '';
    String name =  isPreViewResumeResponse.body?.data?.userinfo?.name == ""?
    isPreViewResumeResponse.body?.screenInfo?.name ??'ชื่อ ':  isPreViewResumeResponse.body?.data?.userinfo?.name ??isPreViewResumeResponse.body?.screenInfo?.name ??'ชื่อ';


    String lastname =isPreViewResumeResponse.body?.data?.userinfo?.lastname == ""?
    isPreViewResumeResponse.body?.screenInfo?.lastname ??'นามสกุล':  isPreViewResumeResponse.body?.data?.userinfo?.lastname ??isPreViewResumeResponse.body?.screenInfo?.lastname ??'นามสกุล';

    Color? appBarBackgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
    Color? appBarForegroundColor =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
    print(widget.isPreViewResumeResponse.body?.data?.image);
    String isAddressValue =
        "${isPreViewResumeResponse.body?.data?.address?.number ?? ''} "
        "${isPreViewResumeResponse.body?.data?.address?.moo ?? ''} "
        " ${isPreViewResumeResponse.body?.data?.address?.soi ?? ''} "
        "${isPreViewResumeResponse.body?.data?.address?.road ?? ''} "
        "${isPreViewResumeResponse.body?.data?.address?.subdistrict ?? ''} "
        " ${isPreViewResumeResponse.body?.data?.address?.district ?? ''} "
        "${isPreViewResumeResponse.body?.data?.address?.province ?? ''} "
        " ${isPreViewResumeResponse.body?.data?.address?.zipcode ?? ''}";
    TextEditingController objectives = TextEditingController();
    final myController = TextEditingController();
    double gap = 15.0;


    String email = isPreViewResumeResponse.body?.data?.personinfo?.email ??'';
    String phone = isPreViewResumeResponse.body?.data?.personinfo?.phone ??'';
    String facebook = isPreViewResumeResponse.body?.data?.personinfo?.facebook ??'';
    String line = isPreViewResumeResponse.body?.data?.personinfo?.line ??'';
    String instagram = isPreViewResumeResponse.body?.data?.personinfo?.instagram ??'';
    String twitter = isPreViewResumeResponse.body?.data?.personinfo?.twitter ??'';
    String youtube = isPreViewResumeResponse.body?.data?.personinfo?.youtube ??'';


    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,  elevation: 0,
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  const HomeScreen()), (Route<dynamic> route) => false);
                },

                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
              title: Center(
                  child: Text(
                      isPreViewResumeResponse.body?.screenInfo?.titleresumeinformation ??
                          "Resume Information",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color:
                          Theme.of(context).appBarTheme.foregroundColor))),
              actions: [
                InkWell(
                  onTap: () async {
                    await setUserLanguageResume(
                        isSelectLanguageThai == true ? "TH" : "EN");
                    setState(() {
                      isSelectLanguageThai = !isSelectLanguageThai;
                      isSelectLanguageThai == true ? "TH" : "EN";

                      context
                          .read<ResumeBloc>()
                          .add(GetEditScreenPreviewResumeEvent());
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(isSelectLanguageThai == true ? "EN" : "TH",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor))),
                  ),
                ),
              ]),
          body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            spaceGap(20.0),
                            GestureDetector(
                                onTap: () {
                                  print("Container clicked ChangePhotoRequest");
                                  context
                                      .read<ResumeBloc>()
                                      .add(EditChangePhotoRequest());
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: DottedBorder(
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(12),
                                        padding: EdgeInsets.all(2),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                          child: Container(
                                            //inner container

                                            height: 120, //height of inner container
                                            width:
                                            80, //width to 100% match to parent container.
                                            color: colorBoxDotted,

                                            child: Center(
                                                child: (widget.isPreViewResumeResponse
                                                    .body?.data?.image ==
                                                    '' ||
                                                    widget.isPreViewResumeResponse
                                                        .body?.data?.image ==
                                                        null)
                                                    ? Image.asset(
                                                  "assets/profile.jpg",
                                                  width: 600.0,
                                                  height: 240.0,
                                                  fit: BoxFit.cover,
                                                )
                                                    : Image.memory(
                                                  (base64Decode(
                                                      base64.normalize(widget
                                                          .isPreViewResumeResponse
                                                          .body
                                                          ?.data
                                                          ?.image ??
                                                          imageBase64))),
                                                )), //background color of inner container
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 15,
                                      top: 15,
                                      child: Icon(
                                        FontAwesomeIcons.image,
                                        color: Theme.of(context).iconTheme.color,
                                        size: 20,
                                        shadows: <Shadow>[
                                          Shadow(
                                              color: Colors.white, blurRadius: 15.0)
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 20, bottom: 5),
                                      child: Text(
                                        "$name $lastname",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .appBarTheme
                                                .foregroundColor),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {

                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return const EditUserInfoResumeScreen();
                                                  })).then((value) =>setState(() {
                                                context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                              }),
                                              );

                                            },
                                            child: Container(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons.pen,
                                                      size: 12,
                                                      color: Theme.of(context)
                                                          .appBarTheme
                                                          .foregroundColor,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        isPreViewResumeResponse
                                                            .body
                                                            ?.screenInfo
                                                            ?.editinfomations ??
                                                            "Edit Information",
                                                        style: TextStyle(
                                                            decoration:
                                                            TextDecoration
                                                                .underline,
                                                            decorationThickness: 2,
                                                            fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            color: Theme.of(context)
                                                                .appBarTheme
                                                                .foregroundColor),
                                                      ),
                                                    )
                                                  ],
                                                ))),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15, top: 5),
                                      child: Text(
                                        " ${isPreViewResumeResponse.body?.screenInfo?.ratio ?? "The aspect ratio must be 3:4"} \n"
                                            "${isPreViewResumeResponse.body?.screenInfo?.sizepictuce ?? "The aspect ratio must be 3:4"} ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .appBarTheme
                                                .foregroundColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: colorBoxDotted,
                          height: 2,
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                        ),
                        // buildTitleEditDataResume(
                        //     context: context,
                        //     isPreViewResumeTitle:
                        //     isPreViewResumeResponse.body?.screenInfo?.aboutme ??
                        //         "About me",
                        //     isPreViewResumeEditData: isClickAbout ==false ? isPreViewResumeResponse
                        //         .body?.screenInfo?.editinfomations ??
                        //         "Edit Information":"Save",
                        //     ontap: () {
                        //       // Navigator.push(
                        //       //   context,
                        //       //   MaterialPageRoute(
                        //       //       builder: (context) =>
                        //       //       const ContentDesignResumeEditScreen()),
                        //       // );
                        //       setState(() {
                        //         isClickAbout = !isClickAbout;
                        //       });
                        //       print(isClickAbout);
                        //     }),
                        // isClickAbout ==false ?
                        // buildDetailResumeCustomNotIconsReadOnly(
                        //     context: context,
                        //     detail:
                        //         "         ${isPreViewResumeResponse.body?.data?.aboutme ?? "About me"}",
                        //     appBarForeGroundColor: appBarforegroundColor)
                        // :
                        // BuildTextFormFieldUnLimitCustomNotIcons(
                        //   textEditingController: resumeName,
                        //   onChanged: (value) {
                        //     resumeName.text = value;
                        //     if (kDebugMode) {
                        //       print(resumeName.text);
                        //     }
                        //   },
                        //   hintLabel: "   ${widget.isPreViewResumeResponse.body?.data?.aboutme??"รายละเอียดเกี่ยวกับฉัน"}",
                        //   initialvalue:widget.isPreViewResumeResponse.body?.data?.aboutme??"รายละเอียดเกี่ยวกับฉัน",
                        //   textInputType: TextInputType.text,),
                        //

                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.aboutme ??
                                      "About me",
                                  isPreViewResumeEditData:  isPreViewResumeResponse
                                      .body?.screenInfo?.editinfomations ??
                                      "Edit Information",
                                  ontap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //        EditResumeScreen(isResumeData:isPreViewResumeResponse)),
                                    // );

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return const EditAboutMeResumeScreen();
                                        })).then((value) =>setState(() {
                                      context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                    }),
                                    );


                                  }),
                              buildDetailResumeCustomNotIconsReadOnly(
                                  context: context,
                                  detail:
                                  "         ${isPreViewResumeResponse.body?.data?.aboutme ?? isPreViewResumeResponse
                                      .body?.screenInfo?.aboutme ??"About me ..."}",
                                  appBarForeGroundColor: appBarForegroundColor)
                            ],
                          ),
                        ),
                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.position ??
                                      "ตำแหน่งที่สนใจ",
                                  isPreViewResumeEditData:  '',
                                  ontap: () {

                                  }),
                              buildPositionCard(
                                  context: context,
                                  type: '',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: '',
                                  positionData: isPreViewResumeResponse.body?.data?.position,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit),
                              // buildDetailResumeCustomNotIconsReadOnly(
                              //     context: context,
                              //     detail: isPreViewResumeResponse
                              //         .body?.data?.position ??
                              //         "ตำแหน่งที่สนใจ",
                              //     appBarForeGroundColor: appBarForegroundColor),
                              // GestureDetector(
                              //   onTap: (){
                              //
                              //     Navigator.push(context,
                              //         MaterialPageRoute(builder: (context) {
                              //           return  const EditPositionsResumePage();
                              //         })).then((value) =>setState(() {
                              //       context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                              //     }),
                              //     );},
                              //   child:
                              //   Container(
                              //     padding: EdgeInsets.all(10),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(50),
                              //     ),
                              //     child: DottedBorder(
                              //       color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                              //       borderType: BorderType.RRect,
                              //       radius: Radius.circular(12),
                              //       padding: EdgeInsets.all(2),
                              //       child: ClipRRect(
                              //         borderRadius:
                              //         BorderRadius.all(Radius.circular(12)),
                              //         child: Container(
                              //           //inner container
                              //
                              //           height: 30, //height of inner container
                              //           width:MediaQuery.of(context).size.width,
                              //
                              //           child: Center(
                              //             child: Icon(
                              //               FontAwesomeIcons.plus,
                              //               color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                              //               size: 20.0,
                              //             ),
                              //           ), //background color of inner container
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.education ??
                                      "การศึกษา",
                                  isPreViewResumeEditData:"",
                                  ontap: () {

                                  }),
                              buildEducationCard(
                                  context: context,
                                  type: 'HSC',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: isPreViewResumeResponse
                                      .body?.screenInfo?.hsc ??"ระดับประกาศนียบัตรมัธยมศึกษาตอนปลาย",
                                  educationData: isPreViewResumeResponse.body?.data?.education?.hsc,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit ),
                              buildEducationCard(
                                  context: context,
                                  type: 'BD',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: isPreViewResumeResponse
                                      .body?.screenInfo?.bd ??"ระดับปริญญาตรี",
                                  educationData: isPreViewResumeResponse.body?.data?.education?.bd,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit ),
                              buildEducationCard(
                                  context: context,
                                  type: 'MD',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: isPreViewResumeResponse
                                      .body?.screenInfo?.md ??"ระดับปริญญาโท",
                                  educationData: isPreViewResumeResponse.body?.data?.education?.md,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit ),
                              buildEducationCard(
                                  context: context,
                                  type: 'DD',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: isPreViewResumeResponse
                                      .body?.screenInfo?.dd ??"ระดับปริญญาเอก",
                                  educationData: isPreViewResumeResponse.body?.data?.education?.dd,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit ),
                              buildEducationCard(
                                  context: context,
                                  type: 'HDD',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: isPreViewResumeResponse
                                      .body?.screenInfo?.hdd ??"ระดับปริญญาดุษฎีบัณฑิตกิตติมศักดิ์",
                                  educationData: isPreViewResumeResponse.body?.data?.education?.hdd,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit ),
                            ],
                          ),
                        ),
                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.contact ??
                                      "ช่องทางการติดต่อ",
                                  isPreViewResumeEditData:  isPreViewResumeResponse
                                      .body?.screenInfo?.editinfomations ??
                                      "Edit Information",
                                  ontap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //       const ContentDesignResumeEditScreen()),
                                    // );
                                    setState(() {
                                      isClickContactReadOnly = !isClickContactReadOnly;
                                    });
                                    if( isClickContactReadOnly == true) { context.read<ResumeBloc>().add(SentEditContactResumeEvent(
                                      email: (emailController.text == ''
                                          ? email
                                          : emailController.text) ??
                                          '',
                                      phone: (phoneController.text == ''
                                          ? phone
                                          : phoneController.text) ??
                                          '',
                                      facebook: (facebookController.text == ''
                                          ? facebook
                                          : facebookController.text) ??
                                          '',
                                      line: (lineController.text == ''
                                          ? line
                                          : lineController.text) ??
                                          '',
                                      instagram: (instagramController.text == ''
                                          ? instagram
                                          : instagramController.text) ??
                                          '',
                                      twitter: (twitterController.text == ''
                                          ? twitter
                                          : twitterController.text) ??
                                          '',
                                      youtube: (youtubeController.text == ''
                                          ? youtube
                                          : youtubeController.text) ??
                                          '',));}


                                  }),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:isClickContactReadOnly,
                                textEditingController: emailController,
                                onChanged: (value) {
                                  emailController.text = value;
                                  if (kDebugMode) {
                                    print(emailController.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                    .body?.screenInfo?.email ??
                                    "email",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.personinfo?.email,
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.envelope,
                              ),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:isClickContactReadOnly,
                                textEditingController: phoneController,
                                onChanged: (value) {
                                  phoneController.text = value;
                                  if (kDebugMode) {
                                    print(phoneController.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                    .body?.screenInfo?.phone ??
                                    "เบอร์โทรศัพท์",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.personinfo?.phone,
                                textInputType: TextInputType.number,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.phone,
                              ),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:isClickContactReadOnly,
                                textEditingController: facebookController,
                                onChanged: (value) {
                                  facebookController.text = value;
                                  if (kDebugMode) {
                                    print(facebookController.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                    .body?.screenInfo?.facebook ??
                                    "เฟสบุ๊ค",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.personinfo?.facebook,
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.facebook,
                              ),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:isClickContactReadOnly,
                                textEditingController: lineController,
                                onChanged: (value) {
                                  lineController.text = value;
                                  if (kDebugMode) {
                                    print(lineController.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                    .body?.screenInfo?.line ??
                                    "ไลน์",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.personinfo?.line,
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.line,
                              ),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:isClickContactReadOnly,
                                textEditingController: instagramController,
                                onChanged: (value) {
                                  instagramController.text = value;
                                  if (kDebugMode) {
                                    print(instagramController.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                    .body?.screenInfo?.instagram ??
                                    "instagram",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.personinfo?.instagram,
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.instagram,
                              ),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:isClickContactReadOnly,
                                textEditingController: twitterController,
                                onChanged: (value) {
                                  twitterController.text = value;
                                  if (kDebugMode) {
                                    print(twitterController.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                    .body?.screenInfo?.twitter ??
                                    "twitter",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.personinfo?.twitter,
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.twitter,
                              ),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:isClickContactReadOnly,
                                textEditingController: youtubeController,
                                onChanged: (value) {
                                  youtubeController.text = value;
                                  if (kDebugMode) {
                                    print(youtubeController.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                    .body?.screenInfo?.youtube ??
                                    "youtube",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.personinfo?.youtube,
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.youtube,
                              ),
                            ],
                          ),
                        ),
                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.address ??
                                      "ที่อยู่",
                                  isPreViewResumeEditData: isPreViewResumeResponse
                                      .body?.screenInfo?.editinfomations ??
                                      "Edit Information",
                                  ontap: () {}),
                              BuildTextFormFieldUnLimitCustomResume(
                                readOnly:true,
                                textEditingController: objectives,
                                onChanged: (value) {
                                  objectives.text = value;
                                  if (kDebugMode) {
                                    print(objectives.text);
                                  }
                                },
                                hintLabel: "",
                                initialvalue: isAddressValue,
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.locationDot,
                              ),
                            ],
                          ),
                        ),
                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.experience ??
                                      "ประสบการทำงาน",
                                  isPreViewResumeEditData:'',
                                  ontap: () {}),
                              buildExperienceCard(
                                  context: context,
                                  type: '',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: '',
                                  experienceData: isPreViewResumeResponse.body?.data?.experience,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit),
                            ],
                          ),
                        ),
                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.certificate ??
                                      "ใบรับรอง",
                                  isPreViewResumeEditData:'',
                                  ontap: () {}),
                              buildCertificateCard(
                                  context: context,
                                  type: '',
                                  editInFormations:
                                  isPreViewResumeResponse.body?.screenInfo
                                      ?.editinfomations ??
                                      "Edit Information",
                                  title: '',
                                  certificateData: isPreViewResumeResponse.body?.data?.certificate,
                                  appBarForegroundColor: appBarForegroundColor,
                                  returnResumeEdit:returnResumeEdit),
                              // Column(
                              //     children: List.generate(
                              //         isPreViewResumeResponse
                              //             .body?.data?.certificate?.length ??
                              //             0, (index) {
                              //       return Stack(
                              //         children: [
                              //           buildDetailResumeCustomNotIconsReadOnly(
                              //               context: context,
                              //               detail:
                              //               "  ${isPreViewResumeResponse.body?.data?.certificate?[index].title ?? ""} \n"
                              //                   "${isPreViewResumeResponse.body?.data?.certificate?[index].description ?? ""}",
                              //               appBarForeGroundColor: appBarForegroundColor),
                              //           Positioned(
                              //             // height: 0,
                              //             // width: 0,
                              //             // left: 0,
                              //             right: MediaQuery.of(context).padding.right+10,
                              //             bottom:  MediaQuery.of(context).padding.bottom+5,
                              //             child: InkWell(
                              //               onTap: (){
                              //
                              //                 Navigator.push(context,
                              //                     MaterialPageRoute(builder: (context) {
                              //                       return  EditCertificateResumeScreen(id:(isPreViewResumeResponse.body?.data?.certificate?[index].id??0).toInt());
                              //                     })).then((value) =>setState(() {
                              //                   context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                              //                 }),
                              //                 );},
                              //               child: Text(
                              //                 isPreViewResumeResponse.body?.screenInfo
                              //                     ?.editinfomations ??
                              //                     "Edit Information",
                              //                 style: TextStyle(
                              //                     decoration: TextDecoration.underline,
                              //                     decorationThickness: 2,
                              //                     fontSize: 10,
                              //                     fontWeight: FontWeight.w500,
                              //                     color: Theme.of(context).appBarTheme.foregroundColor),
                              //               ),
                              //             ),)
                              //         ],
                              //       );
                              //     })),
                              // GestureDetector(
                              //   onTap: (){
                              //
                              //     Navigator.push(context,
                              //         MaterialPageRoute(builder: (context) {
                              //           return  const EditCertificateResumeScreen(id:0);
                              //         })).then((value) =>setState(() {
                              //       context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                              //     }),
                              //     );},
                              //   child:
                              //   Container(
                              //     padding: EdgeInsets.all(10),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(50),
                              //     ),
                              //     child: DottedBorder(
                              //       color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                              //       borderType: BorderType.RRect,
                              //       radius: Radius.circular(12),
                              //       padding: EdgeInsets.all(2),
                              //       child: ClipRRect(
                              //         borderRadius:
                              //         BorderRadius.all(Radius.circular(12)),
                              //         child: Container(
                              //           //inner container
                              //
                              //           height: 30, //height of inner container
                              //           width:MediaQuery.of(context).size.width,
                              //
                              //           child: Center(
                              //             child: Icon(
                              //               FontAwesomeIcons.plus,
                              //               color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                              //               size: 20.0,
                              //             ),
                              //           ), //background color of inner container
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // )

                            ],
                          ),
                        ),
                        spaceGap(gap),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.skill ??
                                      "ประสบการทำงาน",
                                  isPreViewResumeEditData:isPreViewResumeResponse
                                      .body?.screenInfo?.tapedit ??'แตะเพื่อแก้ไข้ข้อมูล',
                                  ontap: () {

                                    var textSnack =  'แตะการ์ดขด้านล่าง เพื่อแก้ไข้ข้อมูล';
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(textSnack,
                                          style: const TextStyle(fontSize: sizeTextSmaller14, color: Colors.black)),
                                      duration: const Duration(seconds: 1),
                                      backgroundColor: const Color(0xFFFFF9D1),
                                    ));}),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Column(
                                    children: List.generate(
                                        isPreViewResumeResponse
                                            .body?.data?.skill?.length ??
                                            0, (index) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child:  InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return  EditSkillResumeScreen(id: isPreViewResumeResponse.body?.data?.skill?[index].id ??0 ,);
                                                  })).then((value) =>setState(() {
                                                context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                              }),
                                              );
                                            },
                                            child:   Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(child:Text(
                                                    isPreViewResumeResponse.body?.data
                                                        ?.skill?[index].skill ??
                                                        "",maxLines :5,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor)) )
                                                ,Padding(
                                                  padding: EdgeInsets.only(left: 10),
                                                  child:ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: SizedBox(

                                                      width: MediaQuery.of(context).size.width -
                                                          250,
                                                      child: LinearPercentIndicator(
                                                          padding: EdgeInsets.zero,
                                                          animation: true,
                                                          lineHeight: 20.0,
                                                          animationDuration: 2500,
                                                          percent: int.parse(
                                                              "${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}") /
                                                              100.0,
                                                          center: Text(
                                                              "${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}.0%"),
                                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                                          progressColor:widgetPointerValueColor(int.parse(
                                                              "${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}") / 1.0,)
                                                      ),
                                                    ),
                                                  ) ,


                                                )



                                              ],
                                            ),
                                          )


                                      );
                                    })),
                              ),


                              GestureDetector(
                                onTap: (){

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return  const EditSkillResumeScreen(id: 0,);
                                      })).then((value) =>setState(() {
                                    context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                  }),
                                  );},
                                child:
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: DottedBorder(
                                    color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(12),
                                    padding: EdgeInsets.all(2),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                      child: Container(
                                        //inner container

                                        height: 30, //height of inner container
                                        width:MediaQuery.of(context).size.width,

                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.plus,
                                            color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                                            size: 20.0,
                                          ),
                                        ), //background color of inner container
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Card(
                          color: Theme.of(context).primaryColor.withOpacity(0.9),
                          child: Column(
                            children: [
                              buildTitleEditDataResume(
                                  context: context,
                                  isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.language ??
                                      "ประสบการทางภาษา",
                                  isPreViewResumeEditData:isPreViewResumeResponse
                                      .body?.screenInfo?.tapedit ??'แตะเพื่อแก้ไข้ข้อมูล',
                                  ontap: () {

                                    var textSnack =  'แตะการ์ดขด้านล่าง เพื่อแก้ไข้ข้อมูล';
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(textSnack,
                                          style: const TextStyle(fontSize: sizeTextSmaller14, color: Colors.black)),
                                      duration: const Duration(seconds: 1),
                                      backgroundColor: const Color(0xFFFFF9D1),
                                    ));
                                  }),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Column(
                                    children: List.generate(
                                        isPreViewResumeResponse
                                            .body?.data?.language?.length ??
                                            0, (index) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return  EditSkillLanguageResumeScreen(id: isPreViewResumeResponse.body?.data?.language?[index].id??0 ,);
                                                  })).then((value) =>setState(() {
                                                context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                              }),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(child:Text(
                                                    isPreViewResumeResponse.body?.data
                                                        ?.language?[index].language ??
                                                        "",maxLines :5,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor)) )
                                                ,
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: SizedBox(

                                                      width: MediaQuery.of(context).size.width -
                                                          250,
                                                      child: LinearPercentIndicator(
                                                          padding: EdgeInsets.zero,
                                                          animation: true,
                                                          lineHeight: 20.0,
                                                          animationDuration: 2500,
                                                          percent: int.parse(
                                                              "${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}") /
                                                              100.0,
                                                          center: Text(
                                                              "${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}.0%"),
                                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                                          progressColor:widgetPointerValueColor(int.parse(
                                                              "${isPreViewResumeResponse.body?.data?.language?[index].value ?? 0}") / 1.0,)
                                                      ),
                                                    ),
                                                  ),


                                                )


                                              ],
                                            ),
                                          )
                                      );
                                    })),
                              ),

                              GestureDetector(
                                onTap: (){


                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return  EditSkillLanguageResumeScreen(id: 0,);
                                      })).then((value) =>setState(() {
                                    context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                  }),
                                  );
                                },
                                child:
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: DottedBorder(
                                    color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(12),
                                    padding: EdgeInsets.all(2),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                      child: Container(
                                        //inner container

                                        height: 30, //height of inner container
                                        width:MediaQuery.of(context).size.width,

                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.plus,
                                            color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                                            size: 20.0,
                                          ),
                                        ), //background color of inner container
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
              )),
          floatingActionButton: floatingSetThemePDF(
            context: context,
            setState,
            "Set Theme PDF",
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
        )
    );
  }
}

floatingSetThemePDF(
    setState,
    String pdf, {
      required BuildContext context,
    }) {
  return FloatingActionButton.extended(
    backgroundColor:
    Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ContentDesignResumeScreen()));
    },
    icon: Icon(
      FontAwesomeIcons.barsStaggered,
      color: Theme.of(context).iconTheme.color,
      size: 20.0,
    ),
    label: Text('   ${pdf ?? 'PDF'}',
        style: TextStyle(
          fontSize: sizeTextSmaller14,
          color: Theme.of(context).iconTheme.color,
        )),
  );
}

buildTitleEditDataResume(
    {required String isPreViewResumeTitle,
      required BuildContext context,
      required String isPreViewResumeEditData,
      required Null Function() ontap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(isPreViewResumeTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        Row(
          children: [
            InkWell(
              onTap: ontap,
              child: Text(
                isPreViewResumeEditData,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).appBarTheme.foregroundColor),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

buildPositionCard( {
  required BuildContext context,
  required String editInFormations,
  required String title,
  required String type,
  required positionData,
  required Color appBarForegroundColor,
  required Function() returnResumeEdit}){
  return Column(
    children: [
      Column(
          children: List.generate(
              positionData?.length ??
                  0, (index) {
            return
              Stack(
                children: [
                  buildDetailResumeCustomNotIconsReadOnly(
                      context: context,
                      detail:positionData[index].position ?? "",
                      appBarForeGroundColor: appBarForegroundColor),
                  Positioned(
                    // height: 0,
                    // width: 0,
                    // left: 0,
                    right: MediaQuery.of(context).padding.right+15,
                    bottom:  MediaQuery.of(context).padding.bottom+15,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return  EditPositionsResumeScreen(id:positionData?[index].id??0);
                            })).then((value) =>returnResumeEdit,
                        );},
                      child: Text(editInFormations ??
                          "Edit Information",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).appBarTheme.foregroundColor),
                      ),
                    ),)
                ],
              );


          })),
      GestureDetector(
        onTap: (){

          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return  const EditPositionsResumeScreen(id:0);
                //

              })).then((value) =>returnResumeEdit,
          );},
        child:
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 30, //height of inner container
                width:MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

buildExperienceCard( {
  required BuildContext context,
  required String editInFormations,
  required String title,
  required String type,
  required experienceData,
  required Color appBarForegroundColor,
  required Function() returnResumeEdit}){
  return Column(
    children: [
      Column(
          children: List.generate(
              experienceData?.length ??
                  0, (index) {
            return
              Stack(
                children: [
                  buildDetailResumeCustomNotIconsReadOnly(
                      context: context,
                      detail:
                      "     ${experienceData[index].startdate ?? ""} - ${experienceData[index].startdate ?? ""} "
                          "${experienceData[index].position ?? ""} \n"
                          "${experienceData[index].detail ?? ""}",
                      appBarForeGroundColor: appBarForegroundColor),
                  Positioned(
                    // height: 0,
                    // width: 0,
                    // left: 0,
                    right: MediaQuery.of(context).padding.right+15,
                    bottom:  MediaQuery.of(context).padding.bottom+15,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return  EditExperienceResumeScreen(id:experienceData?[index].id??0);
                            })).then((value) =>returnResumeEdit,
                        );},
                      child: Text(editInFormations ??
                          "Edit Information",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).appBarTheme.foregroundColor),
                      ),
                    ),)
                ],
              );


          })),
      GestureDetector(
        onTap: (){

          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return  const EditExperienceResumeScreen(id:0);
              })).then((value) =>returnResumeEdit,
          );},
        child:
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 30, //height of inner container
                width:MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

buildCertificateCard( {
  required BuildContext context,
  required String editInFormations,
  required String title,
  required String type,
  required certificateData,
  required Color appBarForegroundColor,
  required Function() returnResumeEdit}){
  return Column(
    children: [
      Column(
          children: List.generate(
              certificateData?.length ??
                  0, (index) {
            return
              Stack(
                children: [
                  buildDetailResumeCustomNotIconsReadOnly(
                      context: context,
                      detail:
                      "  ${certificateData?[index].title ?? ""} "
                          "\n""${certificateData?[index].description ?? ""}",
                      appBarForeGroundColor: appBarForegroundColor),
                  Positioned(
                    // height: 0,
                    // width: 0,
                    // left: 0,
                    right: MediaQuery.of(context).padding.right+15,
                    bottom:  MediaQuery.of(context).padding.bottom+15,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return  EditCertificateResumeScreen(id:(certificateData?[index].id??0).toInt());
                            })).then((value) =>returnResumeEdit,
                        );},
                      child: Text(editInFormations ??
                          "Edit Information",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).appBarTheme.foregroundColor),
                      ),
                    ),)
                ],
              );


          })),
      GestureDetector(
        onTap: (){

          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return  const EditCertificateResumeScreen(id:0);
              })).then((value) =>returnResumeEdit,
          );},
        child:
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 30, //height of inner container
                width:MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

buildEducationCard( {
  required BuildContext context,
  required String editInFormations,
  required String title,
  required String type,
  required educationData,
  required Color appBarForegroundColor,
  required Function() returnResumeEdit}){
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(5),
        child: Text( title),
      ),
      Column(
          children: List.generate(
              educationData?.length ??
                  0, (index) {
            return
              Stack(
                children: [
                  buildDetailResumeCustomNotIconsReadOnly(
                      context: context,
                      detail:
                      "     ${educationData?[index].startdate ?? ""} - ${educationData?[index].startdate ?? ""} "
                          "${educationData?[index].placeofstudy ?? ""} \n"
                          "${educationData?[index].detail ?? ""}",
                      appBarForeGroundColor: appBarForegroundColor),
                  Positioned(
                    // height: 0,
                    // width: 0,
                    // left: 0,
                    right: MediaQuery.of(context).padding.right+15,
                    bottom:  MediaQuery.of(context).padding.bottom+15,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return  EditEducationResumeScreen(id:educationData?[index].id ??0, type:educationData?[index].type??'HSC',);
                            })).then((value) =>returnResumeEdit,
                        );},
                      child: Text(editInFormations ??
                          "Edit Information",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).appBarTheme.foregroundColor),
                      ),
                    ),)
                ],
              );


          })),
      GestureDetector(
        onTap: (){

          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return   EditEducationResumeScreen(id:0, type: type);
              })).then((value) =>returnResumeEdit,
          );},
        child:
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 30, //height of inner container
                width:MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color?? Colors.grey).withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
