import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';

import '../../customs/button/button_custom.dart';
import '../../customs/color/color_const.dart';
import '../../customs/color/pdf_color_const.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../customs/message/text_demo_resume.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../app.dart';

class ContentDesignResumeScreen extends StatelessWidget {
  const ContentDesignResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContentDesignResume();
  }
}

class ContentDesignResume extends StatefulWidget {
  const ContentDesignResume({Key? key}) : super(key: key);

  @override
  State<ContentDesignResume> createState() => _ContentDesignResumeState();
}

class _ContentDesignResumeState extends State<ContentDesignResume> {
  TextEditingController resumeAbout = TextEditingController();
  TextEditingController resumeName = TextEditingController();
  TextEditingController resumePositions = TextEditingController();
  TextEditingController resume = TextEditingController();
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
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
  Widget build(BuildContext context) {
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

                                                child: Center(
                                                  child: Image.asset(
                                                    "assets/profile.jpg",
                                                    width: 600.0,
                                                    height: 240.0,
                                                    fit: BoxFit.cover,
                                                  ),
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
                            BuildTextformfieldUnlimitCustomNotIcons(
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

                            BuildTextformfieldUnlimitCustomNotIcons(
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

                            BuildTextformfieldUnlimitCustomNotIcons(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
                            BuildTextformfieldNotlimitCustomCheckbox(
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
