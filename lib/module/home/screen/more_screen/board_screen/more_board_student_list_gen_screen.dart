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
import '../../../model/response/more_response/screen_more_list_name_gen_response.dart';
import '../../more_widget/student_list_gen_body.dart';

class MoreBoardListStudentListGenScreen extends StatelessWidget {
  const MoreBoardListStudentListGenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc()..add(MoreBoardListGenStudentEvent(gen: '',genname: '',)),
        child: const MoreBoardListStudentListGenPage());
  }
}

class MoreBoardListStudentListGenPage extends StatefulWidget {
  const MoreBoardListStudentListGenPage({Key? key}) : super(key: key);

  @override
  State<MoreBoardListStudentListGenPage> createState() => _MoreBoardListStudentListGenPageState();
}

class _MoreBoardListStudentListGenPageState extends State<MoreBoardListStudentListGenPage> with ProgressDialog {
  ScreenMoreListNameGenResponse? _screenMoreListNameGenResponse;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late int _optionSearch = 0;
  final TextEditingController   _searchController = TextEditingController();

  @override
  void initState() {
    _isSessionUnauthorized();
    super.initState();
  }
  void _setOptionSearch(int clickOptionSearch)  {
    setState(
          () {
             _optionSearch = clickOptionSearch;
          },
    );
    print(_optionSearch);
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
        if (state is ListGenStudentLoading) {
          showProgressDialog(context);
        }
        if (state is ListGenStudentEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ListGenStudentError) {
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
        if (state is MoreBoardListGenStudentSearchSuccessState) {
          _screenMoreListNameGenResponse = state.responseBoardListGenStudent;
           studentListGenBody( context,_screenMoreListNameGenResponse, _searchController,_optionSearch,_setOptionSearch);
        }
      },
      builder: (context, state) {
        if (state is MoreBoardListGenStudentSuccessState) {
          _screenMoreListNameGenResponse = state.responseBoardListGenStudent;
          return studentListGenBody( context,_screenMoreListNameGenResponse, _searchController,_optionSearch,_setOptionSearch);
        }
        if (state is MoreBoardListGenStudentSearchSuccessState) {
          _screenMoreListNameGenResponse = state.responseBoardListGenStudent;
          return studentListGenBody( context,_screenMoreListNameGenResponse, _searchController,_optionSearch,_setOptionSearch);
        }
        else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is MoreBoardListGenStudentSuccessState||state is MoreBoardListGenStudentSearchSuccessState;
      },
    );
  }
}
