// import 'dart:convert';
// import 'dart:io' show File;
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pdf/pdf.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../customs/button/button_custom.dart';
// import '../../customs/color/color_const.dart';
// import '../../customs/color/pdf_color_const.dart';
// import 'package:dotted_border/dotted_border.dart';
// import '../../customs/dialog/dialog_widget.dart';
// import '../../customs/image_base_64.dart';
// import '../../customs/message/text_button.dart';
// import '../../customs/message/text_error.dart';
// import '../../customs/progress_dialog.dart';
// import '../../customs/size/gap.dart';
// import '../../customs/size/size.dart';
// import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
// import '../bloc_resume/resume_bloc.dart';
// import '../../module/login/screen/login_screen/login_screen.dart';
// import '../../utils/shared_preferences.dart';
// import '../app.dart';
// import '../components/components_resume.dart';
// import '../model/response/pre_view_resume_response.dart';
// import 'content_design_resume_edit.dart';
//
// class ContentDesignResumeScreen extends StatelessWidget {
//   const ContentDesignResumeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) =>
//             ResumeBloc()..add(GetOnSelectedAndPreviewResumeEvent()),
//         child: const ContentDesignResume());
//   }
// }
//
// class ContentDesignResume extends StatefulWidget {
//   const ContentDesignResume({Key? key}) : super(key: key);
//
//   @override
//   State<ContentDesignResume> createState() => _ContentDesignResumeState();
// }
//
// class _ContentDesignResumeState extends State<ContentDesignResume>
//     with ProgressDialog {
//   late SharedPreferences prefs;
//   late String _userLanguage;
//   late String textSessionExpired;
//   late String textSubSessionExpired;
//   late String _buttonOk;
//   late String isPhotoResume;
//
//   late PreViewResumeResponse _preViewResumeResponse;
//
//   @override
//   void initState() {
//     _isSessionUnauthorized();
//
//     super.initState();
//   }
//
//   Future<void> _isSessionUnauthorized() async {
//     prefs = await SharedPreferences.getInstance();
//     _userLanguage = prefs.getString('userLanguage') ?? 'TH';
//     _userLanguage = prefs.getString('userLanguage') ?? 'TH';
//
//     textSessionExpired =
//         _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
//     textSubSessionExpired =
//         _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
//     _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ResumeBloc, ResumeState>(
//       listener: (context, state) {
//         if (state is PreviewResumeLoading) {
//           showProgressDialog(context);
//         }
//         if (state is PreviewResumeEndLoading) {
//           hideProgressDialog(context);
//         }
//         if (state is OnSelectedAndPreviewResumeSuccessState) {
//           _preViewResumeResponse = state.isPreViewResumeResponse;
//           BodyPreviewResume(
//             isPreViewResumeResponse: _preViewResumeResponse,
//           );
//         }
//         if (state is PreviewResumeError) {
//           if (state.errorMessage.toString() == 'Unauthorized') {
//             dialogSessionExpiredOneBtn(
//                 context, textSessionExpired, textSubSessionExpired, _buttonOk,
//                 onClickBtn: () {
//               cleanDelete();
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => const LoginScreen()));
//             });
//           } else {
//             dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
//                 onClickBtn: () {
//               Navigator.of(context).pop();
//             });
//           }
//         }
//         if (state is SetOnSelectedAndPreviewResumeEvent) {
//           context.read<ResumeBloc>().add(GetOnSelectedAndPreviewResumeEvent());
//         }
//       },
//       builder: (context, state) {
//         if (state is OnSelectedAndPreviewResumeSuccessState) {
//           _preViewResumeResponse = state.isPreViewResumeResponse;
//           return BodyPreviewResume(
//             isPreViewResumeResponse: _preViewResumeResponse,
//           );
//         } else {
//           return Container();
//         }
//       },
//       buildWhen: (context, state) {
//         return state is OnSelectedAndPreviewResumeSuccessState;
//       },
//     );
//   }
// }
//
// class BodyPreviewResume extends StatefulWidget {
//   final PreViewResumeResponse isPreViewResumeResponse;
//   const BodyPreviewResume({Key? key, required this.isPreViewResumeResponse})
//       : super(key: key);
//
//   @override
//   State<BodyPreviewResume> createState() => _BodyPreviewResumeState();
// }
//
// class _BodyPreviewResumeState extends State<BodyPreviewResume> {
//   late PreViewResumeResponse isPreViewResumeResponse;
//   bool isSelectLanguageThai = true;
//   int colorInt = 8;
//   late double sizePhoto = 1.5;
//   late double widthSizeCM = 3.00;
//   late double heightSizeCM = 4.00;
//   late PdfColor colorOfPdfUsTheme = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsTheme = colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsButtonTitle = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsButtonTitle =
//       colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsName = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsName = colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsPosition = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsPosition =
//       colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsExperience = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsExperience =
//       colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsCertifications =
//       colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsCertifications =
//       colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsSkills = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsSkills =
//       colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsAbout = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsAbout = colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsText = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsText = colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsEducations = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsEducations =
//       colorOfPdfList[colorInt].materialColor;
//   late PdfColor colorOfPdfUsContact = colorOfPdfList[colorInt].pdfOfColor;
//   late Color materialColorOfPdfUsContact =
//       colorOfPdfList[colorInt].materialColor;
//
//   File? image;
//   String? base64img;
//   String isPhotoResume =
//       "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAAXNSR0IArs4c6QAAA1lJREFUeF7t3GtyqkAQBWBchmzD/e8Al6Euw1tTKXONAvPqxzlD8ydUAtM954PBoiqelmV5ns/nKTb/BB6Px3S63W7PtHO5XPw7OnAH1+t1muf5ByTtpF8Eis8V8cr+9w5JIGkLFHuQ98y/QALFFuTzBlgFCRQblLXVaBMkUHRRth4NuyCBooOy95zOggSKLEruQ1MRSKDIoOQwUpVikEDpQynBqAYJlDaUUowmkECpQ6nBaAYJlDKUWowukEDZR2nB6AYJlHWUVgwRkED5i9KDIQYSKD8ovRiiIFINlT0u8Y6SwBAHOSqKFIYKyNFQJDHUQI6CIo2hCjI6igaGOsioKFoYJiCjoWhimIGMgqKNYQrCjmKBYQ7CimKF4QLChmKJ4QbCgmKN4QqCjuKB4Q6CiuKFAQGChuKJAQOCguKNAQXijYKAAQfihYKCAQlijYKEAQtihYKGAQ2ijYKIAQ+ihYKKQQEijYKMQQMihYKOQQXSi8KAQQfSisKCQQlSi8KEQQtSisKGQQ2SQ2HEoAfZQmHFGALkE4UZYxiQF0r6yf71UlX/p54mjLqlOyNAQHTel6lYspxR1gCYUaiXrL3gWVFoQUoCLznG+Qb/Kk8JUhN0zbEIOHQgLQG3nOOFQwXSE2zPuZY4NCASgUqMoY1DASIZpORYGjjwIBoBaowphQMNohmc5tg9OLAgFoFZ1KjFgQSxDMqyVgkOHIhHQB41t3CgQDyD8az9jgMDghAIQg8QIAhBvK5S717cQbwDWFvLPXtyBfGceO4Tj1dvbiBeE85BvP/do0cXEI+J1kB4opiDMGF4POhNQRgxrFHMQJgxLFFMQEbAsEJRBxkJwwJFFWREDG0UNZCRMTRRVECOgKGFIg5yJAwNFFGQI2JIo4iBHBlDEkUEJDD+v/3qzaIbpLeB1pd+yOf1ZNIF0lMYOVCJ3lqzaQZpLSgxWZYxWjJqAmkpxBKidJ+1WVWD1BaQniDjeDWZVYHUDMwYnGbPpdkVg5QOqDkp9rFLMiwCKRmIPSyr/nNZZkFyA1hNZKQ6e5nuggSG3mWwle0mSGDoYey9+1oFCQx9jC2UL5DAsMNYQ/kDEhj2GJ8ovyBph/3Lv/zilKmcboh5nqfTsizPtBObfwL3+336B07+3Sny7gNQAAAAAElFTkSuQmCC";
//   Color getColor(Set<MaterialState> states) {
//     const Set<MaterialState> interactiveStates = <MaterialState>{
//       MaterialState.pressed,
//       MaterialState.hovered,
//       MaterialState.focused,
//     };
//     if (states.any(interactiveStates.contains)) {
//       return Colors.blue;
//     }
//     return Theme.of(context).bottomAppBarColor;
//   }
//
//   late SharedPreferences prefs;
//   late String _userLanguage;
//   late String textSessionExpired;
//   late String textSubSessionExpired;
//   late String _buttonOk;
//   late String isAddressValue;
//   late List<OnSelect> positionOnSelect = [];
//   late List<OnSelect> educationHSCOnSelect = [];
//   late List<OnSelect> educationBDOnSelect = [];
//   late List<OnSelect> educationMDOnSelect = [];
//   late List<OnSelect> educationDDOnSelect = [];
//   late List<OnSelect> educationHDDOnSelect = [];
//   late List<OnSelect> socialOnSelect = [];
//   late List<OnSelect> addressOnSelect = [];
//   late List<OnSelect> experienceOnSelect = [];
//   late List<OnSelect> certificateOnSelect = [];
//   late List<OnSelect> skillOnSelect = [];
//   late List<OnSelect> languageOnSelect = [];
//   double gap = 5.0;
//   Future<void> _isSelectLanguageThai() async {
//     prefs = await SharedPreferences.getInstance();
//     isSelectLanguageThai =
//         (prefs.getString('ResumePhoto') ?? '') == 'EN' ? false : true;
//     setState(() {});
//   }
//
//   onChangedSetState() {
//     setState(() {});
//   }
//
//   Future<void> _isSessionUnauthorized() async {
//     prefs = await SharedPreferences.getInstance();
//     _userLanguage = prefs.getString('userLanguage') ?? 'TH';
//     textSessionExpired =
//         _userLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
//     textSubSessionExpired =
//         _userLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
//     _buttonOk = _userLanguage == 'EN' ? buttonOkEN : buttonOkTH;
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     _isSelectLanguageThai();
//     _isSessionUnauthorized();
//     isPreViewResumeResponse = widget.isPreViewResumeResponse;
//     positionOnSelectSet();
//     isAddressValue = '';
//     super.initState();
//   }
//
//   positionOnSelectSet() {
//     print(jsonEncode(isPreViewResumeResponse.body?.data?.position?.length));
//     print(jsonEncode(isPreViewResumeResponse.body?.data?.position));
//     // print(jsonEncode(_isGetOnSelectedResume.body?.dataOnSelect?.positionOnSelect?.length));
//     // print(jsonEncode(_isGetOnSelectedResume.body?.dataOnSelect?.positionOnSelect));
//     setState(() {
//       isPreViewResumeResponse.body?.data?.position?.forEach((element) {
//         positionOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//
//       isPreViewResumeResponse.body?.data?.experience?.forEach((element) {
//         experienceOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//
//       isPreViewResumeResponse.body?.data?.certificate?.forEach((element) {
//         certificateOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//
//       isPreViewResumeResponse.body?.data?.skill?.forEach((element) {
//         skillOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//
//       isPreViewResumeResponse.body?.data?.language?.forEach((element) {
//         languageOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//
//       isPreViewResumeResponse.body?.data?.education?.hsc?.forEach((element) {
//         educationHSCOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//       isPreViewResumeResponse.body?.data?.education?.bd?.forEach((element) {
//         educationBDOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//       isPreViewResumeResponse.body?.data?.education?.md?.forEach((element) {
//         educationMDOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//       isPreViewResumeResponse.body?.data?.education?.dd?.forEach((element) {
//         educationDDOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//       isPreViewResumeResponse.body?.data?.education?.hdd?.forEach((element) {
//         educationHDDOnSelect.add(
//             OnSelect(id: element.id ?? 0, onselect: element.onselect ?? true));
//       });
//       var varSocialOnSelect = isPreViewResumeResponse.body?.data?.contactinfo;
//       socialOnSelect = [
//         OnSelect(id: 1, onselect: varSocialOnSelect?.onselectedEmail ?? false),
//         OnSelect(id: 2, onselect: varSocialOnSelect?.onselectedPhone ?? false),
//         OnSelect(
//             id: 3, onselect: varSocialOnSelect?.onselectedFacebook ?? false),
//         OnSelect(id: 4, onselect: varSocialOnSelect?.onselectedLine ?? false),
//         OnSelect(
//             id: 5, onselect: varSocialOnSelect?.onselectedInstagram ?? false),
//         OnSelect(
//             id: 6, onselect: varSocialOnSelect?.onselectedTwitter ?? false),
//         OnSelect(
//             id: 7, onselect: varSocialOnSelect?.onselectedYoutube ?? false),
//       ];
//       var varAddressOnSelect = isPreViewResumeResponse.body?.data?.address;
//       addressOnSelect = [
//         OnSelect(
//             id: 1, onselect: varAddressOnSelect?.onselectedNumber ?? false),
//         OnSelect(id: 2, onselect: varAddressOnSelect?.onselectedMoo ?? false),
//         OnSelect(id: 3, onselect: varAddressOnSelect?.onselectedSoi ?? false),
//         OnSelect(id: 4, onselect: varAddressOnSelect?.onselectedRoad ?? false),
//         OnSelect(
//             id: 5,
//             onselect: varAddressOnSelect?.onselectedSubdistrict ?? false),
//         OnSelect(
//             id: 5, onselect: varAddressOnSelect?.onselectedDistrict ?? false),
//         OnSelect(
//             id: 6, onselect: varAddressOnSelect?.onselectedProvince ?? false),
//         OnSelect(
//             id: 7, onselect: varAddressOnSelect?.onselectedZipcode ?? false),
//       ];
//       // _isGetOnSelectedResume.body?.dataOnSelect?.socialOnSelect?.hddOnSelect?.forEach((element) {
//       //   socialOnSelect.add(OnSelect(id:element.id??0,onselect:element.onselect??true));
//       // }) ;
//
//       isAddressValue =
//           "${isPreViewResumeResponse.body?.data?.address?.number ?? ''} "
//           "${isPreViewResumeResponse.body?.data?.address?.moo ?? ''} "
//           " ${isPreViewResumeResponse.body?.data?.address?.soi ?? ''} "
//           "${isPreViewResumeResponse.body?.data?.address?.road ?? ''} "
//           "${isPreViewResumeResponse.body?.data?.address?.subdistrict ?? ''} "
//           " ${isPreViewResumeResponse.body?.data?.address?.district ?? ''} "
//           "${isPreViewResumeResponse.body?.data?.address?.province ?? ''} "
//           " ${isPreViewResumeResponse.body?.data?.address?.zipcode ?? ''}";
//     });
//
//     print(jsonEncode(positionOnSelect));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     isPreViewResumeResponse = widget.isPreViewResumeResponse;
//     String prefix = isPreViewResumeResponse.body?.data?.userinfo?.prefix ?? '';
//     String name =
//         isPreViewResumeResponse.body?.data?.userinfo?.name ?? 'ชื่อ -';
//     String lastname =
//         isPreViewResumeResponse.body?.data?.userinfo?.lastname ?? 'นามสกุล';
//
//     Color? appBarBackgroundColor =
//         Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
//     Color? appBarForegroundColor =
//         Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
//     return WillPopScope(
//         onWillPop: () async {
//           return false;
//         },
//         child: Scaffold(
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           appBar: AppBar(
//               backgroundColor: Theme.of(context).primaryColor,
//               elevation: 0,
//               leading: IconButton(
//                 onPressed: () {
//                   // Navigator.pop(context);
//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(
//                           builder: (context) => const ContentDesignResumeEditScreen()),
//                           (Route<dynamic> route) => false);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back,
//                   size: sizeTitle24,
//                   color: Theme.of(context).appBarTheme.foregroundColor,
//                 ),
//               ),
//
//               // leading: Builder(
//               //   builder: (BuildContext context) {
//               //     return IconButton(
//               //       icon: FaIcon(FontAwesomeIcons.bars,
//               //           color: Theme.of(context).iconTheme.color, size: 20),
//               //       onPressed: () {
//               //         Scaffold.of(context).openDrawer();
//               //       },
//               //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//               //     );
//               //   },
//               // ),
//
//               title: Center(
//                   child: Text(
//                       isPreViewResumeResponse
//                               .body?.screenInfo?.titlesetthemecolor ??
//                           "Set Theme And Color",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color:
//                               Theme.of(context).appBarTheme.foregroundColor))),
//               // actions: [
//               //   InkWell(
//               //     onTap: () async {
//               //       await setUserLanguageResume(
//               //           isSelectLanguageThai == true ? "TH" : "EN");
//               //       setState(() {
//               //         isSelectLanguageThai = !isSelectLanguageThai;
//               //         isSelectLanguageThai == true ? "TH" : "EN";
//               //       });
//               //       context
//               //           .read<ResumeBloc>()
//               //           .add(GetOnSelectedAndPreviewResumeEvent());
//               //     },
//               //     child: Padding(
//               //       padding: const EdgeInsets.all(8.0),
//               //       child: Center(
//               //           child: Text(isSelectLanguageThai == true ? "EN" : "TH",
//               //               style: TextStyle(
//               //                   fontSize: 12,
//               //                   fontWeight: FontWeight.w500,
//               //                   color: Theme.of(context)
//               //                       .appBarTheme
//               //                       .foregroundColor))),
//               //     ),
//               //   ),
//               // ]
//           ),
//           body: SafeArea(
//               child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           GestureDetector(
//                               onTap: () async {
//                                 await showMenu<int>(
//                                     context: context,
//                                     position: RelativeRect.fromLTRB(0, 0, 0, 0),
//                                     items: List.generate(
//                                         colorOfPdfList.length ?? 0, (index) {
//                                       return PopupMenuItem(
//                                         value: index,
//                                         child: Text(
//                                           "${colorOfPdfList[index].nameColor}",
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               color: (colorOfPdfList[index]
//                                                               .materialColor ==
//                                                           Colors.black) ||
//                                                       (colorOfPdfList[index]
//                                                               .materialColor ==
//                                                           Colors.white)
//                                                   ? Theme.of(context)
//                                                       .appBarTheme
//                                                       .foregroundColor
//                                                   : colorOfPdfList[index]
//                                                       .materialColor),
//                                         ),
//                                         onTap: () {
//                                           setState(() {
//                                             materialColorOfPdfUsTheme =
//                                                 colorOfPdfList[index]
//                                                     .materialColor;
//                                             // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
//                                             //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
//                                             // }
//                                             colorOfPdfUsTheme =
//                                                 colorOfPdfList[index]
//                                                     .pdfOfColor;
//                                           });
//                                         },
//                                       );
//                                     }));
//                               },
//                               child: Container(
//                                 color: (materialColorOfPdfUsTheme ==
//                                             Colors.black &&
//                                         materialColorOfPdfUsTheme ==
//                                             Colors.black)
//                                     ? Colors.white
//                                     : (materialColorOfPdfUsTheme ==
//                                                 Colors.white &&
//                                             materialColorOfPdfUsTheme ==
//                                                 Colors.white)
//                                         ? Colors.black
//                                         : Theme.of(context)
//                                             .scaffoldBackgroundColor,
//                                 child: Icon(FontAwesomeIcons.droplet,
//                                     size: 20, color: materialColorOfPdfUsTheme),
//                               )),
//                           Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text(
//                               isPreViewResumeResponse
//                                       .body?.screenInfo?.themecolor ??
//                                   "Theme Color",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                   color: Theme.of(context)
//                                       .appBarTheme
//                                       .foregroundColor),
//                             ),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const ContentDesignResumeEditScreen()),
//                                 );
//                               },
//                               child: Container(
//                                   color: (materialColorOfPdfUsTheme ==
//                                               Colors.black &&
//                                           materialColorOfPdfUsTheme ==
//                                               Colors.black)
//                                       ? Colors.white
//                                       : (materialColorOfPdfUsTheme ==
//                                                   Colors.white &&
//                                               materialColorOfPdfUsTheme ==
//                                                   Colors.white)
//                                           ? Colors.black
//                                           : Theme.of(context)
//                                               .scaffoldBackgroundColor,
//                                   child: Row(
//                                     children: [
//                                       Icon(FontAwesomeIcons.pen,
//                                           size: 12,
//                                           color: materialColorOfPdfUsTheme),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 10),
//                                         child: Text(
//                                           isPreViewResumeResponse
//                                                   .body
//                                                   ?.screenInfo
//                                                   ?.editinfomations ??
//                                               "Edit Information",
//                                           style: TextStyle(
//                                               decoration:
//                                                   TextDecoration.underline,
//                                               decorationThickness: 2,
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w500,
//                                               color: Theme.of(context)
//                                                   .appBarTheme
//                                                   .foregroundColor),
//                                         ),
//                                       )
//                                     ],
//                                   ))),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Card(
//                     child: Column(
//                       children: [
//                         Text(
//                           isPreViewResumeResponse.body?.screenInfo?.pictuce ??
//                               "Pictuce",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                               color: Theme.of(context)
//                                   .appBarTheme
//                                   .foregroundColor),
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: DottedBorder(
//                                 borderType: BorderType.RRect,
//                                 radius: Radius.circular(12),
//                                 padding: EdgeInsets.all(2),
//                                 child: ClipRRect(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12)),
//                                   child: Container(
//                                     //inner container
//
//                                     height: 120, //height of inner container
//                                     width:
//                                         80, //width to 100% match to parent container.
//                                     color: colorBoxDotted,
//
//                                     child: Center(
//                                         child: (widget.isPreViewResumeResponse
//                                                         .body?.data?.image ==
//                                                     '' ||
//                                                 widget.isPreViewResumeResponse
//                                                         .body?.data?.image ==
//                                                     null)
//                                             ? Image.asset(
//                                                 "assets/profile.jpg",
//                                                 width: 600.0,
//                                                 height: 240.0,
//                                                 fit: BoxFit.cover,
//                                               )
//                                             : Image.memory(
//                                                 (base64Decode(base64.normalize(
//                                                     widget.isPreViewResumeResponse
//                                                             .body?.data?.image ??
//                                                         imageBase64))),
//                                               )), //background color of inner container
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(left: 15),
//                                       child: Text(
//                                         "   ${isPreViewResumeResponse.body?.screenInfo?.ratio ?? "The aspect ratio must be 3:4"} \n"
//                                         "${isPreViewResumeResponse.body?.screenInfo?.sizepictuce ?? "The aspect ratio must be 3:4"} ",
//                                         style: TextStyle(
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.w500,
//                                             color: Theme.of(context)
//                                                 .appBarTheme
//                                                 .foregroundColor),
//                                       ),
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Icon(
//                                           FontAwesomeIcons.squareCheck,
//                                           color:
//                                               Theme.of(context).iconTheme.color,
//                                           size: 20,
//                                           shadows: <Shadow>[
//                                             Shadow(
//                                                 color: Colors.white,
//                                                 blurRadius: 15.0)
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(left: 5),
//                                           child: Text(
//                                             " ${isPreViewResumeResponse.body?.screenInfo?.selecttheinformation ?? "Please select the information \nthat will be used to create a resume."} ",
//                                             style: TextStyle(
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Theme.of(context)
//                                                     .appBarTheme
//                                                     .foregroundColor),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           color: (materialColorOfPdfUsAbout ==
//                                                       Colors.black &&
//                                                   materialColorOfPdfUsAbout ==
//                                                       Colors.black)
//                                               ? Colors.white
//                                               : (materialColorOfPdfUsAbout ==
//                                                           Colors.white &&
//                                                       materialColorOfPdfUsAbout ==
//                                                           Colors.white)
//                                                   ? Colors.black
//                                                   : Theme.of(context)
//                                                       .scaffoldBackgroundColor,
//                                           child: Icon(FontAwesomeIcons.droplet,
//                                               size: 20,
//                                               color: materialColorOfPdfUsAbout),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(left: 5),
//                                           child: Text(
//                                             "${isPreViewResumeResponse.body?.screenInfo?.selecttheinformation ?? "Please select a color\n"
//                                                 "to use in creating a resume.\n"}  ",
//                                             style: TextStyle(
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Theme.of(context)
//                                                     .appBarTheme
//                                                     .foregroundColor),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                       onTap: () async {
//                                         int? value = await showMenu<int>(
//                                             context: context,
//                                             position: RelativeRect.fromLTRB(
//                                                 0, 0, 0, 0),
//                                             items: List.generate(
//                                                 sizeImageResume.length ?? 0,
//                                                 (index) {
//                                               return PopupMenuItem(
//                                                 value: index,
//                                                 child: Text(
//                                                   "${sizeImageResume[index].sizePhoto} "
//                                                   "${isPreViewResumeResponse.body?.screenInfo?.n ?? " N''"}  "
//                                                   "${sizeImageResume[index].widthSizeCM} x ${sizeImageResume[index].heightSizeCM} "
//                                                   "${isPreViewResumeResponse.body?.screenInfo?.whcm ?? " (w x h : cm)) "} ",
//                                                   style: TextStyle(
//                                                       fontSize: 20,
//                                                       color: Theme.of(context)
//                                                           .appBarTheme
//                                                           .foregroundColor),
//                                                 ),
//                                                 onTap: () {
//                                                   setState(() {
//                                                     sizePhoto =
//                                                         sizeImageResume[index]
//                                                             .sizePhoto;
//                                                     widthSizeCM =
//                                                         sizeImageResume[index]
//                                                             .widthSizeCM;
//                                                     heightSizeCM =
//                                                         sizeImageResume[index]
//                                                             .heightSizeCM;
//                                                   });
//                                                 },
//                                               );
//                                             }));
//                                       },
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "${isPreViewResumeResponse.body?.screenInfo?.select ?? "Select"}  ",
//                                             style: TextStyle(
//                                                 decoration:
//                                                     TextDecoration.underline,
//                                                 decorationThickness: 2,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Theme.of(context)
//                                                     .appBarTheme
//                                                     .foregroundColor),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 5),
//                                             child: Text(
//                                               "${sizePhoto == 1.5 ? isPreViewResumeResponse.body?.screenInfo?.textdefault ?? "Default" : ''}${isPreViewResumeResponse.body?.screenInfo?.size ?? "size"}  : $sizePhoto "
//                                               "${isPreViewResumeResponse.body?.screenInfo?.n ?? " N''"}  "
//                                               " $widthSizeCM x $heightSizeCM ${isPreViewResumeResponse.body?.screenInfo?.whcm ?? " (w x h : cm)) "} ",
//                                               style: TextStyle(
//                                                   fontSize: 10,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Theme.of(context)
//                                                       .appBarTheme
//                                                       .foregroundColor),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Divider(
//                     color: colorBoxDotted,
//                     height: 5,
//                     thickness: 5,
//                     indent: 0,
//                     endIndent: 0,
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.aboutme ??
//                                 "About me",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         buildDetailResumeCustomNotIconsReadOnly(
//                             context: context,
//                             detail:
//                                 "         ${isPreViewResumeResponse.body?.data?.aboutme ?? isPreViewResumeResponse.body?.screenInfo?.aboutme ?? "About me ..."}",
//                             appBarForeGroundColor: appBarForegroundColor)
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.position ??
//                                 "ตำแหน่งที่สนใจ",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         buildPositionOnSelectCard(
//                             positionOnSelect: positionOnSelect,
//                             context: context,
//                             getColor: getColor,
//                             onChangedSetState: onChangedSetState,
//                             positionData:
//                                 isPreViewResumeResponse.body?.data?.position ??
//                                     [],
//                             appBarForegroundColor: appBarForegroundColor,
//                             returnResumeEdit: () {}, boolClick: false, onTap: () {  }),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.education ??
//                                 "การศึกษา",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         buildEducationOnSelectCard(
//                           educationOnSelect: educationHSCOnSelect,
//                           title:
//                               isPreViewResumeResponse.body?.screenInfo?.hsc ??
//                                   "ระดับประกาศนียบัตรมัธยมศึกษาตอนปลาย",
//                           context: context,
//                           getColor: getColor,
//                           onChangedSetState: onChangedSetState,
//                           educationData: isPreViewResumeResponse
//                                   .body?.data?.education?.hsc ??
//                               [],
//                           appBarForegroundColor: appBarForegroundColor,
//                           returnResumeEdit: () {},
//                         ),
//                         buildEducationOnSelectCard(
//                           educationOnSelect: educationBDOnSelect,
//                           title: isPreViewResumeResponse.body?.screenInfo?.bd ??
//                               "ระดับปริญญาตรี",
//                           context: context,
//                           getColor: getColor,
//                           onChangedSetState: onChangedSetState,
//                           educationData: isPreViewResumeResponse
//                                   .body?.data?.education?.bd ??
//                               [],
//                           appBarForegroundColor: appBarForegroundColor,
//                           returnResumeEdit: () {},
//                         ),
//                         buildEducationOnSelectCard(
//                           educationOnSelect: educationMDOnSelect,
//                           title: isPreViewResumeResponse.body?.screenInfo?.md ??
//                               "ระดับปริญญาโท",
//                           context: context,
//                           getColor: getColor,
//                           onChangedSetState: onChangedSetState,
//                           educationData: isPreViewResumeResponse
//                                   .body?.data?.education?.md ??
//                               [],
//                           appBarForegroundColor: appBarForegroundColor,
//                           returnResumeEdit: () {},
//                         ),
//                         buildEducationOnSelectCard(
//                           educationOnSelect: educationDDOnSelect,
//                           title: isPreViewResumeResponse.body?.screenInfo?.dd ??
//                               "ระดับปริญญาเอก",
//                           context: context,
//                           getColor: getColor,
//                           onChangedSetState: onChangedSetState,
//                           educationData: isPreViewResumeResponse
//                                   .body?.data?.education?.dd ??
//                               [],
//                           appBarForegroundColor: appBarForegroundColor,
//                           returnResumeEdit: () {},
//                         ),
//                         buildEducationOnSelectCard(
//                           educationOnSelect: educationHDDOnSelect,
//                           title:
//                               isPreViewResumeResponse.body?.screenInfo?.hdd ??
//                                   "ระดับปริญญาดุษฎีบัณฑิตกิตติมศักดิ์",
//                           context: context,
//                           getColor: getColor,
//                           onChangedSetState: onChangedSetState,
//                           educationData: isPreViewResumeResponse
//                                   .body?.data?.education?.hdd ??
//                               [],
//                           appBarForegroundColor: appBarForegroundColor,
//                           returnResumeEdit: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.contact ??
//                                 "ช่องทางการติดต่อ",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         Stack(
//                           children: [
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.email ??
//                                     "email",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.contactinfo?.email ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.envelope,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.contactinfo?.email ==
//                                           null
//                                       ? false
//                                       : socialOnSelect[0].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.contactinfo?.phone !=
//                                         null) {
//                                       socialOnSelect[0].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         socialOnSelect[0].onselect.toString());
//                                     print(socialOnSelect[0]);
//                                     print(jsonEncode(socialOnSelect[1]));
//                                     print(jsonEncode(socialOnSelect));
//                                   },
//                                 )),
//                           ],
//                         ),
//                         BuildTextFormFieldUnLimitSocialCustomResume(
//                             readOnly: true,
//                             hintLabel: isPreViewResumeResponse
//                                     .body?.screenInfo?.phone ??
//                                 "เบอร์โทรศัพท์",
//                             initialvalue: isPreViewResumeResponse
//                                     .body?.data?.contactinfo?.phone ??
//                                 ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                             textInputType: TextInputType.number,
//                             // iconsFile : Icons.person_rounded,
//                             iconsFile: FontAwesomeIcons.phone,
//                             checkbox: Checkbox(
//                               checkColor: Theme.of(context).primaryColor,
//                               fillColor:
//                                   MaterialStateProperty.resolveWith(getColor),
//                               value: isPreViewResumeResponse
//                                           .body?.data?.contactinfo?.phone ==
//                                       null
//                                   ? false
//                                   : socialOnSelect[2].onselect,
//                               onChanged: (bool? value) {
//                                 if (isPreViewResumeResponse
//                                         .body?.data?.contactinfo?.phone !=
//                                     null) {
//                                   socialOnSelect[1].onselect = value!;
//                                 } else {
//                                   var textSnack =
//                                       'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(textSnack,
//                                         style: const TextStyle(
//                                             fontSize: sizeTextSmaller14,
//                                             color: Colors.black)),
//                                     duration: const Duration(seconds: 1),
//                                     backgroundColor: const Color(0xFFFFF9D1),
//                                   ));
//                                 }
//                                 onChangedSetState();
//                                 print(value);
//                                 print(socialOnSelect[1].onselect.toString());
//                                 print(socialOnSelect[1]);
//                                 print(jsonEncode(socialOnSelect[2]));
//                                 print(jsonEncode(socialOnSelect));
//                               },
//                             )),
//                         BuildTextFormFieldUnLimitSocialCustomResume(
//                             readOnly: true,
//                             hintLabel: isPreViewResumeResponse
//                                     .body?.screenInfo?.facebook ??
//                                 "เฟสบุ๊ค",
//                             initialvalue: isPreViewResumeResponse
//                                     .body?.data?.contactinfo?.facebook ??
//                                 ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                             textInputType: TextInputType.text,
//                             // iconsFile : Icons.person_rounded,
//                             iconsFile: FontAwesomeIcons.facebook,
//                             checkbox: Checkbox(
//                               checkColor: Theme.of(context).primaryColor,
//                               fillColor:
//                                   MaterialStateProperty.resolveWith(getColor),
//                               value: isPreViewResumeResponse
//                                           .body?.data?.contactinfo?.facebook ==
//                                       null
//                                   ? false
//                                   : socialOnSelect[2].onselect,
//                               onChanged: (bool? value) {
//                                 if (isPreViewResumeResponse
//                                         .body?.data?.contactinfo?.facebook !=
//                                     null) {
//                                   socialOnSelect[2].onselect = value!;
//                                 } else {
//                                   var textSnack =
//                                       'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(textSnack,
//                                         style: const TextStyle(
//                                             fontSize: sizeTextSmaller14,
//                                             color: Colors.black)),
//                                     duration: const Duration(seconds: 1),
//                                     backgroundColor: const Color(0xFFFFF9D1),
//                                   ));
//                                 }
//                                 onChangedSetState();
//                                 print(value);
//                                 print(socialOnSelect[2].onselect.toString());
//                                 print(socialOnSelect[2]);
//                                 print(jsonEncode(socialOnSelect[1]));
//                                 print(jsonEncode(socialOnSelect));
//                               },
//                             )),
//                         BuildTextFormFieldUnLimitSocialCustomResume(
//                             readOnly: true,
//                             hintLabel: isPreViewResumeResponse
//                                     .body?.screenInfo?.line ??
//                                 "ไลน์",
//                             initialvalue: isPreViewResumeResponse
//                                     .body?.data?.contactinfo?.line ??
//                                 ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                             textInputType: TextInputType.text,
//                             // iconsFile : Icons.person_rounded,
//                             iconsFile: FontAwesomeIcons.line,
//                             checkbox: Checkbox(
//                               checkColor: Theme.of(context).primaryColor,
//                               fillColor:
//                                   MaterialStateProperty.resolveWith(getColor),
//                               value: isPreViewResumeResponse
//                                           .body?.data?.contactinfo?.line ==
//                                       null
//                                   ? false
//                                   : socialOnSelect[3].onselect,
//                               onChanged: (bool? value) {
//                                 if (isPreViewResumeResponse
//                                         .body?.data?.contactinfo?.line !=
//                                     null) {
//                                   socialOnSelect[3].onselect = value!;
//                                 } else {
//                                   var textSnack =
//                                       'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(textSnack,
//                                         style: const TextStyle(
//                                             fontSize: sizeTextSmaller14,
//                                             color: Colors.black)),
//                                     duration: const Duration(seconds: 1),
//                                     backgroundColor: const Color(0xFFFFF9D1),
//                                   ));
//                                 }
//                                 onChangedSetState();
//                                 print(value);
//                                 print(socialOnSelect[3].onselect.toString());
//                                 print(socialOnSelect[3]);
//                                 print(jsonEncode(socialOnSelect[3]));
//                                 print(jsonEncode(socialOnSelect));
//                               },
//                             )),
//                         BuildTextFormFieldUnLimitSocialCustomResume(
//                             readOnly: true,
//                             hintLabel: isPreViewResumeResponse
//                                     .body?.screenInfo?.instagram ??
//                                 "instagram",
//                             initialvalue: isPreViewResumeResponse
//                                     .body?.data?.contactinfo?.instagram ??
//                                 ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                             textInputType: TextInputType.text,
//                             // iconsFile : Icons.person_rounded,
//                             iconsFile: FontAwesomeIcons.instagram,
//                             checkbox: Checkbox(
//                               checkColor: Theme.of(context).primaryColor,
//                               fillColor:
//                                   MaterialStateProperty.resolveWith(getColor),
//                               value: isPreViewResumeResponse
//                                           .body?.data?.contactinfo?.instagram ==
//                                       null
//                                   ? false
//                                   : socialOnSelect[4].onselect,
//                               onChanged: (bool? value) {
//                                 if (isPreViewResumeResponse
//                                         .body?.data?.contactinfo?.instagram !=
//                                     null) {
//                                   socialOnSelect[4].onselect = value!;
//                                 } else {
//                                   var textSnack =
//                                       'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(textSnack,
//                                         style: const TextStyle(
//                                             fontSize: sizeTextSmaller14,
//                                             color: Colors.black)),
//                                     duration: const Duration(seconds: 1),
//                                     backgroundColor: const Color(0xFFFFF9D1),
//                                   ));
//                                 }
//                                 onChangedSetState();
//                                 print(value);
//                                 print(socialOnSelect[4].onselect.toString());
//                                 print(socialOnSelect[4]);
//                                 print(jsonEncode(socialOnSelect[4]));
//                                 print(jsonEncode(socialOnSelect));
//                               },
//                             )),
//                         BuildTextFormFieldUnLimitSocialCustomResume(
//                             readOnly: true,
//                             hintLabel: isPreViewResumeResponse
//                                     .body?.screenInfo?.twitter ??
//                                 "twitter",
//                             initialvalue: isPreViewResumeResponse
//                                     .body?.data?.contactinfo?.twitter ??
//                                 ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                             textInputType: TextInputType.text,
//                             // iconsFile : Icons.person_rounded,
//                             iconsFile: FontAwesomeIcons.twitter,
//                             checkbox: Checkbox(
//                               checkColor: Theme.of(context).primaryColor,
//                               fillColor:
//                                   MaterialStateProperty.resolveWith(getColor),
//                               value: isPreViewResumeResponse
//                                           .body?.data?.contactinfo?.twitter ==
//                                       null
//                                   ? false
//                                   : socialOnSelect[5].onselect,
//                               onChanged: (bool? value) {
//                                 if (isPreViewResumeResponse
//                                         .body?.data?.contactinfo?.twitter !=
//                                     null) {
//                                   socialOnSelect[5].onselect = value!;
//                                 } else {
//                                   var textSnack =
//                                       'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(textSnack,
//                                         style: const TextStyle(
//                                             fontSize: sizeTextSmaller14,
//                                             color: Colors.black)),
//                                     duration: const Duration(seconds: 1),
//                                     backgroundColor: const Color(0xFFFFF9D1),
//                                   ));
//                                 }
//                                 onChangedSetState();
//                                 print(value);
//                                 print(socialOnSelect[5].onselect.toString());
//                                 print(socialOnSelect[5]);
//                                 print(jsonEncode(socialOnSelect[5]));
//                                 print(jsonEncode(socialOnSelect));
//                               },
//                             )),
//                         BuildTextFormFieldUnLimitSocialCustomResume(
//                             readOnly: true,
//                             hintLabel: isPreViewResumeResponse
//                                     .body?.screenInfo?.youtube ??
//                                 "youtube",
//                             initialvalue: isPreViewResumeResponse
//                                     .body?.data?.contactinfo?.youtube ??
//                                 ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                             textInputType: TextInputType.text,
//                             // iconsFile : Icons.person_rounded,
//                             iconsFile: FontAwesomeIcons.youtube,
//                             checkbox: Checkbox(
//                               checkColor: Theme.of(context).primaryColor,
//                               fillColor:
//                                   MaterialStateProperty.resolveWith(getColor),
//                               value: isPreViewResumeResponse
//                                           .body?.data?.contactinfo?.youtube ==
//                                       null
//                                   ? false
//                                   : socialOnSelect[6].onselect,
//                               onChanged: (bool? value) {
//                                 if (isPreViewResumeResponse
//                                         .body?.data?.contactinfo?.youtube !=
//                                     null) {
//                                   socialOnSelect[6].onselect = value!;
//                                 } else {
//                                   var textSnack =
//                                       'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(textSnack,
//                                         style: const TextStyle(
//                                             fontSize: sizeTextSmaller14,
//                                             color: Colors.black)),
//                                     duration: const Duration(seconds: 1),
//                                     backgroundColor: const Color(0xFFFFF9D1),
//                                   ));
//                                 }
//
//                                 onChangedSetState();
//                                 print(value);
//                                 print(socialOnSelect[6].onselect.toString());
//                                 print(socialOnSelect[6]);
//                                 print(jsonEncode(socialOnSelect[6]));
//                                 print(jsonEncode(socialOnSelect));
//                               },
//                             )),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.address ??
//                                 "ที่อยู่ปัจจุบัน",
//                             isPreViewResumeEditData: "",
//                             ontap: () {}),
//                         Column(
//                           children: [
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.number ??
//                                     "บ้านเลขที่",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.number ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.solidMap,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.address?.number ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[0].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.number !=
//                                         null) {
//                                       addressOnSelect[0].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[0].onselect.toString());
//                                     print(addressOnSelect[0]);
//                                     print(jsonEncode(addressOnSelect[1]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.moo ??
//                                     "หมู่",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.moo ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.signsPost,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.address?.moo ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[1].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.moo !=
//                                         null) {
//                                       addressOnSelect[1].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[1].onselect.toString());
//                                     print(addressOnSelect[1]);
//                                     print(jsonEncode(addressOnSelect[1]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.soi ??
//                                     "ซอย",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.soi ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.trafficLight,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.address?.soi ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[2].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.soi !=
//                                         null) {
//                                       addressOnSelect[2].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[2].onselect.toString());
//                                     print(addressOnSelect[2]);
//                                     print(jsonEncode(addressOnSelect[1]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.road ??
//                                     "ถนน",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.road ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.road,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.address?.road ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[3].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.road !=
//                                         null) {
//                                       addressOnSelect[3].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[3].onselect.toString());
//                                     print(addressOnSelect[3]);
//                                     print(jsonEncode(addressOnSelect[3]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.subdistrict ??
//                                     "ตำบล",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.subdistrict ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.treeCity,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse.body?.data
//                                               ?.address?.subdistrict ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[4].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.subdistrict !=
//                                         null) {
//                                       addressOnSelect[4].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[4].onselect.toString());
//                                     print(addressOnSelect[4]);
//                                     print(jsonEncode(addressOnSelect[4]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.district ??
//                                     "หมู่",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.district ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.city,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.address?.district ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[5].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.district !=
//                                         null) {
//                                       addressOnSelect[5].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[5].onselect.toString());
//                                     print(addressOnSelect[5]);
//                                     print(jsonEncode(addressOnSelect[5]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.province ??
//                                     "จังหวัด",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.province ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.earthAsia,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.address?.province ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[6].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.province !=
//                                         null) {
//                                       addressOnSelect[6].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[6].onselect.toString());
//                                     print(addressOnSelect[6]);
//                                     print(jsonEncode(addressOnSelect[6]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                             BuildTextFormFieldUnLimitSocialCustomResume(
//                                 readOnly: true,
//                                 hintLabel: isPreViewResumeResponse
//                                         .body?.screenInfo?.zipcode ??
//                                     "รหัสไปรษณีย์",
//                                 initialvalue: isPreViewResumeResponse
//                                         .body?.data?.address?.zipcode ??
//                                     ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
//                                 textInputType: TextInputType.text,
//                                 // iconsFile : Icons.person_rounded,
//                                 iconsFile: FontAwesomeIcons.mapPin,
//                                 checkbox: Checkbox(
//                                   checkColor: Theme.of(context).primaryColor,
//                                   fillColor: MaterialStateProperty.resolveWith(
//                                       getColor),
//                                   value: isPreViewResumeResponse
//                                               .body?.data?.address?.zipcode ==
//                                           null
//                                       ? false
//                                       : addressOnSelect[6].onselect,
//                                   onChanged: (bool? value) {
//                                     if (isPreViewResumeResponse
//                                             .body?.data?.address?.zipcode !=
//                                         null) {
//                                       addressOnSelect[6].onselect = value!;
//                                     } else {
//                                       var textSnack =
//                                           'คุณยังไม่มีข้อมูลส่วนนี้ ไม่สามารถเลือกได้';
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(textSnack,
//                                             style: const TextStyle(
//                                                 fontSize: sizeTextSmaller14,
//                                                 color: Colors.black)),
//                                         duration: const Duration(seconds: 1),
//                                         backgroundColor:
//                                             const Color(0xFFFFF9D1),
//                                       ));
//                                     }
//                                     onChangedSetState();
//                                     print(value);
//                                     print(
//                                         addressOnSelect[6].onselect.toString());
//                                     print(addressOnSelect[6]);
//                                     print(jsonEncode(addressOnSelect[6]));
//                                     print(jsonEncode(addressOnSelect));
//                                   },
//                                 )),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.experience ??
//                                 "ตำแหน่งที่สนใจ",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         buildExperienceOnSelectCard(
//                             experienceOnSelect: experienceOnSelect,
//                             context: context,
//                             getColor: getColor,
//                             onChangedSetState: onChangedSetState,
//                             experienceData: isPreViewResumeResponse
//                                     .body?.data?.experience ??
//                                 [],
//                             appBarForegroundColor: appBarForegroundColor,
//                             returnResumeEdit: () {}),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.certificate ??
//                                 "ใบรับรอง",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         buildCertificateOnSelectCard(
//                             certificateOnSelect: certificateOnSelect,
//                             context: context,
//                             getColor: getColor,
//                             onChangedSetState: onChangedSetState,
//                             certificateData: isPreViewResumeResponse
//                                     .body?.data?.certificate ??
//                                 [],
//                             appBarForegroundColor: appBarForegroundColor,
//                             returnResumeEdit: () {}),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.skill ??
//                                 "ทักษะความสามารถ",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         buildSkillOnSelectCard(
//                             skillOnSelect: skillOnSelect,
//                             context: context,
//                             getColor: getColor,
//                             onChangedSetState: onChangedSetState,
//                             skillData:
//                                 isPreViewResumeResponse.body?.data?.skill ?? [],
//                             appBarForegroundColor: appBarForegroundColor,
//                             returnResumeEdit: () {}),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap),
//                   Card(
//                     color: Theme.of(context).primaryColor.withOpacity(0.9),
//                     child: Column(
//                       children: [
//                         buildTitleEditDataResume(
//                             context: context,
//                             isPreViewResumeTitle: isPreViewResumeResponse
//                                     .body?.screenInfo?.language ??
//                                 "ทักษะทางภาษา",
//                             isPreViewResumeEditData: '',
//                             ontap: () {}),
//                         buildLanguageOnSelectCard(
//                             languageOnSelect: languageOnSelect,
//                             context: context,
//                             getColor: getColor,
//                             onChangedSetState: onChangedSetState,
//                             languageData:
//                                 isPreViewResumeResponse.body?.data?.language ??
//                                     [],
//                             appBarForegroundColor: appBarForegroundColor,
//                             returnResumeEdit: () {}),
//                       ],
//                     ),
//                   ),
//                   spaceGap(gap*20),
//                   // Container(
//                   //   child: ButtonIconsCustomLimit(
//                   //     label: isPreViewResumeResponse.body?.screenInfo?.saveor ??
//                   //         " Delete/ลบ",
//                   //     buttonIcons: Icon(
//                   //       FontAwesomeIcons.trashCan,
//                   //       color: bcButtonDelete.withOpacity(0.8),
//                   //       size: 20.0,
//                   //     ),
//                   //     colortext: bcButtonDelete.withOpacity(0.8),
//                   //     colorbutton: Theme.of(context).scaffoldBackgroundColor,
//                   //     sizetext: 14,
//                   //     colorborder: bcButtonDelete.withOpacity(0.8),
//                   //     sizeborder: 3,
//                   //     onPressed: () {
//                   //       context
//                   //           .read<ResumeBloc>()
//                   //           .add(SetOnSelectedAndPreviewResumeEvent(
//                   //             positionOnSelect: positionOnSelect,
//                   //             educationHSCOnSelect: educationHSCOnSelect,
//                   //             educationBDOnSelect: educationBDOnSelect,
//                   //             educationMDOnSelect: educationMDOnSelect,
//                   //             educationDDOnSelect: educationDDOnSelect,
//                   //             educationHDDOnSelect: educationHDDOnSelect,
//                   //             socialOnSelect: socialOnSelect,
//                   //             addressOnSelect: addressOnSelect,
//                   //             experienceOnSelect: experienceOnSelect,
//                   //             certificateOnSelect: certificateOnSelect,
//                   //             skillOnSelect: skillOnSelect,
//                   //             languageOnSelect: languageOnSelect,
//                   //           ));
//                   //     },
//                   //   ),
//                   // )
//                 ],
//               ),
//             ),
//           )),
//           floatingActionButton: floatingGeneratePDF(
//             context: context,
//             setState,
//             "Generate PDF",
//             isPreViewResumeResponse.body?.screenInfo?.saveor ??
//               " Delete/ลบ",
//             colorOfPdfUsButtonTitle: colorOfPdfUsButtonTitle,
//             colorOfPdfUsName: colorOfPdfUsName,
//             colorOfPdfUsPosition: colorOfPdfUsPosition,
//             colorOfPdfUsExperience: colorOfPdfUsExperience,
//             colorOfPdfUsEducations: colorOfPdfUsEducations,
//             colorOfPdfUsContact: colorOfPdfUsContact,
//             colorOfPdfUsCertifications: colorOfPdfUsCertifications,
//             colorOfPdfUsSkills: colorOfPdfUsSkills,
//             colorOfPdfUsAbout: colorOfPdfUsAbout,
//             colorOfPdfUsText: colorOfPdfUsText,
//             colorOfPdfUsTheme: colorOfPdfUsTheme,
//             widthSizeCM: widthSizeCM,
//             heightSizeCM: heightSizeCM,
//             isPreViewResumeResponse: isPreViewResumeResponse,
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
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//         ));
//   }
// }
//
// selectColorViewPdf(
//   setState, {
//   required BuildContext context,
//   required PdfColor colorOfPdfUs,
// }) {
//   return PopupMenuButton(
//     child: Align(
//       alignment: Alignment.centerRight,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Icon(
//           FontAwesomeIcons.filter,
//           size: 20,
//           color: Theme.of(context).bottomAppBarColor,
//         ),
//       ),
//     ),
//     itemBuilder: (context) {
//       return List.generate(colorOfPdfList.length ?? 0, (index) {
//         return PopupMenuItem(
//           value: colorOfPdfList[index].pdfOfColor,
//           child: Text(
//             "${colorOfPdfList[index].nameColor}",
//             style: TextStyle(
//                 fontSize: 20,
//                 color: (colorOfPdfList[index].materialColor == Colors.black) ||
//                         (colorOfPdfList[index].materialColor == Colors.white)
//                     ? Theme.of(context).appBarTheme.foregroundColor
//                     : colorOfPdfList[index].materialColor),
//           ),
//         );
//       });
//     },
//     onSelected: (value) {
//       colorOfPdfUs = colorOfPdfList[6].pdfOfColor;
//       setState(() {});
//     },
//   );
// }
