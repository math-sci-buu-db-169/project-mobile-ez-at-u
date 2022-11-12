import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldSearchCustom extends StatefulWidget {
  final TextEditingController? textEditingController;
  // final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;

  final IconData iconsFile;
  const TextFieldSearchCustom({
    Key? key,
    this.textEditingController,
    // required this.hintLabel,
    this.onChanged,
    required this.textInputType,
    this.initialvalue,
    required this.iconsFile,
  }) : super(key: key);



  @override
  State<TextFieldSearchCustom> createState() =>
      _TextTextFieldSearchCustomState();
}

class _TextTextFieldSearchCustomState extends State<TextFieldSearchCustom> {
  bool _isVisible = false;
  List<String> optionsGen =["ลำดับรุ่นมหาลัย","ชื่อรุ่นมหาลัย"];
  String hintLabelBUU='';

  @override
  void initState() {
     hintLabelBUU = "ลำดับรุ่นมหาลัย" ;
     setState(() {});
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          style: const TextStyle(
              fontSize: sizeText18, color: Colors.black // height: 2.0,
              ),
          cursorColor: Colors.black,
          keyboardType: widget.textInputType,
          // controller: textEditingController,
          initialValue: widget.initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: widget.onChanged,
          obscureText: !_isVisible,
          decoration: InputDecoration(
              filled: true,
              fillColor: tcTextfile,
              hintText: hintLabelBUU,
              prefixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                      showDialog(
                          context: context,
                          barrierDismissible: false,
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
                                          int.parse("2"),
                                          (index) => Column(
                                            children: [
                                              index != 1
                                                  ? const SizedBox()
                                                  : const Divider(
                                                color: Colors.grey,
                                                height: 5,
                                                thickness: 1,
                                                indent: 20,
                                                endIndent: 0,
                                              ),
                                              InkWell(
                                                  onTap: () {

                                                    hintLabelBUU = optionsGen[index].toString();
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
                                                            optionsGen[index].toString(),
                                                            textAlign: TextAlign.center,
                                                            style: const TextStyle(fontSize: sizeTextSmaller14),
                                                          ),
                                                        ])
                                                      ],
                                                    ),
                                                  )
                                              )

                                            ],
                                          )
                                      ),
                                    )));
                          });
                    });
                  },
                  icon: _isVisible
                      ? const FaIcon(FontAwesomeIcons.caretUp,
                          color: Color(0xFF4F4F4F))
                      : const FaIcon(FontAwesomeIcons.caretDown,
                          color: Color(0xFF4F4F4F))),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass,
                      size: 20, color: Color(0xFF4F4F4F))),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: tcHint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: fcBlue, width: 2.0),
              )),
        ));
  }
}
