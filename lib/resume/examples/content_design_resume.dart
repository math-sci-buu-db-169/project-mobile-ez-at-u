import 'dart:convert';
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customs/color/color_const.dart';
import '../../customs/color/pdf_color_const.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../customs/dialog/dialog_widget.dart';
import '../../customs/message/text_button.dart';
import '../../customs/message/text_demo_resume.dart';
import '../../customs/message/text_error.dart';
import '../../customs/progress_dialog.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../bloc_resume/resume_bloc.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../../utils/shared_preferences.dart';
import '../app.dart';
import '../model/response/pre_view_resume_response.dart';
import 'content_design_resume_edit.dart';

class ContentDesignResumeScreen extends StatelessWidget {
  const ContentDesignResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ResumeBloc()..add(GetPreviewResumeEvent()),
        child: const ContentDesignResume());
  }
}

class ContentDesignResume extends StatefulWidget {
  const ContentDesignResume({Key? key}) : super(key: key);

  @override
  State<ContentDesignResume> createState() => _ContentDesignResumeState();
}

class _ContentDesignResumeState extends State<ContentDesignResume>
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
        if (state is PreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is PreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is PreviewResumeError) {
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

        if (state is ChooseImageUpLoadResumeSuccess) {
          context.read<ResumeBloc>().add(GetPreviewResumeEvent());
        }
      },
      builder: (context, state) {
        if (state is PreviewResumeSuccessState) {
          _preViewResumeResponse = state.isPreViewResumeResponse;
          return BodyPreviewResume(
              isPreViewResumeResponse: _preViewResumeResponse);
        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is PreviewResumeSuccessState ;
      },
    );
  }
}

class BodyPreviewResume extends StatefulWidget {
  final PreViewResumeResponse isPreViewResumeResponse;
  const BodyPreviewResume({Key? key, required this.isPreViewResumeResponse})
      : super(key: key);

  @override
  State<BodyPreviewResume> createState() => _BodyPreviewResumeState();
}

class _BodyPreviewResumeState extends State<BodyPreviewResume> {
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
  bool isChecked1 = false;
  bool isSelectLanguageThai = true;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isEducationsTitle = true;
  bool isEducationsOne = true;
  bool isEducationsTwo = true;
  bool isEducationsThree = true;
  bool isContactTitle = true;
  bool isContactOne = true;
  bool isContactTwo = true;
  bool isContactThree = true;
  bool isContactFour = true;
  bool isContactFive = true;

  bool isExperienceTitle = true;
  bool isExperienceOne = true;
  bool isExperienceTwo = true;
  bool isExperienceThree = true;
  bool isCertTitle = true;
  bool isCertOne = true;
  bool isCertTwo = true;
  bool isCertThree = true;
  bool isSkillsTitle = true;
  bool isSkillsOne = true;
  bool isSkillsTwo = true;
  bool isSkillsThree = true;
  late double sizePhoto = 1.5;
  late double widthSizeCM = 3.00;
  late double heightSizeCM = 4.00;
  late PdfColor colorOfPdfUsTheme = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsTheme = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsButtonTitle = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsButtonTitle = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsName = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsName = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsPosition = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsPosition = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsExperience = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsExperience = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsCertifications = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsCertifications =
      colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsSkills = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsSkills = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsAbout = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsAbout = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsText = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsText = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsEducations = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsEducations = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsContact = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsContact = colorOfPdfList[6].materialColor;

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

              // leading: Builder(
              //   builder: (BuildContext context) {
              //     return IconButton(
              //       icon: FaIcon(FontAwesomeIcons.bars,
              //           color: Theme.of(context).iconTheme.color, size: 20),
              //       onPressed: () {
              //         Scaffold.of(context).openDrawer();
              //       },
              //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              //     );
              //   },
              // ),

              title: Center(
                  child: Text(
                      isPreViewResumeResponse
                              .body?.screenInfo?.titlesetthemecolor ??
                          "Set Theme And Color",
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

                      context.read<ResumeBloc>().add(GetPreviewResumeEvent());
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
                // IconButton(onPressed:  () =>
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => const ContentDesignResumeEditScreen()),
                //     ), icon:  Text("data"),)
              ]
              // // actions: [
              //   PopupMenuButton(
              //     child: Align(
              //       alignment: Alignment.centerRight,
              //       child: Padding(
              //         padding: const EdgeInsets.all(16.0),
              //         child: Icon(
              //           FontAwesomeIcons.filter,
              //           size: 20,
              //           color: Theme.of(context).bottomAppBarColor,
              //         ),
              //       ),
              //     ),
              //     itemBuilder: (context) {
              //       return List.generate(colorOfPdfList.length ?? 0, (index) {
              //         return PopupMenuItem(
              //           value: index,
              //           child: Text(
              //             "${colorOfPdfList[index].nameColor}",
              //             style: TextStyle(
              //                 fontSize: 20,
              //                 color: (colorOfPdfList[index].materialColor ==
              //                             Colors.black) ||
              //                         (colorOfPdfList[index].materialColor ==
              //                             Colors.white)
              //                     ? Theme.of(context).appBarTheme.foregroundColor
              //                     : colorOfPdfList[index].materialColor),
              //           ),
              //         );
              //       });
              //     },
              //     onSelected: (value) {
              //       colorOfPdfUsTheme = colorOfPdfList[value].pdfOfColor;
              //       setState(() {});
              //     },
              //   ),
              // ],
              ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 250,
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () async {
                                          await showMenu<int>(
                                              context: context,
                                              position: RelativeRect.fromLTRB(
                                                  0, 0, 0, 0),
                                              items: List.generate(
                                                  colorOfPdfList.length ?? 0,
                                                  (index) {
                                                return PopupMenuItem(
                                                  value: index,
                                                  child: Text(
                                                    "${colorOfPdfList[index].nameColor}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: (colorOfPdfList[
                                                                            index]
                                                                        .materialColor ==
                                                                    Colors
                                                                        .black) ||
                                                                (colorOfPdfList[
                                                                            index]
                                                                        .materialColor ==
                                                                    Colors
                                                                        .white)
                                                            ? Theme.of(context)
                                                                .appBarTheme
                                                                .foregroundColor
                                                            : colorOfPdfList[
                                                                    index]
                                                                .materialColor),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      materialColorOfPdfUsTheme =
                                                          colorOfPdfList[index]
                                                              .materialColor;
                                                      // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                      //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                      // }
                                                      colorOfPdfUsTheme =
                                                          colorOfPdfList[index]
                                                              .pdfOfColor;
                                                    });
                                                  },
                                                );
                                              }));
                                        },
                                        child: Container(
                                          color: (materialColorOfPdfUsTheme ==
                                                      Colors.black &&
                                                  materialColorOfPdfUsTheme ==
                                                      Colors.black)
                                              ? Colors.white
                                              : (materialColorOfPdfUsTheme ==
                                                          Colors.white &&
                                                      materialColorOfPdfUsTheme ==
                                                          Colors.white)
                                                  ? Colors.black
                                                  : Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                          child: Icon(FontAwesomeIcons.droplet,
                                              size: 20,
                                              color: materialColorOfPdfUsTheme),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        isPreViewResumeResponse
                                                .body?.screenInfo?.themecolor ??
                                            "Theme Color",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .appBarTheme
                                                .foregroundColor),
                                      ),
                                    )
                                  ],
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
                                            color: (materialColorOfPdfUsTheme ==
                                                        Colors.black &&
                                                    materialColorOfPdfUsTheme ==
                                                        Colors.black)
                                                ? Colors.white
                                                : (materialColorOfPdfUsTheme ==
                                                            Colors.white &&
                                                        materialColorOfPdfUsTheme ==
                                                            Colors.white)
                                                    ? Colors.black
                                                    : Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                            child: Row(
                                              children: [
                                                Icon(FontAwesomeIcons.pen,
                                                    size: 12,
                                                    color:
                                                        materialColorOfPdfUsTheme),
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
                                                        fontSize: 12,
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
                              ],
                            ),

                            Text(
                              isPreViewResumeResponse
                                      .body?.screenInfo?.pictuce ??
                                  "Pictuce",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .foregroundColor),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      print(
                                          "Container clicked ChangePhotoRequest");
                                      context
                                          .read<ResumeBloc>()
                                          .add(ChangePhotoRequest());
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: DottedBorder(
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(12),
                                            padding: EdgeInsets.all(2),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              child: Container(
                                                //inner container

                                                height:
                                                    120, //height of inner container
                                                width:
                                                    80, //width to 100% match to parent container.
                                                color: colorBoxDotted,

                                                child: Center(
                                                    child: (widget
                                                                    .isPreViewResumeResponse
                                                                    .body
                                                                    ?.data
                                                                    ?.image ==
                                                                '' ||
                                                            widget
                                                                    .isPreViewResumeResponse
                                                                    .body
                                                                    ?.data
                                                                    ?.image ==
                                                                null)
                                                        ? Image.asset(
                                                            "assets/profile.jpg",
                                                            width: 600.0,
                                                            height: 240.0,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Image.memory(
                                                            (base64Decode(base64
                                                                .normalize(widget
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
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            size: 20,
                                            shadows: <Shadow>[
                                              Shadow(
                                                  color: Colors.white,
                                                  blurRadius: 15.0)
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "   ${isPreViewResumeResponse.body?.screenInfo?.ratio ?? "The aspect ratio must be 3:4"} \n"
                                            "${isPreViewResumeResponse.body?.screenInfo?.sizepictuce ?? "The aspect ratio must be 3:4"} ",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .appBarTheme
                                                    .foregroundColor),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.squareCheck,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                              size: 20,
                                              shadows: <Shadow>[
                                                Shadow(
                                                    color: Colors.white,
                                                    blurRadius: 15.0)
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                " ${isPreViewResumeResponse.body?.screenInfo?.selecttheinformation ?? "Please select the information \nthat will be used to create a resume."} ",
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
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              color: (materialColorOfPdfUsAbout ==
                                                          Colors.black &&
                                                      materialColorOfPdfUsAbout ==
                                                          Colors.black)
                                                  ? Colors.white
                                                  : (materialColorOfPdfUsAbout ==
                                                              Colors.white &&
                                                          materialColorOfPdfUsAbout ==
                                                              Colors.white)
                                                      ? Colors.black
                                                      : Theme.of(context)
                                                          .scaffoldBackgroundColor,
                                              child: Icon(
                                                  FontAwesomeIcons.droplet,
                                                  size: 20,
                                                  color:
                                                      materialColorOfPdfUsAbout),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "${isPreViewResumeResponse.body?.screenInfo?.selecttheinformation ?? "Please select a color\n"
                                                    "to use in creating a resume.\n"}  ",
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
                                        InkWell(
                                          onTap: () async {
                                            int? value = await showMenu<int>(
                                                context: context,
                                                position: RelativeRect.fromLTRB(
                                                    0, 0, 0, 0),
                                                items: List.generate(
                                                    sizeImageResume.length ?? 0,
                                                    (index) {
                                                  return PopupMenuItem(
                                                    value: index,
                                                    child: Text(
                                                      "${sizeImageResume[index].sizePhoto} "
                                                      "${isPreViewResumeResponse.body?.screenInfo?.n ?? " N''"}  "
                                                      "${sizeImageResume[index].widthSizeCM} x ${sizeImageResume[index].heightSizeCM} "
                                                      "${isPreViewResumeResponse.body?.screenInfo?.whcm ?? " (w x h : cm)) "} ",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Theme.of(
                                                                  context)
                                                              .appBarTheme
                                                              .foregroundColor),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        sizePhoto =
                                                            sizeImageResume[
                                                                    index]
                                                                .sizePhoto;
                                                        widthSizeCM =
                                                            sizeImageResume[
                                                                    index]
                                                                .widthSizeCM;
                                                        heightSizeCM =
                                                            sizeImageResume[
                                                                    index]
                                                                .heightSizeCM;
                                                      });
                                                    },
                                                  );
                                                }));
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${isPreViewResumeResponse.body?.screenInfo?.select ?? "Select"}  ",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationThickness: 2,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context)
                                                        .appBarTheme
                                                        .foregroundColor),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "${sizePhoto == 1.5 ? isPreViewResumeResponse.body?.screenInfo?.textdefault ?? "Default" : ''}${isPreViewResumeResponse.body?.screenInfo?.size ?? "size"}  : $sizePhoto "
                                                  "${isPreViewResumeResponse.body?.screenInfo?.n ?? " N''"}  "
                                                  " $widthSizeCM x $heightSizeCM ${isPreViewResumeResponse.body?.screenInfo?.whcm ?? " (w x h : cm)) "} ",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .appBarTheme
                                                          .foregroundColor),
                                                ),
                                              ),
                                            ],
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
                              height: 5,
                              thickness: 5,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      int? value = await showMenu<int>(
                                          context: context,
                                          position:
                                              RelativeRect.fromLTRB(0, 0, 0, 0),
                                          items: List.generate(
                                              colorOfPdfList.length ?? 0,
                                              (index) {
                                            return PopupMenuItem(
                                              value: index,
                                              child: Text(
                                                "${colorOfPdfList[index].nameColor}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.black) ||
                                                            (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.white)
                                                        ? Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor
                                                        : colorOfPdfList[index]
                                                            .materialColor),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  materialColorOfPdfUsAbout =
                                                      colorOfPdfList[index]
                                                          .materialColor;
                                                  // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                  //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                  // }
                                                  colorOfPdfUsAbout =
                                                      colorOfPdfList[index]
                                                          .pdfOfColor;
                                                });
                                              },
                                            );
                                          }));
                                    },
                                    child: Container(
                                      color: (materialColorOfPdfUsAbout ==
                                                  Colors.black &&
                                              materialColorOfPdfUsAbout ==
                                                  Colors.black)
                                          ? Colors.white
                                          : (materialColorOfPdfUsAbout ==
                                                      Colors.white &&
                                                  materialColorOfPdfUsAbout ==
                                                      Colors.white)
                                              ? Colors.black
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                      child: Icon(FontAwesomeIcons.droplet,
                                          size: 20,
                                          color: materialColorOfPdfUsAbout),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    isPreViewResumeResponse
                                            .body?.screenInfo?.aboutme ??
                                        isAboutMe,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                )
                              ],
                            ),
                            buildDetailResumeCustomNotIconsReadOnly(
                                context: context,
                                detail:
                                    "         ${isPreViewResumeResponse.body?.data?.aboutme ?? "รายละเอียดเกี่ยวกับฉัน"}",
                                appBarForeGroundColor: appBarforegroundColor),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      int? value = await showMenu<int>(
                                          context: context,
                                          position:
                                              RelativeRect.fromLTRB(0, 0, 0, 0),
                                          items: List.generate(
                                              colorOfPdfList.length ?? 0,
                                              (index) {
                                            return PopupMenuItem(
                                              value: index,
                                              child: Text(
                                                "${colorOfPdfList[index].nameColor}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.black) ||
                                                            (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.white)
                                                        ? Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor
                                                        : colorOfPdfList[index]
                                                            .materialColor),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  materialColorOfPdfUsName =
                                                      colorOfPdfList[index]
                                                          .materialColor;
                                                  // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                  //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                  // }
                                                  colorOfPdfUsName =
                                                      colorOfPdfList[index]
                                                          .pdfOfColor;
                                                });
                                              },
                                            );
                                          }));
                                    },
                                    child: Container(
                                      color: (materialColorOfPdfUsName ==
                                                  Colors.black &&
                                              materialColorOfPdfUsName ==
                                                  Colors.black)
                                          ? Colors.white
                                          : (materialColorOfPdfUsName ==
                                                      Colors.white &&
                                                  materialColorOfPdfUsName ==
                                                      Colors.white)
                                              ? Colors.black
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                      child: Icon(FontAwesomeIcons.droplet,
                                          size: 20,
                                          color: materialColorOfPdfUsName),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    isPreViewResumeResponse
                                            .body?.screenInfo?.name ??
                                        "Name",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                )
                              ],
                            ),

                            buildDetailResumeCustomNotIconsReadOnly(
                                context: context,
                                detail: "$name $lastname",
                                appBarForeGroundColor: appBarforegroundColor),

                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      int? value = await showMenu<int>(
                                          context: context,
                                          position:
                                              RelativeRect.fromLTRB(0, 0, 0, 0),
                                          items: List.generate(
                                              colorOfPdfList.length ?? 0,
                                              (index) {
                                            return PopupMenuItem(
                                              value: index,
                                              child: Text(
                                                "${colorOfPdfList[index].nameColor}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.black) ||
                                                            (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.white)
                                                        ? Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor
                                                        : colorOfPdfList[index]
                                                            .materialColor),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  materialColorOfPdfUsPosition =
                                                      colorOfPdfList[index]
                                                          .materialColor;
                                                  // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                  //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                  // }
                                                  colorOfPdfUsPosition =
                                                      colorOfPdfList[index]
                                                          .pdfOfColor;
                                                });
                                              },
                                            );
                                          }));
                                    },
                                    child: Container(
                                      color: (materialColorOfPdfUsPosition ==
                                                  Colors.black &&
                                              materialColorOfPdfUsPosition ==
                                                  Colors.black)
                                          ? Colors.white
                                          : (materialColorOfPdfUsPosition ==
                                                      Colors.white &&
                                                  materialColorOfPdfUsPosition ==
                                                      Colors.white)
                                              ? Colors.black
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                      child: Icon(FontAwesomeIcons.droplet,
                                          size: 20,
                                          color: materialColorOfPdfUsPosition),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    isPreViewResumeResponse
                                            .body?.screenInfo?.position ??
                                        "Positions",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                )
                              ],
                            ),
                            buildDetailResumeCustomNotIconsReadOnly(
                                context: context,
                                detail: widget.isPreViewResumeResponse.body
                                        ?.data?.position ??
                                    "ต่ำแหน่งงาน",
                                appBarForeGroundColor: appBarforegroundColor),

                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      int? value = await showMenu<int>(
                                          context: context,
                                          position:
                                              RelativeRect.fromLTRB(0, 0, 0, 0),
                                          items: List.generate(
                                              colorOfPdfList.length ?? 0,
                                              (index) {
                                            return PopupMenuItem(
                                              value: index,
                                              child: Text(
                                                "${colorOfPdfList[index].nameColor}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.black) ||
                                                            (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.white)
                                                        ? Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor
                                                        : colorOfPdfList[index]
                                                            .materialColor),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  materialColorOfPdfUsEducations =
                                                      colorOfPdfList[index]
                                                          .materialColor;
                                                  // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                  //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                  // }
                                                  colorOfPdfUsEducations =
                                                      colorOfPdfList[index]
                                                          .pdfOfColor;
                                                });
                                              },
                                            );
                                          }));
                                    },
                                    child: Container(
                                      color: (materialColorOfPdfUsEducations ==
                                                  Colors.black &&
                                              materialColorOfPdfUsEducations ==
                                                  Colors.black)
                                          ? Colors.white
                                          : (materialColorOfPdfUsEducations ==
                                                      Colors.white &&
                                                  materialColorOfPdfUsEducations ==
                                                      Colors.white)
                                              ? Colors.black
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                      child: Icon(FontAwesomeIcons.droplet,
                                          size: 20,
                                          color:
                                              materialColorOfPdfUsEducations),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    isPreViewResumeResponse
                                            .body?.screenInfo?.education ??
                                        "Educations",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                ),
                                Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isEducationsTitle,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isEducationsTitle = value ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            buildDetailResumeCheckboxCustomNotIconsReadOnly(
                              context: context,
                              detail:
                                  "${isPreViewResumeResponse.body?.data?.education?[0].startdate ?? ""} - ${isPreViewResumeResponse.body?.data?.education?[0].startdate ?? ""}\n"
                                  "${isPreViewResumeResponse.body?.data?.education?[0].placeofstudy ?? "High school education"} \n"
                                  "     ${isPreViewResumeResponse.body?.data?.education?[0].detail ?? ""}",
                              appBarForeGroundColor: appBarforegroundColor,
                              checkbox: Checkbox(
                                checkColor: Theme.of(context).primaryColor,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isEducationsOne,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isEducationsOne = value ?? false;
                                  });
                                },
                              ),
                            ),

                            buildDetailResumeCheckboxCustomNotIconsReadOnly(
                              context: context,
                              detail:
                                  "${isPreViewResumeResponse.body?.data?.education?[1].startdate ?? ""} - ${isPreViewResumeResponse.body?.data?.education?[1].startdate ?? ""}\n"
                                  "${isPreViewResumeResponse.body?.data?.education?[1].placeofstudy ?? "High school education"} \n"
                                  "     ${isPreViewResumeResponse.body?.data?.education?[1].detail ?? ""}",
                              appBarForeGroundColor: appBarforegroundColor,
                              checkbox: Checkbox(
                                checkColor: Theme.of(context).primaryColor,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isEducationsTwo,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isEducationsTwo = value ?? false;
                                  });
                                },
                              ),
                            ),

                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    int? value = await showMenu<int>(
                                        context: context,
                                        position:
                                            RelativeRect.fromLTRB(0, 0, 0, 0),
                                        items: List.generate(
                                            colorOfPdfList.length ?? 0,
                                            (index) {
                                          return PopupMenuItem(
                                            value: index,
                                            child: Text(
                                              "${colorOfPdfList[index].nameColor}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: (colorOfPdfList[index]
                                                                  .materialColor ==
                                                              Colors.black) ||
                                                          (colorOfPdfList[index]
                                                                  .materialColor ==
                                                              Colors.white)
                                                      ? Theme.of(context)
                                                          .appBarTheme
                                                          .foregroundColor
                                                      : colorOfPdfList[index]
                                                          .materialColor),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                materialColorOfPdfUsContact =
                                                    colorOfPdfList[index]
                                                        .materialColor;
                                                // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                // }
                                                colorOfPdfUsContact =
                                                    colorOfPdfList[index]
                                                        .pdfOfColor;
                                              });
                                            },
                                          );
                                        }));
                                  },
                                  child: Container(
                                      color: (materialColorOfPdfUsContact ==
                                                  Colors.black &&
                                              materialColorOfPdfUsContact ==
                                                  Colors.black)
                                          ? Colors.white
                                          : (materialColorOfPdfUsContact ==
                                                      Colors.white &&
                                                  materialColorOfPdfUsContact ==
                                                      Colors.white)
                                              ? Colors.black
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                      child: Icon(FontAwesomeIcons.droplet,
                                          size: 20,
                                          color: materialColorOfPdfUsContact)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.isPreViewResumeResponse.body
                                            ?.screenInfo?.contact ??
                                        "Contact",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                ),
                                Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isContactTitle,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isContactTitle = value ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            if (isPreViewResumeResponse
                                    .body?.data?.personinfo?.email !=
                                null)
                              buildDetailResumeCheckboxCustomNotIconsReadOnly(
                                context: context,
                                detail:
                                "${isPreViewResumeResponse.body?.screenInfo?.email ?? "email"} : ${isPreViewResumeResponse.body?.data?.personinfo?.email} ",
                                appBarForeGroundColor: appBarforegroundColor,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                                  value: isContactOne,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isContactOne = value ?? false;
                                    });
                                  },
                                ),
                              ),
                            if (isPreViewResumeResponse
                                    .body?.data?.personinfo?.phone !=
                                null)
                              buildDetailResumeCheckboxCustomNotIconsReadOnly(
                                context: context,
                                detail:
                                "${isPreViewResumeResponse.body?.screenInfo?.phone ?? "phone"} : ${isPreViewResumeResponse.body?.data?.personinfo?.phone} ",
                                appBarForeGroundColor: appBarforegroundColor,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                                  value: isContactTwo,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isContactTwo = value ?? false;
                                    });
                                  },
                                ),
                              ),

                            if (isPreViewResumeResponse
                                    .body?.data?.personinfo?.feacbook !=
                                null)buildDetailResumeCheckboxCustomNotIconsReadOnly(
                              context: context,
                              detail:
                              "${isPreViewResumeResponse.body?.screenInfo?.feacbook ?? "facebook"} : ${isPreViewResumeResponse.body?.data?.personinfo?.feacbook} ",
                              appBarForeGroundColor: appBarforegroundColor,
                              checkbox: Checkbox(
                                checkColor: Theme.of(context).primaryColor,
                                fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                                value: isContactThree,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isContactThree = value ?? false;
                                  });
                                },
                              ),
                            ),
                            if (isPreViewResumeResponse
                                    .body?.data?.personinfo?.line !=
                                null)
                              buildDetailResumeCheckboxCustomNotIconsReadOnly(
                                context: context,
                                detail:
                                "${isPreViewResumeResponse.body?.screenInfo?.line ?? "line"} : ${isPreViewResumeResponse.body?.data?.personinfo?.line} ",
                                appBarForeGroundColor: appBarforegroundColor,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                                  value: isContactFour,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isContactFour = value ?? false;
                                    });
                                  },
                                ),
                              ),

                            if (isPreViewResumeResponse
                                    .body?.data?.personinfo?.twitter !=
                                null)
                              BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                textEditingController: resumeName,
                                onChanged: (value) {
                                  resumeName.text = value;
                                  if (kDebugMode) {
                                    print(resumeName.text);
                                  }
                                },
                                hintLabel: isPreViewResumeResponse
                                        .body?.screenInfo?.twitter ??
                                    "twitter",
                                initialvalue:
                                    "${isPreViewResumeResponse.body?.screenInfo?.twitter ?? "twitter"} : ${isPreViewResumeResponse.body?.data?.personinfo?.twitter} }",
                                textInputType: TextInputType.text,
                                isChecked: isContactFive,
                                isCheckedSetState: (bool? value) {
                                  setState(() {
                                    isContactFive = value ?? false;
                                  });
                                },
                              ),
                            if (isPreViewResumeResponse
                                    .body?.data?.experience?.length !=
                                0)
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () async {
                                        int? value = await showMenu<int>(
                                            context: context,
                                            position: RelativeRect.fromLTRB(
                                                0, 0, 0, 0),
                                            items: List.generate(
                                                colorOfPdfList.length ?? 0,
                                                (index) {
                                              return PopupMenuItem(
                                                value: index,
                                                child: Text(
                                                  "${colorOfPdfList[index].nameColor}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: (colorOfPdfList[
                                                                          index]
                                                                      .materialColor ==
                                                                  Colors
                                                                      .black) ||
                                                              (colorOfPdfList[
                                                                          index]
                                                                      .materialColor ==
                                                                  Colors.white)
                                                          ? Theme.of(context)
                                                              .appBarTheme
                                                              .foregroundColor
                                                          : colorOfPdfList[
                                                                  index]
                                                              .materialColor),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    materialColorOfPdfUsExperience =
                                                        colorOfPdfList[index]
                                                            .materialColor;
                                                    // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                    //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                    // }
                                                    colorOfPdfUsExperience =
                                                        colorOfPdfList[index]
                                                            .pdfOfColor;
                                                  });
                                                },
                                              );
                                            }));
                                      },
                                      child: Container(
                                        color: (materialColorOfPdfUsExperience ==
                                                    Colors.black &&
                                                materialColorOfPdfUsExperience ==
                                                    Colors.black)
                                            ? Colors.white
                                            : (materialColorOfPdfUsExperience ==
                                                        Colors.white &&
                                                    materialColorOfPdfUsExperience ==
                                                        Colors.white)
                                                ? Colors.black
                                                : Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                        child: Icon(FontAwesomeIcons.droplet,
                                            size: 20,
                                            color:
                                                materialColorOfPdfUsExperience),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      isPreViewResumeResponse
                                              .body?.screenInfo?.experience ??
                                          "Experience",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .appBarTheme
                                              .foregroundColor),
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Theme.of(context).primaryColor,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isExperienceTitle,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isExperienceTitle = value ?? false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            if (isPreViewResumeResponse
                                    .body?.data?.education?.length !=
                                0)
                              buildDetailResumeCheckboxCustomNotIconsReadOnly(
                                context: context,
                                detail:
                                "${isPreViewResumeResponse.body?.data?.experience?[0].startdate ?? ""} - ${isPreViewResumeResponse.body?.data?.experience?[0].startdate ?? ""}\n"
                                    "     ${isPreViewResumeResponse.body?.data?.experience?[0].position ?? ""} : ${isPreViewResumeResponse.body?.data?.experience?[0].detail ?? ""}",
                                appBarForeGroundColor: appBarforegroundColor,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                                  value: isExperienceOne,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isExperienceOne = value ?? false;
                                    });
                                  },
                                ),
                              ),

                            if (isPreViewResumeResponse
                                    .body?.data?.certificate?.length !=
                                0)
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () async {
                                        int? value = await showMenu<int>(
                                            context: context,
                                            position: RelativeRect.fromLTRB(
                                                0, 0, 0, 0),
                                            items: List.generate(
                                                colorOfPdfList.length ?? 0,
                                                (index) {
                                              return PopupMenuItem(
                                                value: index,
                                                child: Text(
                                                  "${colorOfPdfList[index].nameColor}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: (colorOfPdfList[
                                                                          index]
                                                                      .materialColor ==
                                                                  Colors
                                                                      .black) ||
                                                              (colorOfPdfList[
                                                                          index]
                                                                      .materialColor ==
                                                                  Colors.white)
                                                          ? Theme.of(context)
                                                              .appBarTheme
                                                              .foregroundColor
                                                          : colorOfPdfList[
                                                                  index]
                                                              .materialColor),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    materialColorOfPdfUsCertifications =
                                                        colorOfPdfList[index]
                                                            .materialColor;
                                                    // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                    //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                    // }
                                                    colorOfPdfUsCertifications =
                                                        colorOfPdfList[index]
                                                            .pdfOfColor;
                                                  });
                                                },
                                              );
                                            }));
                                      },
                                      child: Container(
                                        color: (materialColorOfPdfUsCertifications ==
                                                    Colors.black &&
                                                materialColorOfPdfUsCertifications ==
                                                    Colors.black)
                                            ? Colors.white
                                            : (materialColorOfPdfUsCertifications ==
                                                        Colors.white &&
                                                    materialColorOfPdfUsCertifications ==
                                                        Colors.white)
                                                ? Colors.black
                                                : Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                        child: Icon(FontAwesomeIcons.droplet,
                                            size: 20,
                                            color:
                                                materialColorOfPdfUsCertifications),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      isPreViewResumeResponse
                                              .body?.screenInfo?.certificate ??
                                          isCertifications,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .appBarTheme
                                              .foregroundColor),
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Theme.of(context).primaryColor,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isCertTitle,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCertTitle = value ?? false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            if (isPreViewResumeResponse
                                    .body?.data?.certificate?.length !=
                                0)
                              buildDetailResumeCheckboxCustomNotIconsReadOnly(
                                context: context,
                                detail:
                                "${isPreViewResumeResponse.body?.data?.certificate?[0].title ?? ""} - ${isPreViewResumeResponse.body?.data?.certificate?[0].caption ?? ""}",
                                appBarForeGroundColor: appBarforegroundColor,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                                  value: isCertOne,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCertOne = value ?? false;
                                    });
                                  },
                                ),
                              ),

                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () async {
                                      int? value = await showMenu<int>(
                                          context: context,
                                          position:
                                              RelativeRect.fromLTRB(0, 0, 0, 0),
                                          items: List.generate(
                                              colorOfPdfList.length ?? 0,
                                              (index) {
                                            return PopupMenuItem(
                                              value: index,
                                              child: Text(
                                                "${colorOfPdfList[index].nameColor}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.black) ||
                                                            (colorOfPdfList[
                                                                        index]
                                                                    .materialColor ==
                                                                Colors.white)
                                                        ? Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor
                                                        : colorOfPdfList[index]
                                                            .materialColor),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  materialColorOfPdfUsSkills =
                                                      colorOfPdfList[index]
                                                          .materialColor;
                                                  // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                  //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                  // }
                                                  colorOfPdfUsSkills =
                                                      colorOfPdfList[index]
                                                          .pdfOfColor;
                                                });
                                              },
                                            );
                                          }));
                                    },
                                    child: Container(
                                      color: (materialColorOfPdfUsSkills ==
                                                  Colors.black &&
                                              materialColorOfPdfUsSkills ==
                                                  Colors.black)
                                          ? Colors.white
                                          : (materialColorOfPdfUsSkills ==
                                                      Colors.white &&
                                                  materialColorOfPdfUsSkills ==
                                                      Colors.white)
                                              ? Colors.black
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                      child: Icon(FontAwesomeIcons.droplet,
                                          size: 20,
                                          color: materialColorOfPdfUsSkills),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    isPreViewResumeResponse
                                            .body?.screenInfo?.skill ??
                                        isSKILLS,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                ),
                                Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isSkillsTitle,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isSkillsTitle = value ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                            buildDetailResumeCheckboxCustomNotIconsReadOnly(
                              context: context,
                              detail:isPreViewResumeResponse
                                  .body?.data?.skill?[0].skill ??
                                  isSKILLS,
                              appBarForeGroundColor: appBarforegroundColor,
                              checkbox: Checkbox(
                                checkColor: Theme.of(context).primaryColor,
                                fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                                value: isSkillsOne,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSkillsOne = value ?? false;
                                  });
                                },
                              ),
                            ),
                            buildDetailResumeCheckboxCustomNotIconsReadOnly(
                              context: context,
                              detail:isPreViewResumeResponse
                                  .body?.data?.skill?[1].skill ??
                                  isSKILLS,
                              appBarForeGroundColor: appBarforegroundColor,
                              checkbox: Checkbox(
                                checkColor: Theme.of(context).primaryColor,
                                fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                                value: isSkillsTwo,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSkillsTwo = value ?? false;
                                  });
                                },
                              ),
                            ),
                            buildDetailResumeCheckboxCustomNotIconsReadOnly(
                              context: context,
                              detail:isPreViewResumeResponse
                                  .body?.data?.languge?[0].language ??
                                  isSKILLS,
                              appBarForeGroundColor: appBarforegroundColor,
                              checkbox: Checkbox(
                                checkColor: Theme.of(context).primaryColor,
                                fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                                value: isSkillsThree,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isSkillsThree = value ?? false;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          )),
          floatingActionButton: floatingLineOffice(
            context: context,
            setState,
            "PDF",
            colorOfPdfUsButtonTitle: colorOfPdfUsButtonTitle,
            colorOfPdfUsName: colorOfPdfUsName,
            colorOfPdfUsPosition: colorOfPdfUsPosition,
            colorOfPdfUsExperience: colorOfPdfUsExperience,
            colorOfPdfUsEducations: colorOfPdfUsEducations,
            colorOfPdfUsContact: colorOfPdfUsContact,
            colorOfPdfUsCertifications: colorOfPdfUsCertifications,
            colorOfPdfUsSkills: colorOfPdfUsSkills,
            colorOfPdfUsAbout: colorOfPdfUsAbout,
            colorOfPdfUsText: colorOfPdfUsText,
            colorOfPdfUsTheme: colorOfPdfUsTheme,
            widthSizeCM: widthSizeCM,
            heightSizeCM: heightSizeCM,
            isPreViewResumeResponse: isPreViewResumeResponse,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}

selectColorViewPdf(
  setState, {
  required BuildContext context,
  required PdfColor colorOfPdfUs,
}) {
  return PopupMenuButton(
    child: Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          FontAwesomeIcons.filter,
          size: 20,
          color: Theme.of(context).bottomAppBarColor,
        ),
      ),
    ),
    itemBuilder: (context) {
      return List.generate(colorOfPdfList.length ?? 0, (index) {
        return PopupMenuItem(
          value: colorOfPdfList[index].pdfOfColor,
          child: Text(
            "${colorOfPdfList[index].nameColor}",
            style: TextStyle(
                fontSize: 20,
                color: (colorOfPdfList[index].materialColor == Colors.black) ||
                        (colorOfPdfList[index].materialColor == Colors.white)
                    ? Theme.of(context).appBarTheme.foregroundColor
                    : colorOfPdfList[index].materialColor),
          ),
        );
      });
    },
    onSelected: (value) {
      colorOfPdfUs = colorOfPdfList[6].pdfOfColor;
      setState(() {});
    },
  );
}

floatingLineOffice(
  setState,
  String pdf, {
  required BuildContext context,
  required PdfColor colorOfPdfUsTheme,
  required PdfColor colorOfPdfUsButtonTitle,
  required PdfColor colorOfPdfUsName,
  required PdfColor colorOfPdfUsPosition,
  required PdfColor colorOfPdfUsExperience,
  required PdfColor colorOfPdfUsEducations,
  required PdfColor colorOfPdfUsContact,
  required PdfColor colorOfPdfUsCertifications,
  required PdfColor colorOfPdfUsSkills,
  required PdfColor colorOfPdfUsAbout,
  required PdfColor colorOfPdfUsText,
  required double widthSizeCM,
  required double heightSizeCM,
  required isPreViewResumeResponse,
}) {
  return FloatingActionButton.extended(
    backgroundColor:
        Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyAppResume(
                    colorOfPdfUsButtonTitle: colorOfPdfUsButtonTitle,
                    colorOfPdfUsName: colorOfPdfUsName,
                    colorOfPdfUsPosition: colorOfPdfUsPosition,
                    colorOfPdfUsExperience: colorOfPdfUsExperience,
                    colorOfPdfUsEducations: colorOfPdfUsEducations,
                    colorOfPdfUsContact: colorOfPdfUsContact,
                    colorOfPdfUsCertifications: colorOfPdfUsCertifications,
                    colorOfPdfUsSkills: colorOfPdfUsSkills,
                    colorOfPdfUsAbout: colorOfPdfUsAbout,
                    colorOfPdfUsText: colorOfPdfUsText,
                    colorOfPdfUsTheme: colorOfPdfUsTheme,
                    widthSizeCM: widthSizeCM,
                    heightSizeCM: heightSizeCM,
                    isPreViewResumeResponse: isPreViewResumeResponse,
                  )));
    },
    icon: Icon(
      FontAwesomeIcons.bars,
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

class SelectSizeImageResume {
  double sizePhoto;
  double widthSizeCM;
  double heightSizeCM;

  SelectSizeImageResume(
    this.sizePhoto,
    this.widthSizeCM,
    this.heightSizeCM,
  );
}

List<SelectSizeImageResume> sizeImageResume = [
  //(sizePhoto,widthSizeCM,heightSizeCM)
  SelectSizeImageResume(1, 2.50, 3.25),
  SelectSizeImageResume(1.5, 3.00, 4.00),
  SelectSizeImageResume(2, 4.00, 5.23),
  SelectSizeImageResume(2.5, 4.75, 6.25),
  SelectSizeImageResume(3, 6.15, 7.80),
];
buildDetailResumeCustomNotIconsReadOnly(
    {required BuildContext context,
    required String detail,
    required Color appBarForeGroundColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      color: Theme.of(context).primaryColor == Colors.black
          ? Color(0xFF1F222A)
          : Colors.transparent.withOpacity(0.03),
    ),
    child: Text(
      detail,
      style: TextStyle(
        fontSize: 12,
        color: appBarForeGroundColor, // height: 2.0,
      ),
    ),
  );
}

buildDetailResumeCheckboxCustomNotIconsReadOnly(
    {required BuildContext context,
    required String detail,
    required Color appBarForeGroundColor,
    required Checkbox checkbox}) {
  return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 5,bottom: 5),
      padding: const EdgeInsets.only(left: 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Theme.of(context).primaryColor == Colors.black
            ? Color(0xFF1F222A)
            : Colors.transparent.withOpacity(0.03),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkbox,
          Expanded(
              child: Text(
                detail,
                style: TextStyle(
                  fontSize: 12,
                  color: appBarForeGroundColor, // height: 2.0,
                ),
              )),

        ],
      ));
}
