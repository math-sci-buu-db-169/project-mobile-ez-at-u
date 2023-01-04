

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../utils/shared_preferences.dart';
import '../../../../login/screen/login_screen/login_screen.dart';
import '../../../bloc/more_bloc/more_bloc.dart';
import '../../../model/response/more_response/screen_more_board_student_list_response.dart';
import '../list_nisit_page/student_list_search_body.dart';

class MoreSrarchNisitScreen extends StatelessWidget {
  const MoreSrarchNisitScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreSrarchNisitNinitEvent(gen: '',studentID: '',studentName: '',studentLastname:'' )),
        child:const MoreSrarchNisitPage());
  }
}

class MoreSrarchNisitPage extends StatefulWidget {
  const MoreSrarchNisitPage({Key? key,}) : super(key: key);

  @override
  State<MoreSrarchNisitPage> createState() => _MoreSrarchNisitPageState();
}

class _MoreSrarchNisitPageState extends State<MoreSrarchNisitPage> with ProgressDialog {
  ScreenMoreBoardStudentListResponse? _screenMoreBoardStudentListResponse;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late int _optionSearchNiSit = 0;
  late String _optionSearchGen = '';
  final TextEditingController   searchNiSitController = TextEditingController();

  void _setOptionSearchNiSit(int clickOptionSearchNiSit)  {

    setState(
          () {
        _optionSearchNiSit = clickOptionSearchNiSit;
      },
    );
    print(_optionSearchNiSit);
  }  void _setOptionSearchGenNiSit(String clickOptionSearchGenNiSit)  {

    setState(
          () {
            _optionSearchGen = clickOptionSearchGenNiSit;
      },
    );
    print(_optionSearchGen);
  }
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreSrarchNisitLoading) {
          showProgressDialog(context);
        }
        if (state is MoreSrarchNisitEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreSrarchNisitError) {
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
          } else if (state.errorMessage.toUpperCase().toString() == 'S401EXP01'||state.errorMessage.toUpperCase().toString() == 'T401NOT01') {
            dialogSessionExpiredOneBtn(
                context, textSessionExpired, textSubSessionExpired, _buttonOk,
                onClickBtn: () {
                  cleanDelete();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginScreen()));
                });
          }else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
                onClickBtn: () {
                  Navigator.of(context).pop();
                });
          }
        }

        if (state is TokenExpiredState) {
          dialogSessionExpiredOneBtn(
              context, textSessionExpired, textSubSessionExpired, _buttonOk,
              onClickBtn: () {
                cleanDelete();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen()));
              });
        }
        if (state is MoreSrarchNisitSuccessState) {
          _screenMoreBoardStudentListResponse = state.responseBoardListStudent;
          studentListScreenBody(context, _screenMoreBoardStudentListResponse,searchNiSitController,_optionSearchNiSit,_setOptionSearchNiSit,_setOptionSearchGenNiSit,_optionSearchGen);
        }
      },
      builder: (context, state) {
        if (state is MoreSrarchNisitNinitSuccessState) {
          _screenMoreBoardStudentListResponse = state.responseBoardListStudent;
          return studentListScreenBody(context, _screenMoreBoardStudentListResponse,searchNiSitController,_optionSearchNiSit,_setOptionSearchNiSit,_setOptionSearchGenNiSit,_optionSearchGen);

        }
        if (state is MoreSrarchNisitSuccessState) {
          _screenMoreBoardStudentListResponse = state.responseBoardListStudent;
          return studentListScreenBody(context, _screenMoreBoardStudentListResponse,searchNiSitController,_optionSearchNiSit,_setOptionSearchNiSit,_setOptionSearchGenNiSit,_optionSearchGen);

        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is MoreSrarchNisitNinitSuccessState||state is MoreSrarchNisitSuccessState;
      },
    );
  }
}
