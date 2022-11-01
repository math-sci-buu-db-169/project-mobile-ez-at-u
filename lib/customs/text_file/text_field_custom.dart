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
    return Container(
      // padding: EdgeInsets.all(12),
        margin:  const EdgeInsets.all(12),
        child: TextFormField(
          cursorColor: Colors.black,
          maxLength: widget.maxLengthOTP,

          style:  const TextStyle(fontSize: sizeText18, color: Colors.black // height: 2.0,
          ),
          keyboardType: widget.textInputType,
          initialValue: widget.initialvalue,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              prefixIcon: Icon(widget.iconsFile,

          color: Colors.grey,
        ),
              filled: true,
              fillColor: tcTextfile,
              hintText: widget.hintLabel,
              enabledBorder:  const OutlineInputBorder(
                borderSide: BorderSide(color: tcHint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:  const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: fcBlue, width: 2.0),

              )),

        )
    );
  }
}
