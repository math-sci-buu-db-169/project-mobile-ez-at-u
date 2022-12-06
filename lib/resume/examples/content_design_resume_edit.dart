import 'dart:convert';
import 'dart:io' show File;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:pdf/pdf.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../customs/color/color_const.dart';
import '../../customs/color/pdf_color_const.dart';
import '../../customs/dialog/dialog_widget.dart';
import '../../customs/message/text_button.dart';
import '../../customs/message/text_error.dart';
import '../../customs/progress_dialog.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../bloc_resume/resume_bloc.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../../utils/shared_preferences.dart';
import '../model/response/pre_view_resume_response.dart';
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
    super.initState();
  }

  TextEditingController resumeAbout = TextEditingController();
  TextEditingController resumeName = TextEditingController();
  TextEditingController resumePositions = TextEditingController();
  TextEditingController resume = TextEditingController();
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
  bool isClickAbout = false;
  bool isClickPosition = false;
  bool isClickInformation = false;
  bool isClickName = false;
  bool isClickEducation = false;
  bool isClickContact = false;
  bool isClickAddress = false;
  bool isClickExperience = false;
  bool isClickCertificate = false;
  bool isClickSkill = false;
  bool isClickLanguage = false;
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

  @override
  Widget build(BuildContext context) {
    var isPreViewResumeResponse = widget.isPreViewResumeResponse;
    String prefix = isPreViewResumeResponse.body?.data?.userinfo?.prefix ?? '';
    String name =
        isPreViewResumeResponse.body?.data?.userinfo?.name ?? 'ชื่อ -';
    String lastname =
        isPreViewResumeResponse.body?.data?.userinfo?.lastname ?? 'นามสกุล';

    Color? appBarBackgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
    Color? appBarforegroundColor =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
    print(widget.isPreViewResumeResponse.body?.data?.image);
    String isAddressValue =  "${isPreViewResumeResponse.body?.data?.address?.number ?? ''} "
        "${isPreViewResumeResponse.body?.data?.address?.moo ?? ''} "
        " ${isPreViewResumeResponse.body?.data?.address?.soi ?? ''} "
        "${isPreViewResumeResponse.body?.data?.address?.road ?? ''} "
        "${isPreViewResumeResponse.body?.data?.address?.subdistrict ?? ''} "
        " ${isPreViewResumeResponse.body?.data?.address?.district ?? ''} "
         "${isPreViewResumeResponse.body?.data?.address?.province ?? ''} "
        " ${isPreViewResumeResponse.body?.data?.address?.zipcode ?? ''}";
    TextEditingController objectives = TextEditingController();
    final myController = TextEditingController();
    double spaceGap = 15.0;
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
              title: Center(
                  child: Text(
                      // isPreViewResumeResponse.body?.screenInfo?.titlesetthemecolor ??
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

                        const Gap(20),
                        GestureDetector(
                            onTap: () {
                              print("Container clicked ChangePhotoRequest");
                              context
                                  .read<ResumeBloc>()
                                  .add(ChangePhotoRequest());
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
                                                            ?.image))),
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ContentDesignResumeEditScreen()),
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

                   Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.aboutme ??
                                  "About me",
                              isPreViewResumeEditData: isClickAbout == false
                                  ? isPreViewResumeResponse
                                          .body?.screenInfo?.editinfomations ??
                                      "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickAbout = !isClickAbout;
                                });
                                print(isClickAbout);
                              }),
                          isClickAbout == false
                              ? buildDetailResumeCustomNotIconsReadOnly(
                                  context: context,
                                  detail:
                                      "         ${isPreViewResumeResponse.body?.data?.aboutme ?? "About me"}",
                                  appBarForeGroundColor: appBarforegroundColor)
                              : BuildTextFormFieldUnLimitCustomNotIcons(
                                  textEditingController: resumeName,
                                  onChanged: (value) {
                                    resumeName.text = value;
                                    if (kDebugMode) {
                                      print(resumeName.text);
                                    }
                                  },
                                  hintLabel:
                                      "   ${widget.isPreViewResumeResponse.body?.data?.aboutme ?? "รายละเอียดเกี่ยวกับฉัน"}",
                                  initialvalue: widget.isPreViewResumeResponse
                                          .body?.data?.aboutme ??
                                      "รายละเอียดเกี่ยวกับฉัน",
                                  textInputType: TextInputType.text,
                                ),
                        ],
                      ),
                    ),
                   Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.position ??
                                  "ตำแหน่งที่สนใจ",
                              isPreViewResumeEditData: isClickPosition == false
                                  ? isPreViewResumeResponse
                                          .body?.screenInfo?.editinfomations ??
                                      "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickPosition = !isClickPosition;
                                });
                              }),
                          isClickPosition == false
                              ? buildDetailResumeCustomNotIconsReadOnly(
                                  context: context,
                                  detail: isPreViewResumeResponse
                                          .body?.data?.position ??
                                      "ตำแหน่งที่สนใจ",
                                  appBarForeGroundColor: appBarforegroundColor)
                              : BuildTextFormFieldUnLimitCustomNotIcons(
                                  textEditingController: resumeName,
                                  onChanged: (value) {
                                    resumeName.text = value;
                                    if (kDebugMode) {
                                      print(resumeName.text);
                                    }
                                  },
                                  hintLabel: isPreViewResumeResponse
                                          .body?.data?.position ??
                                      "ตำแหน่งที่สนใจ",
                                  initialvalue: isPreViewResumeResponse
                                          .body?.data?.position ??
                                      "ตำแหน่งที่สนใจ",
                                  textInputType: TextInputType.text,
                                ),
                        ],
                      ),
                    ),
                   Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.education ??
                                  "การศึกษา",
                              isPreViewResumeEditData: isClickEducation == false
                                  ? isPreViewResumeResponse
                                          .body?.screenInfo?.editinfomations ??
                                      "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickEducation = !isClickEducation;
                                });
                              }),
                          Column(
                              children: List.generate(
                                  isPreViewResumeResponse
                                          .body?.data?.education?.length ??
                                      0, (index) {
                            return buildDetailResumeCustomNotIconsReadOnly(
                                context: context,
                                detail:
                                "     ${isPreViewResumeResponse.body?.data?.education?[index].startdate ?? ""} - ${isPreViewResumeResponse.body?.data?.education?[index].startdate ?? ""} "
                                    "${isPreViewResumeResponse.body?.data?.education?[index].placeofstudy ?? ""} \n"
                                    "${isPreViewResumeResponse.body?.data?.education?[index].detail ?? ""}",
                                appBarForeGroundColor: appBarforegroundColor);
                          })),

                        ],
                      ),
                    ),
                   Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                      .body?.screenInfo?.contact ??
                                  "ช่องทางการติดต่อ",
                              isPreViewResumeEditData: isClickContact == false
                                  ? isPreViewResumeResponse
                                          .body?.screenInfo?.editinfomations ??
                                      "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickContact= !isClickContact;
                                });
                              }),

                          BuildTextFormFieldUnLimitCustomResume(
                            textEditingController: objectives,
                            onChanged: (value) {
                              objectives.text = value;
                              if (kDebugMode) {
                                print(objectives.text);
                              }
                            },
                            hintLabel:isPreViewResumeResponse.body?.screenInfo?.email ?? "email",
                            initialvalue:isPreViewResumeResponse.body?.data?.personinfo?.email,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.envelope,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            textEditingController: objectives,
                            onChanged: (value) {
                              objectives.text = value;
                              if (kDebugMode) {
                                print(objectives.text);
                              }
                            },
                            hintLabel:isPreViewResumeResponse.body?.screenInfo?.phone ?? "เบอร์โทรศัพท์",
                            initialvalue:isPreViewResumeResponse.body?.data?.personinfo?.phone,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.phone,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            textEditingController: objectives,
                            onChanged: (value) {
                              objectives.text = value;
                              if (kDebugMode) {
                                print(objectives.text);
                              }
                            },
                            hintLabel:isPreViewResumeResponse.body?.screenInfo?.feacbook ?? "เฟสบุ๊ค",
                            initialvalue:isPreViewResumeResponse.body?.data?.personinfo?.feacbook,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.facebook,
                          ),
                          BuildTextFormFieldUnLimitCustomResume(
                            textEditingController: objectives,
                            onChanged: (value) {
                              objectives.text = value;
                              if (kDebugMode) {
                                print(objectives.text);
                              }
                            },
                            hintLabel:isPreViewResumeResponse.body?.screenInfo?.line ?? "ไลน์",
                            initialvalue:isPreViewResumeResponse.body?.data?.personinfo?.line,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.line,
                          ),


                        ],
                      ),
                    ),
                   Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                  .body?.screenInfo?.address ??
                                  "ที่อยู่",
                              isPreViewResumeEditData: isClickAddress == false
                                  ? isPreViewResumeResponse
                                  .body?.screenInfo?.editinfomations ??
                                  "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickAddress= !isClickAddress;
                                });
                              }),

                          BuildTextFormFieldUnLimitCustomResume(
                            textEditingController: objectives,
                            onChanged: (value) {
                              objectives.text = value;
                              if (kDebugMode) {
                                print(objectives.text);
                              }
                            },
                            hintLabel:"",
                            initialvalue:isAddressValue,
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.locationDot,
                          ),
                        ],
                      ),
                    ),
                   Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                  .body?.screenInfo?.experience ??
                                  "ประสบการทำงาน",
                              isPreViewResumeEditData: isClickExperience == false
                                  ? isPreViewResumeResponse
                                  .body?.screenInfo?.editinfomations ??
                                  "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickExperience = !isClickExperience;
                                });
                              }),
                          Column(
                              children: List.generate(
                                  isPreViewResumeResponse
                                      .body?.data?.experience?.length ??
                                      0, (index) {
                                return buildDetailResumeCustomNotIconsReadOnly(
                                    context: context,
                                    detail:
                                    "     ${isPreViewResumeResponse.body?.data?.experience?[index].startdate ?? ""} - ${isPreViewResumeResponse.body?.data?.experience?[index].startdate ?? ""} "
                                        "${isPreViewResumeResponse.body?.data?.experience?[index].position ?? "High school education"} \n"
                                        "${isPreViewResumeResponse.body?.data?.experience?[index].detail ?? ""}",
                                    appBarForeGroundColor: appBarforegroundColor);
                              })),

                        ],
                      ),
                    ),
                     Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                  .body?.screenInfo?.certificate ??
                                  "ประสบการทำงาน",
                              isPreViewResumeEditData: isClickCertificate == false
                                  ? isPreViewResumeResponse
                                  .body?.screenInfo?.editinfomations ??
                                  "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickCertificate = !isClickCertificate;
                                });
                              }),
                          Column(
                              children: List.generate(
                                  isPreViewResumeResponse
                                      .body?.data?.experience?.length ??
                                      0, (index) {
                                return buildDetailResumeCustomNotIconsReadOnly(
                                    context: context,
                                    detail:"  ${isPreViewResumeResponse.body?.data?.certificate?[index].title ?? ""} \n"
                                        "${isPreViewResumeResponse.body?.data?.certificate?[index].caption ?? ""}",
                                    appBarForeGroundColor: appBarforegroundColor);
                              })),

                        ],
                      ),
                    ),
                     Gap(spaceGap),
                    Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.9),
                      child: Column(
                        children: [
                          buildTitleEditDataResume(
                              context: context,
                              isPreViewResumeTitle: isPreViewResumeResponse
                                  .body?.screenInfo?.skill ??
                                  "ประสบการทำงาน",
                              isPreViewResumeEditData: isClickSkill == false
                                  ? isPreViewResumeResponse
                                  .body?.screenInfo?.editinfomations ??
                                  "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickSkill = !isClickSkill;
                                });
                              }),
                      Padding(padding: EdgeInsets.only(bottom: 15),child: Column(
                          children: List.generate(
                              isPreViewResumeResponse
                                  .body?.data?.skill?.length ??
                                  0, (index) {
                            return Padding(padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(isPreViewResumeResponse.body?.data?.skill?[index].skill ?? "",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).appBarTheme.foregroundColor)),
                                  LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.width - 200,
                                    animation: true,
                                    lineHeight: 20.0,
                                    animationDuration: 2500,
                                    percent: int. parse("${isPreViewResumeResponse.body?.data?.skill?[index].value??0}")/100.0,
                                    center: Text("${isPreViewResumeResponse.body?.data?.skill?[index].value??0}.0%"),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor:
                                    int. parse("${isPreViewResumeResponse.body?.data?.skill?[index].value??0}") <31?Colors.redAccent:
                                    int. parse("${isPreViewResumeResponse.body?.data?.skill?[index].value??0}") <50?Colors.yellowAccent:
                                    int. parse("${isPreViewResumeResponse.body?.data?.skill?[index].value??0}") <65?Colors.blueAccent:
                                    Colors.green,
                                  ),
                                ],),);
                          })),),
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
                                  "ประสบการทำงาน",
                              isPreViewResumeEditData: isClickLanguage == false
                                  ? isPreViewResumeResponse
                                  .body?.screenInfo?.editinfomations ??
                                  "Edit Information"
                                  : "Save",
                              ontap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //       const ContentDesignResumeEditScreen()),
                                // );
                                setState(() {
                                  isClickLanguage = !isClickLanguage;
                                });
                              }),
                          Padding(padding: EdgeInsets.only(bottom: 15),child: Column(
                              children: List.generate(
                                  isPreViewResumeResponse
                                      .body?.data?.languge?.length ??
                                      0, (index) {
                                return Padding(padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(isPreViewResumeResponse.body?.data?.languge?[index].language ?? "",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).appBarTheme.foregroundColor)),
                                      LinearPercentIndicator(
                                        width: MediaQuery.of(context).size.width - 200,
                                        animation: true,
                                        lineHeight: 20.0,
                                        animationDuration: 2500,
                                        percent: int. parse("${isPreViewResumeResponse.body?.data?.languge?[index].value??0}")/100.0,
                                        center: Text("${isPreViewResumeResponse.body?.data?.languge?[index].value??0}.0%"),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor:
                                        int. parse("${isPreViewResumeResponse.body?.data?.languge?[index].value??0}") <31?Colors.redAccent:
                                        int. parse("${isPreViewResumeResponse.body?.data?.languge?[index].value??0}") <50?Colors.yellowAccent:
                                        int. parse("${isPreViewResumeResponse.body?.data?.languge?[index].value??0}") <65?Colors.blueAccent:
                                        Colors.green,
                                      ),
                                    ],),);
                              })),),
                        ],
                      ),
                    ),





                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          )), floatingActionButton: floatingSetThemePDF(
          context: context,
          setState,
          "Set Theme PDF",
        ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
        ));
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
              builder: (context) => const ContentDesignResumeScreen(
              )));
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
