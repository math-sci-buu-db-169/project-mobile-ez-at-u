import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String hintLabel;
  final Function(String result) callbackFromCustomDatePicker;

  const CustomDatePicker(
      {Key? key, required this.hintLabel, required this.callbackFromCustomDatePicker})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  DateTime date = DateTime.now();
  late String? dateFormated;
  @override
  void initState(){
    dateFormated = DateFormat('d/M/y').format(date);
    // date = DateTime.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: tcHint),
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateFormated??"16/02/2001",
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(

                    builder: (context, child) {
                      return Theme(data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Color(0xfff9ccff),
                          onPrimary: Colors.black,
                          onSurface: Colors.black,
                        ), textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(primary: Colors.black,
                        ),
                      ),
                      ), child: child!,);},

                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2200));
                if (newDate == null) return;
                setState(() {
                  date = newDate;
                  dateFormated = DateFormat('d/M/y').format(date);
                  widget.callbackFromCustomDatePicker(dateFormated??"16/02/2001");
                });
              },
              icon: const Icon(Icons.calendar_month))
        ],
      ),
    );
  }
}
