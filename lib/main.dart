
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'main_route/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
  ]);

  // debugPaintSizeEnabled = true;
  //--//
  // BlocOverrides.runZoned(
  //       () {runApp( const MyApp());},
  //   blocObserver: BUUBlocObserver(),
  // );
  Bloc.observer = BUUBlocObserver();
  runApp( const MyApp());
  //--//
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, String? isStartPage}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Easy At You BETA',
        theme: ThemeData(
          primarySwatch: white,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.notoSerifThaiTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        // home: HomeScreen(),
        routes: {
          '/': (context) =>const MainRouteScreen(),
        }
    );
  }
}
const MaterialColor white = MaterialColor(
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

class BUUBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    // ignore: avoid_print
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print(change);
    }
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (kDebugMode) {
      print(transition);
    }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('$error, $stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }
}
//555