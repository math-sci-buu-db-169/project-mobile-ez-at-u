import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

class MyAppTestSYN extends StatefulWidget {

  const MyAppTestSYN({Key? key}) : super(key: key);

  @override
  _MyAppTestSYNState createState() => _MyAppTestSYNState();
}

class _MyAppTestSYNState extends State<MyAppTestSYN> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate =  DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('zh'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale('ru'),
        Locale('ja'),
        Locale('ar'),
        Locale('fa'),
        Locale("es"),
        Locale("it"),
      ],
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Colors.pinkAccent)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Month Picker Example App'),
        ),
        body: Center(
          child: Text(
            'Year: ${selectedDate?.year}\nMonth: ${selectedDate?.month}',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              showMonthPicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 1, 5),
                lastDate: DateTime(DateTime.now().year + 1, 9),
                initialDate: selectedDate ?? DateTime.now(),
                locale: Locale("en"),
                //show only even months
                selectableMonthPredicate: (DateTime val) => val.month.isEven,
                headerColor: Colors.purple,
                headerTextColor: Colors.orange,
                selectedMonthBackgroundColor: Colors.amber[900],
                selectedMonthTextColor: Colors.white,
                unselectedMonthTextColor: Colors.green,
                confirmText: Text('This one!',style: TextStyle(fontWeight: FontWeight.bold),),
                cancelText: Text('Cancel'),
                yearFirst: true,
                roundedCornersRadius: 20,
              ).then((date) {
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              });
            },
            child: Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }
}