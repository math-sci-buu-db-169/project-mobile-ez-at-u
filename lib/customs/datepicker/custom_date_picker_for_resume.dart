import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerForResumeMMYY extends StatefulWidget {
  final String hintLabel;
  final String textOnTopOfDatePicker;
  final Function(String result) callbackFromCustomDatePicker;

  const CustomDatePickerForResumeMMYY(
      {Key? key,
      required this.hintLabel,
      required this.callbackFromCustomDatePicker,
      required this.textOnTopOfDatePicker})
      : super(key: key);

  @override
  State<CustomDatePickerForResumeMMYY> createState() =>
      CustomDatePickerForResumeMMYYState();
}

class CustomDatePickerForResumeMMYYState
    extends State<CustomDatePickerForResumeMMYY> {
  DateTime date = DateTime.now();
  late String? dateFormated;
  @override
  void initState() {
    dateFormated = DateFormat('M/y').format(date);
    // date = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.white;
    Color? appBarforegroundColor =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.black;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).primaryColor == Colors.black
                    ? fillColorDark
                    : fillColorLight),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Theme.of(context).primaryColor == Colors.black
                ? fillColorDark
                : fillColorLight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateFormated ?? "02/2001",
                style: TextStyle(fontSize: 18, color: appBarforegroundColor),
              ),
              IconButton(
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
                      dateFormated = DateFormat('M/y').format(date);
                      widget.callbackFromCustomDatePicker(
                          dateFormated ?? "02/2001");
                    });
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    color: appBarforegroundColor,
                  ))
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 15,
            child: Text(
              widget.textOnTopOfDatePicker,
              style: TextStyle(color: appBarforegroundColor),
            ))
      ],
    );
  }
}
