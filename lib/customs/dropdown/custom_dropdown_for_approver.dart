import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

class CustomDropdownApprover extends StatefulWidget {
  final String hint;
  final List<dynamic> dropdownList;
  final double width;
  final String? dropdownValue;
  final Function(String result) callbackFromCustomDropdown;
  const CustomDropdownApprover(
      {Key? key,
      required this.hint,
      required this.dropdownList,
      required this.width,
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
    // List<String>? dropdownlist = widget.dropdownList;
    // var dropdownValue = widget.dropdownvalue;
    // print(dropdownValue);
    return Container(
      // height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: tcHint),
            borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        width: widget.width,
        child:
        PopupMenuButton<String>(
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        showDropdown??hint,
                        style: const TextStyle(fontSize: sizeText18, color: Colors.black
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    )),
                const Icon(Icons.keyboard_arrow_down)
              ]),
          itemBuilder: (context) {
            return List.generate(widget.dropdownList.length,
                    (index) {
                  return PopupMenuItem(
                    value: index.toString(),
                    child:
                    Text('${widget.dropdownList[index].approvername}  ${widget.dropdownList[index].approverlastname}  '),
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
