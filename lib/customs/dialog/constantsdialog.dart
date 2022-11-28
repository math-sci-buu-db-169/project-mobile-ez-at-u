
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences prefs;
class ConstantsDialog{
  ConstantsDialog._();
  static const double padding =20;
  static const double avatarRadius =45;
  static const IconData close = IconData(0xe16a, fontFamily: 'MaterialIcons');
  static const Color buttonColors = Color(0xFFFDEA8F);
}