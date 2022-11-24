import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

class CustomDropdownApprover extends StatefulWidget {
  final String hint;
  final List<dynamic> dropdownList;
  final double width;
  final String? dropdownValue;
  final Function(String result) callbackFromCustomDropdown;
  final IconData iconsFile;
  const CustomDropdownApprover(
      {Key? key,
      required this.hint,
      required this.dropdownList,
      required this.width,
        required this.iconsFile,
      this.dropdownValue
        , required this.callbackFromCustomDropdown
      })
      : super(key: key);

  @override
  State<CustomDropdownApprover> createState() => _CustomDropdownApproverState();
}

class _CustomDropdownApproverState extends State<CustomDropdownApprover> {
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
    // var dropdownValue = widget.dropdownvalue;
    // print(dropdownValue);
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // height: 50,
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
                    value: index.toString(),
                    child:
                    Text('${widget.dropdownList[index].approvername}  ${widget.dropdownList[index].approverlastname}  ',style: TextStyle(color: appBarforegroundColor),),
                  );
                });
          },
          onSelected: (value) {
            setState(() {
              print(value);
              dropdownValue = widget.dropdownList[int.parse(value)].approvercode;
              print(dropdownValue);
              showDropdown = '${widget.dropdownList[int.parse(value)].approvername}  ${widget.dropdownList[int.parse(value)].approverlastname}  ';
              print(showDropdown);
              widget.callbackFromCustomDropdown(dropdownValue??"TCMM01");
            });

          },
        ),
      ),
    );
  }
}
