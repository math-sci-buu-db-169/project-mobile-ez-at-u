import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

import '../color/color_const.dart';

class CustomDropdownSelectActivityNameByStudent extends StatefulWidget {
  final String hint;
  final List<dynamic> dropdownList;
  final double width;
  final String? dropdownValue;
  final Function(String result) callbackFromCustomDropdownActivityNameId;
  final IconData iconsFile;
  const CustomDropdownSelectActivityNameByStudent(
      {Key? key,
      required this.hint,
      required this.dropdownList,
      required this.width,
        required this.iconsFile,
      this.dropdownValue
        , required this.callbackFromCustomDropdownActivityNameId
      })
      : super(key: key);

  @override
  State<CustomDropdownSelectActivityNameByStudent> createState() => _CustomDropdownSelectActivityNameByStudentState();
}

class _CustomDropdownSelectActivityNameByStudentState extends State<CustomDropdownSelectActivityNameByStudent> {
  String? dropdownValue;
  String? showDropdown;
  String? teacherIdValue;
  @override
  void initState(){
    dropdownValue = widget.dropdownValue;
    showDropdown = dropdownValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String hint = widget.hint;
    IconData iconsFile = widget.iconsFile;
    // List<String>? dropdownlist = widget.dropdownList;
    // var dropdownValue = widget.dropdownvalue;
    // print(dropdownValue);
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:  Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,),
            borderRadius: BorderRadius.circular(10),
        color:  Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
      ),
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        width: widget.width,
        child:
        PopupMenuButton<String>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Icon(iconsFile, color: appBarforegroundColor,),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        showDropdown??hint,
                        style:
                        (dropdownValue == null)?
                        TextStyle(fontSize: sizeText18, color: appBarforegroundColor.withOpacity(0.5))
                              :
                          TextStyle(fontSize: sizeText18, color: appBarforegroundColor),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    )),
                Icon(Icons.keyboard_arrow_down, color: appBarforegroundColor,)
              ]),
          itemBuilder: (context) {
            return List.generate(widget.dropdownList.length,
                    (index) {
                  return PopupMenuItem(
                    value: index.toString(),
                    child:
                    Text('${widget.dropdownList[index].activitynameresponse}',style: TextStyle(color: appBarforegroundColor),),
                  );
                });
          },
          onSelected: (value) {
            setState(() {
              print(value);
              dropdownValue = widget.dropdownList[int.parse(value)].activitynameidresponse.toString();
              print(dropdownValue);
              showDropdown = '${widget.dropdownList[int.parse(value)].activitynameresponse}';
              print(showDropdown);
              teacherIdValue = '${widget.dropdownList[int.parse(value)].teacheridresponse}';
              widget.callbackFromCustomDropdownActivityNameId(dropdownValue??"5");
            });

          },
        ),
      ),
    );
  }
}
