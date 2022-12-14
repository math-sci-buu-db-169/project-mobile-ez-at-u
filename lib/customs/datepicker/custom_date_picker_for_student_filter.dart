import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerStudentFilter extends StatefulWidget {
  final Function(String filterResult)
      callbackFromCustomDatePickerForStudentFilter;
  const CustomDatePickerStudentFilter(
      {Key? key, required this.callbackFromCustomDatePickerForStudentFilter})
      : super(key: key);

  @override
  State<CustomDatePickerStudentFilter> createState() =>
      _CustomDatePickerStudentFilterState();
}

class _CustomDatePickerStudentFilterState
    extends State<CustomDatePickerStudentFilter> {
  DateTime date = DateTime.now();
  late String? dateFormated;
  @override
  void initState() {
    dateFormated = DateFormat('d/M/y').format(date);
    // date = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
    Color? appBarforegroundColor =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
    return IconButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Theme.of(context).splashColor,
                      onPrimary: appBarBackgroundColor,
                      onSurface: appBarforegroundColor,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: appBarforegroundColor,
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
              context: context,
              initialDate: date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2200));
          if (newDate == null) return;
          setState(() {
            date = newDate;
            dateFormated = DateFormat('d/M/y').format(date);
            widget.callbackFromCustomDatePickerForStudentFilter(
                dateFormated ?? "16/02/2001");
          });
        },
        icon: Icon(
          Icons.filter_alt,
          color: appBarforegroundColor,
        ));
  }
}
