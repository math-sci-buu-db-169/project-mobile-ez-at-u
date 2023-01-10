import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/message/text_more.dart';
import '../../../../customs/message/text_pdpa.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/home/model/response/more_response/scree_more_pdpa_response.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../login/bloc/pdpa_bloc/pdpa_bloc.dart';
import '../../bloc/more_bloc/more_bloc.dart';

mPDPAMoreWidget(
    BuildContext context,
    ScreenMorePDPAResponse? screenHomeMorePDPAResponse,
    String getIsVersionPDPA,
    bool isChecked,
    Color Function(Set<MaterialState> states) getColor,
    Function(bool? value) isCheckedSetState, {required load}) {
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
              if(load ==true ){
                Navigator.pop(context);
              }else{

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomeScreen()));
              }
            },
            icon: Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
          ),
          title: Text(
            screenHomeMorePDPAResponse?.body?.screeninfo?.titlepdpa ??
                moreBtnAndTitleTermAndCon,
            style: TextStyle(
              color: Theme.of(context).appBarTheme.foregroundColor,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
          // child: Container(
          //     padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 20),
          //     color: bscTransparent,
          //     width: MediaQuery.of(context).size.width,
          //     child: SfPdfViewer.network("${screenHomeMorePDPAResponse?.body?.linkpdpa}")
          //
          // ),
          // child: Container(
          //     padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 20),
          //     color: bscTransparent,
          //     width: MediaQuery.of(context).size.width,
          //     child: SfPdfViewer.network("${screenHomeMorePDPAResponse?.body?.data?.pdpaurl}")
          //
          // ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15, bottom: 10),
                  //   child: Text(screenPDPAResponse?.body?.screeninfo?.titlepdpa?? pDPATitlePDPA,
                  //       textAlign: TextAlign.center, style: const TextStyle(fontSize: sizeTitle24, color: Colors.black)),
                  // ),
                  Expanded(
                    child: Container(
                        color: bscTransparent,
                        width: MediaQuery.of(context).size.width,
                        child: SfPdfViewer.network(
                            "${screenHomeMorePDPAResponse?.body?.data?.pdpaurl}")),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  screenHomeMorePDPAResponse?.body?.data?.pdpaversion
                              .toString() !=
                          screenHomeMorePDPAResponse?.body?.data?.versionuse
                              .toString()
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Theme.of(context).primaryColor ,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    isCheckedSetState(value);
                                  },
                                ),
                                Text(
                                  screenHomeMorePDPAResponse
                                      ?.body?.screeninfo?.textcheckbox??pDPACheckboxBtnAccept,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).bottomAppBarColor),
                                )
                              ],
                            ),
                            isChecked == true
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Expanded(
                                          child: ButtonCustom(
                                        label: screenHomeMorePDPAResponse
                                                ?.body?.screeninfo?.btnaccept ??
                                            pDPABtnAccept,
                                        colortext: tcButtonTextColor,
                                        colorbutton: tcButtonTextWhite,
                                        sizetext: sizeTextBig20,
                                        colorborder: tcButtonTextBoarder,
                                        sizeborder: 10,
                                        onPressed: () {
                                          // BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: true));
                                          context.read<MoreBloc>().add(
                                              MorePDPAEvent(
                                                  usabilityScreen: false,
                                                  versionPDPA:
                                                      screenHomeMorePDPAResponse
                                                          ?.body
                                                          ?.data
                                                          ?.pdpaversion
                                                          .toString()));
                                        },
                                      )),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Expanded(
                                          child: ButtonCustom(
                                        label: screenHomeMorePDPAResponse?.body
                                                ?.screeninfo?.btndecline ??
                                            pDPABtnDecline,
                                        colortext: tcButtonTextColor,
                                        colorbutton: tcButtonTextRed,
                                        sizetext: sizeTextBig20,
                                        colorborder: tcButtonTextRedBoarder,
                                        sizeborder: 10,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          // BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: false));
                                        },
                                      )),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
}
