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
import '../../module/home/bloc/resume_bloc.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../../utils/shared_preferences.dart';
import '../app.dart';


class ContentDesignResumeEditScreen extends StatelessWidget {
  const ContentDesignResumeEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ResumeBloc()..add(ResumeInnitEvent()),child:const  ContentDesignEditResume());
  }
}

class ContentDesignEditResume extends StatefulWidget {
  const ContentDesignEditResume({Key? key}) : super(key: key);

  @override
  State<ContentDesignEditResume> createState() => _ContentDesignEditResumeState();
}

class _ContentDesignEditResumeState extends State<ContentDesignEditResume> with ProgressDialog {
  TextEditingController resumeAbout = TextEditingController();
  TextEditingController resumeName = TextEditingController();
  TextEditingController resumePositions = TextEditingController();
  TextEditingController resume = TextEditingController();
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  late double sizePhoto = 1.5 ;
  late  double widthSizeCM  = 3.00;
  late double heightSizeCM  = 4.00;
  late PdfColor colorOfPdfUsTheme = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsTheme = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsButtonTitle = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsButtonTitle = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsName = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsName  = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsPosition = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsPosition = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsExperience= colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsExperience = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsCertifications= colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsCertifications = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsSkills= colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsSkills= colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsAbout = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsAbout = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsText = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsText = colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsEducations = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsEducations= colorOfPdfList[6].materialColor;
  late PdfColor colorOfPdfUsContact = colorOfPdfList[6].pdfOfColor;
  late Color materialColorOfPdfUsContact = colorOfPdfList[6].materialColor;

  File? image;
  String? base64img;
  String phimg = "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAAXNSR0IArs4c6QAAA1lJREFUeF7t3GtyqkAQBWBchmzD/e8Al6Euw1tTKXONAvPqxzlD8ydUAtM954PBoiqelmV5ns/nKTb/BB6Px3S63W7PtHO5XPw7OnAH1+t1muf5ByTtpF8Eis8V8cr+9w5JIGkLFHuQ98y/QALFFuTzBlgFCRQblLXVaBMkUHRRth4NuyCBooOy95zOggSKLEruQ1MRSKDIoOQwUpVikEDpQynBqAYJlDaUUowmkECpQ6nBaAYJlDKUWowukEDZR2nB6AYJlHWUVgwRkED5i9KDIQYSKD8ovRiiIFINlT0u8Y6SwBAHOSqKFIYKyNFQJDHUQI6CIo2hCjI6igaGOsioKFoYJiCjoWhimIGMgqKNYQrCjmKBYQ7CimKF4QLChmKJ4QbCgmKN4QqCjuKB4Q6CiuKFAQGChuKJAQOCguKNAQXijYKAAQfihYKCAQlijYKEAQtihYKGAQ2ijYKIAQ+ihYKKQQEijYKMQQMihYKOQQXSi8KAQQfSisKCQQlSi8KEQQtSisKGQQ2SQ2HEoAfZQmHFGALkE4UZYxiQF0r6yf71UlX/p54mjLqlOyNAQHTel6lYspxR1gCYUaiXrL3gWVFoQUoCLznG+Qb/Kk8JUhN0zbEIOHQgLQG3nOOFQwXSE2zPuZY4NCASgUqMoY1DASIZpORYGjjwIBoBaowphQMNohmc5tg9OLAgFoFZ1KjFgQSxDMqyVgkOHIhHQB41t3CgQDyD8az9jgMDghAIQg8QIAhBvK5S717cQbwDWFvLPXtyBfGceO4Tj1dvbiBeE85BvP/do0cXEI+J1kB4opiDMGF4POhNQRgxrFHMQJgxLFFMQEbAsEJRBxkJwwJFFWREDG0UNZCRMTRRVECOgKGFIg5yJAwNFFGQI2JIo4iBHBlDEkUEJDD+v/3qzaIbpLeB1pd+yOf1ZNIF0lMYOVCJ3lqzaQZpLSgxWZYxWjJqAmkpxBKidJ+1WVWD1BaQniDjeDWZVYHUDMwYnGbPpdkVg5QOqDkp9rFLMiwCKRmIPSyr/nNZZkFyA1hNZKQ6e5nuggSG3mWwle0mSGDoYey9+1oFCQx9jC2UL5DAsMNYQ/kDEhj2GJ8ovyBph/3Lv/zilKmcboh5nqfTsizPtBObfwL3+336B07+3Sny7gNQAAAAAElFTkSuQmCC";

  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String isPhotoResume;

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
  @override
  void initState() {
    _isPhotoResume();
    _isSessionUnauthorized();

    super.initState();
  }
  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    isPhotoResume = prefs.getString('ResumePhoto') ?? '';
    setState(() {});
  }

  Future<void> _isPhotoResume() async {
    prefs = await SharedPreferences.getInstance();
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
        if (state is ResumeLoading) {
          showProgressDialog(context);
        }
        if (state is ResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ResumeError) {
          if (state.message.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(context, textSessionExpired, textSubSessionExpired, _buttonOk, onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
            });
          } else {
            dialogOneLineOneBtn(context, '${state.message}\n ', _buttonOk, onClickBtn: () {
              Navigator.of(context).pop();
            });
          }
        }
      },
      builder: (context, state) {
        if (state is ResumeInitialState  || state is ChangPhotoResumeSuccess ) {

          if (state is ChangPhotoResumeSuccess ){
            isPhotoResume = state.base64img ;
          }
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
                      child: Text("Content Design Resume",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).appBarTheme.foregroundColor))),

                    actions: [
                      IconButton(onPressed:  () =>
                          context
                              .read<ResumeBloc>()
                              .add(ChangePhotoRequest()), icon:  Icon(
                      FontAwesomeIcons.filter,
                      size: 20,
                      color: Theme.of(context).bottomAppBarColor,
                    ),)
                    ]
                  // actions: [
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
                                        children: [

                                GestureDetector(
                                    onTap: () async {
                                      int? value = await showMenu<int>(
                                          context: context,
                                          position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                          items: List.generate(
                                              colorOfPdfList.length ?? 0, (index) {
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
                                              onTap:(){
                                                setState(() {
                                                  materialColorOfPdfUsTheme = colorOfPdfList[index].materialColor;
                                                  // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                  //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                  // }
                                                  colorOfPdfUsTheme = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(

                                                color:
                                                (materialColorOfPdfUsTheme == Colors.black && materialColorOfPdfUsTheme == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsTheme == Colors.white && materialColorOfPdfUsTheme == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsTheme
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
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
                                      Text(
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
                                                print("Container clicked");
                                                context
                                                    .read<ResumeBloc>()
                                                    .add(ChangePhotoRequest());
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(20),
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

                                                          child:
                                                          Center(
                                                            child:
                                                            isPhotoResume ==''?Image.asset(
                                                              "assets/profile.jpg",
                                                              width: 600.0,
                                                              height: 240.0,
                                                              fit: BoxFit.cover,
                                                            ):
                                                            Image.memory((base64Decode(base64.normalize(
                                                                isPhotoResume ))),)
                                                          ), //background color of inner container
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 30,
                                                    top: 25,
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 15),
                                                child: Text(
                                                  "The aspect ratio must be 1:1 \n"
                                                      "The file size does not exceed 5 MB \n",
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
                                                    color:
                                                    Theme.of(context).iconTheme.color,
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
                                                      "The aspect ratio must be 1:1 \n"
                                                          "The file size does not exceed 5 MB \n",
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
                                                  Icon(
                                                    FontAwesomeIcons.square,
                                                    color:
                                                    Theme.of(context).iconTheme.color,
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
                                                      "The aspect ratio must be 1:1 \n"
                                                          "The file size does not exceed 5 MB \n",
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
                                                   position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                   items: List.generate(
                                                       sizeImageResume.length ?? 0, (index) {
                                                     return PopupMenuItem(
                                                       value: index,
                                                       child: Text(
                                                         "${sizeImageResume[index].sizePhoto} N' ${sizeImageResume[index].widthSizeCM} x ${sizeImageResume[index].heightSizeCM} cm",
                                                         style: TextStyle(
                                                             fontSize: 20,
                                                             color:Theme.of(context).appBarTheme.foregroundColor
                                                         ),
                                                       ),
                                                       onTap:(){
                                                         setState(() {
                                                           sizePhoto = sizeImageResume[index].sizePhoto;
                                                          widthSizeCM  = sizeImageResume[index].widthSizeCM;
                                                           heightSizeCM  = sizeImageResume[index].heightSizeCM;




                                                         });

                                                       },
                                                     );
                                                   }));

                                             },
                                                child:
                                                Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                Text(
                                                "Select",
                                                style: TextStyle(
                                                    decoration: TextDecoration.underline,
                                                    decorationThickness: 2,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context)
                                                        .appBarTheme
                                                        .foregroundColor),
                                              ),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 5),
                                                    child: Text(
                                                      "${sizePhoto == 1.5 ?"Default":''} size  : $sizePhoto N'' $widthSizeCM x $heightSizeCM (w x h) Cm  ",
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
                                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                    items: List.generate(
                                                        colorOfPdfList.length ?? 0, (index) {
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
                                                        onTap:(){
                                                          setState(() {
                                                            materialColorOfPdfUsAbout = colorOfPdfList[index].materialColor;
                                                            // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                            //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                            // }
                                                            colorOfPdfUsAbout = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(

                                                color:
                                                (materialColorOfPdfUsAbout == Colors.black && materialColorOfPdfUsAbout == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsAbout == Colors.white && materialColorOfPdfUsAbout == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsAbout
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
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
                                      BuildTextFormFieldUnLimitCustomNotIconsReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "รายละเอียดเกี่ยวกับฉัน",
                                        textInputType: TextInputType.text,
                                      ),
                                      Row(
                                        children: [

                                          GestureDetector(
                                              onTap: () async {
                                                int? value = await showMenu<int>(
                                                    context: context,
                                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                    items: List.generate(
                                                        colorOfPdfList.length ?? 0, (index) {
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
                                                        onTap:(){
                                                          setState(() {
                                                            materialColorOfPdfUsName = colorOfPdfList[index].materialColor;
                                                            // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                            //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                            // }
                                                            colorOfPdfUsName = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(

                                                color:
                                                (materialColorOfPdfUsName == Colors.black && materialColorOfPdfUsName == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsName == Colors.white && materialColorOfPdfUsName == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsName
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
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

                                      BuildTextFormFieldUnLimitCustomNotIconsReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ชื่อนามสกุล",
                                        textInputType: TextInputType.text,
                                      ),
                                      Row(
                                        children: [

                                          GestureDetector(
                                              onTap: () async {
                                                int? value = await showMenu<int>(
                                                    context: context,
                                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                    items: List.generate(
                                                        colorOfPdfList.length ?? 0, (index) {
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
                                                        onTap:(){
                                                          setState(() {
                                                            materialColorOfPdfUsPosition = colorOfPdfList[index].materialColor;
                                                            // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                            //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                            // }
                                                            colorOfPdfUsPosition = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(

                                                color:
                                                (materialColorOfPdfUsPosition == Colors.black && materialColorOfPdfUsPosition == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsPosition == Colors.white && materialColorOfPdfUsPosition == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsPosition
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
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

                                      BuildTextFormFieldUnLimitCustomNotIconsReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ต่ำแหน่งงาน",
                                        textInputType: TextInputType.text,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () async {
                                                int? value = await showMenu<int>(
                                                    context: context,
                                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                    items: List.generate(
                                                        colorOfPdfList.length ?? 0, (index) {
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
                                                        onTap:(){
                                                          setState(() {
                                                            materialColorOfPdfUsEducations = colorOfPdfList[index].materialColor;
                                                            // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                            //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                            // }
                                                            colorOfPdfUsEducations = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(

                                                color:
                                                (materialColorOfPdfUsEducations == Colors.black && materialColorOfPdfUsEducations == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsEducations == Colors.white && materialColorOfPdfUsEducations == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsEducations
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child:
                                            Text(
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
                                            value: isChecked1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked1 = value ?? false;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "Educations 1",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "Educations ที่ 2",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ), Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              int? value = await showMenu<int>(
                                                  context: context,
                                                  position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                  items: List.generate(
                                                      colorOfPdfList.length ?? 0, (index) {
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
                                                      onTap:(){
                                                        setState(() {
                                                          materialColorOfPdfUsContact = colorOfPdfList[index].materialColor;
                                                          // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                          //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                          // }
                                                          colorOfPdfUsContact = colorOfPdfList[index].pdfOfColor;




                                                        });

                                                      },
                                                    );
                                                  }));

                                            },
                                            child:Container(

                                                color:
                                                (materialColorOfPdfUsContact== Colors.black && materialColorOfPdfUsContact== Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsContact== Colors.white && materialColorOfPdfUsContact == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsContact
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child:
                                            Text(
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
                                            value: isChecked1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked1 = value ?? false;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "Contact 1",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "Contact ที่ 2",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "Contact ที่ 3",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "Contact ที่ 4",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "Contact ที่ 5",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () async {
                                                int? value = await showMenu<int>(
                                                    context: context,
                                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                    items: List.generate(
                                                        colorOfPdfList.length ?? 0, (index) {
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
                                                        onTap:(){
                                                          setState(() {
                                                            materialColorOfPdfUsExperience = colorOfPdfList[index].materialColor;
                                                            // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                            //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                            // }
                                                            colorOfPdfUsExperience = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(

                                                color:
                                                (materialColorOfPdfUsExperience == Colors.black && materialColorOfPdfUsExperience == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsExperience == Colors.white && materialColorOfPdfUsExperience == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsExperience
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child:
                                            Text(
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
                                            fillColor: MaterialStateProperty.resolveWith(
                                                getColor),
                                            value: isChecked1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked1 = value ?? false;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ประสบการณ์การทำงานที่ 1",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ประสบการณ์การทำงาน ที่ 2",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ประสบการณ์การทำงาน ที่3 ",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () async {
                                                int? value = await showMenu<int>(
                                                    context: context,
                                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                    items: List.generate(
                                                        colorOfPdfList.length ?? 0, (index) {
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
                                                        onTap:(){
                                                          setState(() {
                                                            materialColorOfPdfUsCertifications = colorOfPdfList[index].materialColor;
                                                            // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                            //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                            // }
                                                            colorOfPdfUsCertifications = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(

                                                color:
                                                (materialColorOfPdfUsCertifications == Colors.black && materialColorOfPdfUsCertifications == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsCertifications == Colors.white && materialColorOfPdfUsCertifications == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsCertifications
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child:
                                            Text(
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
                                            fillColor: MaterialStateProperty.resolveWith(
                                                getColor),
                                            value: isChecked3,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked3 = value ?? false;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ใบรับรองที่ได้รับ 1",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ใบรับรองที่ได้รับ 2 ",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ใบรับรองที่ได้รับ 3 ",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                              onTap: () async {
                                                int? value = await showMenu<int>(
                                                    context: context,
                                                    position: RelativeRect.fromLTRB(0, 0, 0, 0),
                                                    items: List.generate(
                                                        colorOfPdfList.length ?? 0, (index) {
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
                                                        onTap:(){
                                                          setState(() {
                                                            materialColorOfPdfUsSkills = colorOfPdfList[index].materialColor;
                                                            // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                                                            //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                                                            // }
                                                            colorOfPdfUsSkills = colorOfPdfList[index].pdfOfColor;




                                                          });

                                                        },
                                                      );
                                                    }));

                                              },
                                              child:Container(
                                                color:
                                                (materialColorOfPdfUsSkills == Colors.black && materialColorOfPdfUsSkills == Colors.black ) ?
                                                Colors.white :
                                                (materialColorOfPdfUsSkills == Colors.white && materialColorOfPdfUsSkills == Colors.white ) ?
                                                Colors.black : Theme.of(context).scaffoldBackgroundColor

                                                ,
                                                child:  Icon(
                                                    FontAwesomeIcons.droplet,
                                                    size: 20,
                                                    color: materialColorOfPdfUsSkills
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child:
                                            Text(
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
                                            value: isChecked4,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked4 = value ?? false;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ทักษะที่ 1 ",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ทักษะที่ 2 ",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),
                                      BuildTextFormFieldNotlimitCustomCheckboxReadOnly(
                                        textEditingController: resumeName,
                                        onChanged: (value) {
                                          resumeName.text = value;
                                          if (kDebugMode) {
                                            print(resumeName.text);
                                          }
                                        },
                                        hintLabel: "ทักษะที่ 3 ",
                                        textInputType: TextInputType.text,
                                        isChecked: isChecked1,
                                        isCheckedSetState: (bool? value) {
                                          setState(() {
                                            isChecked1 = value ?? false;
                                          });
                                        },
                                      ),


                                      // Container(
                                      //   child: SingleChildScrollView(
                                      //       padding:
                                      //           const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      //       scrollDirection: Axis.vertical,
                                      //       child: Column(children: [
                                      //         SingleChildScrollView(
                                      //           padding:
                                      //               const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      //           scrollDirection: Axis.horizontal,
                                      //           physics: const ClampingScrollPhysics(),
                                      //           child: Row(
                                      //             children: List.generate(
                                      //                 colorOfPdfList.length ?? 0,
                                      //                 (index) => Column(
                                      //                       children: [
                                      //                         SizedBox(
                                      //                           child: InkWell(
                                      //                               onTap: () {
                                      //                                 // widget.callbackFromOptionSearch(index);
                                      //                                 // hintLabelSearchNiSit =  widget.screenMoreBoardStudentListResponse?.body?.options?[index].title.toString();
                                      //                                 // Navigator.pop(context);
                                      //                                 colorOfPdfUsTheme =
                                      //                                     colorOfPdfList[
                                      //                                             index]
                                      //                                         .pdfOfColor;
                                      //                                 setState(() {});
                                      //                               },
                                      //                               child: Padding(
                                      //                                 padding:
                                      //                                     EdgeInsets.all(
                                      //                                         10),
                                      //                                 child: Row(
                                      //                                   mainAxisAlignment:
                                      //                                       MainAxisAlignment
                                      //                                           .start,
                                      //                                   children: [
                                      //                                     Container(
                                      //                                         width: 20,
                                      //                                         height: 20,
                                      //                                         decoration: ShapeDecoration(
                                      //                                             color: (colorOfPdfList[index].materialColor == Colors.black) || (colorOfPdfList[index].materialColor == Colors.white)
                                      //                                                 ? Theme.of(context)
                                      //                                                     .appBarTheme
                                      //                                                     .foregroundColor
                                      //                                                 : colorOfPdfList[index]
                                      //                                                     .materialColor,
                                      //                                             shape:
                                      //                                                 const CircleBorder())),
                                      //                                     Padding(
                                      //                                       padding: const EdgeInsets
                                      //                                               .only(
                                      //                                           left: 15),
                                      //                                       child: Text(
                                      //                                         "${colorOfPdfList[index].nameColor}",
                                      //                                         style: TextStyle(
                                      //                                             fontSize:
                                      //                                                 20,
                                      //                                             color: (colorOfPdfList[index].materialColor == Colors.black) ||
                                      //                                                     (colorOfPdfList[index].materialColor == Colors.white)
                                      //                                                 ? Theme.of(context).appBarTheme.foregroundColor
                                      //                                                 : colorOfPdfList[index].materialColor),
                                      //                                       ),
                                      //                                     ),
                                      //                                   ],
                                      //                                 ),
                                      //                               )),
                                      //                         ),
                                      //                         index < 0
                                      //                             ? const SizedBox()
                                      //                             : const Divider(
                                      //                                 color: Colors.grey,
                                      //                                 height: 5,
                                      //                                 thickness: 1,
                                      //                                 indent: 0,
                                      //                                 endIndent: 0,
                                      //                               ),
                                      //                       ],
                                      //                     )),
                                      //           ),
                                      //         ),
                                      //
                                      //       ])),
                                      // ),
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
                  colorOfPdfUsTheme: colorOfPdfUsTheme,),
                floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
              ));
        }else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is ChangPhotoResumeSuccess ||state is ResumeInitialState ;
      },
    );
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
      required   PdfColor colorOfPdfUsButtonTitle,
      required   PdfColor colorOfPdfUsName,
      required  PdfColor colorOfPdfUsPosition,
      required  PdfColor colorOfPdfUsExperience,
      required  PdfColor colorOfPdfUsEducations,
      required PdfColor colorOfPdfUsContact,
      required PdfColor colorOfPdfUsCertifications,
      required PdfColor colorOfPdfUsSkills,
      required PdfColor colorOfPdfUsAbout,
      required PdfColor colorOfPdfUsText
    }) {
  return FloatingActionButton.extended(
    backgroundColor:
    Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ContentDesignResumeEditScreen(
                // colorOfPdfUsButtonTitle: colorOfPdfUsButtonTitle,
                // colorOfPdfUsName: colorOfPdfUsName,
                // colorOfPdfUsPosition: colorOfPdfUsPosition,
                // colorOfPdfUsExperience: colorOfPdfUsExperience,
                // colorOfPdfUsEducations: colorOfPdfUsEducations,
                // colorOfPdfUsContact: colorOfPdfUsContact,
                // colorOfPdfUsCertifications: colorOfPdfUsCertifications,
                // colorOfPdfUsSkills: colorOfPdfUsSkills,
                // colorOfPdfUsAbout: colorOfPdfUsAbout,
                // colorOfPdfUsText: colorOfPdfUsText,
                // colorOfPdfUsTheme: colorOfPdfUsTheme,


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
  double sizePhoto  ;
  double widthSizeCM ;
  double heightSizeCM  ;


  SelectSizeImageResume(
      this.sizePhoto,
      this.widthSizeCM,
      this.heightSizeCM,

      );
}
List<SelectSizeImageResume> sizeImageResume = [
  //(sizePhoto,widthSizeCM,heightSizeCM)
  SelectSizeImageResume(1, 2.50,3.25),
  SelectSizeImageResume(1.5, 3.00,4.00),
  SelectSizeImageResume(2, 4.00,5.23),
  SelectSizeImageResume(2.5, 4.75,6.25),
  SelectSizeImageResume(3, 6.15,7.80),
];
