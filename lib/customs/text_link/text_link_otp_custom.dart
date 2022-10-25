import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextSendOTPCustom extends StatelessWidget {
  final String textlabel;
  final Color? textcolor;
  final double sizetext;
  final VoidCallback? onTap;
  const TextSendOTPCustom(
      {Key? key, required this.textlabel, required this.textcolor, this.onTap, required this.sizetext,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(textlabel,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: textcolor,
            decorationColor: textcolor,
            fontWeight: FontWeight.w600,
              fontSize: sizetext
          )),
    );
  }
}
