import 'package:flutter/material.dart';

import '../model/response/api_profile_response.dart';

class ProfileDropdownCareerDataTab extends StatefulWidget {
  final String jobTextLeft;
  final String userJobTypeValue;
  final List<Jobtype> jobTypeArray;
  final bool isUnpressed;
  final Function(String? jobtype) callbackHiddenCareerDataTab;
  const ProfileDropdownCareerDataTab(
      {Key? key,
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
    bool isUnpressed = widget.isUnpressed;
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
                widget.jobTextLeft,
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
                                showJobTypeValue??'',
                                style: const TextStyle(color: Colors.black),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              )),
                          const Icon(Icons.keyboard_arrow_down)
                        ]),
                    itemBuilder: (context) {
                      return List.generate(widget.jobTypeArray.length,
                              (index) {
                            return PopupMenuItem(
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
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final Function(String result) callbackFromHiddenCareerDataTab;

  const ProfileCareerDataTab({Key? key, required this.textLeft, required this.textRight, required this.isUnpressed,required this.callbackFromHiddenCareerDataTab,}) : super(key: key);

  @override
  State<ProfileCareerDataTab> createState() => _ProfileCareerDataTabState();
}

class _ProfileCareerDataTabState extends State<ProfileCareerDataTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    bool isUnpressed = widget.isUnpressed;
    String userValue = '';
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
            Text(
              '$textLeft ',
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: TextFormField(
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
