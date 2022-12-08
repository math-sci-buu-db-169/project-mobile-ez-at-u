import 'package:flutter/material.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_home.dart';
import '../../../../module/activity/model/response/screen_status_activity_response.dart';
import '../../../../module/activity/screen/buildlistactivity.dart';
import '../../../../module/home/model/response/home_response/alert_no_activity_response.dart';

homeBodyActivityWidget(
  BuildContext context,
  ScreenStatusActivityStudentResponse? screenStatusActivityResponse,
) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,

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

homeStudentBodyEmptyActivityWidget(
  BuildContext context,
  AlertNoActivityStudentResponse? alertNoActivityResponse,
) {
  return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: transparent),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
              Icons.running_with_errors_outlined,
              color:Theme.of(context).bottomAppBarColor.withOpacity(0.8),
              size: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(alertNoActivityResponse?.body?.screeninfo?.noactivity??noActivity,
                style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
                  color:Theme.of(context).bottomAppBarColor.withOpacity(0.8),)),
            const SizedBox(
              height: 5,
            ),
            Text(alertNoActivityResponse?.body?.screeninfo?.subactlineone??subNoActivityLineOne,
                style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500,
                  color:Theme.of(context).bottomAppBarColor.withOpacity(0.8),)),
            const SizedBox(
              height: 5,
            ),
            Text(alertNoActivityResponse?.body?.screeninfo?.subactlinetwo??subNoActivityLineTwo,
                style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500,
                  color:Theme.of(context).bottomAppBarColor.withOpacity(0.8),)),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ));
}
