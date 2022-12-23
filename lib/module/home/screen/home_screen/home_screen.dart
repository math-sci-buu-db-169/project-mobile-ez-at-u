import 'package:ez_at_u/module/activity/model/response/activity_list_teacher_screen.dart';
import 'package:ez_at_u/module/home/model/response/home_response/no_activity_teacher_response.dart';
import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../module/login/screen/login_screen/login_screen.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../module/activity/model/response/screen_status_activity_response.dart';
import '../../../../module/home/bloc/home_bloc/home_bloc.dart';
import '../../../../module/home/model/response/home_response/alert_no_activity_response.dart';
import '../../../../module/home/model/response/home_response/screen_home_response.dart';
import '../../../../module/home/screen/home_widget/home_widget.dart';
import '../../../../module/profile/model/response/api_profile_response.dart';
import '../../../../utils/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeScreenInfoEvent()),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ProgressDialog {
  ScreenHomeResponse? _screenHomeResponse;
  ApiProfileResponse? _screenProfileResponse;
  ProfileTeacherScreenApi? _screenProfileTeacherResponse;
  ScreenStatusActivityStudentResponse? _screenStatusActivityStudentResponse;
  ActivityListTeacherScreen? _screenStatusActivityTeacherResponse;

  AlertNoActivityStudentResponse? _noActivityStudentResponse;
  NoActivityTeacherResponse? _noActivityTeacherResponse;
  TextEditingController otpCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String keyToken;
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String _role;
  late int intThemeMode = 2;
  late ThemeMode themeMode;
  // late String? _refreshKey;
  // late bool _isHidden;
  late PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    buildNumber: 'Unknown',
    version: 'Unknown',
  );

  @override
  void initState() {
    _initPackageInfo();
    _initRole();
    _iniGetThemeMode();
    _isSessionUnauthorized();
    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      _packageInfo = info;
    });
  }
  void _initRole()  async{

    prefs = await SharedPreferences.getInstance();
    setState(()  {
      _role = prefs.getString('Role')??"TC";
    });
  }

  void _iniGetThemeMode()  async{

    prefs = await SharedPreferences.getInstance();
    setState(()  {
      if (prefs.getInt('themeMode') == null) {
        setThemeModeApp( intMode: 2,);
      }
      intThemeMode =  prefs.getInt('themeMode')?? 2;
      if (prefs.getInt('themeMode') != null) {
        switch (prefs.getInt('themeMode')) {
          case 0:
            themeMode = ThemeMode.light;
            print("themeMode H case 0: = ${themeMode}");

            break;
          case 1:
            themeMode = ThemeMode.dark;
            print("themeMode  H case 1: = ${themeMode}");
            break;
          case 2:
            themeMode = ThemeMode.system;
            print("themeMode  H case 2: = ${themeMode}");
            break;
          default:
            themeMode = ThemeMode.system;
            print("themeMode  H case default: = ${themeMode}");
            break;
        }
      } else {
        themeMode = ThemeMode.system;
        setThemeModeApp( intMode: 2,);
      }
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

  void _toggleLanguageView() {
    _screenProfileResponse?.body?.profileGeneralInfo?.langeuage == 'TH' ? _userLanguage = "EN" : _userLanguage = "TH";
    context.read<HomeBloc>().add(OnClickChangeLanguageHomeEvent(userLanguage: _userLanguage));
  }

  void _changeLanguageSuccess({required String userLanguage}) {
    setUserLanguage(userLanguage);
    context.read<HomeBloc>().add(HomeScreenInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
          showProgressDialog(context);
        }
        if (state is HomeAlertLoading) {
          showProgressTransparent(context);
        }
        if (state is HomeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is HomeError) {
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

        if (state is HomeLogoutState) {
          cleanDelete();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
        }
        if (state is OnClickConfirmDeleteAccountState) {
          cleanDelete();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
        }
        if (state is OnClickChangeLanguageHomeSuccessState) {
          _changeLanguageSuccess(userLanguage: state.userLanguage);
        }
      },
      builder: (context, state) {
        if (state is ScreenInfoHomeSuccessState) {
          _screenHomeResponse = state.responseScreenInfoHome;
          _screenProfileResponse = state.responseProfile;
          _screenStatusActivityStudentResponse = state.responseActivityStudent;
          _screenStatusActivityTeacherResponse = state.responseActivityTeacher;
          _userLanguage = _screenProfileResponse?.body?.profileGeneralInfo?.langeuage ?? "TH";
          return buildContentHomeScreen(
              context,
              _toggleLanguageView,
              isHidden: _screenProfileResponse?.body?.profileGeneralInfo?.langeuage == 'TH' ? true : false,
              intThemeMode:intThemeMode,
              iniGetThemeMode:_iniGetThemeMode,
              role:_role,
              _screenHomeResponse,
              _screenProfileResponse,
              _screenProfileTeacherResponse,
              _userLanguage,
              _screenStatusActivityStudentResponse,
              _screenStatusActivityTeacherResponse,
              _noActivityStudentResponse,
              _noActivityTeacherResponse,
              activityStudentIsEmpty: false,
              activityTeacherIsEmpty: false,
              versionApp: _packageInfo.version,
              otpCodeController,
              passwordController);
        } else if (state is ScreenInfoHomeNoActivityStudentAndTeacherSuccessState) {
          _screenHomeResponse = state.responseScreenInfoHome;
          _screenProfileResponse = state.responseProfile;
          _noActivityStudentResponse = state.responseNoActivityStudent;
          _noActivityTeacherResponse = state.responseNoActivityTeacher;
          _userLanguage = _screenProfileResponse?.body?.profileGeneralInfo?.langeuage ?? "TH"; //+++
          return buildContentHomeScreen(
              context,
              _toggleLanguageView,
              isHidden: _screenProfileResponse?.body?.profileGeneralInfo?.langeuage == 'TH' ? true : false,
              intThemeMode:intThemeMode,
              iniGetThemeMode:_iniGetThemeMode,
              role:_role,
              _screenHomeResponse,
              _screenProfileResponse,
              _screenProfileTeacherResponse,
              _userLanguage,
              _screenStatusActivityStudentResponse,
              _screenStatusActivityTeacherResponse,
              _noActivityStudentResponse,
              _noActivityTeacherResponse,
              activityStudentIsEmpty: true,
              activityTeacherIsEmpty: true,
              versionApp: _packageInfo.version,
              otpCodeController,
              passwordController);
        }

        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is ScreenInfoHomeSuccessState || state is ScreenInfoHomeNoActivityStudentAndTeacherSuccessState;
      },
    );
  }
}
