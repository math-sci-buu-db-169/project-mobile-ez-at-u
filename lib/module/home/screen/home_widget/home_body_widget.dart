import 'package:flutter/material.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_home.dart';
import '../../../../module/activity/model/response/screen_status_activity_response.dart';
import '../../../../module/activity/screen/buildlistactivity.dart';
import '../../../../module/home/model/response/home_response/alert_no_activity_response.dart';

homeBodyActivityWidget(
  BuildContext context,
  ScreenStatusActivityResponse? screenStatusActivityResponse,
) {
  return Container(
    color: tcButtonTextWhite,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildListActivity(context, screenStatusActivityResponse),
            const SizedBox(
              height: 300,
            ),
          ],
        ),
      ),
    ),
  );
}

homeBodyEntryWidget(
  BuildContext context,
  AlertNoActivityResponse? alertNoActivityResponse,
) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: transparent),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.running_with_errors_outlined,
              color: tcNoActivity,
              size: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(alertNoActivityResponse?.body?.screeninfo?.noactivity??noActivity,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: tcNoActivity)),
            const SizedBox(
              height: 5,
            ),
            Text(alertNoActivityResponse?.body?.screeninfo?.subactlineone??subNoActivityLineOne,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: tcNoActivity)),
            const SizedBox(
              height: 5,
            ),
            Text(alertNoActivityResponse?.body?.screeninfo?.subactlinetwo??subNoActivityLineTwo,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: tcNoActivity)),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ));
}
