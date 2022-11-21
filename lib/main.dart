
import 'package:ez_at_u/utils/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customs/common/provider/theme_provider.dart';
import 'main_route/main_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
  ]);

  debugPaintSizeEnabled = false;
  //--//
  // BlocOverrides.runZoned(
  //       () {runApp( const MyApp());},
  //   blocObserver: BUUBlocObserver(),
  // );
  Bloc.observer = BUUBlocObserver();
  runApp( MyApp());
  //--//
  // runApp(const MyApp());
}

late SharedPreferences prefs;
class MyApp extends StatelessWidget {
  const MyApp({Key? key, String? isStartPage}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return    const MyAppRun();
  }
}

class MyAppRun extends StatefulWidget {
  const MyAppRun({Key? key}) : super(key: key);

  @override
  State<MyAppRun> createState() => _MyAppRunState();
}

class _MyAppRunState extends State<MyAppRun> {
  @override
  void initState() {
    setState(() {


    } ) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
            title: 'Easy At You BETA',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            // theme: ThemeData(
            //   primarySwatch: themeMode ==ThemeMode.light? black:white,
            //   scaffoldBackgroundColor: Colors.white,
            //   textTheme: GoogleFonts.notoSerifThaiTextTheme(
            //     Theme.of(context).textTheme,
            //   ),
            // ),
            // home: HomeScreen(),
            routes: {
              '/': (context) =>const MainRouteScreen(),
            }
        );
      },
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
const MaterialColor black = MaterialColor(
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