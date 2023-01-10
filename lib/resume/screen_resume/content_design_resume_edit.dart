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
import '../../check_token/token_bloc.dart';
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
import '../components/components_resume.dart';
import '../model/response/pre_view_resume_response.dart';
import 'edit_about_me_resume_screen.dart';
import 'edit_address_resume_screen.dart';
import 'edit_skill_language_resume_screen.dart';
import 'edit_skill_resume_screen.dart';
import 'edit_user_info_resume_screen.dart';
import 'content_design_resume_color.dart';

class ContentDesignResumeEditScreen extends StatelessWidget {
  const ContentDesignResumeEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ResumeBloc()..add(GetEditScreenPreviewResumeEvent()), child: const ContentDesignEditResume());
  }
}

class ContentDesignEditResume extends StatefulWidget {
  const ContentDesignEditResume({Key? key}) : super(key: key);

  @override
  State<ContentDesignEditResume> createState() => _ContentDesignEditResumeState();
}

class _ContentDesignEditResumeState extends State<ContentDesignEditResume> with ProgressDialog {
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
    textSessionExpired = _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
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
        if (state is SentEditContactResumeSuccessState) {
          if (state.pop == true) {
            // Navigator.pop(context);
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (Route<dynamic> route) => false);
          } else {
            context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
          }
        }
        if (state is EditPreviewResumeError) {
          if (state.errorMessage.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
            });
          } else if (state.errorMessage.toUpperCase().toString() == 'S401EXP01' || state.errorMessage.toUpperCase().toString() == 'T401NOT01') {
            dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
            });
          } else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk, onClickBtn: () {
              Navigator.of(context).pop();
            });
          }
        }

        if (state is TokenExpiredState) {
          dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
            cleanDelete();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
          });
        }
        if (state is EditPreviewResumeSuccessState) {
          _preViewResumeResponse = state.isPreViewResumeResponse;
          BodyEditPreviewResume(isPreViewResumeResponse: _preViewResumeResponse);
        }
        if (state is EditChooseImageUpLoadResumeSuccess) {
          context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
        }
      },
      builder: (context, state) {
        if (state is EditPreviewResumeSuccessState) {
          _preViewResumeResponse = state.isPreViewResumeResponse;
          return BodyEditPreviewResume(isPreViewResumeResponse: _preViewResumeResponse);
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
  const BodyEditPreviewResume({Key? key, required this.isPreViewResumeResponse}) : super(key: key);

  @override
  State<BodyEditPreviewResume> createState() => _BodyEditPreviewResumeState();
}

class _BodyEditPreviewResumeState extends State<BodyEditPreviewResume> {
  @override
  void initState() {
    _isSelectLanguageThai();
    _isSessionUnauthorized();
    widgetPointerValue = 26;
    countIntData = widget.isPreViewResumeResponse.body?.data?.resumedatacount;
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
  late String showAll;
  late String showSome;
  late double widgetPointerValue;
  late bool isClickPosition = false;
  late bool isClickEducationHSC = false;
  late bool isClickEducationBD = false;
  late bool isClickEducationMD = false;
  late bool isClickEducationDD = false;
  late bool isClickEducationHDD = false;
  late bool isClickInformation = false;
  late bool isClickName = false;
  late bool isClickExperience = false;
  late bool isClickCertificate = false;
  late bool isClickSkill = false;
  late bool isClickLanguage = false;
  late bool isClickContactReadOnly = true;
  late Resumedatacount? countIntData;
  Future<void> _isSelectLanguageThai() async {
    prefs = await SharedPreferences.getInstance();
    isSelectLanguageThai = (prefs.getString('ResumePhoto') ?? '') == 'EN' ? false : true;
    setState(() {});
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired = _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  returnResumeEdit() {
    setState(() {
      context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    var isPreViewResumeResponse = widget.isPreViewResumeResponse;
    String prefix = isPreViewResumeResponse.body?.data?.userinfo?.prefix ?? '';
    String showAll = isPreViewResumeResponse.body?.screeninfo?.showall ?? 'แสดงทั้งหมด';
    String showSome = isPreViewResumeResponse.body?.screeninfo?.showsome ?? 'แสดงบางส่วน';
    String name = isPreViewResumeResponse.body?.data?.userinfo?.name == ""
        ? isPreViewResumeResponse.body?.screeninfo?.name ?? 'ชื่อ '
        : isPreViewResumeResponse.body?.data?.userinfo?.name ?? isPreViewResumeResponse.body?.screeninfo?.name ?? 'ชื่อ';

    String lastname = isPreViewResumeResponse.body?.data?.userinfo?.lastname == ""
        ? isPreViewResumeResponse.body?.screeninfo?.lastname ?? 'นามสกุล'
        : isPreViewResumeResponse.body?.data?.userinfo?.lastname ?? isPreViewResumeResponse.body?.screeninfo?.lastname ?? 'นามสกุล';

    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
    Color? appBarForegroundColor = Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
    print(widget.isPreViewResumeResponse.body?.data?.image);
    String isAddressValue = "${isPreViewResumeResponse.body?.data?.address?.number ?? ''} "
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

    String email = isPreViewResumeResponse.body?.data?.contactinfo?.email ?? '';
    String btnResume1 = isPreViewResumeResponse.body?.screeninfo?.btnresume1 ?? '';
    String phone = isPreViewResumeResponse.body?.data?.contactinfo?.phone ?? '';
    String facebook = isPreViewResumeResponse.body?.data?.contactinfo?.facebook ?? '';
    String line = isPreViewResumeResponse.body?.data?.contactinfo?.line ?? '';
    String instagram = isPreViewResumeResponse.body?.data?.contactinfo?.instagram ?? '';
    String twitter = isPreViewResumeResponse.body?.data?.contactinfo?.twitter ?? '';
    String youtube = isPreViewResumeResponse.body?.data?.contactinfo?.youtube ?? '';
    setState(() {
      countIntData = widget.isPreViewResumeResponse.body?.data?.resumedatacount;
    });
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  context.read<ResumeBloc>().add(SentEditContactResumeEvent(
                        pop: true,
                        email: (emailController.text == '' ? email : emailController.text) ?? '',
                        phone: (phoneController.text == '' ? phone : phoneController.text) ?? '',
                        facebook: (facebookController.text == '' ? facebook : facebookController.text) ?? '',
                        line: (lineController.text == '' ? line : lineController.text) ?? '',
                        instagram: (instagramController.text == '' ? instagram : instagramController.text) ?? '',
                        twitter: (twitterController.text == '' ? twitter : twitterController.text) ?? '',
                        youtube: (youtubeController.text == '' ? youtube : youtubeController.text) ?? '',
                      ));
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
              title: Center(
                  child: Text(isPreViewResumeResponse.body?.screeninfo?.titleresumeinformation ?? "Resume Information",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Theme.of(context).appBarTheme.foregroundColor))),
              actions: [
                InkWell(
                  onTap: () async {
                    await setUserLanguageResume(isSelectLanguageThai == true ? "EN" : "TH");
                    setState(() {
                      isSelectLanguageThai = !isSelectLanguageThai;
                      isSelectLanguageThai == true ? "EN" : "TH";

                      context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(isSelectLanguageThai == true ? "EN" : "TH",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Theme.of(context).appBarTheme.foregroundColor))),
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
                              context.read<ResumeBloc>().add(EditChangePhotoRequest());
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
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      child: Container(
                                        //inner container

                                        height: 120, //height of inner container
                                        width: 80, //width to 100% match to parent container.
                                        color: colorBoxDotted,

                                        child: Center(
                                            child: (widget.isPreViewResumeResponse.body?.data?.image == '' ||
                                                    widget.isPreViewResumeResponse.body?.data?.image == null)
                                                ? Image.asset(
                                                    "assets/profile.jpg",
                                                    width: 600.0,
                                                    height: 240.0,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.memory(
                                                    (base64Decode(base64.normalize(widget.isPreViewResumeResponse.body?.data?.image ?? imageBase64))),
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
                                    shadows: <Shadow>[Shadow(color: Colors.white, blurRadius: 15.0)],
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
                                  padding: EdgeInsets.only(left: 15, top: 20, bottom: 5),
                                  child: Text(
                                    "$name $lastname",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Theme.of(context).appBarTheme.foregroundColor),
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return const EditUserInfoResumeScreen();
                                          })).then(
                                            (value) => setState(() {
                                              context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                            }),
                                          );
                                        },
                                        child: Container(
                                            color: Theme.of(context).scaffoldBackgroundColor,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.pen,
                                                  size: 12,
                                                  color: Theme.of(context).appBarTheme.foregroundColor,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                                                    style: TextStyle(
                                                        decoration: TextDecoration.underline,
                                                        decorationThickness: 2,
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w500,
                                                        color: Theme.of(context).appBarTheme.foregroundColor),
                                                  ),
                                                )
                                              ],
                                            ))),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15, top: 5),
                                  child: Text(
                                    " ${isPreViewResumeResponse.body?.screeninfo?.ratio ?? "The aspect ratio must be 3:4"} \n"
                                    "${isPreViewResumeResponse.body?.screeninfo?.sizepictuce ?? "The aspect ratio must be 3:4"} ",
                                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Theme.of(context).appBarTheme.foregroundColor),
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
                    //     isPreViewResumeResponse.body?.screeninfo?.aboutme ??
                    //         "About me",
                    //     isPreViewResumeEditData: isClickAbout ==false ? isPreViewResumeResponse
                    //         .body?.screeninfo?.editinfomations ??
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.aboutme ?? "About me",
                              isPreViewResumeEditData: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //        EditResumeScreen(isResumeData:isPreViewResumeResponse)),
                                // );

                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const EditAboutMeResumeScreen();
                                })).then(
                                  (value) => setState(() {
                                    context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                  }),
                                );
                              }),
                          buildDetailResumeCustomNotIconsReadOnly(
                              context: context,
                              detail:
                                  "         ${isPreViewResumeResponse.body?.data?.aboutme ?? isPreViewResumeResponse.body?.screeninfo?.aboutme ?? "About me ..."}",
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.position ?? "ตำแหน่งที่สนใจ",
                              isPreViewResumeEditData: '',
                              ontap: () {}),
                          buildCardPositionEditResumeScreen(
                            count: countIntData?.position ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: '',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: '',
                            positionData: isPreViewResumeResponse.body?.data?.position,
                            appBarForegroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickPosition,
                            onTap: () {
                              setState(() {
                                isClickPosition = !isClickPosition;
                              });
                            },
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.education ?? "การศึกษา",
                              isPreViewResumeEditData: "",
                              ontap: () {}),
                          buildEducationCard(
                            count: countIntData?.educationHsc ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: 'HSC',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: isPreViewResumeResponse.body?.screeninfo?.hsc ?? "ระดับประกาศนียบัตรมัธยมศึกษาตอนปลาย",
                            educationData: isPreViewResumeResponse.body?.data?.education?.hsc,
                            appBarForeGroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickEducationHSC,
                            onTap: () {
                              setState(() {
                                isClickEducationHSC = !isClickEducationHSC;
                              });
                            },
                          ),
                          buildEducationCard(
                            count: countIntData?.educationBd ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: 'BD',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: isPreViewResumeResponse.body?.screeninfo?.bd ?? "ระดับปริญญาตรี",
                            educationData: isPreViewResumeResponse.body?.data?.education?.bd,
                            appBarForeGroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickEducationBD,
                            onTap: () {
                              setState(() {
                                isClickEducationBD = !isClickEducationBD;
                              });
                            },
                          ),
                          buildEducationCard(
                            count: countIntData?.educationMd ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: 'MD',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: isPreViewResumeResponse.body?.screeninfo?.md ?? "ระดับปริญญาโท",
                            educationData: isPreViewResumeResponse.body?.data?.education?.md,
                            appBarForeGroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickEducationMD,
                            onTap: () {
                              setState(() {
                                isClickEducationMD = !isClickEducationMD;
                              });
                            },
                          ),
                          buildEducationCard(
                            count: countIntData?.educationDd ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: 'DD',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: isPreViewResumeResponse.body?.screeninfo?.dd ?? "ระดับปริญญาเอก",
                            educationData: isPreViewResumeResponse.body?.data?.education?.dd,
                            appBarForeGroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickEducationDD,
                            onTap: () {
                              setState(() {
                                isClickEducationDD = !isClickEducationDD;
                              });
                            },
                          ),
                          buildEducationCard(
                            count: countIntData?.educationHdd ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: 'HDD',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: isPreViewResumeResponse.body?.screeninfo?.hdd ?? "ระดับปริญญาดุษฎีบัณฑิตกิตติมศักดิ์",
                            educationData: isPreViewResumeResponse.body?.data?.education?.hdd,
                            appBarForeGroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickEducationHDD,
                            onTap: () {
                              setState(() {
                                isClickEducationHDD = !isClickEducationHDD;
                              });
                            },
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.contact ?? "ช่องทางการติดต่อ",
                              isPreViewResumeEditData: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
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
                                if (isClickContactReadOnly == true) {
                                  context.read<ResumeBloc>().add(SentEditContactResumeEvent(
                                        pop: false,
                                        email: (emailController.text == '' ? email : emailController.text) ?? '',
                                        phone: (phoneController.text == '' ? phone : phoneController.text) ?? '',
                                        facebook: (facebookController.text == '' ? facebook : facebookController.text) ?? '',
                                        line: (lineController.text == '' ? line : lineController.text) ?? '',
                                        instagram: (instagramController.text == '' ? instagram : instagramController.text) ?? '',
                                        twitter: (twitterController.text == '' ? twitter : twitterController.text) ?? '',
                                        youtube: (youtubeController.text == '' ? youtube : youtubeController.text) ?? '',
                                      ));
                                }
                              }),
                          BuildTextFormFieldUnLimitCustomResume(
                            readOnly: isClickContactReadOnly,
                            textEditingController: emailController,
                            onChanged: (value) {
                              emailController.text = value;
                              if (kDebugMode) {
                                print(emailController.text);
                              }
                            },
                            hintLabel: isPreViewResumeResponse.body?.screeninfo?.email ?? "email",
                            initialvalue: isPreViewResumeResponse.body?.data?.contactinfo?.email,

                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.envelope,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            readOnly: isClickContactReadOnly,
                            textEditingController: phoneController,
                            onChanged: (value) {
                              phoneController.text = value;
                              if (kDebugMode) {
                                print(phoneController.text);
                              }
                            },
                            hintLabel: isPreViewResumeResponse.body?.screeninfo?.phone ?? "เบอร์โทรศัพท์",
                            initialvalue: isPreViewResumeResponse.body?.data?.contactinfo?.phone,
                            textInputType: TextInputType.number,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.phone,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            readOnly: isClickContactReadOnly,
                            textEditingController: facebookController,
                            onChanged: (value) {
                              facebookController.text = value;
                              if (kDebugMode) {
                                print(facebookController.text);
                              }
                            },
                            hintLabel: isPreViewResumeResponse.body?.screeninfo?.facebook ?? "เฟสบุ๊ค",
                            initialvalue: isPreViewResumeResponse.body?.data?.contactinfo?.facebook,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.facebook,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            readOnly: isClickContactReadOnly,
                            textEditingController: lineController,
                            onChanged: (value) {
                              lineController.text = value;
                              if (kDebugMode) {
                                print(lineController.text);
                              }
                            },
                            hintLabel: isPreViewResumeResponse.body?.screeninfo?.line ?? "ไลน์",
                            initialvalue: isPreViewResumeResponse.body?.data?.contactinfo?.line,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.line,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            readOnly: isClickContactReadOnly,
                            textEditingController: instagramController,
                            onChanged: (value) {
                              instagramController.text = value;
                              if (kDebugMode) {
                                print(instagramController.text);
                              }
                            },
                            hintLabel: isPreViewResumeResponse.body?.screeninfo?.instagram ?? "instagram",
                            initialvalue: isPreViewResumeResponse.body?.data?.contactinfo?.instagram,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.instagram,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            readOnly: isClickContactReadOnly,
                            textEditingController: twitterController,
                            onChanged: (value) {
                              twitterController.text = value;
                              if (kDebugMode) {
                                print(twitterController.text);
                              }
                            },
                            hintLabel: isPreViewResumeResponse.body?.screeninfo?.twitter ?? "twitter",
                            initialvalue: isPreViewResumeResponse.body?.data?.contactinfo?.twitter,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.twitter,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            readOnly: isClickContactReadOnly,
                            textEditingController: youtubeController,
                            onChanged: (value) {
                              youtubeController.text = value;
                              if (kDebugMode) {
                                print(youtubeController.text);
                              }
                            },
                            hintLabel: isPreViewResumeResponse.body?.screeninfo?.youtube ?? "youtube",
                            initialvalue: isPreViewResumeResponse.body?.data?.contactinfo?.youtube,
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.address ?? "ที่อยู่",
                              isPreViewResumeEditData: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                              ontap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return EditAddressResumeScreen();
                                })).then(
                                  (value) => setState(() {
                                    context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                  }),
                                );
                              }),
                          Stack(
                            children: [
                              buildDetailResumeCustomNotIconsReadOnly(
                                  context: context, detail: "         $isAddressValue", appBarForeGroundColor: appBarForegroundColor),
                              const Positioned(
                                top: 15,
                                left: 15,
                                child: Icon(FontAwesomeIcons.mapPin),
                              )
                            ],
                          )
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.experience ?? "ประสบการทำงาน",
                              isPreViewResumeEditData: '',
                              ontap: () {}),
                          buildExperienceCard(
                            count: countIntData?.experience ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: '',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: '',
                            experienceData: isPreViewResumeResponse.body?.data?.experience,
                            appBarForegroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickExperience,
                            onTap: () {
                              setState(() {
                                isClickExperience = !isClickExperience;
                              });
                            },
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.certificate ?? "ใบรับรอง",
                              isPreViewResumeEditData: '',
                              ontap: () {}),
                          buildCertificateCard(
                            count: countIntData?.certificate ?? 0,
                            context: context,
                            showSome : showSome,
                            showAll : showAll,
                            type: '',
                            editInFormations: isPreViewResumeResponse.body?.screeninfo?.editinfomations ?? "Edit Information",
                            title: '',
                            certificateData: isPreViewResumeResponse.body?.data?.certificate,
                            appBarForegroundColor: appBarForegroundColor,
                            returnResumeEdit: returnResumeEdit,
                            boolClick: isClickCertificate,
                            onTap: () {
                              setState(() {
                                isClickCertificate = !isClickCertificate;
                              });
                            },
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.skill ?? "ประสบการทำงาน",
                              isPreViewResumeEditData: isPreViewResumeResponse.body?.screeninfo?.tapedit ?? 'แตะเพื่อแก้ไข้ข้อมูล',
                              ontap: () {
                                var textSnack = 'แตะการ์ดขด้านล่าง เพื่อแก้ไข้ข้อมูล';
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(textSnack, style: const TextStyle(fontSize: sizeTextSmaller14, color: Colors.black)),
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: const Color(0xFFFFF9D1),
                                ));
                              }),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(children: [
                              Column(
                                children: List.generate(
                                    (isPreViewResumeResponse.body?.data?.skill?.length ?? 0) > 3
                                        ? (isClickSkill == false ? 3 : isPreViewResumeResponse.body?.data?.skill?.length ?? 0)
                                        : (isPreViewResumeResponse.body?.data?.skill?.length ?? 0), (index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return EditSkillResumeScreen(
                                              id: isPreViewResumeResponse.body?.data?.skill?[index].id ?? 0,
                                              count: countIntData?.skill ?? 0,
                                            );
                                          })).then(
                                            (value) => setState(() {
                                              context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                            }),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(isPreViewResumeResponse.body?.data?.skill?[index].skill ?? "",
                                                    maxLines: 5,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: Theme.of(context).appBarTheme.foregroundColor))),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width - 250,
                                                  child: LinearPercentIndicator(
                                                      padding: EdgeInsets.zero,
                                                      animation: true,
                                                      lineHeight: 20.0,
                                                      animationDuration: 2500,
                                                      percent: int.parse("${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}") / 100.0,
                                                      center: Text("${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}.0%"),
                                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                                      progressColor: widgetPointerValueColor(
                                                        int.parse("${isPreViewResumeResponse.body?.data?.skill?[index].value ?? 0}") / 1.0,
                                                      )),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                }),
                              ),
                              if ((isPreViewResumeResponse.body?.data?.skill?.length ?? 0) > 3)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isClickSkill = !isClickSkill;
                                    });
                                  },
                                  child: Text(
                                    isClickSkill == false
                                        ?
                                    showSome : showAll,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).appBarTheme.foregroundColor),
                                  ),
                                ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return EditSkillResumeScreen(
                                  id: 0,
                                  count: countIntData?.skill ?? 0,
                                );
                              })).then(
                                (value) => setState(() {
                                  context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                }),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: DottedBorder(
                                color: (Theme.of(context).iconTheme.color ?? Colors.grey).withOpacity(0.5),
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    //inner container

                                    height: 20, //height of inner container
                                    width: MediaQuery.of(context).size.width,

                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        color: (Theme.of(context).iconTheme.color ?? Colors.grey).withOpacity(0.5),
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
                              isPreViewResumeTitle: isPreViewResumeResponse.body?.screeninfo?.language ?? "ประสบการทางภาษา",
                              isPreViewResumeEditData: isPreViewResumeResponse.body?.screeninfo?.tapedit ?? 'แตะเพื่อแก้ไข้ข้อมูล',
                              ontap: () {
                                var textSnack = 'แตะการ์ดขด้านล่าง เพื่อแก้ไข้ข้อมูล';
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(textSnack, style: const TextStyle(fontSize: sizeTextSmaller14, color: Colors.black)),
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: const Color(0xFFFFF9D1),
                                ));
                              }),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(children: [
                              Column(
                                children: List.generate(
                                    (isPreViewResumeResponse.body?.data?.language?.length ?? 0) > 3
                                        ? (isClickLanguage == false ? 3 : isPreViewResumeResponse.body?.data?.language?.length ?? 0)
                                        : (isPreViewResumeResponse.body?.data?.language?.length ?? 0), (index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return EditSkillLanguageResumeScreen(
                                              id: isPreViewResumeResponse.body?.data?.language?[index].id ?? 0,
                                              count: countIntData?.language ?? 0,
                                            );
                                          })).then(
                                            (value) => setState(() {
                                              context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                            }),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(isPreViewResumeResponse.body?.data?.language?[index].language ?? "",
                                                    maxLines: 5,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: Theme.of(context).appBarTheme.foregroundColor))),
                                            Padding(
                                              padding: EdgeInsets.only(left: 10),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width - 250,
                                                  child: LinearPercentIndicator(
                                                      padding: EdgeInsets.zero,
                                                      animation: true,
                                                      lineHeight: 20.0,
                                                      animationDuration: 2500,
                                                      percent:
                                                          int.parse("${isPreViewResumeResponse.body?.data?.language?[index].value ?? 0}") / 100.0,
                                                      center: Text("${isPreViewResumeResponse.body?.data?.language?[index].value ?? 0}.0%"),
                                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                                      progressColor: widgetPointerValueColor(
                                                        int.parse("${isPreViewResumeResponse.body?.data?.language?[index].value ?? 0}") / 1.0,
                                                      )),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                }),
                              ),
                              if ((isPreViewResumeResponse.body?.data?.language?.length ?? 0) > 3)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isClickLanguage = !isClickLanguage;
                                    });
                                  },
                                  child: Text(
                                    isClickLanguage == false ? showSome : showAll,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).appBarTheme.foregroundColor),
                                  ),
                                ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return EditSkillLanguageResumeScreen(
                                  id: 0,
                                  count: countIntData?.language ?? 0,
                                );
                              })).then(
                                (value) => setState(() {
                                  context.read<ResumeBloc>().add(GetEditScreenPreviewResumeEvent());
                                }),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: DottedBorder(
                                color: (Theme.of(context).iconTheme.color ?? Colors.grey).withOpacity(0.5),
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    //inner container

                                    height: 20, //height of inner container
                                    width: MediaQuery.of(context).size.width,

                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.plus,
                                        color: (Theme.of(context).iconTheme.color ?? Colors.grey).withOpacity(0.5),
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
          floatingActionButton: floatingGoToSetThemePDF(
            context: context,
            setState,
            btnResume1,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ));
  }
}
