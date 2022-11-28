import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_pdpa.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/login/bloc/pdpa_bloc/pdpa_bloc.dart';
import '../../../../module/login/model/response/screen_pdpa_response.dart';

pDPAScreenWidget(BuildContext context, ScreenPDPAResponse? screenPDPAResponse) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(screenPDPAResponse?.body?.screeninfo?.titlepdpa ?? pDPATitlePDPA,
                      textAlign: TextAlign.center, style:  TextStyle(fontSize: sizeTitle24,
                    color: Theme.of(context).bottomAppBarColor,)),
                ),
                Expanded(
                  child: Container(
                      color: bscTransparent,
                      width: MediaQuery.of(context).size.width,
                      child: SfPdfViewer.network("${screenPDPAResponse?.body?.linkpdpa}")),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                        child: ButtonCustom(
                      label: screenPDPAResponse?.body?.screeninfo?.btnaccept ?? pDPABtnAccept,
                      colortext: tcButtonTextColor,
                      colorbutton: tcButtonTextWhite,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: true));
                      },
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                        child: ButtonCustom(
                      label: screenPDPAResponse?.body?.screeninfo?.btndecline ?? pDPABtnDecline,
                      colortext: tcButtonTextWhite,
                      colorbutton: tcButtonTextRed,
                      sizetext: sizeTextBig20,
                      colorborder: tcButtonTextRedBoarder,
                      sizeborder: 10,
                      onPressed: () {
                        BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: false));
                      },
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
