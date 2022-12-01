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
  PdfColor colorOfPdfUs = colorOfPdfList[0].pdfOfColor;
  TextEditingController resumeAbout = TextEditingController();
  TextEditingController resumeName = TextEditingController();
  TextEditingController resumePositions = TextEditingController();
  TextEditingController resume = TextEditingController();
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).bottomAppBarColor ;
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
                  child:SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      scrollDirection: Axis.vertical,
                      child:Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pictuce",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).appBarTheme.foregroundColor),
                          ),
                          Container(
                              padding: EdgeInsets.all(20), //padding of outer Container
                              child: DottedBorder(
                                color: Theme.of(context).appBarTheme.foregroundColor ??
                                    Colors.grey, //color of dotted/dash line
                                strokeWidth: 3, //thickness of dash/dots
                                dashPattern: [10, 6],
                                //dash patterns, 10 is dash width, 6 is space width
                                child: Container(
                                  //inner container
                                    height: 80, //height of inner container
                                    width: double
                                        .infinity -50, //width to 100% match to parent container.
                                    color:
                                    colorBoxDotted //background color of inner container
                                ),
                              )),
                          Padding(padding: EdgeInsets.only(left: 15),child: Text(
                            "The aspect ratio must be 1:1 \n"
                                "The file size does not exceed 5 MB \n",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).appBarTheme.foregroundColor),
                          ),),
                          const Divider(
                            color: colorBoxDotted,
                            height: 5,
                            thickness: 5,
                            indent: 0,
                            endIndent: 0,
                          ),
                          Text(
                            isAboutMe,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).appBarTheme.foregroundColor),
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
                          Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).appBarTheme.foregroundColor),
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
                          Text(
                            "Positions",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).appBarTheme.foregroundColor),
                          ),BuildTextformfieldUnlimitCustomNotIcons(
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
                              Text(
                                "Experience",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).appBarTheme.foregroundColor),
                              ),
                              Checkbox(
                                checkColor: Theme.of(context).primaryColor ,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: isChecked1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked1 = value ??false ;
                                  });
                                },
                              ),


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
                            hintLabel: "ประสบการณ์การทำงานที่ 1",
                            textInputType: TextInputType.text,
                          ),

                          BuildTextformfieldUnlimitCustomNotIcons(
                            textEditingController: resumeName,
                            onChanged: (value) {
                              resumeName.text = value;
                              if (kDebugMode) {
                                print(resumeName.text);
                              }
                            },
                            hintLabel: "ประสบการณ์การทำงาน ที่ 2",
                            textInputType: TextInputType.text,
                          ),

                          BuildTextformfieldUnlimitCustomNotIcons(
                            textEditingController: resumeName,
                            onChanged: (value) {
                              resumeName.text = value;
                              if (kDebugMode) {
                                print(resumeName.text);
                              }
                            },
                            hintLabel: "ประสบการณ์การทำงาน ที่3 ",
                            textInputType: TextInputType.text,
                          ),


                          Row(
                            children: [
                              Text(
                                isCertifications,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).appBarTheme.foregroundColor),
                              ),
                              Checkbox(
                                checkColor: Theme.of(context).primaryColor ,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: isChecked3,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked3 = value ??false ;
                                  });
                                },
                              ),


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
                            hintLabel: "ใบรับรองที่ได้รับ 1",
                            textInputType: TextInputType.text,
                          ),
                          BuildTextformfieldUnlimitCustomNotIcons(
                            textEditingController: resumeName,
                            onChanged: (value) {
                              resumeName.text = value;
                              if (kDebugMode) {
                                print(resumeName.text);
                              }
                            },
                            hintLabel: "ใบรับรองที่ได้รับ 2 ",
                            textInputType: TextInputType.text,
                          ),
                          BuildTextformfieldUnlimitCustomNotIcons(
                            textEditingController: resumeName,
                            onChanged: (value) {
                              resumeName.text = value;
                              if (kDebugMode) {
                                print(resumeName.text);
                              }
                            },
                            hintLabel: "ใบรับรองที่ได้รับ 3 ",
                            textInputType: TextInputType.text,
                          ),
                          Row(
                            children: [
                              Text(isSKILLS,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).appBarTheme.foregroundColor),
                              ),

                              Checkbox(
                                checkColor: Theme.of(context).primaryColor ,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: isChecked4,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked4 = value ??false ;
                                  });
                                },
                              ),


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
                            hintLabel: "ทักษะที่ 1 ",
                            textInputType: TextInputType.text,
                          ),
                          BuildTextformfieldUnlimitCustomNotIcons(
                            textEditingController: resumeName,
                            onChanged: (value) {
                              resumeName.text = value;
                              if (kDebugMode) {
                                print(resumeName.text);
                              }
                            },
                            hintLabel: "ทักษะที่ 2 ",
                            textInputType: TextInputType.text,
                          ),
                          BuildTextformfieldUnlimitCustomNotIcons(
                            textEditingController: resumeName,
                            onChanged: (value) {
                              resumeName.text = value;
                              if (kDebugMode) {
                                print(resumeName.text);
                              }
                            },
                            hintLabel: "ทักษะที่ 3 ",
                            textInputType: TextInputType.text,
                          ),
                        ],
                      )),),
              ),
              Container(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        child: Row(
                          children: List.generate(
                              colorOfPdfList.length ?? 0,
                                  (index) => Column(
                                children: [
                                  SizedBox(
                                    child: InkWell(
                                        onTap: () {
                                          // widget.callbackFromOptionSearch(index);
                                          // hintLabelSearchNiSit =  widget.screenMoreBoardStudentListResponse?.body?.options?[index].title.toString();
                                          // Navigator.pop(context);
                                          colorOfPdfUs =
                                              colorOfPdfList[index]
                                                  .pdfOfColor;
                                          setState(() {});
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: ShapeDecoration(
                                                      color: (colorOfPdfList[index]
                                                          .materialColor ==
                                                          Colors
                                                              .black) ||
                                                          (colorOfPdfList[index]
                                                              .materialColor ==
                                                              Colors
                                                                  .white)
                                                          ? Theme.of(
                                                          context)
                                                          .appBarTheme
                                                          .foregroundColor
                                                          : colorOfPdfList[
                                                      index]
                                                          .materialColor,
                                                      shape:
                                                      const CircleBorder())),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  "${colorOfPdfList[index].nameColor}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: (colorOfPdfList[index]
                                                          .materialColor ==
                                                          Colors
                                                              .black) ||
                                                          (colorOfPdfList[index]
                                                              .materialColor ==
                                                              Colors
                                                                  .white)
                                                          ? Theme.of(
                                                          context)
                                                          .appBarTheme
                                                          .foregroundColor
                                                          : colorOfPdfList[
                                                      index]
                                                          .materialColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  index < 0
                                      ? const SizedBox()
                                      : const Divider(
                                    color: Colors.grey,
                                    height: 5,
                                    thickness: 1,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                ],
                              )),
                        ),
                      ),
                      // Column(
                      //   children: List.generate(
                      //       colorOfPdfList.length ?? 0,
                      //       (index) => Column(
                      //             children: [
                      //               Container(
                      //                 width: 300,
                      //                 child: InkWell(
                      //                     onTap: () {
                      //                       // widget.callbackFromOptionSearch(index);
                      //                       // hintLabelSearchNiSit =  widget.screenMoreBoardStudentListResponse?.body?.options?[index].title.toString();
                      //                       // Navigator.pop(context);
                      //                       colorOfPdfUs =
                      //                           colorOfPdfList[index]
                      //                               .pdfOfColor;
                      //                       setState(() {});
                      //                     },
                      //                     child: Padding(
                      //                       padding: EdgeInsets.all(10),
                      //                       child: Table(
                      //                         border: TableBorder.symmetric(
                      //                             outside: const BorderSide(
                      //                                 width: 2,
                      //                                 color: Colors
                      //                                     .transparent)),
                      //                         columnWidths: {
                      //                           0: FractionColumnWidth(1)
                      //                         },
                      //                         defaultVerticalAlignment:
                      //                             TableCellVerticalAlignment
                      //                                 .top,
                      //                         children: [
                      //                           TableRow(children: [
                      //                             Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment
                      //                                       .start,
                      //                               children: [
                      //                                 Container(
                      //                                     width: 20,
                      //                                     height: 20,
                      //                                     decoration: ShapeDecoration(
                      //                                         color: colorOfPdfList[
                      //                                                 index]
                      //                                             .materialColor,
                      //                                         shape:
                      //                                             CircleBorder())),
                      //                                 Padding(
                      //                                   padding:
                      //                                       const EdgeInsets
                      //                                               .only(
                      //                                           left: 15),
                      //                                   child: Text(
                      //                                     "${colorOfPdfList[index].nameColor}",
                      //                                     style: TextStyle(
                      //                                         fontSize: 20,
                      //                                         color: colorOfPdfList[
                      //                                                 index]
                      //                                             .materialColor),
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ])
                      //                         ],
                      //                       ),
                      //                     )),
                      //               ),
                      //               index < 0
                      //                   ? const SizedBox()
                      //                   : const Divider(
                      //                       color: Colors.grey,
                      //                       height: 5,
                      //                       thickness: 1,
                      //                       indent: 0,
                      //                       endIndent: 0,
                      //                     ),
                      //             ],
                      //           )),
                      // )
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Center(
                  child: ButtonIconsCustom(
                    // label: screenHomeResponse?.body?.screenInfo?.btnadd ?? homeTextAdd,
                    label: "PDF",
                    buttonIcons: Icon(
                      FontAwesomeIcons.bars,
                      color: Theme.of(context).iconTheme.color,
                      size: 20.0,
                    ),
                    colortext: Theme.of(context).bottomAppBarColor,
                    colorbutton: Theme.of(context).scaffoldBackgroundColor,
                    sizetext: 14,
                    colorborder: Theme.of(context).scaffoldBackgroundColor,
                    sizeborder: 3,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyAppResume(colorOfPdfUs: colorOfPdfUs)));
                    },
                  ),
                ),
              ),
              //Teacher role button
            ],
          ),
        )),
      ),
    );
  }
}
