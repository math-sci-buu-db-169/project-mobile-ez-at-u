
import 'package:flutter/material.dart';

import '../model/response/api_profile_response.dart';

class ProfileAttentionDropdownTab extends StatefulWidget {
  final Color textColor;
  final Color dataTabColor;
  final List<Attention> attentionArray;
  final String textLeft;
  final String userAttentionValue;
  final bool isUnpressed;
  final Function(String attentionResult) callbackFromAttentionDataTab;
  const ProfileAttentionDropdownTab(
      {Key? key,
        required this.textColor,
        required this.dataTabColor,
        required this.textLeft,
        required this.userAttentionValue,
        required this.attentionArray,
        required this.isUnpressed,
        required this.callbackFromAttentionDataTab})
      : super(key: key);

  @override
  State<ProfileAttentionDropdownTab> createState() =>
      _ProfileAttentionDropdownTabState();
}


class _ProfileAttentionDropdownTabState
    extends State<ProfileAttentionDropdownTab> {
  String? userAttentionValue;
  String? showAttentionValue;
  @override
  void initState(){
    userAttentionValue = widget.userAttentionValue;
    showAttentionValue = userAttentionValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColor = widget.dataTabColor;
    String textLeft = widget.textLeft;

    var isUnpressed = widget.isUnpressed;
    return Container(
      decoration: BoxDecoration(
        color: dataTabColor.withOpacity(0.1),
        border: Border(
            top: BorderSide(width: 1, color: Colors.black12),
            bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 20),
        child: Row(
          children: [
            SizedBox(

              width: MediaQuery.of(context).size.width * 0.5,

              child: Text(
                textLeft,
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: IgnorePointer(
                  ignoring: isUnpressed,
                  child:
                  PopupMenuButton<String>(
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                showAttentionValue??'',
                                style:  TextStyle(fontSize:18 ,color: textColor,),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )),
                          Icon(Icons.keyboard_arrow_down, color: textColor,)
                        ]),
                    itemBuilder: (context) {
                      return List.generate(widget.attentionArray.length,
                              (index) {
                            return PopupMenuItem(
                              textStyle: TextStyle(fontSize: 18, color: textColor),
                              value: widget.attentionArray[index].attenvalue,
                              child:
                              Column(
                                children: [
                                  Text(widget.attentionArray[index].attenname ?? ''),
                                ],
                              ),
                            );
                          });
                    },
                    onSelected: (value) {
                      setState(() {
                        userAttentionValue = value;
                        showAttentionValue = widget.attentionArray[int.parse(value)-1].attenname;
                        widget.callbackFromAttentionDataTab(userAttentionValue??"-");
                        print(widget.attentionArray.length);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}