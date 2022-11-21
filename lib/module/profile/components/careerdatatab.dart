

import 'package:ez_at_u/module/profile/components/workdatatab.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';
import 'attentiondatatab.dart';

class ProfileCareerDataHead extends StatefulWidget {
  final Color? dataTabColor;
  final Color? textColor;
  final Color? dataTabColorRO;
  final ApiProfileResponse? dataFromAPI;
  final String? userRole;
  const ProfileCareerDataHead({Key? key, required this.dataFromAPI, required this.textColor
    , required this.dataTabColor, required this.dataTabColorRO, required this.userRole})
      : super(key: key);

  @override
  State<ProfileCareerDataHead> createState() => _ProfileCareerDataHeadState();
}

////////////////////////////////////////////////////////////////////////////////
class _ProfileCareerDataHeadState extends State<ProfileCareerDataHead> {
  bool isUnpressed = true;
  bool isVisible = true;
  late dynamic dataFromAPI;
  late String attentionValue;
  late String statusValue;
  late String jobTypeValue;
  late String workplaceValue;
  late String careerValue;
  late String companyValue;
  late Color textColor;
  late Color dataTabColor;
  late Color dataTabColorRO;
  late String userRole;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    attentionValue = dataFromAPI?.body?.profileCareerInfo?.userattentionvalue ?? "1";
    statusValue = dataFromAPI?.body?.profileCareerInfo?.userstatusvalue ?? "1";
    jobTypeValue = dataFromAPI?.body?.profileCareerInfo?.userjobtypevalue ?? "1";
    workplaceValue = dataFromAPI?.body?.profileCareerInfo?.userworkplace ?? "-";
    careerValue = dataFromAPI?.body?.profileCareerInfo?.usercareer ?? "-";
    companyValue = dataFromAPI?.body?.profileCareerInfo?.usercompany ?? "-";
    textColor = widget.textColor??Colors.black.withOpacity(0.5);
    dataTabColor = widget.dataTabColor??Colors.transparent.withOpacity(0.5);
    dataTabColorRO = widget.dataTabColorRO??Colors.transparent.withOpacity(0.5);
    userRole = widget.userRole??"ST";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var dataFromAPI = widget.dataFromAPI;
    // String attentionValue =
    //     dataFromAPI?.body?.profileCareerInfo?.userattentionvalue ?? "1";
    // String statusValue =
    //     dataFromAPI?.body?.profileCareerInfo?.userstatusvalue ?? "1";
    // String jobTypeValue =
    //     dataFromAPI?.body?.profileCareerInfo?.userjobtypevalue ?? "1";
    // String workplaceValue =
    //     dataFromAPI?.body?.profileCareerInfo?.userworkplace ?? "-";
    // String careerValue =
    //     dataFromAPI?.body?.profileCareerInfo?.usercareer ?? "-";
    // String companyValue =
    //     dataFromAPI?.body?.profileCareerInfo?.usercompany ?? "-";
    return
      (userRole == "ST") ?
      Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: dataTabColor,
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.transparent)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  dataFromAPI?.body?.screeninfo?.subtitleworkinfo ??
                      profileSubTitleWorkInfo,
                  style: TextStyle(fontSize: 20, color: textColor),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isUnpressed = !isUnpressed;
                          if (isUnpressed == true) {
                            context.read<ProfileBloc>().add(CareerSubmitEvent(
                                jobType: jobTypeValue,
                                company: companyValue,
                                status: statusValue,
                                attention: attentionValue,
                                career: careerValue,
                                workplace: workplaceValue));
                          }
                        });
                      },
                      child: isUnpressed
                          ? Text(
                              dataFromAPI?.body?.screeninfo?.textedit ??
                                  profileTextEdit,
                              style: const TextStyle(color: Colors.red))
                          : Text(
                              dataFromAPI?.body?.screeninfo?.textsave ??
                                  profileTextSave,
                              style: const TextStyle(color: Colors.green)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileAttentionDropdownTab(
          dataTabColor: dataTabColor,
          textColor: textColor,
          attentionArray:
              dataFromAPI?.body?.profileCareerScreenInfo?.attention ?? [],
          userAttentionValue:
              dataFromAPI?.body?.profileCareerInfo?.userattention ?? "-",
          textLeft:
              dataFromAPI?.body?.screeninfo?.textatt ?? profileTextAttention,
          isUnpressed: isUnpressed,
          callbackFromAttentionDataTab: (String attentionResult) {
            setState(() {
              attentionValue = attentionResult;
              if (kDebugMode) {
                print('attention is ');
                print(attentionValue);
              }
            });
          },
        ),
        ProfileCareerDropdownTab(
          dataTabColor: dataTabColor,
          textColor: textColor,
          textLeft:
              dataFromAPI?.body?.screeninfo?.textstatus ?? profileTextStatus,
          statusArray: dataFromAPI?.body?.profileCareerScreenInfo?.status ?? [],
          userStatusValue:
              dataFromAPI?.body?.profileCareerInfo?.userstatus ?? "-",

          ///
          userStatusValueCheck:
              dataFromAPI?.body?.profileCareerInfo?.userstatusvalue ?? "1",
          jobTextLeft:
              dataFromAPI?.body?.screeninfo?.textJobtype ?? profileTextJobType,
          jobTypeArray:
              dataFromAPI?.body?.profileCareerScreenInfo?.jobtype ?? [],
          userJobValue:
              dataFromAPI?.body?.profileCareerInfo?.userjobtype ?? "-",

          ///
          subtitleWorkplace: dataFromAPI?.body?.screeninfo?.subtitleworkplace ??
              profileSubTitleWorkplace,
          userWorkplace:
              dataFromAPI?.body?.profileCareerInfo?.userworkplace ?? "-",
          userCareer: dataFromAPI?.body?.profileCareerInfo?.usercareer ?? "-",
          userCompany: dataFromAPI?.body?.profileCareerInfo?.usercompany ?? "-",
          textComp:
              dataFromAPI?.body?.screeninfo?.textcomp ?? profileTextCompany,
          textCareer:
              dataFromAPI?.body?.screeninfo?.textcareer ?? profileTextCareer,
          isUnpressed: isUnpressed,
          // callbackFromWorkDataTab: (String jobType, String workplace, String career, String company){
          //   setState((){
          //     jobTypeValue = jobType;
          //     workplaceValue = workplace;
          //     careerValue = career;
          //     companyValue = company;
          //     if (kDebugMode) {
          //       print("$jobTypeValueและ$workplaceValueและ$careerValueและ$companyValue");
          //       print("araiiiiiii");
          //     }
          //   });
          callbackFromWorkDataTab: (String value, String type) {
            // setState(() {
              if (kDebugMode) {
              // print("$jobTypeValueและ$workplaceValueและ$careerValueและ$companyValue");
              print(value);
              print(type);
              }
              if (type == "jobType") {
                jobTypeValue = value;
              } else if (type == "workplace") {
                workplaceValue = value;
              } else if (type == "career") {
                careerValue = value;
              } else if (type == "company") {
                companyValue = value;
              }
              if (kDebugMode) {
                print("$jobTypeValueและ$workplaceValueและ$careerValueและ$companyValue");
              }
            // }
            // );
          },
          callbackFromWorkDataTabStatus: (String status) {
            setState(() {
              statusValue = status;
              if (kDebugMode) {
                print('status is ');
                print(statusValue);
              }
            });
          },
        ),
      ],
    )
          :
          Column();
  }
}
