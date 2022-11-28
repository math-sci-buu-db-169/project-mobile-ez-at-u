import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../customs/color/color_const.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../login/screen/login_screen/login_screen.dart';
import '../../bloc/more_bloc/more_bloc.dart';
import '../../model/response/more_response/courses_screen_response.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MoreBloc()..add(MoreCoursesScreenEvent()), child: const CoursePage());
  }
}

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key,}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage>  with ProgressDialog {
  CoursesScreenResponse? _coursesScreenResponse;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;

  @override
  void initState() {
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';

    textSessionExpired = _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreCoursesLoading) {
          showProgressDialog(context);
        }
        if (state is MoreCoursesEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreCoursesError) {
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
        if (state is MoreCoursesScreenInfoSuccessState) {
          _coursesScreenResponse = state.coursesScreenResponse;
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
                  title: Text( _coursesScreenResponse?.body?.screeninfo?.titlecourse??"หลักสูตร",
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
                                _coursesScreenResponse?.body?.screeninfo?.bachelor??'หลักสูตรระดับปริญญาตรี',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: sizeTextBig20,
                                  color: Theme.of(context).bottomAppBarColor,
                                ),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                  _coursesScreenResponse?.body?.bachelors?.length ?? 0,
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
                                                  "${_coursesScreenResponse?.body?.bachelors?[index].weblink}"));
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
                                                0:FractionColumnWidth(0.9),
                                                1:FractionColumnWidth(0.1),
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
                                                      (_coursesScreenResponse?.body?.bachelors?[index].namecourses??'').toString(),
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        fontSize:
                                                        sizeTextSmaller14,
                                                        color: Theme.of(context)
                                                            .bottomAppBarColor,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 16.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Theme.of(context)
                                                          .iconTheme
                                                          .color,
                                                      size: 20,
                                                    ),
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
                                _coursesScreenResponse?.body?.screeninfo?.graduate??'หลักสูตรระดับบัณฑิตศึกษา',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: sizeTextBig20,
                                  color: Theme.of(context).bottomAppBarColor,
                                ),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                  _coursesScreenResponse?.body?.masters?.length ?? 0,
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
                                                  "${_coursesScreenResponse?.body?.masters?[index].weblink}"));
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
                                                0:FractionColumnWidth(0.9),
                                                1:FractionColumnWidth(0.1),
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
                                                      (_coursesScreenResponse?.body?.masters?[index].namecourses??'').toString(),
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
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 16.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Theme.of(context)
                                                          .iconTheme
                                                          .color,
                                                      size: 20,
                                                    ),
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
                    _coursesScreenResponse?.body?.screeninfo?.coursall??'หลักสูตรทั้งหมด',
                    (_coursesScreenResponse?.body?.screeninfo?.websitecoursall??'https://www.google.com/').toString()),
                floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
              ));
        } else {
          return Scaffold(
              body: Container(
                color: Colors.white,
              ));
        }
      },
      buildWhen: (context, state) {
        return state is MoreCoursesScreenInfoSuccessState;
      },
    );
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
              Uri.parse(lukSuitUrl ?? "https://www.google.com/"));
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
