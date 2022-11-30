import 'package:ez_at_u/customs/message/text_board.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/module/home/screen/more_widget/build_list_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../customs/text_file/text_field_search_nisit_all.dart';
import '../../../bloc/more_bloc/more_bloc.dart';
import '../../../model/response/more_response/screen_more_board_student_list_response.dart';


studentListScreenBody(
    BuildContext context, ScreenMoreBoardStudentListResponse? screenMoreBoardStudentListResponse,
    TextEditingController searchNiSitController,
    int optionSearchNiSit,
    void Function(int clickOptionSearch) setOptionSearchNiSit, void Function(String clickOptionSearchGenNiSit) setOptionSearchGenNiSit,
    String optionSearchGen) {
  String generation =
      screenMoreBoardStudentListResponse?.body?.screeninfo?.titleboardgen ?? boardDetailNiSitTitleBoardNiSitGen;
 List<String> lengthPopupMenuItem =["ล้างทั้งหมด",'65','64','63'];
  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor:Theme.of(context).primaryColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Theme.of(context).bottomAppBarColor,
            ),
          ),
          title: Text(
            "$generation  $optionSearchGen ",
            style:  TextStyle(
              color: Theme.of(context).bottomAppBarColor,
              fontSize: sizeTitle24,
            ),
          ),

          actions: [
            PopupMenuButton(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    FontAwesomeIcons.filter,
                    size: 20,
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                ),
              ),
              itemBuilder: (context) {
                return List.generate(
                    (lengthPopupMenuItem.length)
                    , (index) {

                  return  PopupMenuItem(
                    value: index,
                    child: Text(lengthPopupMenuItem[index] ??'Settings',style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
                  );

                }
                );
              },
                onSelected: (value) {
                  optionSearchGen ='';
                  if(value != 0){
                    optionSearchGen = lengthPopupMenuItem[value];
                  }
                  setOptionSearchGenNiSit(optionSearchGen);
                  context.read<MoreBloc>().add(MoreSrarchNisitEvent(gen: optionSearchGen,studentID: '',studentName: '',studentLastname:'' ));

                }

            ),





            // IconButton(
            //     onPressed: () {},
            //     icon:  FaIcon(FontAwesomeIcons.filter,
            //       size: 20,
            //       color: Theme.of(context).bottomAppBarColor,)),
            // IconButton(
            //     onPressed: () {},
            //     icon:  FaIcon(FontAwesomeIcons.filter,
            //         size: 20,
            //       color: Theme.of(context).bottomAppBarColor,)),
          ],
        ),
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                // child: buildListStudent(context, screenMoreBoardStudentListResponse),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldSearchNiSitAllCustom(
                      screenMoreBoardStudentListResponse:screenMoreBoardStudentListResponse,
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
                            context.read<MoreBloc>().add(MoreSrarchNisitEvent(
                              gen:optionSearchGen , studentID: searchNiSitController.text, studentName: '', studentLastname: '',));
                          }
                          break;

                          case 1: {
                            context.read<MoreBloc>().add(MoreSrarchNisitEvent(
                              gen:optionSearchGen , studentID:'' , studentName: searchNiSitController.text ,studentLastname: '',));

                          }
                          break;
                          case 2: {
                            context.read<MoreBloc>().add(MoreSrarchNisitEvent(
                              gen:optionSearchGen , studentID: '', studentName: '', studentLastname: searchNiSitController.text,));
                          }
                          break;
                          default: {
                            context.read<MoreBloc>().add(MoreSrarchNisitEvent(
                              gen:optionSearchGen , studentID: '', studentName: '', studentLastname: '',));
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
