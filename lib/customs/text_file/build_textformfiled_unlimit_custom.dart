import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

import '../color/color_const.dart';

class BuildTextformfieldUnlimitCustom extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  final IconData iconsFile;
  const BuildTextformfieldUnlimitCustom(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue, required this.iconsFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: sizeText18, color: appBarforegroundColor // height: 2.0,
          ),
          keyboardType: textInputType,
          maxLines: null,
          // controller: textEditingController,
          initialValue: initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: onChanged,
          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
            prefixIcon: Icon(iconsFile, color: appBarforegroundColor,),
              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 2.0),
              )),
        ));
  }
}
