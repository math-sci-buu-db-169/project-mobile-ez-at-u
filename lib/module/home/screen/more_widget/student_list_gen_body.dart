import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../customs/message/text_board.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_search_gen_buu.dart';
import '../../../../module/home/model/response/more_response/screen_more_list_name_gen_response.dart';
import '../../../../module/home/screen/more_widget/build_list_student.dart';
import '../../../../module/home/screen/more_widget/board_Item_student.dart';
import '../../../../module/home/screen/more_screen/board_screen/more_board_student_List_screen.dart';
import '../../bloc/more_bloc/more_bloc.dart';

studentListGenBody(BuildContext context, ScreenMoreListNameGenResponse? screenMoreListNameGenResponse, TextEditingController searchNiSItController, int optionSearch, void Function(int) setOptionSearch) {

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:  Icon(
                Icons.arrow_back,
                size: sizeTitle24,
                color: Theme.of(context).bottomAppBarColor ,
                // color: Colors.black,
              ),
            ),
            title: Text(
              screenMoreListNameGenResponse?.body?.screeninfo?.titleboardnisit ?? boardDetailNiSitTitleBoardNiSit,
              style:  TextStyle(
                // color: Colors.black,
                fontSize: sizeTitle24,
                color: Theme.of(context).bottomAppBarColor ,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon:  FaIcon(FontAwesomeIcons.filter,
                      size: 20,
                      color: Theme.of(context).bottomAppBarColor ,
                  )),
            ],
          ),
          body: SafeArea(
            child: Container(
              color: Colors.transparent.withOpacity(0.1),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  TextFieldSearchGenBUUCustom(
                    textEditingController: searchNiSItController,
                    callbackFromOptionSearch: (int optionSearchResult) {
                      setOptionSearch(optionSearchResult);
                      // optionSearch = optionSearchResult;
                    },
                    onChanged: (valuePassword) {
                      searchNiSItController.text = valuePassword;
                      optionSearch == 0
                          ?
                      context.read<MoreBloc>().add(MoreBoardListGenStudentSearchEvent(gen: searchNiSItController.text ,genname: '',))
                          :context.read<MoreBloc>().add(MoreBoardListGenStudentSearchEvent(gen: '',genname: searchNiSItController.text ,));
                    },
                    // hintLabel: 'ชื่อรุ่นมหาลัย',
                    textInputType: TextInputType.text,
                    initialvalue: searchNiSItController.text,
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
                      }, context: context,
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
            )
          ),
        ));
  }

