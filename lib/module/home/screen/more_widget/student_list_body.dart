import 'package:ez_at_u/customs/message/text_board.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/module/home/screen/more_widget/build_list_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../customs/text_file/text_field_custom.dart';
import '../../../../customs/text_file/text_field_search_nisit.dart';
import '../../bloc/more_bloc/more_bloc.dart';
import '../../model/response/more_response/screen_more_board_student_list_response.dart';

studentListBody(
    BuildContext context, ScreenMoreBoardStudentListResponse? screenMoreBoardStudentListResponse,
    String title,
    TextEditingController searchNiSitController,
    int optionSearchNiSit,
    void Function(int clickOptionSearch) setOptionSearchNiSit) {
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

          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,
                    size: 20, color: Color(0xFF4F4F4F))),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.filter,
                    size: 20, color: Color(0xFF4F4F4F))),
          ],
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
                    TextFieldSearchNiSitCustom(
                      textEditingController: searchNiSitController,
                      callbackFromOptionSearch: (int optionSearchResult) {
                        setOptionSearchNiSit(optionSearchResult);
                        // optionSearch = optionSearchResult;
                      },
                      onChanged: (valuePassword) {
                        searchNiSitController.text = valuePassword;
                        print(optionSearchNiSit);
                        switch(optionSearchNiSit) {
                          case 0: {
                            context.read<MoreBloc>().add(MoreBoardListStudentSearchEvent(
                              gen:title , studentID: searchNiSitController.text, studentName: '', studentLastname: '',));
                          }
                          break;

                          case 1: {
                            context.read<MoreBloc>().add(MoreBoardListStudentSearchEvent(
                              gen:title , studentID:'' , studentName: searchNiSitController.text ,studentLastname: '',));

                          }
                          break;
                          case 2: {
                            context.read<MoreBloc>().add(MoreBoardListStudentSearchEvent(
                            gen:title , studentID: '', studentName: '', studentLastname: searchNiSitController.text,));
                          }
                          break;
                          default: {
                            context.read<MoreBloc>().add(MoreBoardListStudentSearchEvent(
                              gen:title , studentID: '', studentName: '', studentLastname: '',));
                          }
                          break;
                        }

                      },
                      // hintLabel: 'ชื่อรุ่นมหาลัย',
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
