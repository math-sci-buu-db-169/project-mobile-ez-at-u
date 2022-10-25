import 'package:ez_u/customs/color/color_const.dart';
import 'package:flutter/material.dart';

var styleButtonDialog = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(tcButtonTextWhite),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: tcButtonTextBoarder),
      borderRadius: BorderRadius.circular(16),
    )));


var styleButtonDialogCancel = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(tcButtonTextRed),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: tcButtonTextRed),
      borderRadius: BorderRadius.circular(16),
    )));
var styleButtonDialogWarning = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(tcButtonTextRed),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: tcButtonTextRed),
      borderRadius: BorderRadius.circular(16),
    )));