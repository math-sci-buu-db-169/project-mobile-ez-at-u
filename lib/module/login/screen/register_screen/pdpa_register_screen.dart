import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/login/bloc/pdpa_bloc/pdpa_bloc.dart';
import '../../../../module/login/model/response/screen_pdpa_response.dart';
import '../../../../module/login/screen/register_screen/register_screen.dart';
import '../../../../module/login/widget/pdpa_widget.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';

class ConditionPDPAScreen extends StatelessWidget {
  const ConditionPDPAScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PdpaBloc()..add(ScreenInfoPDPAEvent()), child: const ConditionPDPAPage());
  }
}

class ConditionPDPAPage extends StatefulWidget {
  const ConditionPDPAPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ConditionPDPAPage> createState() => _ConditionPDPAPageState();
}

class _ConditionPDPAPageState extends State<ConditionPDPAPage> with ProgressDialog {
  ScreenPDPAResponse? _screenPDPAResponse;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String valueLanguage;
  @override
  void initState() {
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired = valueLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired = valueLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = valueLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PdpaBloc, PdpaState>(
      listener: (context, state) {
        if (state is PDPALoading) {
          showProgressDialog(context);
        }
        if (state is PDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is PDPAError) {
          // show dialog error
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
        if (state is PDPADecline) {
          // show dialog error
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
        if (state is PDPAAccept) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoPDPASuccessState) {
          _screenPDPAResponse = state.response;
          return pDPAScreenWidget(context, _screenPDPAResponse);
        }
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoPDPASuccessState;
      },
    );
  }
}
