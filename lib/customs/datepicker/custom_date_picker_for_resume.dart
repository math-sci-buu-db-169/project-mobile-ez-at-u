import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

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
  DateTime selectedDate= DateTime.now();
  late String? dateFormated;
  @override
  void initState() {
    dateFormated = DateFormat('M/y').format(selectedDate);
    selectedDate =  DateTime.now();
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
                dateFormated ?? "01/2023",
                style: TextStyle(fontSize: 18, color: appBarforegroundColor),
              ),
              IconButton(
                  onPressed: () async {
                    DateTime? newDate = await  showMonthPicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 10, 1),
                      lastDate: DateTime(DateTime.now().year + 1,3),
                      initialDate: selectedDate ?? DateTime.now(),
                      locale: Locale("en"),
                      //show only even months
                      // selectableMonthPredicate: (DateTime val) => val.month.isEven,
                      headerColor: Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.6),
                      headerTextColor: Theme.of(context).appBarTheme.foregroundColor,
                      selectedMonthBackgroundColor: tcButtonLine,
                      selectedMonthTextColor:Theme.of(context).scaffoldBackgroundColor,
                      unselectedMonthTextColor: Colors.green,
                      confirmText: Text('OK !',style: TextStyle(fontWeight: FontWeight.bold,color: tcButtonGreen),),
                      cancelText: Text('Cancel',style: TextStyle(color:tcButtonRed),),
                      yearFirst: true,
                      roundedCornersRadius: 20,
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        setState(() {
                          dateFormated = DateFormat('M/y').format(selectedDate);
                          widget.callbackFromCustomDatePicker(
                              dateFormated ?? "01/2023");
                        });
                      }
                    });
                    if (newDate == null) return;
                    setState(() {
                      selectedDate = newDate;
                      dateFormated = DateFormat('M/y').format(selectedDate);
                      widget.callbackFromCustomDatePicker(
                          dateFormated ?? "01/2023");
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
