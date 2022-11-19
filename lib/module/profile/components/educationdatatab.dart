import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';
import 'package:hexcolor/hexcolor.dart';


class ProfileEducationDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  final String? userRole;
  const ProfileEducationDataHead({Key? key, required this.dataFromAPI, required this.userRole}) : super(key: key);

  @override
  State<ProfileEducationDataHead> createState() => _ProfileEducationDataHeadState();
}
class _ProfileEducationDataHeadState extends State<ProfileEducationDataHead> {
  bool isUnpressed = true;
  late dynamic dataFromAPI;
  late String gpaJhValue;
  late String gpaShValue;
  late String gpaBdValue;
  late String userRole;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    gpaJhValue = dataFromAPI?.body?.profileEduInfo?.gpaJhs??"-";
    gpaShValue = dataFromAPI?.body?.profileEduInfo?.gpaShs??"-";
    gpaBdValue = dataFromAPI?.body?.profileEduInfo?.gpaBd??"-";
    userRole = widget.userRole??"ST";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var dataFromAPI = widget.dataFromAPI;
    // String gpaJhValue = dataFromAPI?.body?.profileEduInfo?.gpaJhs??"-";
    // String gpaShValue = dataFromAPI?.body?.profileEduInfo?.gpaShs??"-";
    // String gpaBdValue = dataFromAPI?.body?.profileEduInfo?.gpaBd??"-";
    return
      (userRole == "ST") ?
      Column(
      children: [
        Container(
          decoration: const BoxDecoration(
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
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isUnpressed = !isUnpressed;
                          if(isUnpressed == true){
                            context.read<ProfileBloc>().add(EducationSubmitEvent(gpaBd: gpaBdValue, gpaSh: gpaShValue, gpaJh: gpaJhValue));
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
        ProfileEducationDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textfac??profileTextFac,
            textRight: dataFromAPI?.body?.profileEduInfo?.faculty??"-"),
        ProfileEducationDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textdepart??profileTextDepart,
            textRight: dataFromAPI?.body?.profileEduInfo?.department??"-"),
        ProfileEducationDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textmajor??profileTextMajor,
            textRight: dataFromAPI?.body?.profileEduInfo?.major??"-"),
        ProfileEducationDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textgpaju??profileTextGpaJu,
            textRight: dataFromAPI?.body?.profileEduInfo?.gpaJhs??"-",
          onChange: (value) {
            gpaJhValue = value;
            if (kDebugMode) {
              print(gpaJhValue);
            }
          },),
        ProfileEducationDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textgpase??profileTextGpaSe,
            textRight: dataFromAPI?.body?.profileEduInfo?.gpaShs??"-",
          onChange: (value) {
          gpaShValue = value;
          if (kDebugMode) {
            print(gpaShValue);
          }
        },),
        ProfileEducationDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textgpaba??profileTextGpaBa,
            textRight: dataFromAPI?.body?.profileEduInfo?.gpaBd??"-",
          onChange: (value) {
            gpaBdValue = value;
            if (kDebugMode) {
              print(gpaBdValue);
            }
          },),
      ],
    )
          :
      Column(
        children: [
          Container(
            decoration: const BoxDecoration(
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
                    style: const TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isUnpressed = !isUnpressed;
                            if(isUnpressed == true){
                              context.read<ProfileBloc>().add(EducationSubmitEvent(gpaBd: gpaBdValue, gpaSh: gpaShValue, gpaJh: gpaJhValue));
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
            isUnpressed: isUnpressed,
            textLeft: "ปริญญาบัณฑิต",
            textRight: "มหาวิทยาลียบูรพา",
            // onChange: (value) {
            //   gpaJhValue = value;
            //   if (kDebugMode) {
            //     print(gpaJhValue);
            //   }
            // },
          ),
          ProfileEducationDataTab(
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
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  const ProfileEducationDataTab(
      {Key? key,
        required this.textLeft,
        required this.textRight,
        required this.isUnpressed,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileEducationDataTab> createState() => _ProfileEducationDataTabState();
}

class _ProfileEducationDataTabState extends State<ProfileEducationDataTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top : 12.0),
              child: Text(
                '$textLeft ',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.black,
                autofocus: false,
                minLines: 1,
                maxLines: 5,
                style: const TextStyle(fontSize: 18, color: Colors.black),
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
  final String textLeft;
  final String textRight;
  final bool isUnpressed;

  const ProfileEducationDataReadonlyTab(
      {Key? key,
        required this.textLeft,
        required this.textRight,
        required this.isUnpressed})
      : super(key: key);

  @override
  State<ProfileEducationDataReadonlyTab> createState() => _ProfileEducationDataReadonlyTabState();
}

class _ProfileEducationDataReadonlyTabState extends State<ProfileEducationDataReadonlyTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    String textEduData = '';
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#f5f5f5'),
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
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: TextFormField(
                autofocus: false,
                style: const TextStyle(fontSize: 18, color: Colors.black),
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