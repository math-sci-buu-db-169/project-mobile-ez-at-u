import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

class customDropdown extends StatefulWidget {
  final String hint;
  final List<String> dropdownList;
  final double width;
  final String? dropdownValue;
  final Function(String result) callbackFromCustomDropdown;
  const customDropdown(
      {Key? key,
      required this.hint,
      required this.dropdownList,
      required this.width,
      this.dropdownValue
        , required this.callbackFromCustomDropdown
      })
      : super(key: key);

  @override
  State<customDropdown> createState() => _customDropdownState();
}

class _customDropdownState extends State<customDropdown> {
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
    // var dropdownValue = widget.dropdownvalue;
    // print(dropdownValue);
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: appBarforegroundColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(20),
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
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        dropdownValue??hint,
                        style: TextStyle(fontSize: sizeText18, color: appBarforegroundColor
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    )),
                Icon(Icons.keyboard_arrow_down,color: appBarforegroundColor,)
              ]),
          itemBuilder: (context) {
            return List.generate(widget.dropdownList.length,
                    (index) {
                  return PopupMenuItem(
                    child:
                    Text(widget.dropdownList[index],style: TextStyle(fontSize: sizeText18, color: appBarforegroundColor
                    ),
                    ),
                    value: widget.dropdownList[index],
                  );
                });
          },
          onSelected: (value) {
            setState(() {
              dropdownValue = value;
              widget.callbackFromCustomDropdown(dropdownValue??"-");
            });

          },
        ),
      ),
    );
  }
}
