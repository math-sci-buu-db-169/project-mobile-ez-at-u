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
import '../../more_widget/student_list_body.dart';

class MoreBoardStudentListScreen extends StatelessWidget {
  final String titleGen;
  const MoreBoardStudentListScreen({Key? key, required this.titleGen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreBoardListStudentEvent(gen: titleGen)),
        child: MoreBoardStudentListPage(titleGen: titleGen));
  }
}

class MoreBoardStudentListPage extends StatefulWidget {
  final String titleGen;
  const MoreBoardStudentListPage({Key? key, required this.titleGen}) : super(key: key);

  @override
  State<MoreBoardStudentListPage> createState() => _MoreBoardStudentListPageState();
}

class _MoreBoardStudentListPageState extends State<MoreBoardStudentListPage> with ProgressDialog {
  ScreenMoreBoardStudentListResponse? _screenMoreBoardStudentListResponse;
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreBoardListStudentLoading) {
          showProgressDialog(context);
        }
        if (state is MoreBoardListStudentEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreBoardListStudentError) {
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
        if (state is MoreBoardListStudentSuccessState) {
          _screenMoreBoardStudentListResponse = state.responseBoardListStudent;
          return studentListBody(context, _screenMoreBoardStudentListResponse, widget.titleGen);
        } else {
          return Container();
        }
      },
    );
  }
}
