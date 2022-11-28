
import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dialog/constantsdialog.dart';
late SharedPreferences prefs;

var styleButtonDialog = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(ConstantsDialog.buttonColors),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white),
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