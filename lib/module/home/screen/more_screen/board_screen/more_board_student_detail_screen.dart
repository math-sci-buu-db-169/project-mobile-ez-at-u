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
import '../../../model/response/more_response/screen_more_board_student_list_detail_response.dart';
import '../../more_widget/student_detail_body.dart';

class MoreBoardStudentDetailScreen extends StatelessWidget {
  final String? studentCode;
  const MoreBoardStudentDetailScreen({
    Key? key,
    required this.studentCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreBoardDetailStudentEvent(studentCode: studentCode)),
        child: const MoreBoardStudentDetailPage());
  }
}

class MoreBoardStudentDetailPage extends StatefulWidget {
  const MoreBoardStudentDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MoreBoardStudentDetailPage> createState() => _MoreBoardStudentDetailPageState();
}

class _MoreBoardStudentDetailPageState extends State<MoreBoardStudentDetailPage> with ProgressDialog {
  ScreenMoreBoardStudentDetailResponse? _screenMoreBoardStudentDetailResponse;
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
    // context.read<MoreBloc>().add(MoreBoardDetailStudentEvent());
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreBoardDetailStudentLoading) {
          showProgressDialog(context);
        }
        if (state is MoreBoardDetailStudentEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreBoardDetailStudentError) {
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
        if (state is MoreBoardDetailStudentSuccessState) {
          _screenMoreBoardStudentDetailResponse = state.responseBoardDetailStudent;
          return studentDetailBody(
            context,
            _screenMoreBoardStudentDetailResponse,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
