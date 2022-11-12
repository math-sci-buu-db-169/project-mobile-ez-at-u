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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: tcHint),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        width: widget.width,
        child:
        //-------------------------------------//
        // DropdownButtonFormField<String>(
        //   // alignment: Alignment.centerRight,
        //   isExpanded: true,
        //   decoration: InputDecoration(
        //       contentPadding: EdgeInsets.all(10),
        //       border: OutlineInputBorder(),
        //       enabledBorder: OutlineInputBorder(
        //         borderSide: BorderSide(color: TC_Hint),
        //         borderRadius: BorderRadius.all(Radius.circular(30)),
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(30)),
        //         borderSide: BorderSide(color: FC_Blue, width: 2.0),
        //       )),
        //   hint: Text(hint),
        //   value: dropdownValue,
        //   items: dropdownlist
        //       ?.map((item) => DropdownMenuItem<String>(
        //       value: item,
        //       child: Text(
        //         item,
        //         style: TextStyle(fontSize: 18),
        //       )))
        //       .toList(),
        //   onChanged: (item) => setState(() => dropdownValue = item ?? ''),
        // ),
        //-------------------------------------//
        PopupMenuButton<String>(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        dropdownValue??hint,
                        style: TextStyle(fontSize: sizeText18, color: Colors.black
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
                    child:
                    Text(widget.dropdownList[index]),
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
