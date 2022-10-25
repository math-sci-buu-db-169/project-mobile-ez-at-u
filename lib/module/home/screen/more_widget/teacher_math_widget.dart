import 'package:flutter/material.dart';
import '../../../../customs/message/text_board.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/home/model/response/more_response/screen_more_board_teacher_response.dart';
import '../../../../module/home/screen/more_widget/BuildListTeacher.dart';

teacherMathWidget(BuildContext context, ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(screenMoreBoardTeacherResponse?.body?.screeninfo?.textadvisor ?? boardPersonalTextAdvisor,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  )),
            ),
            buildListTeacherLeft(context, screenMoreBoardTeacherResponse),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                  screenMoreBoardTeacherResponse?.body?.screeninfo?.textacademicstaff ?? boardPersonalTextAcademicStaff,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: sizeTitle24,
                  )),
            ),
            buildListStaff(context, screenMoreBoardTeacherResponse),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
