
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

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
    backgroundColor:Colors.grey.shade900,
    scaffoldBackgroundColor: Colors.grey,
    bottomAppBarColor: Colors.white,
    primaryColor: Colors.black,
    splashColor: Color(0xFFFFCE53),
    // cardColor:Colors.white,
    primarySwatch: white,
    textTheme: GoogleFonts.notoSerifThaiTextTheme(),
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.yellow, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    backgroundColor:Colors.white,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.black,
    primaryColor: Colors.white,
    splashColor: Color(0xFFFFC0F8),
    // cardColor:Colors.white,
    primarySwatch: white,
    textTheme: GoogleFonts.notoSerifThaiTextTheme(

    ),
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.purpleAccent, opacity: 0.8),
  );
}
