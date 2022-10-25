
import 'package:flutter/material.dart';

import '../model/response/api_profile_response.dart';

class ProfileAttentionDropdownTab extends StatefulWidget {
  final List<Attention> attentionArray;
  final String textLeft;
  final String userAttentionValue;
  final bool isUnpressed;
  final Function(String attentionResult) callbackFromAttentionDataTab;
  const ProfileAttentionDropdownTab(
      {Key? key,
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
    String textLeft = widget.textLeft;

    var isUnpressed = widget.isUnpressed;
    return Container(
      decoration: const BoxDecoration(
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
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: IgnorePointer(
                  ignoring: isUnpressed,
                  child:
                  PopupMenuButton<String>(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                showAttentionValue??'',
                                style: const TextStyle(color: Colors.black),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )),
                          const Icon(Icons.keyboard_arrow_down)
                        ]),
                    itemBuilder: (context) {
                      return List.generate(widget.attentionArray.length,
                              (index) {
                            return PopupMenuItem(
                              value: widget.attentionArray[index].attenvalue,
                              child:
                              Text(widget.attentionArray[index].attenname ?? ''),
                            );
                          });
                    },
                    onSelected: (value) {
                      setState(() {
                        userAttentionValue = value;
                        showAttentionValue = widget.attentionArray[int.parse(value)-1].attenname;
                        widget.callbackFromAttentionDataTab(userAttentionValue??"-");
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