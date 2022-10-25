import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextLinkToScreenCustom extends StatelessWidget {
  final String linklabel;

  final Color? linktextcolor;
  final double sizetext;
  final VoidCallback? onTap;
  const TextLinkToScreenCustom(
      {Key? key, required this.linklabel, required this.linktextcolor, this.onTap, required this.sizetext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Text(linklabel,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: linktextcolor,
            decorationColor: linktextcolor,
            fontWeight: FontWeight.w600,
              fontSize: sizetext
          )),


    );
  }
}
