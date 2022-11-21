
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';

class ProfileContactDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  final String? userRole;
  const ProfileContactDataHead({Key? key, required this.dataFromAPI, required this.userRole})
      : super(key: key);

  @override
  State<ProfileContactDataHead> createState() => _ProfileContactDataHeadState();
}

class _ProfileContactDataHeadState extends State<ProfileContactDataHead> {
  bool isUnpressed = true;
  late dynamic dataFromAPI;
  late String phoneValue;
  late String lineValue;
  late String facebookValue;
  late String instagramValue;
  late String twitterValue;
  late String youtubeValue;
  late String userRole;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    phoneValue = dataFromAPI?.body?.profileContactInfo?.phone??"-";
    lineValue = dataFromAPI?.body?.profileContactInfo?.line??"-";
    facebookValue = dataFromAPI?.body?.profileContactInfo?.facebook??"-";
    instagramValue = dataFromAPI?.body?.profileContactInfo?.instagram??"-";
    twitterValue = dataFromAPI?.body?.profileContactInfo?.twitter??"-";
    youtubeValue = dataFromAPI?.body?.profileContactInfo?.youtube??"-";
    userRole = widget.userRole??"ST";
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
                  dataFromAPI?.body?.screeninfo?.subtitlecont??profileSubTitleContact,
                  style: const TextStyle(fontSize: 20),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isUnpressed = !isUnpressed;
                          if (isUnpressed == true) {
                            context.read<ProfileBloc>().add(ContactSubmitEvent(
                                instagram: instagramValue,
                                twitter: twitterValue,
                                youtube: youtubeValue,
                                facebook: facebookValue,
                                line: lineValue,
                                phone: phoneValue));
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
        ProfileContactDataTab(
          isUnpressed: isUnpressed,
          iconContact: Icon(
            Icons.phone,
            color: HexColor('#000000'),
          ),
          textContact: dataFromAPI?.body?.profileContactInfo?.phone??"-",
          keyboardType: const TextInputType.numberWithOptions(),
          maxLength: 10,
          onChange: (value) {
            phoneValue = value;
            if (kDebugMode) {
              print(phoneValue);
            }
          },
        ),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.line,
              color: HexColor('#00B900'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.line??"-",
          onChange: (value) {
            lineValue = value;
            if (kDebugMode) {
              print(lineValue);
            }
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.facebook,
              color: HexColor('#3B5998'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.facebook??"-",
          onChange: (value) {
            facebookValue = value;
            if (kDebugMode) {
              print(facebookValue);
            }
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.instagram,
              color: HexColor('#E1306C'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.instagram??"-",
          onChange: (value) {
            instagramValue = value;
            if (kDebugMode) {
              print(instagramValue);
            }
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.twitter,
              color: HexColor('#00acee'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.twitter??"-",
          onChange: (value) {
            twitterValue = value;
            if (kDebugMode) {
              print(twitterValue);
            }
          },),
        ProfileContactDataTab(
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.youtube,
              color: HexColor('#FF0000'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.youtube??"-",
          onChange: (value) {
            youtubeValue = value;
            if (kDebugMode) {
              print(youtubeValue);
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
                    dataFromAPI?.body?.screeninfo?.subtitlecont??profileSubTitleContact,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isUnpressed = !isUnpressed;
                            if (isUnpressed == true) {
                              context.read<ProfileBloc>().add(ContactSubmitEvent(
                                  instagram: instagramValue,
                                  twitter: twitterValue,
                                  youtube: youtubeValue,
                                  facebook: facebookValue,
                                  line: lineValue,
                                  phone: phoneValue));
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
            textLeft: "โทร",
            isUnpressed: isUnpressed,
            iconContact: Icon(
              Icons.phone,
              color: HexColor('#000000'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.phone??"-",
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
            textLeft: "อีเมล",
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.envelope,
              color: HexColor('#00B900'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.line??"-",
            onChange: (value) {
              lineValue = value;
              if (kDebugMode) {
                print(lineValue);
              }
            },),
          ProfileContactDataTCTab(
            textLeft: "ห้องปฏิบัติงาน",
            isUnpressed: isUnpressed,
            iconContact: Icon(
              FontAwesomeIcons.building,
              color: HexColor('#3B5998'),
            ),
            textContact: dataFromAPI?.body?.profileContactInfo?.facebook??"-",
            onChange: (value) {
              facebookValue = value;
              if (kDebugMode) {
                print(facebookValue);
              }
            },),
        ],
      );
  }
}
class ProfileContactDataTab extends StatefulWidget {
  final Widget iconContact;
  final String textContact;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final TextInputType? keyboardType;
  final int? maxLength;
  const ProfileContactDataTab(
      {Key? key,
        required this.iconContact,
        required this.textContact,
        required this.isUnpressed,
        this.keyboardType,
        this.maxLength,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileContactDataTab> createState() => _ProfileContactDataTabState();
}

class _ProfileContactDataTabState extends State<ProfileContactDataTab> {
  @override
  Widget build(BuildContext context) {
    Widget iconContact = widget.iconContact;
    String textContact = widget.textContact;
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
            iconContact,
            Expanded(
              child: TextFormField(
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
  final Widget iconContact;
  final String textContact;
  final String textLeft;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final TextInputType? keyboardType;
  final int? maxLength;
  const ProfileContactDataTCTab(
      {Key? key,
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
    Widget iconContact = widget.iconContact;
    String textContact = widget.textContact;
    String textLeft = widget.textLeft;
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
            iconContact,
            Text(
              ' $textLeft ',
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: TextFormField(
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