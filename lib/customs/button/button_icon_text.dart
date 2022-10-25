import 'package:flutter/material.dart';

buttonIconsText(
    {required Null Function() onPressed,
    required Color colortext,
    required Color colorbutton,
    required double sizetext,
    required Color colorborder,
    required String label,
    required IconData iconlabel}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorbutton),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: colorborder, width: 2),
        ))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconlabel,
          color: colorborder,
          size: sizetext,
        ),
        Text(
          "   $label   ",
          style: TextStyle(fontSize: sizetext, color: colortext, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
