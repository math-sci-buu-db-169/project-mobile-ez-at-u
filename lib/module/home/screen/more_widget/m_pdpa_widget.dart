import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/message/text_more.dart';
import '../../../../customs/message/text_pdpa.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/home/model/response/more_response/scree_more_pdpa_response.dart';

mPDPAMoreWidget(BuildContext context, ScreenMorePDPAResponse? screenHomeMorePDPAResponse) {
  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Colors.black,
            ),
          ),
          title: Text(
            screenHomeMorePDPAResponse?.body?.screeninfo?.titlepdpa ?? moreBtnAndTitleTermAndCon,
            style: const TextStyle(
              color: Colors.black,
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
                        child: SfPdfViewer.network("${screenHomeMorePDPAResponse?.body?.data?.pdpaurl}")),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  screenHomeMorePDPAResponse?.body?.data?.pdpaversion != "1"
                      ? Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                                child: ButtonCustom(
                              label: screenHomeMorePDPAResponse?.body?.screeninfo?.btnaccept ?? pDPABtnAccept,
                              colortext: tcButtonTextBlack,
                              colorbutton: tcButtonTextWhite,
                              sizetext: sizeTextBig20,
                              colorborder: tcButtonTextBoarder,
                              sizeborder: 10,
                              onPressed: () {
                                // BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: true));
                              },
                            )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                                child: ButtonCustom(
                              label: screenHomeMorePDPAResponse?.body?.screeninfo?.btndecline ?? pDPABtnDecline,
                              colortext: tcButtonTextWhite,
                              colorbutton: tcButtonTextRed,
                              sizetext: sizeTextBig20,
                              colorborder: tcButtonTextRedBoarder,
                              sizeborder: 10,
                              onPressed: () {
                                // BlocProvider.of<PdpaBloc>(context).add(OnClickPDPAEvent(accept: false));
                              },
                            )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
}
