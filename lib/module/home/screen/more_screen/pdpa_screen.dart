import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/home/bloc/more_bloc/more_bloc.dart';
import '../../../../module/home/model/response/more_response/scree_more_pdpa_response.dart';
import '../../../../module/home/screen/more_widget/m_pdpa_widget.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../utils/shared_preferences.dart';

class PDPAMoreScreen extends StatelessWidget {
  const PDPAMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MoreBloc()..add(MorePDPAEvent(
        usabilityScreen:true,versionPDPA:''

    )), child: const PDPAPage());
  }
}

class PDPAPage extends StatefulWidget {
  const PDPAPage({Key? key}) : super(key: key);

  @override
  State<PDPAPage> createState() => _PDPAPageState();
}

class _PDPAPageState extends State<PDPAPage> with ProgressDialog {
  ScreenMorePDPAResponse? _screenHomeMorePDPAResponse;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String getIsVersionPDPA ='';
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).bottomAppBarColor ;
  }
  @override
  void initState() {
    _isSessionUnauthorized();
    getIsVersionPDPA =getVersionPDPA().toString();
    super.initState();
  }
  isCheckedSetState(bool? value){
    setState(() {
      isChecked = value!;
    });
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
        if (state is MorePDPALoading) {
          showProgressDialog(context);
        }
        if (state is MorePDPAEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MorePDPAError) {
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
      },
      builder: (context, state) {
        if (state is MorePDPASuccessState) {
          _screenHomeMorePDPAResponse = state.responsePDPA;
          return mPDPAMoreWidget(context, _screenHomeMorePDPAResponse,getIsVersionPDPA,isChecked,getColor,isCheckedSetState);
        } else {
          return Container();
        }
      },

      buildWhen: (context, state) {
        return state is MorePDPASuccessState ||
            state is MorePDPASuccessState;
      },
    );
  }
}
