import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

import '../color/color_const.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final  IconData iconsFile;
  final ValueChanged<String>? onChanged;
  final int? maxLengthOTP;
  final String? initialvalue;

   TextFieldCustom({Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue,
     this.maxLengthOTP, required this.iconsFile,
       })
      : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {

  @override
  Widget build(BuildContext context) {
    // IconData iconsFile = Icons.person_rounded;
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // padding: EdgeInsets.all(12),
        margin:  const EdgeInsets.all(12),
        child: TextFormField(
          cursorColor: appBarforegroundColor,
          maxLength: widget.maxLengthOTP,

          style:   TextStyle(fontSize: sizeText18, color: appBarforegroundColor // height: 2.0,
          ),
          keyboardType: widget.textInputType,
          initialValue: widget.initialvalue,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              prefixIcon: Icon(widget.iconsFile,
                color: Theme.of(context).iconTheme.color,
        ),
              hintStyle: TextStyle(color: appBarforegroundColor.withOpacity(0.5)),
              filled: true,
              // fillColor: Theme.of(context).scaffoldBackgroundColor,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: widget.hintLabel,
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 2.0),

              )),

        )
    );
  }
}
