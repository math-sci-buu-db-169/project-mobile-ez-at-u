import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // ThemeMode themeMode = ThemeMode.system;
  late ThemeMode themeMode = ThemeMode.system;
  late SharedPreferences prefs;
  void getPrefs() async {
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
      setThemeModeApp(
        intMode: 2,
      );
    }
  }

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor black = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static final darkTheme = ThemeData(
      backgroundColor: Color(0xFF181A20),
      scaffoldBackgroundColor: Color(0xFF181A20),
      // scaffoldBackgroundColor: Colors.grey,
      bottomAppBarColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Color(0xFFFFCE53),
      accentColor: Color(0xFFFFCE53),
      buttonColor: Color(0xFFFDEA8F),
      // cardColor:Colors.white,
      primarySwatch: white,
      textTheme: GoogleFonts.promptTextTheme(),
      colorScheme: const ColorScheme.dark(),
      iconTheme: const IconThemeData(color: Colors.white, opacity: 1),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, foregroundColor: Colors.white));

  static final lightTheme = ThemeData(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      bottomAppBarColor: Colors.black,
      primaryColor: Colors.white,
      splashColor: Color(0xFFFFC0F8),
      accentColor: Color(0xFFFFCE53),
      buttonColor: Color(0xFFFDEA8F),
      // cardColor:Colors.white,
      primarySwatch: white,
      textTheme: GoogleFonts.promptTextTheme(),
      colorScheme: const ColorScheme.light(),
      iconTheme: const IconThemeData(color: Colors.black, opacity: 1),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, foregroundColor: Colors.black));
}
