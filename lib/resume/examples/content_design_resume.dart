import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';

import '../../customs/button/button_custom.dart';
import '../../customs/color/pdf_color_const.dart';
import '../../customs/color/pdf_color_const.dart';
import '../../customs/size/size.dart';
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
   PdfColor colorOfPdfUs =colorOfPdfList[0].pdfOfColor ;
  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
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
                child: Text( "Content Design Resume",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).appBarTheme.foregroundColor))),
           ),
        body: SafeArea(
          child: Column(
            children: [
               Expanded(child:
              Container(
                child: SingleChildScrollView(
                    padding:
                    const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                          colorOfPdfList.length??0,
                              (index) => Column(
                            children: [

                              InkWell(
                                  onTap: () {
                                    // widget.callbackFromOptionSearch(index);
                                    // hintLabelSearchNiSit =  widget.screenMoreBoardStudentListResponse?.body?.options?[index].title.toString();
                                    // Navigator.pop(context);
                                    colorOfPdfUs =colorOfPdfList[index].pdfOfColor;
                                    setState(() {});
                                  },
                                  child:Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Table(
                                      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
                                      columnWidths: {0: FractionColumnWidth(1)},
                                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                      children: [
                                        TableRow(children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: ShapeDecoration(
                                                      color: colorOfPdfList[index].materialColor,
                                                      shape: CircleBorder()
                                                  )
                                              ), Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Text("${colorOfPdfList[index].nameColor}",style: TextStyle(fontSize:  20,color: colorOfPdfList[index].materialColor),),),
                                            ],
                                          ),
                                        ])
                                      ],
                                    ),
                                  )
                              ),
                              index  <0
                                  ? const SizedBox()
                                  : const Divider(
                                color: Colors.grey,
                                height: 5,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),

                            ],
                          )
                      ),
                    )),
              ),
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
                    colorbutton:
                    Theme.of(context).scaffoldBackgroundColor,
                    sizetext: 14,
                    colorborder:
                    Theme.of(context).scaffoldBackgroundColor,
                    sizeborder: 3,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                               MyAppResume( colorOfPdfUs:colorOfPdfUs)));
                    },
                  ),
                ),
              ),
              //Teacher role button
            ],
          ),
        ),
      ),
    );
  }
  }
