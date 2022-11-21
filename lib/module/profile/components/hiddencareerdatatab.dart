import 'package:flutter/material.dart';

import '../model/response/api_profile_response.dart';

class ProfileDropdownCareerDataTab extends StatefulWidget {
  final Color textColor;
  final Color dataTabColor;
  final String jobTextLeft;
  final String userJobTypeValue;
  final List<Jobtype> jobTypeArray;
  final bool isUnpressed;
  final Function(String? jobtype) callbackHiddenCareerDataTab;
  const ProfileDropdownCareerDataTab(
      {Key? key,
        required this.textColor,
        required this.dataTabColor,
        required this.jobTextLeft,
        required this.userJobTypeValue,
        required this.jobTypeArray, required this.isUnpressed,
        required this.callbackHiddenCareerDataTab
      })
      : super(key: key);

  @override
  State<ProfileDropdownCareerDataTab> createState() =>
      _ProfileDropdownCareerDataTabState();
}

class _ProfileDropdownCareerDataTabState
    extends State<ProfileDropdownCareerDataTab> {
  String? userJobTypeValue;
  String? showJobTypeValue;
  @override
  void initState(){
    userJobTypeValue = widget.userJobTypeValue;
    showJobTypeValue = userJobTypeValue;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColor = widget.dataTabColor;
    bool isUnpressed = widget.isUnpressed;
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
                widget.jobTextLeft,
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: IgnorePointer(
                  ignoring: isUnpressed,
                  child:
                  PopupMenuButton<String>(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                                showJobTypeValue??'',
                                style: TextStyle(fontSize: 18, color: textColor),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )),
                          Icon(Icons.keyboard_arrow_down, color: textColor)
                        ]),
                    itemBuilder: (context) {
                      return List.generate(widget.jobTypeArray.length,
                              (index) {
                            return PopupMenuItem(
                              textStyle: TextStyle(fontSize: 18, color: textColor),
                              value: widget.jobTypeArray[index].jobtypevalue,
                              child:
                              Text(widget.jobTypeArray[index].jobtype ?? ''),
                            );
                          });
                    },
                    onSelected: (value) {
                        userJobTypeValue = value;
                      setState(() {
                        showJobTypeValue = widget.jobTypeArray[int.parse(value)-1].jobtype;
                        widget.callbackHiddenCareerDataTab(value);
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
////////////////////////////////////////////////////////////////////////////////
class ProfileCareerDataTab extends StatefulWidget {
  final Color textColor;
  final Color dataTabColor;
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final Function(String result) callbackFromHiddenCareerDataTab;

  const ProfileCareerDataTab({Key? key,
    required this.textLeft,
    required this.textRight,
    required this.isUnpressed,
    required this.callbackFromHiddenCareerDataTab,
    required this.textColor,
    required this.dataTabColor,}) : super(key: key);

  @override
  State<ProfileCareerDataTab> createState() => _ProfileCareerDataTabState();
}

class _ProfileCareerDataTabState extends State<ProfileCareerDataTab> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColor = widget.dataTabColor;
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    bool isUnpressed = widget.isUnpressed;
    String userValue = '';
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
            Text(
              '$textLeft ',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            Expanded(
              child: TextFormField(
                style: TextStyle(fontSize: 18, color: textColor),
                cursorColor: Colors.black,
                readOnly: isUnpressed,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    userValue = value;
                    widget.callbackFromHiddenCareerDataTab(userValue);
                  });
                },
                initialValue: textRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
