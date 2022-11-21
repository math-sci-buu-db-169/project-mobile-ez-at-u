import 'package:flutter/material.dart';
import '../../../../customs/message/text_more.dart';
import '../../../../module/home/model/response/more_response/screen_more_faq_response.dart';
import '../../../../module/home/screen/more_widget/faq_widget.dart';

fagBody(BuildContext context, ScreenMoreFAQResponse? screenHomeMoreFAQResponse) {
  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,

        appBar: AppBar(
          backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(
              Icons.arrow_back,
              size: 24,
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
          ),
          title: Text(
            screenHomeMoreFAQResponse?.body?.screeninfo?.titlefaq ?? moreBtnAndTitleFaq,
            style:  TextStyle(
              color: Theme.of(context).appBarTheme.foregroundColor,
              fontSize: 24,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FAQWidget(
                  count: screenHomeMoreFAQResponse?.body?.faq?.length ?? 0,
                  screenHomeMoreFAQResponse: screenHomeMoreFAQResponse,
                ),
                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ),
      ));
}
