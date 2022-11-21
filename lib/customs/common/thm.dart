import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals.dart' as globals;
import '../../utils/shared_preferences.dart';

late ThemeMode themeMode = ThemeMode.system;
late SharedPreferences prefs;
void getPrefs( ) async {
  prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('themeMode') != null) {
      switch (prefs.getInt('themeMode')) {
        case 0:
          themeMode = ThemeMode.light;
          print("themeMode case 0: = $themeMode");

          break;
        case 1:
          themeMode = ThemeMode.dark;
          print("themeMode case 1: = $themeMode");
          break;
        case 2:
          themeMode = ThemeMode.system;
          print("themeMode case 2: = $themeMode");
          break;
        default:
          themeMode = ThemeMode.system;
          print("themeMode case default: = $themeMode");
          break;
      }
    } else {
      themeMode = ThemeMode.system;
      setThemeModeApp( intMode: 2,);
    }
    globals.themeMode = themeMode;

}

