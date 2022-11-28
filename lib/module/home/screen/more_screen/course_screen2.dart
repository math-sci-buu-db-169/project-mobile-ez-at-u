import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../customs/color/color_const.dart';
import '../../../../customs/size/size.dart';

class CourseScreen extends StatelessWidget {
  final String lukSuitUrl;
  const CourseScreen({Key? key, required this.lukSuitUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CoursePage(lukSuitUrl: lukSuitUrl);
  }
}

class CoursePage extends StatefulWidget {
  final String lukSuitUrl;
  const CoursePage({Key? key, required this.lukSuitUrl}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    List<String> optionsUndergraduateProgram = [
      "หลักสูตร วท.บ. (คณิตศาสตร์)",
      "หลักสูตร วท.บ. (สถิติ)",
      "หลักสูตร วท.บ. (วิทยาการข้อมูลและการวิเคราะห์ข้อมูล)"
    ];
    List<String> optionsGraduateProgram = ["หลักสูตร วท. ม. (คณิตศาสตรศึกษา)"];

    List<String> linkUndergraduateProgram = [
      "https://sites.google.com/go.buu.ac.th/bscmathematics",
      "https://sites.google.com/go.buu.ac.th/bscstatistics/home",
      "https://sites.google.com/go.buu.ac.th/dsdabuu"
    ];
    List<String> linkGraduateProgram = [
      "https://sites.google.com/go.buu.ac.th/msc-math-education/home"
    ];
    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            elevation: 0,
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
            title: Text("ลิงก์ที่เกี่ยวข้อง",
                style: TextStyle(
                  // color: Colors.black,
                  fontSize: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                )),
          ),
          body: SafeArea(
            child: Container(
              color: Colors.transparent.withOpacity(0.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                        child: Text(
                          'หลักสูตรระดับปริญญาตรี',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: sizeTextBig20,
                            color: Theme.of(context).bottomAppBarColor,
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                            optionsUndergraduateProgram.length,
                            (index) => Column(
                                  children: [
                                    index == 0
                                        ? const Divider(
                                            color: Colors.grey,
                                            height: 5,
                                            thickness: 1,
                                            indent: 0,
                                            endIndent: 0,
                                          )
                                        : const Divider(
                                            color: Colors.transparent,
                                            height: 0,
                                            thickness: 1,
                                            indent: 0,
                                            endIndent: 0,
                                          ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            _launchInBrowser(Uri.parse(
                                                linkUndergraduateProgram[
                                                    index]));
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Table(
                                            border: TableBorder.symmetric(
                                                outside: const BorderSide(
                                                    width: 2,
                                                    color: Colors.transparent)),
                                            columnWidths: const {
                                              0: FractionColumnWidth(0.95),
                                              1: FractionColumnWidth(0.05)
                                            },
                                            defaultVerticalAlignment:
                                                TableCellVerticalAlignment.top,
                                            children: [
                                              TableRow(children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0),
                                                  child: Text(
                                                    optionsUndergraduateProgram[
                                                            index]
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize:
                                                          sizeTextSmaller14,
                                                      color: Theme.of(context)
                                                          .bottomAppBarColor,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                  size: 20,
                                                ),
                                              ])
                                            ],
                                          ),
                                        )),
                                    const Divider(
                                      color: Colors.grey,
                                      height: 5,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ],
                                )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                        child: Text(
                          'หลักสูตรระดับบัณฑิตศึกษา',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: sizeTextBig20,
                            color: Theme.of(context).bottomAppBarColor,
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                            optionsGraduateProgram.length,
                            (index) => Column(
                                  children: [
                                    index == 0
                                        ? const Divider(
                                            color: Colors.grey,
                                            height: 5,
                                            thickness: 1,
                                            indent: 0,
                                            endIndent: 0,
                                          )
                                        : const Divider(
                                            color: Colors.transparent,
                                            height: 0,
                                            thickness: 1,
                                            indent: 0,
                                            endIndent: 0,
                                          ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            _launchInBrowser(Uri.parse(
                                                linkGraduateProgram[index]));
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Table(
                                            border: TableBorder.symmetric(
                                                outside: const BorderSide(
                                                    width: 2,
                                                    color: Colors.transparent)),
                                            columnWidths: const {
                                              0: FractionColumnWidth(0.95),
                                              1: FractionColumnWidth(0.05)
                                            },
                                            defaultVerticalAlignment:
                                            TableCellVerticalAlignment.top,
                                            children: [
                                              TableRow(children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 16.0),
                                                  child: Text(
                                                    optionsGraduateProgram[
                                                    index]
                                                        .toString(),
                                                    textAlign:
                                                    TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize:
                                                      sizeTextSmaller14,
                                                      color: Theme.of(
                                                          context)
                                                          .bottomAppBarColor,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                  size: 20,
                                                ),
                                              ])
                                            ],
                                          ),
                                        )),
                                    const Divider(
                                      color: Colors.grey,
                                      height: 5,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ],
                                )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ]),
              ),
            ),
          ),
          floatingActionButton: floatingLineOffice(
              context: context,
              setState,
              _launchInBrowser,
              'หลักสูตรทั้งหมด',
              widget.lukSuitUrl),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}

floatingLineOffice(setState, launchInBrowser, String lukSui, String lukSuitUrl,
    {required BuildContext context}) {
  return FloatingActionButton.extended(
      backgroundColor:
          Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      onPressed: () {
        setState(() {
          launchInBrowser(
              Uri.parse(lukSuitUrl ?? "https://line.me/R/ti/p/%40ffy9217v"));
        });
      },
      icon: Icon(
        FontAwesomeIcons.usersViewfinder,
        color: Theme.of(context).appBarTheme.foregroundColor,
      ),
      label: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Text(lukSui,
            style: TextStyle(
              fontSize: sizeTextSmaller14,
              color: Theme.of(context).appBarTheme.foregroundColor,
            )),
      ));
}
