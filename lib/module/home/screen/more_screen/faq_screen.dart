import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/home/bloc/more_bloc/more_bloc.dart';
import '../../../../module/home/model/response/more_response/screen_more_faq_response.dart';
import '../../../../module/home/screen/more_widget/faq_body.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../utils/shared_preferences.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MoreBloc()..add(MoreFAQEvent()), child: const FaqPage());
  }
}

class FaqPage extends StatefulWidget {
  const FaqPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> with ProgressDialog {
  ScreenMoreFAQResponse? _screenHomeMoreFAQResponse;
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
        if (state is MoreFAQLoading) {
          showProgressDialog(context);
        }
        if (state is MoreFAQEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreFAQError) {
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
        if (state is MoreFAQSuccessState) {
          _screenHomeMoreFAQResponse = state.responseFAQ;
          return fagBody(context, _screenHomeMoreFAQResponse);
        }

        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is MoreFAQSuccessState;
      },
    );
  }
}
