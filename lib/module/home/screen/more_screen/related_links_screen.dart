import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/message/text_button.dart';
import '../../../../customs/message/text_error.dart';
import '../../../../customs/message/text_more.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../login/screen/login_screen/login_screen.dart';
import '../../bloc/more_bloc/more_bloc.dart';
import '../../model/response/more_response/related_links_response.dart';

class RelatedLinksScreen extends StatelessWidget {
  const RelatedLinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MoreBloc()..add(MoreRelatedLinksEvent()), child: const RelatedLinksPage());
  }
}

class RelatedLinksPage extends StatefulWidget {
  const RelatedLinksPage({Key? key}) : super(key: key);

  @override
  State<RelatedLinksPage> createState() => _RelatedLinksPageState();
}

class _RelatedLinksPageState extends State<RelatedLinksPage>  with ProgressDialog {
  RelatedLinksResponse? relatedLinksResponse;
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

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreRelatedLinksLoading) {
          showProgressDialog(context);
        }
        if (state is MoreRelatedLinksEndLoading) {
          hideProgressDialog(context);
        }
        if (state is MoreRelatedLinksError) {
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
        if (state is MoreRelatedLinksScreenInfoSuccessState) {
          relatedLinksResponse = state.relatedLinksResponse;
          return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: sizeTitle24,
                        color: Theme.of(context).appBarTheme.foregroundColor,
                      ),
                    ),
                    title: Text(relatedLinksResponse?.body?.screeninfo?.titlerelatedlinks?? moreBtnRelatedLinks,
                        style: TextStyle(
                          // color: Colors.black,
                          fontSize: sizeTitle24,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                        )),
                  ),
                  body: SafeArea(
                    child: Container(
                      color: Colors.transparent.withOpacity(0.1),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: List.generate(
                                    relatedLinksResponse?.body?.datalink?.length ?? 0 ,
                                        (index) => Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              setState(() {
                                                _launchInBrowser(Uri.parse("${relatedLinksResponse?.body?.datalink?[index].link}"));
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Table(
                                                border: TableBorder.symmetric(
                                                    outside: const BorderSide(
                                                        width: 2,
                                                        color:
                                                        Colors.transparent)),
                                                columnWidths: const {
                                                  0:FractionColumnWidth(0.9),
                                                  1:FractionColumnWidth(0.1),
                                                },
                                                defaultVerticalAlignment:
                                                TableCellVerticalAlignment
                                                    .top,
                                                children: [
                                                  TableRow(children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0),
                                                      child: Text(
                                                        ( relatedLinksResponse?.body?.datalink?[index].title ?? '').toString(),
                                                        textAlign:
                                                        TextAlign.start,
                                                        style: TextStyle(
                                                          fontSize:
                                                          sizeTextSmaller14,
                                                          color: Theme.of(context)
                                                              .bottomAppBarColor,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0),
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Theme.of(context)
                                                            .iconTheme
                                                            .color,
                                                        size: 20,
                                                      ),
                                                    ),


                                                  ])
                                                ],
                                              ),
                                            )),
                                        const Divider(
                                          color: Colors.grey,
                                          height: 5,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.05,
                              ),
                            ]),
                      ),
                    ),
                  )));
        } else {
          return Scaffold(
              body: Container(
                color: Colors.white,
              ));
        }
      },
      buildWhen: (context, state) {
        return state is MoreRelatedLinksScreenInfoSuccessState;
      },
    );
  }
}