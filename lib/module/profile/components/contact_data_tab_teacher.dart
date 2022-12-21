
import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';

class ProfileContactDataHeadTeacher extends StatefulWidget {
  final Color? dataTabColor;
  final Color? dataTabColorRO;
  final Color? textColor;
  final ProfileTeacherScreenApi? dataFromAPI;
  final String? userRole;
  const ProfileContactDataHeadTeacher({Key? key, required this.dataFromAPI, required this.userRole    , required this.textColor
    , required this.dataTabColor, required this.dataTabColorRO})
      : super(key: key);

  @override
  State<ProfileContactDataHeadTeacher> createState() => _ProfileContactDataHeadTeacherState();
}

class _ProfileContactDataHeadTeacherState extends State<ProfileContactDataHeadTeacher> {
  bool isUnpressed = true;
  late dynamic dataFromAPI;
  late String phoneValue;
  late String emailValue;
  late String roomValue;
  late String userRole;
  late Color textColor;
  late Color dataTabColor;
  late Color dataTabColorRO;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    phoneValue = dataFromAPI?.body?.profileContactTH?.phone??"-";
    emailValue = dataFromAPI?.body?.profileContactTH?.email??"-";
    roomValue = dataFromAPI?.body?.profileContactTH?.workshop??"-";
    textColor = widget.textColor??Colors.black.withOpacity(0.5);
    dataTabColor = widget.dataTabColor??Colors.transparent.withOpacity(0.5);
    dataTabColorRO = widget.dataTabColorRO??Colors.transparent.withOpacity(0.5);
    userRole = widget.userRole??"TC";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var dataFromAPI = widget.dataFromAPI;
    // String phoneValue = dataFromAPI?.body?.profileContactInfo?.phone??"-";
    // String lineValue = dataFromAPI?.body?.profileContactInfo?.line??"-";
    // String facebookValue = dataFromAPI?.body?.profileContactInfo?.facebook??"-";
    // String instagramValue =  dataFromAPI?.body?.profileContactInfo?.instagram??"-";
    // String twitterValue =  dataFromAPI?.body?.profileContactInfo?.twitter??"-";
    // String youtubeValue =  dataFromAPI?.body?.profileContactInfo?.youtube??"-";
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
                    dataFromAPI?.body?.screeninfo?.subtitlecont??profileSubTitleContact,
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
                              // context.read<ProfileBloc>().add(ContactSubmitEvent(
                              //     instagram: instagramValue,
                              //     twitter: twitterValue,
                              //     youtube: youtubeValue,
                              //     facebook: facebookValue,
                              //     line: lineValue,
                              //     phone: phoneValue));
                            }
                          });
                        },
                        child: isUnpressed
                            ? Text(dataFromAPI?.body?.screeninfo?.textedit??profileTextEdit, style: const TextStyle(color: Colors.red))
                            : Text(dataFromAPI?.body?.screeninfo?.textsave??profileTextSave,
                            style: const TextStyle(color: Colors.green)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProfileContactDataTCTab(
            dataTabColor: dataTabColor,
            textColor: textColor,
            textLeft: dataFromAPI?.body?.screeninfo?.texttel??profileTextTel,
            isUnpressed: isUnpressed,
            iconContact: Icon(
              Icons.phone,
              color: HexColor('#000000'),
            ),
            textContact: dataFromAPI?.body?.profileContactTH?.phone??"-",
            keyboardType: const TextInputType.numberWithOptions(),
            maxLength: 10,
            onChange: (value) {
              phoneValue = value;
              if (kDebugMode) {
                print(phoneValue);
              }
            },
          ),
          ProfileContactDataTCTab(
            dataTabColor: dataTabColor,
            textColor: textColor,
            textLeft: dataFromAPI?.body?.screeninfo?.textemail??profileTextEmail,
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.envelope,
              color: HexColor('#00B900'),
            ),
            textContact: dataFromAPI?.body?.profileContactTH?.email??"-",
            // onChange: (value) {
            //   lineValue = value;
            //   if (kDebugMode) {
            //     print(lineValue);
            //   }
            // },
          ),
          ProfileContactDataTCTab(
            dataTabColor: dataTabColor,
            textColor: textColor,
            textLeft: dataFromAPI?.body?.screeninfo?.textworkshop??profileTextRoom,
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.building,
              color: HexColor('#3B5998'),
            ),
            textContact: dataFromAPI?.body?.profileContactTH?.workshop??"-",
            // onChange: (value) {
            //   facebookValue = value;
            //   if (kDebugMode) {
            //     print(facebookValue);
            //   }
            // },
  ),
        ],
      )
    ;
  }
}
class ProfileContactDataTabTeacher extends StatefulWidget {
  final Color textColor;
  final Color dataTabColor;
  final Widget iconContact;
  final String textContact;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final TextInputType? keyboardType;
  final int? maxLength;
  const ProfileContactDataTabTeacher(
      {Key? key,
        required this.iconContact,
        required this.textContact,
        required this.isUnpressed,
        required this.textColor,
        required this.dataTabColor,
        this.keyboardType,
        this.maxLength,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileContactDataTabTeacher> createState() => _ProfileContactDataTabTeacherState();
}

class _ProfileContactDataTabTeacherState extends State<ProfileContactDataTabTeacher> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColor = widget.dataTabColor;
    Widget iconContact = widget.iconContact;
    String textContact = widget.textContact;
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
            iconContact,
            Expanded(
              child: TextFormField(
                style: TextStyle(fontSize: 18, color: textColor),
                cursorColor: Colors.black,
                keyboardType: widget.keyboardType,
                maxLength: widget.maxLength,
                readOnly: isUnpressed,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: ""
                ),
                onChanged: widget.onChange,
                initialValue: textContact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////
class ProfileContactDataTCTab extends StatefulWidget {
  final Color textColor;
  final Color dataTabColor;
  final Widget iconContact;
  final String textContact;
  final String textLeft;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final TextInputType? keyboardType;
  final int? maxLength;
  const ProfileContactDataTCTab(
      {Key? key,
        required this.textColor,
        required this.dataTabColor,
        required this.textLeft,
      required this.iconContact,
      required this.textContact,
      required this.isUnpressed,
      this.keyboardType,
        this.maxLength,
      this.onChange})
      : super(key: key);

  @override
  State<ProfileContactDataTCTab> createState() => _ProfileContactDataTCTabState();
}

class _ProfileContactDataTCTabState extends State<ProfileContactDataTCTab> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColor = widget.dataTabColor;
    Widget iconContact = widget.iconContact;
    String textContact = widget.textContact;
    String textLeft = widget.textLeft;
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
            iconContact,
            Text(
              ' $textLeft ',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            Expanded(
              child: TextFormField(
                style: TextStyle(fontSize: 18, color: textColor),
                cursorColor: Colors.black,
                keyboardType: widget.keyboardType,
                maxLength: widget.maxLength,
                readOnly: isUnpressed,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: ""
                ),
                onChanged: widget.onChange,
                initialValue: textContact,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/////