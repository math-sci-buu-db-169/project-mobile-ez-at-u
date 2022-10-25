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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.black,
            ),
          ),
          title: Text(
            screenHomeMoreFAQResponse?.body?.screeninfo?.titlefaq ?? moreBtnAndTitleFaq,
            style: const TextStyle(
              color: Colors.black,
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
