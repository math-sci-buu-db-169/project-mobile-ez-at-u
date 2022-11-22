import 'package:flutter/material.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/home/model/response/more_response/screen_more_contact_us_response.dart';
import '../../../../module/home/screen/more_widget/contact_Social_faculty_widget.dart';
import '../../../../module/home/screen/more_widget/contact_faculty_widget.dart';
import '../../../../module/home/screen/more_widget/contact_math_widget.dart';

contactUsWidget(
  BuildContext context,
  setState,
  Future<void> Function(Uri url) launchInBrowser,
  ScreenMoreContactUsResponse? screenMoreContactUsResponse,
) {
  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(

        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
          ),
          title: Text(
            screenMoreContactUsResponse?.body?.screeninfo?.titlecontactus ?? 'ติดต่อเรา.',
            style:  TextStyle(
              color: Theme.of(context).appBarTheme.foregroundColor,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            // color: Colors.grey[200],
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          titleContactUS(
                            context,
                            screenMoreContactUsResponse,
                          ),
                          contactMathWidget(context, screenMoreContactUsResponse),
                          contactFacultyWidget(context, screenMoreContactUsResponse),
                          contactSocialFacultyWidget(context, setState, launchInBrowser, screenMoreContactUsResponse),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: floatingLineOffice(context:context,setState, launchInBrowser, screenMoreContactUsResponse),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ));
}

titleContactUS(BuildContext context, ScreenMoreContactUsResponse? screenMoreContactUsResponse) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    // child: Center(
    //   child: Padding(
    //     padding: const EdgeInsets.only(top: 18, bottom: 10),
    //     child: Text(
    //       screenMoreContactUsResponse?.body?.screeninfo?.subtitlecontactus ?? "ช่องทางการติดต่อเรา",
    //       style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    //     ),
    //   ),
    // ),
    // ใช้งานอยู่
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: screenMoreContactUsResponse?.body?.screeninfo?.titlecontactus == null
                ? Image(
              width: 100,
              height: 100,
              image: NetworkImage(screenMoreContactUsResponse?.body?.screeninfo?.titlecontactus ??
                  'https://webzbinaryz.web.app/assets/EZ@US.png'),
            )
                : const Image(
                width: 100,
                height: 100,
                image: AssetImage(
                  'assets/logo/EZ@ULOGO.png',
                ))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding:const EdgeInsets.only(top: 18, left: 10),
              child: Text(screenMoreContactUsResponse?.body?.screeninfo?.subtitlecontactus??"ช่องทางการติดต่อเรา",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
  color: Theme.of(context).bottomAppBarColor,),
              ),
            ),
            screenMoreContactUsResponse?.body?.screeninfo?.titlecontactus == null
                ? const Image(
              height:30,
              image: NetworkImage(
                  'https://webzbinaryz.web.app/assets/EZ@U2.png'),
            )
                : const Image(
                height: 30,
                image: AssetImage(
                  'assets/logo/EZ@U.png',
                )),
          ],
        ),
      ],
    ),
  );
}
