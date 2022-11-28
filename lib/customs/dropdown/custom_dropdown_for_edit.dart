import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';


class customDropdownForEdit extends StatefulWidget {
  final String hint;
  final List<String> dropdownList;
  final double width;
  final dropdownValue;
  final Function(String result) callbackFromCustomDropdownForEdit;
  const customDropdownForEdit(
      {Key? key,
        required this.hint,
        required this.dropdownList,
        required this.width,
        this.dropdownValue, required this.callbackFromCustomDropdownForEdit})
      : super(key: key);

  @override
  State<customDropdownForEdit> createState() => _customDropdownForEditState();
}

class _customDropdownForEditState extends State<customDropdownForEdit> {
  String? dropdownValue;
  @override
  void initState(){
    dropdownValue = widget.dropdownValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String hint = widget.hint;
    // List<String>? dropdownlist = widget.dropdownList;
    // var dropdownValue = widget.dropdownValue;
    // print(dropdownValue);
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight),
        borderRadius: BorderRadius.circular(10.0),
        color:  Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
      ),
      margin: const EdgeInsets.only(top: 0 ,bottom: 0),
      child: SizedBox(
        width: widget.width,
        child:
        PopupMenuButton<String>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        dropdownValue??hint,
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
                Icon(Icons.keyboard_arrow_down,color: appBarforegroundColor)
              ]),
          itemBuilder: (context) {
            return List.generate(widget.dropdownList.length,
                    (index) {
                  return PopupMenuItem(
                    child:
                    Text(widget.dropdownList[index],style: TextStyle(fontSize: sizeText18, color: appBarforegroundColor),),
                    value: widget.dropdownList[index],
                  );
                });
          },
          onSelected: (value) {
            setState(() {
              dropdownValue = value;
              widget.callbackFromCustomDropdownForEdit(dropdownValue??"-");
            });
          },
        ),
      ),
    );
  }
}
