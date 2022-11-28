// import 'dart:html';

import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:ez_at_u/module/home/model/response/more_response/screen_more_list_name_gen_response.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldSearchGenBUUCustom extends StatefulWidget {
  final TextEditingController? textEditingController;
  // final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final Function(int optionSearchResult) callbackFromOptionSearch;
  final String? initialvalue;
final ScreenMoreListNameGenResponse? screenMoreListNameGenResponse;
  final IconData iconsFile;
  const TextFieldSearchGenBUUCustom({
    Key? key,
    this.textEditingController,
    // required this.hintLabel,
    this.onChanged,
    required this.textInputType,
    this.initialvalue,
    required this.iconsFile,
    required this.callbackFromOptionSearch, this.screenMoreListNameGenResponse,
  }) : super(key: key);



  @override
  State<TextFieldSearchGenBUUCustom> createState() =>
      _TextTextFieldSearchCustomState();
}

class _TextTextFieldSearchCustomState extends State<TextFieldSearchGenBUUCustom> {
  bool _isVisible = false;
  List<String> optionsGen =["ลำดับรุ่นมหาลัย","ชื่อรุ่นมหาลัย"];
  String? hintLabelBUU='';

  @override
  void initState() {
     hintLabelBUU = widget.screenMoreListNameGenResponse?.body?.options?[0].title.toString() ;
     setState(() {});
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String search = widget.screenMoreListNameGenResponse?.body?.screeninfo?.search?? 'ค้นหา';
    String here = widget.screenMoreListNameGenResponse?.body?.screeninfo?.here?? 'ที่นี';
    return Container(
        // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          style:  TextStyle(
              fontSize: sizeText18,
              color:  Theme.of(context).appBarTheme.foregroundColor, // height: 2.0,
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
              hintText: '$search $hintLabelBUU $here',
              prefixIcon:   Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                  color: Theme.of(context).iconTheme.color,

              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return Dialog(
                              // backgroundColor:Theme.of(context).scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SingleChildScrollView(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: List.generate(
                                          widget.screenMoreListNameGenResponse?.body?.options?.length??0,
                                          (index) => Column(
                                            children: [

                                              InkWell(
                                                  onTap: () {
                                                    widget.callbackFromOptionSearch(index);
                                                    hintLabelBUU =  widget.screenMoreListNameGenResponse?.body?.options?[index].title.toString();
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
                                                            widget.screenMoreListNameGenResponse?.body?.options?[index].title.toString() ?? '',
                                                            textAlign: TextAlign.center,
                                                            style:  TextStyle(fontSize: sizeTextSmaller14,
                                                              color: Theme.of(context).bottomAppBarColor,),
                                                          ),
                                                        ])
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              index > 1 || index == (widget.screenMoreListNameGenResponse?.body?.options?.length??0) -1
                                        ? const SizedBox()
                                                  :  const Divider(
                                                // color: Theme.of(context).iconTheme.color,
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
              // suffixIcon: IconButton(
              //     onPressed: () {},
              //     icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,
              //         size: 20, color: Color(0xFF4F4F4F))),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color:Theme.of(context).bottomAppBarColor ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder:  const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Colors.yellowAccent, width: 2.0),
              )),
        ));
  }
}
