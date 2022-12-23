import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';


class ProfileEducationDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  final Color? dataTabColorRO;
  final String? userRole;
  final Color? dataTabColor;
  final Color? textColor;
  const ProfileEducationDataHead({Key? key, required this.dataFromAPI,
    required this.userRole,
    required this.textColor,
    required this.dataTabColorRO,
    required this.dataTabColor}) : super(key: key);

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
  late Color textColor;
  late Color dataTabColor;
  late Color dataTabColorRO;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    gpaJhValue = dataFromAPI?.body?.profileEduInfo?.gpaJhs??"-";
    gpaShValue = dataFromAPI?.body?.profileEduInfo?.gpaShs??"-";
    gpaBdValue = dataFromAPI?.body?.profileEduInfo?.gpaBd??"-";
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
            dataTabColorRO: dataTabColorRO,
            dataTabColor: dataTabColor,
            textColor: textColor,
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textfac??profileTextFac,
            textRight: dataFromAPI?.body?.profileEduInfo?.faculty??"-"),
        ProfileEducationDataReadonlyTab(
            dataTabColorRO: dataTabColorRO,
            dataTabColor: dataTabColor,
            textColor: textColor,
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textdepart??profileTextDepart,
            textRight: dataFromAPI?.body?.profileEduInfo?.department??"-"),
        ProfileEducationDataReadonlyTab(
            dataTabColorRO: dataTabColorRO,
            dataTabColor: dataTabColor,
            textColor: textColor,
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textmajor??profileTextMajor,
            textRight: dataFromAPI?.body?.profileEduInfo?.major??"-"),
        ProfileEducationDataTab(
          dataTabColor: dataTabColor,
          textColor: textColor,
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
          dataTabColor: dataTabColor,
          textColor: textColor,
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
          dataTabColor: dataTabColor,
          textColor: textColor,
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
    ;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                '$textLeft ',
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                '$textLeft ',
                style: TextStyle(fontSize: 18, color: textColor),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                minLines: 1,
                maxLines: null,
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