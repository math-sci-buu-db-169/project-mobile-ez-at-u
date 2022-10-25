import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_board.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../customs/size/size.dart';
import '../../../../../utils/shared_preferences.dart';
import '../../../../login/screen/login_screen/login_screen.dart';
import '../../../bloc/more_bloc/more_bloc.dart';
import '../../../model/response/more_response/screen_more_board_teacher_response.dart';
import '../../more_widget/teacher_math_widget.dart';
import '../../more_widget/teacher_stats_widget.dart';

class MoreBoardListTeacherScreen extends StatelessWidget {
  const MoreBoardListTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreBoardTeacherEvent()), child: const MoreBoardListTeacherPage());
  }
}

class MoreBoardListTeacherPage extends StatefulWidget {
  const MoreBoardListTeacherPage({Key? key}) : super(key: key);

  @override
  State<MoreBoardListTeacherPage> createState() => _MoreBoardListTeacherPageState();
}

bool isSelected = true;
const double yalign = -1;
const Color selectedColor = Colors.black;
const Color normalColor = Colors.black54;

class _MoreBoardListTeacherPageState extends State<MoreBoardListTeacherPage> with ProgressDialog {
  ScreenMoreBoardTeacherResponse? _screenMoreBoardTeacherResponse;
  late double defaultalign;
  late Color departleftcolor;
  late Color departrightcolor;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';

    textSessionExpired = _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  double xalign = 1;
  @override
  void initState() {
    _isSessionUnauthorized();
    defaultalign = yalign;
    departleftcolor = selectedColor;
    departrightcolor = normalColor;
    isSelected = true;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 40.0;

    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreBoardTeacherLoading) {
          showProgressDialog(context);
        }
        if (state is MoreBoardTeacherEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreBoardTeacherError) {
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
        if (state is MoreBoardTeacherSuccessState) {
          _screenMoreBoardTeacherResponse = state.responseBoardTeacher;
          if (kDebugMode) {
            print(_screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?.length);
          }
          return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: sizeTitle24,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    _screenMoreBoardTeacherResponse?.body?.screeninfo?.titileboardpersonal ??
                        boardPersonalTitleBoardPersonal,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: sizeTitle24,
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    // Container(
                    //   height: 100,
                    //   color: Colors.blue,
                    //   child: Image.network(
                    //     "${_screenHomeMoreBoardTeacherResponse?.body?.screeninfo?.imgDepart}",
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 10),
                      child: Container(
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              alignment: Alignment(defaultalign, 0),
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                width: width * 0.5,
                                height: height,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                defaultalign = yalign;
                                departleftcolor = selectedColor;
                                isSelected = true;
                                departrightcolor = normalColor;
                                setState(() {});
                              },
                              child: Align(
                                alignment: const Alignment(-1, 0),
                                child: Container(
                                  width: width * 0.5,
                                  color: Colors.transparent,
                                  alignment: Alignment.center,
                                  child: Text(
                                    _screenMoreBoardTeacherResponse?.body?.screeninfo?.textmath ??
                                        boardPersonalTextMath,
                                    style: TextStyle(
                                      color: departleftcolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                defaultalign = xalign;
                                departrightcolor = selectedColor;
                                isSelected = false;
                                departleftcolor = normalColor;
                                setState(() {});
                              },
                              child: Align(
                                alignment: const Alignment(1, 0),
                                child: Container(
                                  width: width * 0.5,
                                  color: Colors.transparent,
                                  alignment: Alignment.center,
                                  child: Text(
                                    _screenMoreBoardTeacherResponse?.body?.screeninfo?.textstats ??
                                        boardPersonalTextStat,
                                    style: TextStyle(
                                      color: departrightcolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: isSelected
                          ? teacherMathWidget(context, _screenMoreBoardTeacherResponse)
                          : teacherStatsWidget(context, _screenMoreBoardTeacherResponse),
                    ),
                  ],
                ),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
