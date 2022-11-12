import 'package:flutter/material.dart';
import '../../../../customs/message/text_board.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_search_custom.dart';
import '../../../../module/home/model/response/more_response/screen_more_list_name_gen_response.dart';
import '../../../../module/home/screen/more_widget/build_list_student.dart';
import '../../../../module/home/screen/more_widget/board_Item_student.dart';
import '../../../../module/home/screen/more_screen/board_screen/more_board_student_List_screen.dart';

studentListGenBody(BuildContext context, ScreenMoreListNameGenResponse? screenMoreListNameGenResponse, TextEditingController searchController) {
  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
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
            screenMoreListNameGenResponse?.body?.screeninfo?.titleboardnisit ?? boardDetailNiSitTitleBoardNiSit,
            style: const TextStyle(
              color: Colors.black,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextFieldSearchCustom(
                textEditingController: searchController,
                onChanged: (valuePassword) {
                  searchController.text = valuePassword;
                },
                // hintLabel: 'ชื่อรุ่นมหาลัย',
                textInputType: TextInputType.text,
                initialvalue: searchController.text,
                iconsFile : Icons.search,
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                color: Colors.transparent,
                child: boardItemStudentUser(
                  dataUserStudent: screenMoreListNameGenResponse?.body?.userGen,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreBoardStudentListScreen(
                          titleGen: "${screenMoreListNameGenResponse?.body?.userGen?.numgen}",
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildGenListStudent(context, screenMoreListNameGenResponse),
                        const SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
