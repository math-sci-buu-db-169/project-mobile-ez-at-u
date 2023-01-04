import 'dart:convert';
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customs/button/button_custom.dart';
import '../../customs/color/color_const.dart';
import '../../customs/color/pdf_color_const.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../customs/dialog/dialog_widget.dart';
import '../../customs/image_base_64.dart';
import '../../customs/message/text_button.dart';
import '../../customs/message/text_error.dart';
import '../../customs/progress_dialog.dart';
import '../../customs/size/gap.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../bloc_resume/resume_bloc.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../../utils/shared_preferences.dart';
import '../app.dart';
import '../components/components_resume.dart';
import '../model/response/pre_view_resume_response.dart';
import 'content_design_resume_edit.dart';

import 'package:url_launcher/url_launcher.dart';
Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
class ContentDesignResumeScreen extends StatelessWidget {
  const ContentDesignResumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetOnSelectedAndPreviewResumeEvent()),
        child: const ContentDesignResume());
  }
}

class ContentDesignResume extends StatefulWidget {
  const ContentDesignResume({Key? key}) : super(key: key);

  @override
  State<ContentDesignResume> createState() => _ContentDesignResumeState();
}

class _ContentDesignResumeState extends State<ContentDesignResume>
    with ProgressDialog {
  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String isPhotoResume;

  late PreViewResumeResponse _preViewResumeResponse;

  @override
  void initState() {
    _isSessionUnauthorized();

    super.initState();
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';

    textSessionExpired =
        _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
        _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is PreviewResumeLoading) {
          showProgressDialog(context);
        }
        if (state is PreviewResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is OnSelectedAndPreviewResumeSuccessState) {
          _preViewResumeResponse = state.isPreViewResumeResponse;
          BodyPreviewResume(
            isPreViewResumeResponse: _preViewResumeResponse,
          );
        }
        if (state is SetOnSelectedAndGenResumeSuccessState) {
          setState(() {
            _launchInBrowser(Uri.parse(
                "http://msd.buu.ac.th/ServiceTest/resume/generatepdftest?id=62030340"));
          });
        }
        if (state is PreviewResumeError) {
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
          } else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
                onClickBtn: () {
              Navigator.of(context).pop();
            });
          }
        }
        if (state is SetOnSelectedAndPreviewResumeEvent) {
          context.read<ResumeBloc>().add(GetOnSelectedAndPreviewResumeEvent());
        }
        if (state is SetOnSelectedResumeSuccessState) {
          if(state.pop == true){
            Navigator.of(context).pop();
          }else{
            context.read<ResumeBloc>().add(GetOnSelectedAndPreviewResumeEvent());
          }
        }
      },
      builder: (context, state) {
        if (state is OnSelectedAndPreviewResumeSuccessState) {
          _preViewResumeResponse = state.isPreViewResumeResponse;
          return BodyPreviewResume(
            isPreViewResumeResponse: _preViewResumeResponse,
          );
        } else {
          return Container();
        }
      },
      buildWhen: (context, state) {
        return state is OnSelectedAndPreviewResumeSuccessState;
      },
    );
  }
}

class BodyPreviewResume extends StatefulWidget {
  final PreViewResumeResponse isPreViewResumeResponse;
  const BodyPreviewResume({Key? key, required this.isPreViewResumeResponse})
      : super(key: key);

  @override
  State<BodyPreviewResume> createState() => _BodyPreviewResumeState();
}

class _BodyPreviewResumeState extends State<BodyPreviewResume> {
  late PreViewResumeResponse isPreViewResumeResponse;
  bool isSelectLanguageThai = true;
  int colorInt = 8;
  late double sizePhoto = 1.5;
  late double widthSizeCM = 3.00;
  late double heightSizeCM = 4.00;
  late PdfColor colorOfPdfUsTheme = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsTheme = colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsButtonTitle = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsButtonTitle =
      colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsName = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsName = colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsPosition = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsPosition =
      colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsExperience = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsExperience =
      colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsCertifications =
      colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsCertifications =
      colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsSkills = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsSkills =
      colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsAbout = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsAbout = colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsText = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsText = colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsEducations = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsEducations =
      colorOfPdfList[colorInt].materialColor;
  late PdfColor colorOfPdfUsContact = colorOfPdfList[colorInt].pdfOfColor;
  late Color materialColorOfPdfUsContact =
      colorOfPdfList[colorInt].materialColor;

  File? image;
  String? base64img;
  String isPhotoResume =
      "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAAXNSR0IArs4c6QAAA1lJREFUeF7t3GtyqkAQBWBchmzD/e8Al6Euw1tTKXONAvPqxzlD8ydUAtM954PBoiqelmV5ns/nKTb/BB6Px3S63W7PtHO5XPw7OnAH1+t1muf5ByTtpF8Eis8V8cr+9w5JIGkLFHuQ98y/QALFFuTzBlgFCRQblLXVaBMkUHRRth4NuyCBooOy95zOggSKLEruQ1MRSKDIoOQwUpVikEDpQynBqAYJlDaUUowmkECpQ6nBaAYJlDKUWowukEDZR2nB6AYJlHWUVgwRkED5i9KDIQYSKD8ovRiiIFINlT0u8Y6SwBAHOSqKFIYKyNFQJDHUQI6CIo2hCjI6igaGOsioKFoYJiCjoWhimIGMgqKNYQrCjmKBYQ7CimKF4QLChmKJ4QbCgmKN4QqCjuKB4Q6CiuKFAQGChuKJAQOCguKNAQXijYKAAQfihYKCAQlijYKEAQtihYKGAQ2ijYKIAQ+ihYKKQQEijYKMQQMihYKOQQXSi8KAQQfSisKCQQlSi8KEQQtSisKGQQ2SQ2HEoAfZQmHFGALkE4UZYxiQF0r6yf71UlX/p54mjLqlOyNAQHTel6lYspxR1gCYUaiXrL3gWVFoQUoCLznG+Qb/Kk8JUhN0zbEIOHQgLQG3nOOFQwXSE2zPuZY4NCASgUqMoY1DASIZpORYGjjwIBoBaowphQMNohmc5tg9OLAgFoFZ1KjFgQSxDMqyVgkOHIhHQB41t3CgQDyD8az9jgMDghAIQg8QIAhBvK5S717cQbwDWFvLPXtyBfGceO4Tj1dvbiBeE85BvP/do0cXEI+J1kB4opiDMGF4POhNQRgxrFHMQJgxLFFMQEbAsEJRBxkJwwJFFWREDG0UNZCRMTRRVECOgKGFIg5yJAwNFFGQI2JIo4iBHBlDEkUEJDD+v/3qzaIbpLeB1pd+yOf1ZNIF0lMYOVCJ3lqzaQZpLSgxWZYxWjJqAmkpxBKidJ+1WVWD1BaQniDjeDWZVYHUDMwYnGbPpdkVg5QOqDkp9rFLMiwCKRmIPSyr/nNZZkFyA1hNZKQ6e5nuggSG3mWwle0mSGDoYey9+1oFCQx9jC2UL5DAsMNYQ/kDEhj2GJ8ovyBph/3Lv/zilKmcboh5nqfTsizPtBObfwL3+336B07+3Sny7gNQAAAAAElFTkSuQmCC";
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Theme.of(context).bottomAppBarColor;
  }

  late SharedPreferences prefs;
  late String _userLanguage;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;
  late String isAddressValue;
  late List<OnSelect> positionOnSelect = [];
  late List<OnSelect> educationHSCOnSelect = [];
  late List<OnSelect> educationBDOnSelect = [];
  late List<OnSelect> educationMDOnSelect = [];
  late List<OnSelect> educationDDOnSelect = [];
  late List<OnSelect> educationHDDOnSelect = [];
  late List<OnSelect> socialOnSelect = [];
  late List<OnSelect> addressOnSelect = [];
  late List<OnSelect> experienceOnSelect = [];
  late List<OnSelect> certificateOnSelect = [];
  late List<OnSelect> skillOnSelect = [];
  late List<OnSelect> languageOnSelect = [];

  late OnSelectClickResume isOnSelectClickResume;

  late SendOnSelectColorListResume sendOnSelectColorSet  ;
  late Resumedatacolor? colorIntData ;
  late OnSelectColorListResume onSelectColorSet = OnSelectColorListResume(
    text: OnSelectColorResume(
      id: colorInt,
      nameColor: 'black',
      materialColor: colorOfPdfList[0].materialColor,
      pdfColor: colorOfPdfList[0].pdfOfColor, ),
    name: OnSelectColorResume(
      id: colorInt,
      nameColor: 'black',
      materialColor: colorOfPdfList[0].materialColor,
      pdfColor: colorOfPdfList[0].pdfOfColor, ),
    theme: OnSelectColorResume(
      id: colorInt,
      nameColor: 'lightBlue',
      materialColor: colorOfPdfList[colorInt].materialColor,
      pdfColor: colorOfPdfList[colorInt].pdfOfColor, ),
    aboutMe: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    position: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    education: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    contact: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    address: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    experience: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    certificate: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    skill: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
    language: OnSelectColorResume(
        id: colorInt,
        nameColor: 'lightBlue',
        materialColor: colorOfPdfList[colorInt].materialColor,
        pdfColor: colorOfPdfList[colorInt].pdfOfColor),
  );
  double gap = 5.0;
  Future<void> _isSelectLanguageThai() async {
    prefs = await SharedPreferences.getInstance();
    isSelectLanguageThai =
        (prefs.getString('ResumePhoto') ?? '') == 'EN' ? false : true;
    setState(() {});
  }

  onChangedSetState() {
    setState(() {});
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    _userLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired =
        _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
        _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }

  @override
  void initState() {
    _isSelectLanguageThai();
    _isSessionUnauthorized();
    isPreViewResumeResponse = widget.isPreViewResumeResponse;
    positionOnSelectSet();
    isAddressValue = '';
    super.initState();
  }

  positionOnSelectSet() {
    print(jsonEncode(isPreViewResumeResponse.body?.data?.position?.length));
    print(jsonEncode(isPreViewResumeResponse.body?.data?.position));
    // print(jsonEncode(_isGetOnSelectedResume.body?.dataOnSelect?.positionOnSelect?.length));
    // print(jsonEncode(_isGetOnSelectedResume.body?.dataOnSelect?.positionOnSelect));
    setState(() {

      colorIntData = isPreViewResumeResponse.body?.data?.resumedatacolor ;
      isPreViewResumeResponse.body?.data?.position?.forEach((element) {
        positionOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });

      isPreViewResumeResponse.body?.data?.experience?.forEach((element) {
        experienceOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });

      isPreViewResumeResponse.body?.data?.certificate?.forEach((element) {
        certificateOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });

      isPreViewResumeResponse.body?.data?.skill?.forEach((element) {
        skillOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });

      isPreViewResumeResponse.body?.data?.language?.forEach((element) {
        languageOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });

      isPreViewResumeResponse.body?.data?.education?.hsc?.forEach((element) {
        educationHSCOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });
      isPreViewResumeResponse.body?.data?.education?.bd?.forEach((element) {
        educationBDOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });
      isPreViewResumeResponse.body?.data?.education?.md?.forEach((element) {
        educationMDOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });
      isPreViewResumeResponse.body?.data?.education?.dd?.forEach((element) {
        educationDDOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });
      isPreViewResumeResponse.body?.data?.education?.hdd?.forEach((element) {
        educationHDDOnSelect.add(
            OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
      });
      var varSocialOnSelect = isPreViewResumeResponse.body?.data?.contactinfo;
      socialOnSelect = [
        OnSelect(id: 1, onselect: varSocialOnSelect?.onselectedEmail ?? false),
        OnSelect(id: 2, onselect: varSocialOnSelect?.onselectedPhone ?? false),
        OnSelect(
            id: 3, onselect: varSocialOnSelect?.onselectedFacebook ?? false),
        OnSelect(id: 4, onselect: varSocialOnSelect?.onselectedLine ?? false),
        OnSelect(
            id: 5, onselect: varSocialOnSelect?.onselectedInstagram ?? false),
        OnSelect(
            id: 6, onselect: varSocialOnSelect?.onselectedTwitter ?? false),
        OnSelect(
            id: 7, onselect: varSocialOnSelect?.onselectedYoutube ?? false),
      ];
      var varAddressOnSelect = isPreViewResumeResponse.body?.data?.address;
      addressOnSelect = [
        OnSelect(
            id: 1, onselect: varAddressOnSelect?.onselectedNumber ?? false),
        OnSelect(id: 2, onselect: varAddressOnSelect?.onselectedMoo ?? false),
        OnSelect(id: 3, onselect: varAddressOnSelect?.onselectedSoi ?? false),
        OnSelect(id: 4, onselect: varAddressOnSelect?.onselectedRoad ?? false),
        OnSelect(
            id: 5,
            onselect: varAddressOnSelect?.onselectedSubdistrict ?? false),
        OnSelect(
            id: 5, onselect: varAddressOnSelect?.onselectedDistrict ?? false),
        OnSelect(
            id: 6, onselect: varAddressOnSelect?.onselectedProvince ?? false),
        OnSelect(
            id: 7, onselect: varAddressOnSelect?.onselectedZipcode ?? false),
      ];
      // _isGetOnSelectedResume.body?.dataOnSelect?.socialOnSelect?.hddOnSelect?.forEach((element) {
      //   socialOnSelect.add(OnSelect(id:element.id??0,onselect:element.onselect??true));
      // }) ;
      sendOnSelectColorSet  =SendOnSelectColorListResume(
        text: SendOnSelectColorResume(
            id: colorIntData?.text??0,
            nameColor: colorOfPdfList[colorIntData?.text??0].nameColor,
            parameter: ParameterColor.text.name),
        name: SendOnSelectColorResume(
            id: colorIntData?.name??0,
            nameColor: colorOfPdfList[colorIntData?.name??0].nameColor,
            parameter: ParameterColor.name.name ),
        theme: SendOnSelectColorResume(
            id: colorIntData?.theme??colorInt,
            nameColor:colorOfPdfList[colorIntData?.theme??colorInt].nameColor,
            parameter : ParameterColor.theme.name ),
        aboutMe: SendOnSelectColorResume(
            id: colorIntData?.aboutme??colorInt,
            nameColor: colorOfPdfList[colorIntData?.aboutme??colorInt].nameColor,
            parameter:  ParameterColor.aboutMe.name ),
        position: SendOnSelectColorResume(
            id: colorIntData?.position??colorInt,
            nameColor: colorOfPdfList[colorIntData?.position??colorInt].nameColor,
            parameter:  ParameterColor.position.name ),
        education: SendOnSelectColorResume(
            id: colorIntData?.education??colorInt,
            nameColor: colorOfPdfList[colorIntData?.education??colorInt].nameColor,
            parameter:  ParameterColor.education.name ),
        contact: SendOnSelectColorResume(
            id: colorIntData?.contact??colorInt,
            nameColor: colorOfPdfList[colorIntData?.contact??colorInt].nameColor  ,
            parameter: ParameterColor.contact.name),
        address: SendOnSelectColorResume(
            id: colorIntData?.address??colorInt,
            nameColor: colorOfPdfList[colorIntData?.address??colorInt].nameColor ,
            parameter:  ParameterColor.address.name ),
        experience: SendOnSelectColorResume(
            id: colorIntData?.experience??colorInt,
            nameColor: colorOfPdfList[colorIntData?.experience??colorInt].nameColor ,
            parameter:  ParameterColor.experience.name ),
        certificate: SendOnSelectColorResume(
            id: colorIntData?.certificate??colorInt,
            nameColor: colorOfPdfList[colorIntData?.certificate??colorInt].nameColor ,
            parameter:  ParameterColor.certificate.name ),
        skill: SendOnSelectColorResume(
            id: colorIntData?.skill??colorInt,
            nameColor: colorOfPdfList[colorIntData?.skill??colorInt].nameColor ,
            parameter:  ParameterColor.skill.name),
        language: SendOnSelectColorResume(
            id: colorIntData?.language??colorInt,
            nameColor: colorOfPdfList[colorIntData?.language??colorInt].nameColor ,
            parameter:  ParameterColor.language.name ),
      );
      onSelectColorSet = OnSelectColorListResume(
        text: OnSelectColorResume(
          id:colorIntData?.text??0,
          nameColor: colorOfPdfList[colorIntData?.text??0].nameColor ,
          materialColor: colorOfPdfList[colorIntData?.text??0].materialColor,
          pdfColor: colorOfPdfList[colorIntData?.text??0].pdfOfColor, ),
        name: OnSelectColorResume(
          id: colorIntData?.text??0,
          nameColor: colorOfPdfList[colorIntData?.text??0].nameColor ,
          materialColor: colorOfPdfList[colorIntData?.text??0].materialColor,
          pdfColor: colorOfPdfList[colorIntData?.text??0].pdfOfColor, ),
        theme: OnSelectColorResume(
          id: colorIntData?.theme??colorInt,
          nameColor: colorOfPdfList[colorIntData?.theme??colorInt].nameColor ,
          materialColor: colorOfPdfList[colorIntData?.theme??colorInt].materialColor,
          pdfColor: colorOfPdfList[colorIntData?.theme??colorInt].pdfOfColor, ),
        aboutMe: OnSelectColorResume(
            id: colorIntData?.aboutme??colorInt,
            nameColor: colorOfPdfList[colorIntData?.aboutme??colorInt].nameColor ,
            materialColor: colorOfPdfList[colorIntData?.aboutme??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.aboutme??colorInt].pdfOfColor),
        position: OnSelectColorResume(
            id: colorIntData?.position??colorInt,
            nameColor: colorOfPdfList[colorIntData?.position??colorInt].nameColor ,
            materialColor: colorOfPdfList[colorIntData?.position??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.position??colorInt].pdfOfColor),
        education: OnSelectColorResume(
            id: colorIntData?.education??colorInt,
            nameColor: colorOfPdfList[colorIntData?.education??colorInt].nameColor,
            materialColor: colorOfPdfList[colorIntData?.education??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.education??colorInt].pdfOfColor),
        contact: OnSelectColorResume(
            id: colorIntData?.contact??colorInt,
            nameColor: colorOfPdfList[colorIntData?.contact??colorInt].nameColor ,
            materialColor: colorOfPdfList[colorIntData?.contact??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.contact??colorInt].pdfOfColor),
        address: OnSelectColorResume(
            id: colorIntData?.address??colorInt,
            nameColor: colorOfPdfList[colorIntData?.address??colorInt].nameColor,
            materialColor: colorOfPdfList[colorIntData?.address??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.address??colorInt].pdfOfColor),
        experience: OnSelectColorResume(
            id:  colorIntData?.experience??colorInt,
            nameColor: colorOfPdfList[colorIntData?.experience??colorInt].nameColor,
            materialColor: colorOfPdfList[colorIntData?.experience??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.experience??colorInt].pdfOfColor),
        certificate: OnSelectColorResume(
            id:  colorIntData?.certificate??colorInt,
            nameColor: colorOfPdfList[colorIntData?.certificate??colorInt].nameColor,
            materialColor: colorOfPdfList[colorIntData?.certificate??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.certificate??colorInt].pdfOfColor),
        skill: OnSelectColorResume(
            id: colorIntData?.skill??colorInt,
            nameColor: colorOfPdfList[colorIntData?.skill??colorInt].nameColor,
            materialColor: colorOfPdfList[colorIntData?.skill??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.skill??colorInt].pdfOfColor),
        language: OnSelectColorResume(
            id: colorIntData?.language??colorInt,
            nameColor: colorOfPdfList[colorIntData?.language??colorInt].nameColor,
            materialColor: colorOfPdfList[colorIntData?.language??colorInt].materialColor,
            pdfColor: colorOfPdfList[colorIntData?.language??colorInt].pdfOfColor),
      );
      isOnSelectClickResume = OnSelectClickResume(
        text: false ,
        name: false ,
        aboutMe:  false,
        position: false ,
        education:OnSelectClickEducationResume(hsc: false, bd: false, md: false, dd: false, hdd: false)  ,
        contact:  false,
        address:  false,
        experience: false ,
        certificate: false ,
        skill:  false,
        language: false, theme: false ,) ;
      isAddressValue =
          "${isPreViewResumeResponse.body?.data?.address?.number ?? ''} "
          "${isPreViewResumeResponse.body?.data?.address?.moo ?? ''} "
          " ${isPreViewResumeResponse.body?.data?.address?.soi ?? ''} "
          "${isPreViewResumeResponse.body?.data?.address?.road ?? ''} "
          "${isPreViewResumeResponse.body?.data?.address?.subdistrict ?? ''} "
          " ${isPreViewResumeResponse.body?.data?.address?.district ?? ''} "
          "${isPreViewResumeResponse.body?.data?.address?.province ?? ''} "
          " ${isPreViewResumeResponse.body?.data?.address?.zipcode ?? ''}";
    });

    print(jsonEncode(positionOnSelect));
  }

  @override
  Widget build(BuildContext context) {
    isPreViewResumeResponse = widget.isPreViewResumeResponse;
    String prefix = isPreViewResumeResponse.body?.data?.userinfo?.prefix ?? '';
    String showAll = isPreViewResumeResponse.body?.screeninfo?.showall?? '';
    String showSome = isPreViewResumeResponse.body?.screeninfo?.showsome?? '';
    String activityNot = isPreViewResumeResponse.body?.screeninfo?.activitynot?? '';
    String selectedNot = isPreViewResumeResponse.body?.screeninfo?.selectednot?? '';

    String btnResume2 = isPreViewResumeResponse.body?.screeninfo?.btnresume2?? '';    String name =
        isPreViewResumeResponse.body?.data?.userinfo?.name ?? 'ชื่อ -';
    String lastname =
        isPreViewResumeResponse.body?.data?.userinfo?.lastname ?? 'นามสกุล';

    Color? appBarBackgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
    Color? appBarForegroundColor =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (context) => const ContentDesignResumeEditScreen()),
                  //         (Route<dynamic> route) => false);
                  context.read<ResumeBloc>().add(SetOnSelectedAndPreviewResumeEvent(
                    pop:true,
                    positionOnSelect: positionOnSelect,
                    educationHSCOnSelect: educationHSCOnSelect,
                    educationBDOnSelect: educationBDOnSelect,
                    educationMDOnSelect: educationMDOnSelect,
                    educationDDOnSelect: educationDDOnSelect,
                    educationHDDOnSelect: educationHDDOnSelect,
                    socialOnSelect: socialOnSelect,
                    addressOnSelect: addressOnSelect,
                    experienceOnSelect: experienceOnSelect,
                    certificateOnSelect: certificateOnSelect,
                    skillOnSelect: skillOnSelect,
                    languageOnSelect: languageOnSelect,
                    sendOnSelectColorSet: sendOnSelectColorSet,
                  ));
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),

              // leading: Builder(
              //   builder: (BuildContext context) {
              //     return IconButton(
              //       icon: FaIcon(FontAwesomeIcons.bars,
              //           color: Theme.of(context).iconTheme.color, size: 20),
              //       onPressed: () {
              //         Scaffold.of(context).openDrawer();
              //       },
              //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              //     );
              //   },
              // ),

              title: Center(
                  child: Text(
                      isPreViewResumeResponse
                              .body?.screeninfo?.titlesetthemecolor ??
                          "Set Theme And Color",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).appBarTheme.foregroundColor))),
              // actions: [
              //   InkWell(
              //     onTap: () async {
              //       await setUserLanguageResume(
              //           isSelectLanguageThai == true ? "TH" : "EN");
              //       setState(() {
              //         isSelectLanguageThai = !isSelectLanguageThai;
              //         isSelectLanguageThai == true ? "TH" : "EN";
              //       });
              //       context
              //           .read<ResumeBloc>()
              //           .add(GetOnSelectedAndPreviewResumeEvent());
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Center(
              //           child: Text(isSelectLanguageThai == true ? "EN" : "TH",
              //               style: TextStyle(
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.w500,
              //                   color: Theme.of(context)
              //                       .appBarTheme
              //                       .foregroundColor))),
              //     ),
              //   ),
              // ]
          ),
          body: SafeArea(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Text(
                          isPreViewResumeResponse.body?.screeninfo?.pictuce ??
                              "Pictuce",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .appBarTheme
                                  .foregroundColor),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    //inner container

                                    height: 120, //height of inner container
                                    width:
                                        80, //width to 100% match to parent container.
                                    color: colorBoxDotted,

                                    child: Center(
                                        child: (widget.isPreViewResumeResponse
                                                        .body?.data?.image ==
                                                    '' ||
                                                widget.isPreViewResumeResponse
                                                        .body?.data?.image ==
                                                    null)
                                            ? Image.asset(
                                                "assets/profile.jpg",
                                                width: 600.0,
                                                height: 240.0,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.memory(
                                                (base64Decode(base64.normalize(
                                                    widget.isPreViewResumeResponse
                                                            .body?.data?.image ??
                                                        imageBase64))),
                                              )), //background color of inner container
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "   ${isPreViewResumeResponse.body?.screeninfo?.ratio ?? "The aspect ratio must be 3:4"} \n"
                                          "${isPreViewResumeResponse.body?.screeninfo?.sizepictuce ?? "The aspect ratio must be 3:4"} ",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .appBarTheme
                                              .foregroundColor),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Center(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.squareCheck,
                                            color:
                                            Theme.of(context).iconTheme.color,
                                            size: 20,
                                            shadows: <Shadow>[
                                              Shadow(
                                                  color: Colors.white,
                                                  blurRadius: 15.0)
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: SizedBox(
                                              width: 230,
                                              child: Text( " ${isPreViewResumeResponse.body?.screeninfo?.selecttheinformation ?? "Please select the information \nthat will be used to create a resume."} ",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context)
                                                        .appBarTheme
                                                        .foregroundColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Row(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Container(
                                  //       color: (materialColorOfPdfUsAbout ==
                                  //                   Colors.black &&
                                  //               materialColorOfPdfUsAbout ==
                                  //                   Colors.black)
                                  //           ? Colors.white
                                  //           : (materialColorOfPdfUsAbout ==
                                  //                       Colors.white &&
                                  //                   materialColorOfPdfUsAbout ==
                                  //                       Colors.white)
                                  //               ? Colors.black
                                  //               : Theme.of(context)
                                  //                   .scaffoldBackgroundColor,
                                  //       child: Icon(FontAwesomeIcons.droplet,
                                  //           size: 20,
                                  //           color: materialColorOfPdfUsAbout),
                                  //     ),
                                  //     Padding(
                                  //       padding: EdgeInsets.only(left: 5),
                                  //       child: Text(
                                  //         "${isPreViewResumeResponse.body?.screeninfo?.selecttheinformation ?? "Please select a color\n"
                                  //             "to use in creating a resume.\n"}  ",
                                  //         style: TextStyle(
                                  //             fontSize: 10,
                                  //             fontWeight: FontWeight.w500,
                                  //             color: Theme.of(context)
                                  //                 .appBarTheme
                                  //                 .foregroundColor),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  InkWell(
                                    onTap: () async {
                                      int? value = await showMenu<int>(
                                          context: context,
                                          position: RelativeRect.fromLTRB(
                                              0, 0, 0, 0),
                                          items: List.generate(
                                              sizeImageResume.length ?? 0,
                                                  (index) {
                                                return PopupMenuItem(
                                                  value: index,
                                                  child: Text(
                                                    "${sizeImageResume[index].sizePhoto} "
                                                        "${isPreViewResumeResponse.body?.screeninfo?.n ?? " N''"}  "
                                                        "${sizeImageResume[index].widthSizeCM} x ${sizeImageResume[index].heightSizeCM} "
                                                        "${isPreViewResumeResponse.body?.screeninfo?.whcm ?? " (w x h : cm)) "} ",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Theme.of(context)
                                                            .appBarTheme
                                                            .foregroundColor),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      sizePhoto =
                                                          sizeImageResume[index]
                                                              .sizePhoto;
                                                      widthSizeCM =
                                                          sizeImageResume[index]
                                                              .widthSizeCM;
                                                      heightSizeCM =
                                                          sizeImageResume[index]
                                                              .heightSizeCM;
                                                    });
                                                  },
                                                );
                                              }));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${isPreViewResumeResponse.body?.screeninfo?.select ?? "Select"}  ",
                                          style: TextStyle(
                                              decoration:
                                              TextDecoration.underline,
                                              decorationThickness: 2,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .appBarTheme
                                                  .foregroundColor),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            "${sizePhoto == 1.5 ? isPreViewResumeResponse.body?.screeninfo?.textdefault ?? "Default" : ''}${isPreViewResumeResponse.body?.screeninfo?.size ?? "size"}  : $sizePhoto "
                                                "${isPreViewResumeResponse.body?.screeninfo?.n ?? " N''"}  "
                                                " $widthSizeCM x $heightSizeCM ${isPreViewResumeResponse.body?.screeninfo?.whcm ?? " (w x h : cm)) "} ",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .appBarTheme
                                                    .foregroundColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: colorBoxDotted,
                    height: 5,
                    thickness: 5,
                    indent: 0,
                    endIndent: 0,
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.aboutme ??
                                "About me",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        buildDetailResumeCustomNotIconsReadOnly(
                            context: context,
                            detail:
                                "         ${isPreViewResumeResponse.body?.data?.aboutme ?? isPreViewResumeResponse.body?.screeninfo?.aboutme ?? "About me ..."}",
                            appBarForeGroundColor: appBarForegroundColor)
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.position ??
                                "ตำแหน่งที่สนใจ",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        buildPositionOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,

                          positionOnSelect: positionOnSelect,
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          positionData:
                          isPreViewResumeResponse.body?.data?.position ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.position,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.position = !isOnSelectClickResume.position;
                            });

                          },),
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.education ??
                                "การศึกษา",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        buildEducationOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          educationOnSelect: educationHSCOnSelect,
                          title:
                          isPreViewResumeResponse.body?.screeninfo?.hsc ??
                              "ระดับประกาศนียบัตรมัธยมศึกษาตอนปลาย",
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          educationData: isPreViewResumeResponse
                              .body?.data?.education?.hsc ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.education.hsc,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.education.hsc = !isOnSelectClickResume.education.hsc;
                            });

                          },
                        ),
                        buildEducationOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          educationOnSelect: educationBDOnSelect,
                          title: isPreViewResumeResponse.body?.screeninfo?.bd ??
                              "ระดับปริญญาตรี",
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          educationData: isPreViewResumeResponse
                              .body?.data?.education?.bd ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.education.bd,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.education.bd = !isOnSelectClickResume.education.bd;
                            });

                          },
                        ),
                        buildEducationOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          educationOnSelect: educationMDOnSelect,
                          title: isPreViewResumeResponse.body?.screeninfo?.md ??
                              "ระดับปริญญาโท",
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          educationData: isPreViewResumeResponse
                              .body?.data?.education?.md ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.education.md,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.education.md = !isOnSelectClickResume.education.md;
                            });

                          },
                        ),
                        buildEducationOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          educationOnSelect: educationDDOnSelect,
                          title: isPreViewResumeResponse.body?.screeninfo?.dd ??
                              "ระดับปริญญาเอก",
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          educationData: isPreViewResumeResponse
                              .body?.data?.education?.dd ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.education.dd,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.education.dd = !isOnSelectClickResume.education.dd;
                            });

                          },
                        ),
                        buildEducationOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          educationOnSelect: educationHDDOnSelect,
                          title:
                          isPreViewResumeResponse.body?.screeninfo?.hdd ??
                              "ระดับปริญญาดุษฎีบัณฑิตกิตติมศักดิ์",
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          educationData: isPreViewResumeResponse
                              .body?.data?.education?.hdd ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.education.hdd,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.education.hdd = !isOnSelectClickResume.education.hdd;
                            });

                          },
                        ),
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.contact ??
                                "ช่องทางการติดต่อ",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        BuildTextFormFieldUnLimitSocialCustomResume(
                            readOnly: true,
                            hintLabel: isPreViewResumeResponse
                                .body?.screeninfo?.email ??
                                "email",
                            initialvalue:
                            isPreViewResumeResponse
                                .body?.data?.contactinfo?.email  ==''?
                            ">> $activityNot <<":isPreViewResumeResponse
                                .body?.data?.contactinfo?.email  ??
                                ">> $activityNot <<",
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.envelope,
                            checkbox: Checkbox(
                              checkColor: Theme.of(context).primaryColor,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isPreViewResumeResponse
                                  .body?.data?.contactinfo?.email ==
                                  null
                                  ? false
                                  : socialOnSelect[0].onselect,
                              onChanged: (bool? value) {
                                if (
                                isPreViewResumeResponse.body?.data?.contactinfo?.email == ''||
                                    isPreViewResumeResponse.body?.data?.contactinfo?.email == null) {
                                  var textSnack =
                                      '$activityNot $selectedNot';
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(textSnack,
                                        style: const TextStyle(
                                            fontSize: sizeTextSmaller14,
                                            color: Colors.black)),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFFFFF9D1),
                                  ));
                                }
                                else {

                                  socialOnSelect[0].onselect = value!;

                                }
                                onChangedSetState();
                                if (kDebugMode) {
                                  print(value);
                                  print(socialOnSelect[0].onselect.toString());
                                  print(socialOnSelect[0]);
                                  print(jsonEncode(socialOnSelect[0]));
                                  print(jsonEncode(socialOnSelect));
                                }
                              },
                            )),
                        BuildTextFormFieldUnLimitSocialCustomResume(
                            readOnly: true,
                            hintLabel: isPreViewResumeResponse
                                .body?.screeninfo?.phone ??
                                "phone",
                            initialvalue:
                            isPreViewResumeResponse
                                .body?.data?.contactinfo?.phone  ==''?
                            ">> $activityNot <<":isPreViewResumeResponse
                                .body?.data?.contactinfo?.phone  ??
                                ">> $activityNot <<",
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.phone,
                            checkbox: Checkbox(
                              checkColor: Theme.of(context).primaryColor,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isPreViewResumeResponse
                                  .body?.data?.contactinfo?.phone ==
                                  null
                                  ? false
                                  : socialOnSelect[1].onselect,
                              onChanged: (bool? value) {
                                if (
                                isPreViewResumeResponse.body?.data?.contactinfo?.phone == ''||
                                    isPreViewResumeResponse.body?.data?.contactinfo?.phone == null) {
                                  var textSnack =
                                      '$activityNot $selectedNot';
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(textSnack,
                                        style: const TextStyle(
                                            fontSize: sizeTextSmaller14,
                                            color: Colors.black)),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFFFFF9D1),
                                  ));
                                }
                                else {

                                  socialOnSelect[1].onselect = value!;

                                }
                                onChangedSetState();
                                if (kDebugMode) {
                                  print(value);
                                  print(socialOnSelect[1].onselect.toString());
                                  print(socialOnSelect[1]);
                                  print(jsonEncode(socialOnSelect[1]));
                                  print(jsonEncode(socialOnSelect));
                                }
                              },
                            )),
                        BuildTextFormFieldUnLimitSocialCustomResume(
                            readOnly: true,
                            hintLabel: isPreViewResumeResponse
                                .body?.screeninfo?.facebook ??
                                "facebook",
                            initialvalue:
                            isPreViewResumeResponse
                                .body?.data?.contactinfo?.facebook  ==''?
                            ">> $activityNot <<":isPreViewResumeResponse
                                .body?.data?.contactinfo?.facebook  ??
                                ">> $activityNot <<",
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.facebook,
                            checkbox: Checkbox(
                              checkColor: Theme.of(context).primaryColor,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isPreViewResumeResponse
                                  .body?.data?.contactinfo?.facebook ==
                                  null
                                  ? false
                                  : socialOnSelect[2].onselect,
                              onChanged: (bool? value) {
                                if (
                                isPreViewResumeResponse.body?.data?.contactinfo?.facebook == ''||
                                    isPreViewResumeResponse.body?.data?.contactinfo?.facebook == null) {
                                  var textSnack =
                                      '$activityNot $selectedNot';
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(textSnack,
                                        style: const TextStyle(
                                            fontSize: sizeTextSmaller14,
                                            color: Colors.black)),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFFFFF9D1),
                                  ));
                                }
                                else {

                                  socialOnSelect[2].onselect = value!;

                                }
                                onChangedSetState();
                                if (kDebugMode) {
                                  print(value);
                                  print(socialOnSelect[2].onselect.toString());
                                  print(socialOnSelect[2]);
                                  print(jsonEncode(socialOnSelect[2]));
                                  print(jsonEncode(socialOnSelect));
                                }
                              },
                            )),
                        BuildTextFormFieldUnLimitSocialCustomResume(
                            readOnly: true,
                            hintLabel: isPreViewResumeResponse
                                .body?.screeninfo?.line ??
                                "line",
                            initialvalue:
                            isPreViewResumeResponse
                                .body?.data?.contactinfo?.line  ==''?
                            ">> $activityNot <<":isPreViewResumeResponse
                                .body?.data?.contactinfo?.line  ??
                                ">> $activityNot <<",
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.line,
                            checkbox: Checkbox(
                              checkColor: Theme.of(context).primaryColor,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isPreViewResumeResponse
                                  .body?.data?.contactinfo?.line ==
                                  null
                                  ? false
                                  : socialOnSelect[3].onselect,
                              onChanged: (bool? value) {
                                if (
                                isPreViewResumeResponse.body?.data?.contactinfo?.line == ''||
                                    isPreViewResumeResponse.body?.data?.contactinfo?.line == null) {
                                  var textSnack =
                                      '$activityNot $selectedNot';
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(textSnack,
                                        style: const TextStyle(
                                            fontSize: sizeTextSmaller14,
                                            color: Colors.black)),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFFFFF9D1),
                                  ));
                                }
                                else {

                                  socialOnSelect[3].onselect = value!;

                                }
                                onChangedSetState();
                                if (kDebugMode) {
                                  print(value);
                                  print(socialOnSelect[3].onselect.toString());
                                  print(socialOnSelect[3]);
                                  print(jsonEncode(socialOnSelect[3]));
                                  print(jsonEncode(socialOnSelect));
                                }
                              },
                            )),
                        BuildTextFormFieldUnLimitSocialCustomResume(
                            readOnly: true,
                            hintLabel: isPreViewResumeResponse
                                .body?.screeninfo?.instagram ??
                                "instagram",
                            initialvalue:
                            isPreViewResumeResponse
                                .body?.data?.contactinfo?.instagram  ==''?
                            ">> $activityNot <<":isPreViewResumeResponse
                                .body?.data?.contactinfo?.instagram  ??
                                ">> $activityNot <<",
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.instagram,
                            checkbox: Checkbox(
                              checkColor: Theme.of(context).primaryColor,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isPreViewResumeResponse
                                  .body?.data?.contactinfo?.instagram ==
                                  null
                                  ? false
                                  : socialOnSelect[4].onselect,
                              onChanged: (bool? value) {
                                if (
                                isPreViewResumeResponse.body?.data?.contactinfo?.instagram == ''||
                                    isPreViewResumeResponse.body?.data?.contactinfo?.instagram == null) {
                                  var textSnack =
                                      '$activityNot $selectedNot';
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(textSnack,
                                        style: const TextStyle(
                                            fontSize: sizeTextSmaller14,
                                            color: Colors.black)),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFFFFF9D1),
                                  ));
                                }
                                else {

                                  socialOnSelect[4].onselect = value!;

                                }
                                onChangedSetState();
                                if (kDebugMode) {
                                  print(value);
                                  print(socialOnSelect[4].onselect.toString());
                                  print(socialOnSelect[4]);
                                  print(jsonEncode(socialOnSelect[4]));
                                  print(jsonEncode(socialOnSelect));
                                }
                              },
                            )),
                        BuildTextFormFieldUnLimitSocialCustomResume(
                            readOnly: true,
                            hintLabel: isPreViewResumeResponse
                                .body?.screeninfo?.twitter ??
                                "twitter",
                            initialvalue:
                            isPreViewResumeResponse
                                .body?.data?.contactinfo?.twitter  ==''?
                            ">> $activityNot <<":isPreViewResumeResponse
                                .body?.data?.contactinfo?.twitter  ??
                                ">> $activityNot <<",
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.twitter,
                            checkbox: Checkbox(
                              checkColor: Theme.of(context).primaryColor,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isPreViewResumeResponse
                                  .body?.data?.contactinfo?.twitter ==
                                  null
                                  ? false
                                  : socialOnSelect[5].onselect,
                              onChanged: (bool? value) {
                                if (
                                isPreViewResumeResponse.body?.data?.contactinfo?.twitter == ''||
                                    isPreViewResumeResponse.body?.data?.contactinfo?.twitter == null) {
                                  var textSnack =
                                      '$activityNot $selectedNot';
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(textSnack,
                                        style: const TextStyle(
                                            fontSize: sizeTextSmaller14,
                                            color: Colors.black)),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFFFFF9D1),
                                  ));
                                }
                                else {

                                  socialOnSelect[5].onselect = value!;

                                }
                                onChangedSetState();
                                if (kDebugMode) {
                                  print(value);
                                  print(socialOnSelect[5].onselect.toString());
                                  print(socialOnSelect[5]);
                                  print(jsonEncode(socialOnSelect[5]));
                                  print(jsonEncode(socialOnSelect));
                                }
                              },
                            )),
                        BuildTextFormFieldUnLimitSocialCustomResume(
                            readOnly: true,
                            hintLabel: isPreViewResumeResponse
                                .body?.screeninfo?.youtube ??
                                "youtube",
                            initialvalue:
                            isPreViewResumeResponse
                                .body?.data?.contactinfo?.youtube  ==''?
                            ">> $activityNot <<":isPreViewResumeResponse
                                .body?.data?.contactinfo?.youtube  ??
                                ">> $activityNot <<",
                            textInputType: TextInputType.text,
                            // iconsFile : Icons.person_rounded,
                            iconsFile: FontAwesomeIcons.youtube,
                            checkbox: Checkbox(
                              checkColor: Theme.of(context).primaryColor,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isPreViewResumeResponse
                                  .body?.data?.contactinfo?.youtube ==
                                  null
                                  ? false
                                  : socialOnSelect[6].onselect,
                              onChanged: (bool? value) {
                                if (
                                isPreViewResumeResponse.body?.data?.contactinfo?.youtube == ''||
                                    isPreViewResumeResponse.body?.data?.contactinfo?.youtube == null) {
                                  var textSnack =
                                      '$activityNot $selectedNot';
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(textSnack,
                                        style: const TextStyle(
                                            fontSize: sizeTextSmaller14,
                                            color: Colors.black)),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor:
                                    const Color(0xFFFFF9D1),
                                  ));
                                }
                                else {

                                  socialOnSelect[6].onselect = value!;

                                }
                                onChangedSetState();
                                if (kDebugMode) {
                                  print(value);
                                  print(socialOnSelect[6].onselect.toString());
                                  print(socialOnSelect[6]);
                                  print(jsonEncode(socialOnSelect[6]));
                                  print(jsonEncode(socialOnSelect));
                                }
                              },
                            )),
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.address ??
                                "ที่อยู่ปัจจุบัน",
                            isPreViewResumeEditData: "",
                            ontap: () {}),
                        Column(
                          children: [
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.number ??
                                    "บ้านเลขที่",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.address?.number ==''?
                                ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.number ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.solidMap,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse
                                      .body?.data?.address?.number ==
                                      null
                                      ? false
                                      : addressOnSelect[0].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.number == ''||
                                        isPreViewResumeResponse.body?.data?.address?.number == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[0].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[0].onselect.toString());
                                      print(addressOnSelect[0]);
                                      print(jsonEncode(addressOnSelect[0]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.moo ??
                                    "หมู่",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.address?.moo ==''?
                                ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.moo ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.signsPost,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse
                                      .body?.data?.address?.moo ==
                                      null
                                      ? false
                                      : addressOnSelect[1].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.moo == ''||
                                        isPreViewResumeResponse.body?.data?.address?.moo == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[1].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[1].onselect.toString());
                                      print(addressOnSelect[1]);
                                      print(jsonEncode(addressOnSelect[1]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.soi ??
                                    "ซอย",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.address?.soi ==''?
                                ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.soi ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.trafficLight,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse
                                      .body?.data?.address?.soi ==
                                      null
                                      ? false
                                      : addressOnSelect[2].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.soi == ''||
                                    isPreViewResumeResponse.body?.data?.address?.soi == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[2].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[2].onselect.toString());
                                      print(addressOnSelect[2]);
                                      print(jsonEncode(addressOnSelect[2]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.road ??
                                    "ถนน",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.address?.road ==''?
                                ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.road ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.road,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse
                                      .body?.data?.address?.road ==
                                      null
                                      ? false
                                      : addressOnSelect[3].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.road == ''||
                                    isPreViewResumeResponse.body?.data?.address?.road == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[3].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[3].onselect.toString());
                                      print(addressOnSelect[3]);
                                      print(jsonEncode(addressOnSelect[3]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.subdistrict ??
                                    "ตำบล",
                                initialvalue:isPreViewResumeResponse
                                    .body?.data?.address?.subdistrict ==''?
                                ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.subdistrict ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.treeCity,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse.body?.data
                                      ?.address?.subdistrict ==
                                      null
                                      ? false
                                      : addressOnSelect[4].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.subdistrict == ''||
                                        isPreViewResumeResponse.body?.data?.address?.subdistrict == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[4].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[4].onselect.toString());
                                      print(addressOnSelect[4]);
                                      print(jsonEncode(addressOnSelect[4]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.district ??
                                    "อำเภอ",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.address?.district ==''?
                                ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.district ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.city,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse
                                      .body?.data?.address?.district ==
                                      null
                                      ? false
                                      : addressOnSelect[5].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.district == ''||
                                        isPreViewResumeResponse.body?.data?.address?.district == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[5].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[5].onselect.toString());
                                      print(addressOnSelect[5]);
                                      print(jsonEncode(addressOnSelect[5]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.province ??
                                    "จังหวัด",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.address?.province ==''?
                                ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.province ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.earthAsia,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse
                                      .body?.data?.address?.province ==
                                      null
                                      ? false
                                      : addressOnSelect[6].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.province == ''||
                                        isPreViewResumeResponse.body?.data?.address?.province == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[6].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[6].onselect.toString());
                                      print(addressOnSelect[6]);
                                      print(jsonEncode(addressOnSelect[6]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                            BuildTextFormFieldUnLimitSocialCustomResume(
                                readOnly: true,
                                hintLabel: isPreViewResumeResponse
                                    .body?.screeninfo?.zipcode ??
                                    "รหัสไปรษณีย์",
                                initialvalue: isPreViewResumeResponse
                                    .body?.data?.address?.zipcode ==''?
                                    ">> $activityNot <<":isPreViewResumeResponse
                                    .body?.data?.address?.zipcode ??
                                    ">> $activityNot <<",
                                textInputType: TextInputType.text,
                                // iconsFile : Icons.person_rounded,
                                iconsFile: FontAwesomeIcons.mapPin,
                                checkbox: Checkbox(
                                  checkColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isPreViewResumeResponse
                                      .body?.data?.address?.zipcode ==
                                      null
                                      ? false
                                      : addressOnSelect[7].onselect,
                                  onChanged: (bool? value) {
                                    if (
                                    isPreViewResumeResponse.body?.data?.address?.zipcode == ''||
                                        isPreViewResumeResponse.body?.data?.address?.zipcode == null) {
                                      var textSnack =
                                          '$activityNot $selectedNot';
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(textSnack,
                                            style: const TextStyle(
                                                fontSize: sizeTextSmaller14,
                                                color: Colors.black)),
                                        duration: const Duration(seconds: 1),
                                        backgroundColor:
                                        const Color(0xFFFFF9D1),
                                      ));
                                    }
                                    else {

                                      addressOnSelect[7].onselect = value!;

                                    }
                                    onChangedSetState();
                                    if (kDebugMode) {
                                      print(value);
                                      print(
                                          addressOnSelect[7].onselect.toString());
                                      print(addressOnSelect[7]);
                                      print(jsonEncode(addressOnSelect[7]));
                                      print(jsonEncode(addressOnSelect));
                                    }
                                  },
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.experience ??
                                "ประสบการการทำงาน",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        buildExperienceOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          experienceOnSelect: experienceOnSelect,
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          experienceData: isPreViewResumeResponse
                              .body?.data?.experience ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.experience,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.experience = !isOnSelectClickResume.experience;
                            });

                          },
                        ),
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.certificate ??
                                "ใบรับรอง",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        buildCertificateOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          certificateOnSelect: certificateOnSelect,
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          certificateData: isPreViewResumeResponse
                              .body?.data?.certificate ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.certificate,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.certificate = !isOnSelectClickResume.certificate;
                            });

                          },
                        ),
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.skill ??
                                "ทักษะความสามารถ",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        buildSkillOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          skillOnSelect: skillOnSelect,
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          skillData:
                          isPreViewResumeResponse.body?.data?.skill ?? [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.skill,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.skill = !isOnSelectClickResume.skill;
                            });

                          },
                        ),
                      ],
                    ),
                  ),
                  spaceGap(gap),
                  Card(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    child: Column(
                      children: [
                        buildTitleEditDataResume(
                            context: context,
                            isPreViewResumeTitle: isPreViewResumeResponse
                                    .body?.screeninfo?.language ??
                                "ทักษะทางภาษา",
                            isPreViewResumeEditData: '',
                            ontap: () {}),
                        buildLanguageOnSelectCard(
                          activityNot:activityNot,
                          showSome:showSome,
                          showAll: showAll,
                          languageOnSelect: languageOnSelect,
                          context: context,
                          getColor: getColor,
                          onChangedSetState: onChangedSetState,
                          languageData:
                          isPreViewResumeResponse.body?.data?.language ??
                              [],
                          appBarForegroundColor: appBarForegroundColor,
                          returnResumeEdit: () {},
                          boolClick: isOnSelectClickResume.language,
                          onTap: () {
                            setState(() {
                              isOnSelectClickResume.language = !isOnSelectClickResume.language;
                            });

                          },
                        ),
                      ],
                    ),
                  ),
                  spaceGap(gap*20),
                  // Container(
                  //   child: ButtonIconsCustomLimit(
                  //     label: isPreViewResumeResponse.body?.screenInfo?.saveor ??
                  //         " Delete/ลบ",
                  //     buttonIcons: Icon(
                  //       FontAwesomeIcons.trashCan,
                  //       color: bcButtonDelete.withOpacity(0.8),
                  //       size: 20.0,
                  //     ),
                  //     colortext: bcButtonDelete.withOpacity(0.8),
                  //     colorbutton: Theme.of(context).scaffoldBackgroundColor,
                  //     sizetext: 14,
                  //     colorborder: bcButtonDelete.withOpacity(0.8),
                  //     sizeborder: 3,
                  //     onPressed: () {
                  //       context
                  //           .read<ResumeBloc>()
                  //           .add(SetOnSelectedAndPreviewResumeEvent(
                  //             positionOnSelect: positionOnSelect,
                  //             educationHSCOnSelect: educationHSCOnSelect,
                  //             educationBDOnSelect: educationBDOnSelect,
                  //             educationMDOnSelect: educationMDOnSelect,
                  //             educationDDOnSelect: educationDDOnSelect,
                  //             educationHDDOnSelect: educationHDDOnSelect,
                  //             socialOnSelect: socialOnSelect,
                  //             addressOnSelect: addressOnSelect,
                  //             experienceOnSelect: experienceOnSelect,
                  //             certificateOnSelect: certificateOnSelect,
                  //             skillOnSelect: skillOnSelect,
                  //             languageOnSelect: languageOnSelect,
                  //           ));
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          )),
          floatingActionButton: floatingGeneratePDFAndSaveData(
            context: context,
            setState,
            btnResume2,
            isPreViewResumeResponse.body?.screeninfo?.saveor ??
                "Save/บันทึก",
            colorOfPdfUsButtonTitle: onSelectColorSet.theme.pdfColor ,
            colorOfPdfUsName:  onSelectColorSet.name.pdfColor ,
            colorOfPdfUsPosition:  onSelectColorSet.position.pdfColor ,
            colorOfPdfUsExperience:  onSelectColorSet.experience.pdfColor ,
            colorOfPdfUsEducations:  onSelectColorSet.education.pdfColor ,
            colorOfPdfUsContact:  onSelectColorSet.contact.pdfColor ,
            colorOfPdfUsCertifications:  onSelectColorSet.certificate.pdfColor ,
            colorOfPdfUsSkills:  onSelectColorSet.skill.pdfColor ,
            colorOfPdfUsAbout:  onSelectColorSet.aboutMe.pdfColor ,
            colorOfPdfUsText:  onSelectColorSet.text.pdfColor ,
            colorOfPdfUsTheme:  onSelectColorSet.theme.pdfColor ,
            widthSizeCM: widthSizeCM,
            heightSizeCM: heightSizeCM,
            isPreViewResumeResponse: isPreViewResumeResponse,
            positionOnSelect: positionOnSelect,
            educationHSCOnSelect: educationHSCOnSelect,
            educationBDOnSelect: educationBDOnSelect,
            educationMDOnSelect: educationMDOnSelect,
            educationDDOnSelect: educationDDOnSelect,
            educationHDDOnSelect: educationHDDOnSelect,
            socialOnSelect: socialOnSelect,
            addressOnSelect: addressOnSelect,
            experienceOnSelect: experienceOnSelect,
            certificateOnSelect: certificateOnSelect,
            skillOnSelect: skillOnSelect,
            languageOnSelect: languageOnSelect,
            sendOnSelectColorSet: sendOnSelectColorSet,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
        ));
  }
}

selectColorViewPdf(
  setState, {
  required BuildContext context,
  required PdfColor colorOfPdfUs,
}) {
  return PopupMenuButton(
    child: Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(
          FontAwesomeIcons.filter,
          size: 20,
          color: Theme.of(context).bottomAppBarColor,
        ),
      ),
    ),
    itemBuilder: (context) {
      return List.generate(colorOfPdfList.length ?? 0, (index) {
        return PopupMenuItem(
          value: colorOfPdfList[index].pdfOfColor,
          child: Text(
            "${colorOfPdfList[index].nameColor}",
            style: TextStyle(
                fontSize: 20,
                color: (colorOfPdfList[index].materialColor == Colors.black) ||
                        (colorOfPdfList[index].materialColor == Colors.white)
                    ? Theme.of(context).appBarTheme.foregroundColor
                    : colorOfPdfList[index].materialColor),
          ),
        );
      });
    },
    onSelected: (value) {
      colorOfPdfUs = colorOfPdfList[6].pdfOfColor;
      setState(() {});
    },
  );
}
