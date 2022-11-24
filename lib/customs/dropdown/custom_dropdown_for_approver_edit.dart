import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';


class customDropdownForApproverEdit extends StatefulWidget {
  final String hint;
  final List<dynamic> dropdownList;
  final double width;
  final String? dropdownValue;
  final Function(String result) callbackFromCustomDropdownForEdit;
  final IconData iconsFile;
  const customDropdownForApproverEdit(
      {Key? key,
        required this.hint,
        required this.dropdownList,
        required this.width,
        required this.iconsFile,
        this.dropdownValue, required this.callbackFromCustomDropdownForEdit})
      : super(key: key);

  @override
  State<customDropdownForApproverEdit> createState() => _customDropdownForApproverEditState();
}

class _customDropdownForApproverEditState extends State<customDropdownForApproverEdit> {
  String? dropdownValue;
  String? showDropdown;
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
    // var dropdownValue = widget.dropdownValue;
    // print(dropdownValue);
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: appBarforegroundColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(30),
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
                    child:
                    Text('${widget.dropdownList[index].approvername}  ${widget.dropdownList[index].approverlastname}  ',style: TextStyle(color: appBarforegroundColor)),
                    // value: widget.dropdownList[index],
                    value: index.toString(),
                  );
                });
          },
          onSelected: (value) {
            setState(() {
              dropdownValue = widget.dropdownList[int.parse(value)].approvercode;
              showDropdown = '${widget.dropdownList[int.parse(value)].approvername}   ${widget.dropdownList[int.parse(value)].approverlastname}  ';
              widget.callbackFromCustomDropdownForEdit(dropdownValue??"TCMM01");
            });
          },
        ),
      ),
    );
  }
}
