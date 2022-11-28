import 'package:flutter/material.dart';

import '../../../../../customs/message/text_board.dart';
import '../../../model/response/more_response/screen_more_board_teacher_response.dart';
import 'board_item_teacher.dart';
import 'more_board_staff_detail_screen.dart';
import 'more_board_teacher_detail_screen.dart';

buildListTeacherLeft(
  BuildContext context,
  ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse,
) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?.length}"),
            (index) => boardItemTeacherLeft(
              context:context,
                  dataTeachermath: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index],
                  titleTeacher: screenMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardTeacherDetailScreen(
                          name: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index].name ?? '-',
                          lastname: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index].lastname ?? '-',
                          position: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index].position ?? '-',
                          phone: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index].phone ?? '-',
                          email: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index].email ?? '-',
                          url: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index].website ?? '-',
                          img: screenMoreBoardTeacherResponse?.body?.teacher?.teachermath?[index].img ?? '-',
                          titleName:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textname ?? boardPersonalTextName,
                          titlePosition: screenMoreBoardTeacherResponse?.body?.screeninfo?.textpositon ??
                              boardPersonalTextPosition,
                          titlePhone: screenMoreBoardTeacherResponse?.body?.screeninfo?.texttel ?? boardPersonalTextTel,
                          titleEmail:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textemail ?? boardPersonalTextEmail,
                          titleUrl:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textgotoweb ?? boardPersonalTextGotoWeb,
                        ),
                      ),
                    );
                  },
                ))),
  );
}

buildListTeacherRight(
  BuildContext context,
  ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse,
) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?.length}"),
            (index) => boardItemTeacherRight(
              context:context,
                  dataTeacherstats: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?.elementAt(index),
                  titleTeacher: screenMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardTeacherDetailScreen(
                          name: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?[index].name ?? '-',
                          lastname: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?[index].lastname ?? '-',
                          position: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?[index].position ?? '-',
                          phone: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?[index].phone ?? '-',
                          email: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?[index].email ?? '-',
                          url: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?[index].website ?? '-',
                          img: screenMoreBoardTeacherResponse?.body?.teacher?.teacherstats?[index].img ?? '-',
                          titleName:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textname ?? boardPersonalTextName,
                          titlePosition: screenMoreBoardTeacherResponse?.body?.screeninfo?.textpositon ??
                              boardPersonalTextPosition,
                          titlePhone: screenMoreBoardTeacherResponse?.body?.screeninfo?.texttel ?? boardPersonalTextTel,
                          titleEmail:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textemail ?? boardPersonalTextEmail,
                          titleUrl:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textgotoweb ?? boardPersonalTextGotoWeb,
                        ),
                      ),
                    );
                  },
                ))),
  );
}

buildListStaff(BuildContext context, ScreenMoreBoardTeacherResponse? screenMoreBoardTeacherResponse) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
    scrollDirection: Axis.vertical,
    child: Column(
        children: List.generate(
            int.parse("${screenMoreBoardTeacherResponse?.body?.staff?.length}"),
            (index) => boardItemStaff(
              context:context,
                  dataStaff: screenMoreBoardTeacherResponse?.body?.staff?[index],
                  titleTeacher: screenMoreBoardTeacherResponse?.body?.screeninfo,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardStaffDetailScreen(
                          name: screenMoreBoardTeacherResponse?.body?.staff?[index].name ?? '-',
                          lastName: screenMoreBoardTeacherResponse?.body?.staff?[index].lastname ?? '-',
                          position: screenMoreBoardTeacherResponse?.body?.staff?[index].position ?? '-',
                          phone: screenMoreBoardTeacherResponse?.body?.staff?[index].phone ?? '-',
                          email: screenMoreBoardTeacherResponse?.body?.staff?[index].email ?? '-',
                          img: screenMoreBoardTeacherResponse?.body?.staff?[index].img ?? '-',
                          titleName:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textname ?? boardPersonalTextName,
                          titlePosition: screenMoreBoardTeacherResponse?.body?.screeninfo?.textpositon ??
                              boardPersonalTextPosition,
                          titlePhone: screenMoreBoardTeacherResponse?.body?.screeninfo?.texttel ?? boardPersonalTextTel,
                          titleEmail:
                              screenMoreBoardTeacherResponse?.body?.screeninfo?.textemail ?? boardPersonalTextEmail,
                        ),
                      ),
                    );
                  },
                ))),
  );
}
