import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';


class ProfileEducationDataHeadTeacher extends StatefulWidget {
  final ProfileTeacherScreenApi? dataFromAPI;
  final Color? dataTabColorRO;
  final String? userRole;
  final Color? dataTabColor;
  final Color? textColor;
  const ProfileEducationDataHeadTeacher({Key? key, required this.dataFromAPI,
    required this.userRole,
    required this.textColor,
    required this.dataTabColorRO,
    required this.dataTabColor}) : super(key: key);

  @override
  State<ProfileEducationDataHeadTeacher> createState() => _ProfileEducationDataHeadTeacherState();
}
class _ProfileEducationDataHeadTeacherState extends State<ProfileEducationDataHeadTeacher> {
  bool isUnpressed = true;
  late dynamic dataFromAPI;
  late String bachelorDegreeValue;
  late String masterDegreeValueValue;
  late String pHDValue;
  late String userRole;
  late Color textColor;
  late Color dataTabColor;
  late Color dataTabColorRO;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    bachelorDegreeValue = dataFromAPI?.body?.profileAcademicTH?.graduatedegree??"-";
    masterDegreeValueValue = dataFromAPI?.body?.profileAcademicTH?.masterdegree??"-";
    pHDValue = dataFromAPI?.body?.profileAcademicTH?.phd??"-";
    userRole = widget.userRole??"ST";
    textColor = widget.textColor??Colors.black.withOpacity(0.5);
    dataTabColor = widget.dataTabColor??Colors.transparent.withOpacity(0.5);
    dataTabColorRO = widget.dataTabColorRO??Colors.transparent.withOpacity(0.5);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var dataFromAPI = widget.dataFromAPI;
    // String gpaJhValue = dataFromAPI?.body?.profileEduInfo?.gpaJhs??"-";
    // String gpaShValue = dataFromAPI?.body?.profileEduInfo?.gpaShs??"-";
    // String gpaBdValue = dataFromAPI?.body?.profileEduInfo?.gpaBd??"-";
    return
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
                    dataFromAPI?.body?.screeninfo?.subtitleeduinfo??profileSubTitleEduInfo,
                    style: TextStyle(fontSize: 20, color: textColor),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isUnpressed = !isUnpressed;
                            if(isUnpressed == true){
                              // context.read<ProfileBloc>().add(EducationSubmitEvent(gpaBd: gpaBdValue, gpaSh: gpaShValue, gpaJh: gpaJhValue));
                            }
                          });
                        },
                        child: isUnpressed
                            ? Text(dataFromAPI?.body?.screeninfo?.textedit??profileTextEdit, style: const TextStyle(color: Colors.red))
                            : Text(dataFromAPI?.body?.screeninfo?.textsave??profileTextSave, style: const TextStyle(color: Colors.green)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProfileEducationDataTab(
            dataTabColor: dataTabColor,
            textColor: textColor,
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textgdegree??profileTextBSC,
            textRight: "มหาวิทยาลียบูรพา",
            // onChange: (value) {
            //   gpaJhValue = value;
            //   if (kDebugMode) {
            //     print(gpaJhValue);
            //   }
            // },
          ),
          ProfileEducationDataTab(
            dataTabColor: dataTabColor,
            textColor: textColor,
            isUnpressed: isUnpressed,
            textLeft: "ปริญญามหาบัณฑิต",
            textRight: "มหาวิทยาลัยบูรพา2",
            // onChange: (value) {
            //   gpaShValue = value;
            //   if (kDebugMode) {
            //     print(gpaShValue);
            //   }
            // }
            ),
          ProfileEducationDataTab(
            dataTabColor: dataTabColor,
            textColor: textColor,
            isUnpressed: isUnpressed,
            textLeft: "ปริญญาดุษฎีบัณฑิต",
            textRight: "มหาวิทยาลัยบูรพา3",
            // onChange: (value) {
            //   gpaBdValue = value;
            //   if (kDebugMode) {
            //     print(gpaBdValue);
            //   }
            // },
          ),
          ProfileEducationDataTab(
            dataTabColor: dataTabColor,
            textColor: textColor,
            isUnpressed: isUnpressed,
            textLeft: "ขอบเขตการวิจัย",
            textRight: "Discrete Mathematics, Differential Equations, Numerical Analysis",
            // onChange: (value) {
            //   gpaBdValue = value;
            //   if (kDebugMode) {
            //     print(gpaBdValue);
            //   }
            // },
          ),
        ],
      );
  }
}
////////////////////////////////////////////////////////////////////////////////
class ProfileEducationDataTab extends StatefulWidget {
  final Color dataTabColor;
  final Color textColor;
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  const ProfileEducationDataTab(
      {Key? key,
        required this.textLeft,
        required this.textRight,
        required this.isUnpressed,
        required this.textColor,
        required this.dataTabColor,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileEducationDataTab> createState() => _ProfileEducationDataTabState();
}

class _ProfileEducationDataTabState extends State<ProfileEducationDataTab> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColor = widget.dataTabColor;
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 12.0),
              child: Text(
                '$textLeft ',
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
            Expanded(
              child: TextFormField(
                cursorColor: textColor,
                autofocus: false,
                minLines: 1,
                maxLines: 5,
                style: TextStyle(fontSize: 18, color: textColor),
                readOnly: isUnpressed,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: ""
                ),
                onChanged : widget.onChange,
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
class ProfileEducationDataReadonlyTab extends StatefulWidget {
  final Color dataTabColor;
  final Color dataTabColorRO;
  final Color textColor;
  final String textLeft;
  final String textRight;
  final bool isUnpressed;

  const ProfileEducationDataReadonlyTab(
      {Key? key,
        required this.textLeft,
        required this.textRight,
        required this.isUnpressed
        , required this.dataTabColor
        , required this.dataTabColorRO
        , required this.textColor
      })
      : super(key: key);

  @override
  State<ProfileEducationDataReadonlyTab> createState() => _ProfileEducationDataReadonlyTabState();
}

class _ProfileEducationDataReadonlyTabState extends State<ProfileEducationDataReadonlyTab> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColorRO = widget.dataTabColorRO;
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    String textEduData = '';
    return Container(
      decoration: BoxDecoration(
        color: (dataTabColorRO== Colors.black)? Colors.grey.withOpacity(0.2):Colors.black.withOpacity(0.2),
        border: const Border(
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
                autofocus: false,
                style: TextStyle(fontSize: 18, color: textColor),
                readOnly: true,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    textEduData = value;
                    if (kDebugMode) {
                      print(textEduData);
                    }
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