import 'package:ez_at_u/customs/message/text_board.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/module/home/screen/more_widget/build_list_student.dart';
import 'package:flutter/material.dart';
import '../../../../customs/text_file/text_field_custom.dart';
import '../../model/response/more_response/screen_more_board_student_list_response.dart';

studentListBody(
    BuildContext context, ScreenMoreBoardStudentListResponse? screenMoreBoardStudentListResponse, String title, TextEditingController searchNiSitController) {
  String generation =
      screenMoreBoardStudentListResponse?.body?.screeninfo?.titleboardgen ?? boardDetailNiSitTitleBoardNiSitGen;
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
            "$generation  $title ",
            style: const TextStyle(
              color: Colors.black,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
              color: Colors.grey[200],
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                // child: buildListStudent(context, screenMoreBoardStudentListResponse),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldCustom(
                      textEditingController: searchNiSitController,
                      onChanged: (valueUserID) {
                        searchNiSitController.text = valueUserID;
                      },

                      hintLabel: 'ข้อมูลนิสิต',
                      textInputType: TextInputType.text,
                      initialvalue: searchNiSitController.text,
                      iconsFile : Icons.search,
                    ),
                    Expanded(child: buildListStudent(context, screenMoreBoardStudentListResponse),)

                  ],
                ),
              )),
        ),
      ));
}
