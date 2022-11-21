import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';

class ProfileGeneralDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;
  final String? userRole;
  const ProfileGeneralDataHead({Key? key, required this.dataFromAPI, required this.userRole})
      : super(key: key);
  @override
  State<ProfileGeneralDataHead> createState() => _ProfileGeneralDataHeadState();
}

class _ProfileGeneralDataHeadState extends State<ProfileGeneralDataHead> {
  bool isUnpressed = true;
  late dynamic dataFromAPI;
  late String surnameValue;
  late String nicknameValue;
  // TextEditingController nameValueController = TextEditingController();
  late String nameValue;
  late String userRole;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    surnameValue = dataFromAPI?.body?.profileGeneralInfo?.lastname??"-";
    nicknameValue = dataFromAPI?.body?.profileGeneralInfo?.nickname??"-";
    nameValue = dataFromAPI?.body?.profileGeneralInfo?.name??"-";
    userRole = widget.userRole??"ST";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var dataFromAPI = widget.dataFromAPI;
    // String surnameValue = dataFromAPI?.body?.profileGeneralInfo?.lastname??"-";
    // String nicknameValue = dataFromAPI?.body?.profileGeneralInfo?.nickname??"-";
    return
      (userRole == "ST") ?
      Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.yellow,
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.transparent)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  dataFromAPI?.body?.screeninfo?.subtitlegeninfo??profileSubTitleGenInfo,
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
                            context.read<ProfileBloc>().add(GeneralSubmitEvent(nickname: nicknameValue
                                // , name: nameValueController.text
                                , name: nameValue
                                , surname: surnameValue));
                          }
                        });
                      },
                      child: isUnpressed
                          // ? Text('บันทึก', style: TextStyle(color: Colors.green))
                          ? Text(dataFromAPI?.body?.screeninfo?.textedit??profileTextEdit, style: const TextStyle(color: Colors.red))
                          : Text(dataFromAPI?.body?.screeninfo?.textsave??profileTextSave,
                              style: const TextStyle(color: Colors.green)),
                      // : Text('แก้ไข', style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ProfileGeneralDataTab(
          isUnpressed: isUnpressed,
          textLeft: dataFromAPI?.body?.screeninfo?.textname??profileTextName,
          textRight: dataFromAPI?.body?.profileGeneralInfo?.name??"-",
          // textEditingController: nameValueController..text=dataFromAPI?.body?.profileGeneralInfo?.name??"-",
          onChange: (value) {
            // nameValueController.text = value;
            nameValue = value;
            if (kDebugMode) {
              // print(nameValueController.text);
              print(nameValue);
            }
          },
        ),
        ProfileGeneralDataTab(
          isUnpressed: isUnpressed,
          textLeft: dataFromAPI?.body?.screeninfo?.textlname??profileTextLastName,
          textRight: dataFromAPI?.body?.profileGeneralInfo?.lastname??"-",
          onChange: (value) {
            surnameValue = value;
            if (kDebugMode) {
              print(surnameValue);
            }
          },
        ),
        ProfileGeneralDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textnickname??profileTextNickName,
            textRight: dataFromAPI?.body?.profileGeneralInfo?.nickname??"-",
            onChange: (value) {
              nicknameValue = value;
              if (kDebugMode) {
                print(nicknameValue);
              }
            }),
        ProfileGeneralDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textstdcode??profileTextStdCode,
            textRight: dataFromAPI?.body?.profileGeneralInfo?.studentid??"-"),
        ProfileGeneralDataReadonlyTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textgen??profileTextGen,
            textRight: dataFromAPI?.body?.profileGeneralInfo?.generation??"-"),
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
                dataFromAPI?.body?.screeninfo?.subtitlegeninfo??profileSubTitleGenInfo,
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
                          context.read<ProfileBloc>().add(GeneralSubmitEvent(nickname: nicknameValue
                              // , name: nameValueController.text
                              , name: nameValue
                              , surname: surnameValue));
                        }
                      });
                    },
                    child: isUnpressed
                    // ? Text('บันทึก', style: TextStyle(color: Colors.green))
                        ? Text(dataFromAPI?.body?.screeninfo?.textedit??profileTextEdit, style: const TextStyle(color: Colors.red))
                        : Text(dataFromAPI?.body?.screeninfo?.textsave??profileTextSave,
                        style: const TextStyle(color: Colors.green)),
                    // : Text('แก้ไข', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ProfileGeneralDataTab(
        isUnpressed: isUnpressed,
        textLeft: dataFromAPI?.body?.screeninfo?.textname??profileTextName,
        textRight: dataFromAPI?.body?.profileGeneralInfo?.name??"-",
        // textEditingController: nameValueController..text=dataFromAPI?.body?.profileGeneralInfo?.name??"-",
        onChange: (value) {
          // nameValueController.text = value;
          nameValue = value;
          if (kDebugMode) {
            // print(nameValueController.text);
            print(nameValue);
          }
        },
      ),
      ProfileGeneralDataTab(
        isUnpressed: isUnpressed,
        textLeft: dataFromAPI?.body?.screeninfo?.textlname??profileTextLastName,
        textRight: dataFromAPI?.body?.profileGeneralInfo?.lastname??"-",
        onChange: (value) {
          surnameValue = value;
          if (kDebugMode) {
            print(surnameValue);
          }
        },
      ),
      ProfileGeneralDataTab(
          isUnpressed: isUnpressed,
          textLeft: dataFromAPI?.body?.screeninfo?.textnickname??profileTextNickName,
          textRight: dataFromAPI?.body?.profileGeneralInfo?.nickname??"-",
          onChange: (value) {
            nicknameValue = value;
            if (kDebugMode) {
              print(nicknameValue);
            }
          }),
      ProfileGeneralDataTab(
          isUnpressed: isUnpressed,
          textLeft: "ตำแหน่งทางวิชาการ",
          textRight: "ผู้ช่วยศาสตราจารย์",
          // onChange: (value) {
          //   nicknameValue = value;
          //   if (kDebugMode) {
          //     print(nicknameValue);
          //   }
          // }
          ),
    ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataTab extends StatefulWidget {
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final TextEditingController? textEditingController;
  const ProfileGeneralDataTab(
      {Key? key,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed,
      this.onChange, this.textEditingController})
      : super(key: key);

  @override
  State<ProfileGeneralDataTab> createState() => _ProfileGeneralDataTabState();
}

class _ProfileGeneralDataTabState extends State<ProfileGeneralDataTab> {
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
          children: [
            Text(
              '$textLeft ',
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: TextFormField(
                cursorColor: Colors.black,
                autofocus: false,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                readOnly: isUnpressed,
                // readOnly: true,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                initialValue: textRight,
                onChanged: widget.onChange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
class ProfileGeneralDataReadonlyTab extends StatefulWidget {
  final String textLeft;
  final String textRight;
  final bool isUnpressed;

  const ProfileGeneralDataReadonlyTab(
      {Key? key,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed})
      : super(key: key);

  @override
  State<ProfileGeneralDataReadonlyTab> createState() =>
      _ProfileGeneralDataReadonlyTabState();
}

class _ProfileGeneralDataReadonlyTabState
    extends State<ProfileGeneralDataReadonlyTab> {
  @override
  Widget build(BuildContext context) {
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
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
                initialValue: textRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
