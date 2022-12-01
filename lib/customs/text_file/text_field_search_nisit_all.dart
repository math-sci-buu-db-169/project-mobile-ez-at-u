// import 'dart:html';

import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../module/home/model/response/more_response/screen_more_board_student_list_response.dart';

class TextFieldSearchNiSitAllCustom extends StatefulWidget {
  final TextEditingController? textEditingController;
  // final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final Function(int optionSearchResult) callbackFromOptionSearch;
  final String? initialvalue;
  final ScreenMoreBoardStudentListResponse? screenMoreBoardStudentListResponse;
  final IconData iconsFile;
  const TextFieldSearchNiSitAllCustom({
    Key? key,
    this.textEditingController,
    // required this.hintLabel,
    this.onChanged,
    required this.textInputType,
    this.initialvalue,
    required this.iconsFile,
    required this.callbackFromOptionSearch,
    required this.screenMoreBoardStudentListResponse,
  }) : super(key: key);



  @override
  State<TextFieldSearchNiSitAllCustom> createState() =>
      _TextFieldSearchNiSitAllCustomState();
}

class _TextFieldSearchNiSitAllCustomState extends State<TextFieldSearchNiSitAllCustom> {
  bool _isVisible = false;
  // List<String> optionsNiSit =["รหัสนิสิต","ชื่อ","นามสกุล"];
  String? hintLabelSearchNiSit='';

  @override
  void initState() {
     hintLabelSearchNiSit = widget.screenMoreBoardStudentListResponse?.body?.options?[0].title.toString() ;
     setState(() {});
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String search = widget.screenMoreBoardStudentListResponse?.body?.screeninfo?.search?? 'ค้นหา';
    String here = widget.screenMoreBoardStudentListResponse?.body?.screeninfo?.here?? 'ที่นี';

    return Container(
        // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          style:  TextStyle(
            fontSize: sizeText18,
            color:  Theme.of(context).appBarTheme.foregroundColor // height: 2.0,
          ),
          cursorColor: Theme.of(context).appBarTheme.foregroundColor,
          keyboardType: widget.textInputType,
          // controller: textEditingController,
          initialValue: widget.initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: widget.onChanged,
          obscureText: false,
          decoration: InputDecoration(
              filled: true,
              fillColor:Colors.transparent,
              hintText: '$search $hintLabelSearchNiSit $here',
              prefixIcon:   Icon(
                  FontAwesomeIcons.magnifyingGlass,
                size: 20,
                color: Theme.of(context).iconTheme.color,

              ),
              suffixIcon:
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SingleChildScrollView(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: List.generate(
                                          widget.screenMoreBoardStudentListResponse?.body?.options?.length??0,
                                              (index) => Column(
                                            children: [

                                              InkWell(
                                                  onTap: () {
                                                    widget.callbackFromOptionSearch(index);
                                                    hintLabelSearchNiSit =  widget.screenMoreBoardStudentListResponse?.body?.options?[index].title.toString();
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  },
                                                  child:Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Table(
                                                      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
                                                      columnWidths: {0: FractionColumnWidth(1)},
                                                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                                      children: [
                                                        TableRow(children: [
                                                          Text(
                                                            widget.screenMoreBoardStudentListResponse?.body?.options?[index].title.toString() ?? '',
                                                            textAlign: TextAlign.center,
                                                            style:  TextStyle(fontSize: sizeTextSmaller14,
                                                              color: Theme.of(context).bottomAppBarColor,),
                                                          ),
                                                        ])
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              index > 1 || index == (widget.screenMoreBoardStudentListResponse?.body?.options?.length?? 1)-1
                                                  ? const SizedBox()
                                                  : const Divider(
                                                color: Colors.grey,
                                                height: 5,
                                                thickness: 1,
                                                indent: 0,
                                                endIndent: 0,
                                              ),

                                            ],
                                          )
                                      ),
                                    )));
                          });
                    });
                  },
                  icon: _isVisible
                      ?  FaIcon(FontAwesomeIcons.caretUp,

                    color: Theme.of(context).iconTheme.color,

                  )
                      :  FaIcon(FontAwesomeIcons.caretDown,

                    color: Theme.of(context).iconTheme.color,
                  )),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color:Theme.of(context).bottomAppBarColor ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 1)),
              )),
        );
  }
}
