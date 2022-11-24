import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class customDatePickerForEdit extends StatefulWidget {
  final String hintLabel;
  final String dateValue;
  final Function(String result) callbackFromCustomDatePickerForEdit;
  const customDatePickerForEdit({Key? key, required this.hintLabel, required this.dateValue, required this.callbackFromCustomDatePickerForEdit}) : super(key: key);


  @override
  State<customDatePickerForEdit> createState() => _customDatePickerForEditState();


}

class _customDatePickerForEditState extends State<customDatePickerForEdit> {
  DateTime date = DateTime.now() ;
  late String? datevalue;
  @override
  void initState(){
    datevalue = widget.dateValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(left:10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: appBarforegroundColor.withOpacity(0.5)),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(datevalue??"16/02/2001",style: TextStyle(fontSize: 18, color: appBarforegroundColor),),
          IconButton(onPressed: ()async {
            DateTime? newDate = await showDatePicker(
                builder: (context, child) {
                  return Theme(data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Theme.of(context).splashColor,
                      onPrimary: appBarBackgroundColor,
                      onSurface: appBarforegroundColor,
                    ), textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(foregroundColor: appBarforegroundColor,
                    ),
                  ),
                  ), child: child!,);},

                context: context,
                initialDate: date,
                firstDate: DateTime(2000),
                lastDate: DateTime(2200));
            if (newDate == null) return;
            setState((){
              date = newDate;
              datevalue = DateFormat('d/M/y').format(date);
              widget.callbackFromCustomDatePickerForEdit(datevalue??"16/02/2001");
            });
          }, icon: Icon(Icons.calendar_month, color: appBarforegroundColor,))
        ],
      ),
    );
  }
}
