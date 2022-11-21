import 'package:flutter/material.dart';
import '../../model/response/more_response/screen_more_board_student_list_response.dart';
import '../../model/response/more_response/screen_more_list_name_gen_response.dart';
import '../more_screen/board_screen/more_board_student_List_screen.dart';
import '../more_screen/board_screen/more_board_student_detail_screen.dart';
import '../../../../module/home/screen/more_widget/board_Item_student.dart';

buildGenListStudent(BuildContext context, ScreenMoreListNameGenResponse? screenMoreListNameGenResponse) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreListNameGenResponse?.body?.listGen?.length}"),
            (index) => boardItemStudent(
                  data: screenMoreListNameGenResponse?.body?.listGen?[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardStudentListScreen(
                          titleGen: "${screenMoreListNameGenResponse?.body?.listGen?[index].numgen}",
                        ),
                      ),
                    );
                  }, context: context,
                ))),
  );
}

buildListStudent(BuildContext context, ScreenMoreBoardStudentListResponse? screenMoreBoardStudentListResponse) {
  if (int.parse("${screenMoreBoardStudentListResponse?.body?.data?.length}") == 0) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(screenMoreBoardStudentListResponse?.body?.screeninfo?.textsorryth ?? 'ขออภัย ไม่พบข้อมูลในฐานข้อมูล.'),
          Text(screenMoreBoardStudentListResponse?.body?.screeninfo?.textsorryen ??
              'Sorry, no data found in the database.'),
        ],
      )),
    );
  }
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 200),
    scrollDirection: Axis.vertical,
    child: Column(
      children: List.generate(
          int.parse("${screenMoreBoardStudentListResponse?.body?.data?.length}"),
          (index) => boardItemListStudent(
                data: screenMoreBoardStudentListResponse?.body?.data?[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoreBoardStudentDetailScreen(
                        studentCode: screenMoreBoardStudentListResponse?.body?.data?[index].textstudentcode,
                      ),
                    ),
                  );
                },
              )),
    ),
  );
}
