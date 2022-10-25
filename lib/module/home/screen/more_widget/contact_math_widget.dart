import 'package:flutter/material.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/home/model/response/more_response/screen_more_contact_us_response.dart';
import '../../../../module/home/screen/more_widget/table_contact_style_wedget.dart';

contactMathWidget(BuildContext context, ScreenMoreContactUsResponse? screenMoreContactUsResponse) {
  String startPeriod = screenMoreContactUsResponse?.body?.data?.startperiod ?? "จันทร์";
  String endPeriod = screenMoreContactUsResponse?.body?.data?.endtperiod ?? "ศุกร์";
  String startTime = screenMoreContactUsResponse?.body?.data?.starttime ?? "08:00";
  String endTime = screenMoreContactUsResponse?.body?.data?.endtime ?? "16:00";
  String textUnitTime = screenMoreContactUsResponse?.body?.screeninfo?.textunittime ?? "น.";
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    elevation: 5,
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          // bottomLeft: Radius.circular(40),
        ),
        gradient: LinearGradient(stops: [
          0.02,
          0.02,
          1,
        ], colors: [
          contactUsMath,
          Colors.white,
          Colors.white,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          contactUnderlineOneRow(
            title: screenMoreContactUsResponse?.body?.data?.contactname ?? "ภาควิชาคณิตศาสตร์ คณะวิทยาศาสตร์ ",
            sizeColumnOne: 1,
          ),
          contactOneRow(
            title: screenMoreContactUsResponse?.body?.data?.address ??
                "มหาวิทยาลัยบูรพา 169 ถ.ลงหาดบางแสน ต.แสนสุข อ.เมือง จ.ชลบุรี 20131",
            sizeColumnOne: 1,
          ),
          contactThreeRow(
            context,
            title: screenMoreContactUsResponse?.body?.screeninfo?.texttel ?? "โทร",
            textCenter: '  ',
            value: screenMoreContactUsResponse?.body?.data?.phone ?? "0-3810-3078",
            sizeColumnOne: 0.2,
            sizeColumnTwo: 0.75,
            sizeColumnThree: 0.05,
          ),
          contactThreeRow(
            context,
            title: screenMoreContactUsResponse?.body?.screeninfo?.textfax ?? "แฟกซ์",
            textCenter: '',
            value: screenMoreContactUsResponse?.body?.data?.fax ?? "0-3839-3496",
            sizeColumnOne: 0.2,
            sizeColumnTwo: 0.75,
            sizeColumnThree: 0.05,
          ),
          contactThreeRow(
            context,
            title: "อิเมล",
            textCenter: '',
            value: screenMoreContactUsResponse?.body?.data?.email ?? "math_sci@buu.ac.th",
            sizeColumnOne: 0.2,
            sizeColumnTwo: 0.75,
            sizeColumnThree: 0.05,
          ),
          Center(
            child: Text(
              "$startPeriod - $endPeriod ",
              style: const TextStyle(fontSize: sizeTextSmaller14),
            ),
          ),
          Center(
            child: Text(
              "$startTime - $endTime $textUnitTime ",
              style: const TextStyle(fontSize: sizeTextSmaller14),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}
