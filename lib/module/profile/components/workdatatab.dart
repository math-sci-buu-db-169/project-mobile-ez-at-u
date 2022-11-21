
import 'package:flutter/material.dart';

import '../model/response/api_profile_response.dart';
import 'hiddencareerdatatab.dart';

class ProfileCareerDropdownTab extends StatefulWidget {
  final Color textColor;
  final Color dataTabColor;
  final List<Status> statusArray;
  final String textLeft;
  final String userStatusValue;
  final String jobTextLeft;
  final String userJobValue;
  final List<Jobtype> jobTypeArray;
  final bool isUnpressed;
  final String subtitleWorkplace;
  final String userWorkplace;
  final String userCareer;
  final String userCompany;
  final String textCareer;
  final String textComp;
  final String userStatusValueCheck;
  // final Function(String jobtype, String workplace, String career, String company) callbackFromWorkDataTab;
  final Function(String value, String type) callbackFromWorkDataTab;
  final Function(String status) callbackFromWorkDataTabStatus;
  const ProfileCareerDropdownTab(
      {Key? key,
        required this.textColor,
        required this.dataTabColor,
        required this.textLeft,
        required this.userStatusValue,
        required this.jobTextLeft,
        required this.jobTypeArray,
        required this.userJobValue,
        required this.isUnpressed,
        required this.subtitleWorkplace,
        required this.userWorkplace,
        required this.userCareer,
        required this.userCompany,
        required this.textCareer,
        required this.textComp,
        required this.statusArray,
        required this.callbackFromWorkDataTab,
        required this.callbackFromWorkDataTabStatus, required this.userStatusValueCheck})
      : super(key: key);

  @override
  State<ProfileCareerDropdownTab> createState() =>
      _ProfileCareerDropdownTabState();
}

class _ProfileCareerDropdownTabState extends State<ProfileCareerDropdownTab> {
  String? userStatusValue;
  String? showStatusValue;
  bool isJobInStatusVisible = false;


  @override
  void initState() {
    userStatusValue = widget.userStatusValue;
    showStatusValue = userStatusValue;
    if(widget.userStatusValueCheck == "5"){
      isJobInStatusVisible = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColor = widget.dataTabColor;
    bool isUnpressed = widget.isUnpressed;
    String subTitleWorkPlace = widget.subtitleWorkplace;
    String userWorkPlace = widget.userWorkplace;
    String userCareer = widget.userCareer;
    String userCompany = widget.userCompany;
    String textCareer = widget.textCareer;
    String textComp = widget.textComp;

    return Column(
      children: [
        Container(
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
                    widget.textLeft,
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
                                    showStatusValue??'',
                                    style: TextStyle(fontSize:18, color: textColor),
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  )),
                              Icon(Icons.keyboard_arrow_down, color: textColor)
                            ]),
                        itemBuilder: (context) {
                          return List.generate(widget.statusArray.length,
                                  (index) {
                                return PopupMenuItem(
                                  textStyle: TextStyle(fontSize: 18, color: textColor),
                                  value: widget.statusArray[index].statusvalue,
                                  child:
                                  Text(widget.statusArray[index].statusname ?? ''),
                                );
                              });
                        },
                        onSelected: (value) {
                          userStatusValue = value;
                          if (userStatusValue == "5") {
                          // logic เอาไว้ check ว่ามีงานทำมั้ยถ้ามีให้แสดง
                            isJobInStatusVisible = true;
                          } else {
                            isJobInStatusVisible = false;
                          }
                          setState(() {
                            // print(value);
                            showStatusValue = widget.statusArray[int.parse(value)-1].statusname;
                            widget.callbackFromWorkDataTabStatus(value);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isJobInStatusVisible,
          child: Column(
            children: [
              ProfileDropdownCareerDataTab(
                dataTabColor: dataTabColor,
                textColor: textColor,
                isUnpressed: isUnpressed,
                userJobTypeValue: widget.userJobValue,
                jobTextLeft: widget.jobTextLeft,
                jobTypeArray: widget.jobTypeArray, callbackHiddenCareerDataTab: (String? jobType) {
                widget.callbackFromWorkDataTab(jobType??"1", "jobType");
                  // if (kDebugMode) {
                  //   print("ส่งมั้ย");
                  //   print(jobType);
                  // }
              },
              ),
              ProfileCareerDataTab(
                dataTabColor: dataTabColor,
                textColor: textColor,
                  isUnpressed: isUnpressed,
                  textLeft: subTitleWorkPlace,
                  textRight: userWorkPlace, callbackFromHiddenCareerDataTab: (String workplace) {
                    widget.callbackFromWorkDataTab(workplace, "workplace");
                    // if (kDebugMode) {
                    //   print("ส่งมั้ย");
                    //   print(workplace);
                    // }
              },),
              ProfileCareerDataTab(
                dataTabColor: dataTabColor,
                textColor: textColor,
                  isUnpressed: isUnpressed,
                  textLeft: textCareer,
                  textRight: userCareer, callbackFromHiddenCareerDataTab: (String career) {
                widget.callbackFromWorkDataTab(career, "career");
                // if (kDebugMode) {
                //   print(career);
                // }
              },),
              ProfileCareerDataTab(
                dataTabColor: dataTabColor,
                textColor: textColor,isUnpressed: isUnpressed,
                  textLeft: textComp,
                  textRight: userCompany, callbackFromHiddenCareerDataTab: (String company) {
                widget.callbackFromWorkDataTab(company, "company");
                // if (kDebugMode) {
                //   print(company);
                // }
              },)
            ],
          ),
        )
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
