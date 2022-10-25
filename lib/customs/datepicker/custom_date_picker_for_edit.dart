import 'package:ez_u/customs/color/color_const.dart';
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
    // String datevalue = widget.dateValue;
    // String hint_label = widget.hintLabel;
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(left:10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: tcHint),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(datevalue??"16/02/2001",style: TextStyle(fontSize: 18),),
          IconButton(onPressed: ()async {
            DateTime? newDate = await showDatePicker(
                builder: (context, child) {
                  return Theme(data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
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
            setState((){
              date = newDate;
              datevalue = DateFormat('d/M/y').format(date);
              widget.callbackFromCustomDatePickerForEdit(datevalue??"16/02/2001");
            });
          }, icon: Icon(Icons.calendar_month))
        ],
      ),
    );
  }
}
