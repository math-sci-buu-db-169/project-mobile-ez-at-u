import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

import '../../module/home/model/response/more_response/scree_more_pdpa_response.dart';

// const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
// const PdfColor lightGreen =  PdfColor.fromInt(0xffcdf1e7);
// const PdfColor black =  PdfColor.fromInt(0xff00000);

final colorOfPdf = Data(
  black: const PdfColor.fromInt(0x00000000),
  white: const PdfColor.fromInt(0xFFFFFFFF),
  red: const PdfColor.fromInt(0xFFF44336),
  pink: const PdfColor.fromInt(0xFFE91E63),
  purple: const PdfColor.fromInt(0xFF9C27B0),
  deepPurple: const PdfColor.fromInt(0xFF673AB7),
  indigo: const PdfColor.fromInt(0xFF3F51B5),
  blue: const PdfColor.fromInt(0xFF2196F3),
  lightBlue: const PdfColor.fromInt(0xFF03A9F4),
  cyan: const PdfColor.fromInt(0xFF00BCD4),
  teal: const PdfColor.fromInt(0xFF009688),
  green: const PdfColor.fromInt(0xFF4CAF50),
  lightGreen: const PdfColor.fromInt(0xFF8BC34A),
  lime: const PdfColor.fromInt(0xFFCDDC39),
  yellow: const PdfColor.fromInt(0xFFFFEB3B),
  amber: const PdfColor.fromInt(0xFFFFC107),
  orange: const PdfColor.fromInt(0xFFFF9800),
  deepOrange: const PdfColor.fromInt(0xFFFF5722),
  brown: const PdfColor.fromInt(0xFF795548),
  grey: const PdfColor.fromInt(0xFF9E9E9E),
  blueGrey: const PdfColor.fromInt(0xFF607D8B),
  redAccent: const PdfColor.fromInt(0xFFFF5252),
  pinkAccent: const PdfColor.fromInt(0xFFFF4081),
  purpleAccent: const PdfColor.fromInt(0xFFE040FB),
  deepPurpleAccent: const PdfColor.fromInt(0xFF7C4DFF),
  indigoAccent: const PdfColor.fromInt(0xFF536DFE),
  blueAccent: const PdfColor.fromInt(0xFF448AFF),
  lightBlueAccent: const PdfColor.fromInt(0xFF40C4FF),
  cyanAccent: const PdfColor.fromInt(0xFF18FFFF),
  tealAccent: const PdfColor.fromInt(0xFF64FFDA),
  greenAccent: const PdfColor.fromInt(0xFF69F0AE),
  lightGreenAccent: const PdfColor.fromInt(0xFFCDDC39),
  limeAccent: const PdfColor.fromInt(0xFFEEFF41),
  yellowAccent: const PdfColor.fromInt(0xFFFFFF00),
  amberAccent: const PdfColor.fromInt(0xFFFFD740),
  orangeAccent: const PdfColor.fromInt(0xFFFFAB40),
  deepOrangeAccent: const PdfColor.fromInt(0xFFFF6E40),
);

class Data {
  // primaries
  PdfColor black;
  PdfColor white;
  PdfColor red;
  PdfColor pink;
  PdfColor purple;
  PdfColor deepPurple;
  PdfColor indigo;
  PdfColor blue;
  PdfColor lightBlue;
  PdfColor cyan;
  PdfColor teal;
  PdfColor green;
  PdfColor lightGreen;
  PdfColor lime;
  PdfColor yellow;
  PdfColor amber;
  PdfColor orange;
  PdfColor deepOrange;
  PdfColor brown;
  PdfColor grey;
  PdfColor blueGrey;

  // accents
  PdfColor redAccent;
  PdfColor pinkAccent;
  PdfColor purpleAccent;
  PdfColor deepPurpleAccent;
  PdfColor indigoAccent;
  PdfColor blueAccent;
  PdfColor lightBlueAccent;
  PdfColor cyanAccent;
  PdfColor tealAccent;
  PdfColor greenAccent;
  PdfColor lightGreenAccent;
  PdfColor limeAccent;
  PdfColor yellowAccent;
  PdfColor amberAccent;
  PdfColor orangeAccent;
  PdfColor deepOrangeAccent;
  Data(
      {required this.black,
      required this.white,
      required this.red,
      required this.pink,
      required this.purple,
      required this.deepPurple,
      required this.indigo,
      required this.blue,
      required this.lightBlue,
      required this.cyan,
      required this.teal,
      required this.green,
      required this.lightGreen,
      required this.lime,
      required this.yellow,
      required this.amber,
      required this.orange,
      required this.deepOrange,
      required this.brown,
      required this.grey,
      required this.blueGrey,
      required this.redAccent,
      required this.pinkAccent,
      required this.purpleAccent,
      required this.deepPurpleAccent,
      required this.indigoAccent,
      required this.blueAccent,
      required this.lightBlueAccent,
      required this.cyanAccent,
      required this.tealAccent,
      required this.greenAccent,
      required this.lightGreenAccent,
      required this.limeAccent,
      required this.yellowAccent,
      required this.amberAccent,
      required this.orangeAccent,
      required this.deepOrangeAccent});
}

class colorOfPdfListItem {
  String nameColor;
  PdfColor pdfOfColor;
  Color materialColor;

  colorOfPdfListItem(
    this.nameColor,
    this.pdfOfColor,
    this.materialColor,
  );
}

List<colorOfPdfListItem> colorOfPdfList = [
  colorOfPdfListItem(
    "black",
    const PdfColor.fromInt(0x00000000),
    Colors.black
  ),
  colorOfPdfListItem(
    "white",
    const PdfColor.fromInt(0xFFFFFFFF),
      Colors. white,
  ),
  colorOfPdfListItem(
    "red",
    const PdfColor.fromInt(0xFFF44336),
    Colors. red,
  ),
  colorOfPdfListItem(
    "pink",
    const PdfColor.fromInt(0xFFE91E63),
    Colors. pink,
  ),
  colorOfPdfListItem(
    "purple",
    const PdfColor.fromInt(0xFF9C27B0),
    Colors. purple,
  ),
  colorOfPdfListItem(
    "deepPurple",
    const PdfColor.fromInt(0xFF673AB7),
    Colors. deepPurple,
  ),
  colorOfPdfListItem(
    "indigo",
    const PdfColor.fromInt(0xFF3F51B5),
    Colors.indigo ,
  ),
  colorOfPdfListItem(
    "blue",
    const PdfColor.fromInt(0xFF2196F3),
    Colors. blue,
  ),
  colorOfPdfListItem(
    "lightBlue",
    const PdfColor.fromInt(0xFF03A9F4),
    Colors. lightBlue,
  ),
  colorOfPdfListItem(
    "cyan",
    const PdfColor.fromInt(0xFF00BCD4),
    Colors. cyan,
  ),
  colorOfPdfListItem(
    "teal",
    const PdfColor.fromInt(0xFF009688),
    Colors. teal,
  ),
  colorOfPdfListItem(
    "green",
    const PdfColor.fromInt(0xFF4CAF50),
    Colors.green ,
  ),
  colorOfPdfListItem(
    "lightGreen",
    const PdfColor.fromInt(0xFF8BC34A),
    Colors. lightGreen,
  ),
  colorOfPdfListItem(
    "lime",
    const PdfColor.fromInt(0xFFCDDC39),
    Colors.lime ,
  ),
  colorOfPdfListItem(
    "yellow",
    const PdfColor.fromInt(0xFFFFEB3B),
    Colors. yellow,
  ),
  colorOfPdfListItem(
    "amber",
    const PdfColor.fromInt(0xFFFFC107),
    Colors.amber ,
  ),
  colorOfPdfListItem(
    "orange",
    const PdfColor.fromInt(0xFFFF9800),
    Colors.orange ,
  ),
  colorOfPdfListItem(
    "deepOrange",
    const PdfColor.fromInt(0xFFFF5722),
    Colors.deepOrange ,
  ),
  colorOfPdfListItem(
    "brown",
    const PdfColor.fromInt(0xFF795548),
    Colors.brown ,
  ),
  colorOfPdfListItem(
    "grey",
    const PdfColor.fromInt(0xFF9E9E9E),
    Colors. grey,
  ),
  colorOfPdfListItem(
    "blueGrey",
    const PdfColor.fromInt(0xFF607D8B),
    Colors.blueGrey ,
  ),
  colorOfPdfListItem(
    "redAccent",
    const PdfColor.fromInt(0xFFFF5252),
    Colors. redAccent,
  ),
  colorOfPdfListItem(
    "pinkAccent",
    const PdfColor.fromInt(0xFFFF4081),
    Colors.pinkAccent ,
  ),
  colorOfPdfListItem(
    "purpleAccent",
    const PdfColor.fromInt(0xFFE040FB),
    Colors. purpleAccent,
  ),
  colorOfPdfListItem(
    "deepPurpleAccent",
    const PdfColor.fromInt(0xFF7C4DFF),
    Colors.deepPurpleAccent ,
  ),
  colorOfPdfListItem(
    "indigoAccent",
    const PdfColor.fromInt(0xFF536DFE),
    Colors. indigoAccent,
  ),
  colorOfPdfListItem(
    "blueAccent",
    const PdfColor.fromInt(0xFF448AFF),
    Colors.blueAccent ,
  ),
  colorOfPdfListItem(
    "lightBlueAccent",
    const PdfColor.fromInt(0xFF40C4FF),
    Colors.lightBlueAccent ,
  ),
  colorOfPdfListItem(
    "cyanAccent",
    const PdfColor.fromInt(0xFF18FFFF),
    Colors.cyanAccent ,
  ),
  colorOfPdfListItem(
    "tealAccent",
    const PdfColor.fromInt(0xFF64FFDA),
    Colors. tealAccent,
  ),
  colorOfPdfListItem(
    "greenAccent",
    const PdfColor.fromInt(0xFF69F0AE),
    Colors.greenAccent ,
  ),
  colorOfPdfListItem(
    "lightGreenAccent",
    const PdfColor.fromInt(0xFFCDDC39),
    Colors. lightGreenAccent,
  ),
  colorOfPdfListItem(
    "limeAccent",
    const PdfColor.fromInt(0xFFEEFF41),
    Colors.limeAccent ,
  ),
  colorOfPdfListItem(
    "yellowAccent",
    const PdfColor.fromInt(0xFFFFFF00),
    Colors.yellowAccent ,
  ),
  colorOfPdfListItem(
    "amberAccent",
    const PdfColor.fromInt(0xFFFFD740),
    Colors.amberAccent ,
  ),
  colorOfPdfListItem(
    "orangeAccent",
    const PdfColor.fromInt(0xFFFFAB40),
    Colors.orangeAccent,
  ),
  colorOfPdfListItem(
    "deepOrangeAccent",
    const PdfColor.fromInt(0xFFFF6E40),
    Colors.deepOrangeAccent ,
  ),
];
