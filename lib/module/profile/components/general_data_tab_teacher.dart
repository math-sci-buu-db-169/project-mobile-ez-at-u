import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';

class ProfileGeneralDataHeadTeacher extends StatefulWidget {
  final Color? dataTabColor;
  final Color? textColor;
  final Color? dataTabColorRO;
  final ProfileTeacherScreenApi? dataFromAPI;
  final String? userRole;
  const ProfileGeneralDataHeadTeacher(
      {Key? key,
      required this.dataFromAPI,
      required this.userRole,
      required this.textColor,
      required this.dataTabColor,
      required this.dataTabColorRO})
      : super(key: key);
  @override
  State<ProfileGeneralDataHeadTeacher> createState() => _ProfileGeneralDataHeadTeacherState();
}

class _ProfileGeneralDataHeadTeacherState extends State<ProfileGeneralDataHeadTeacher> {
  bool isUnpressed = true;
  late dynamic dataFromAPI;
  late String surnameValue;
  late String nicknameValue;
  // TextEditingController nameValueController = TextEditingController();
  late String nameValue;
  late String userRole;
  late Color textColor;
  late Color dataTabColor;
  late Color dataTabColorRO;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    surnameValue = dataFromAPI?.body?.profileGeneralTH?.lastname ?? "-";
    nicknameValue = dataFromAPI?.body?.profileGeneralTH?.nickname ?? "-";
    nameValue = dataFromAPI?.body?.profileGeneralTH?.name ?? "-";
    userRole = widget.userRole ?? "TC";
    textColor = widget.textColor ?? Colors.black.withOpacity(0.5);
    dataTabColor = widget.dataTabColor ?? Colors.transparent.withOpacity(0.5);
    dataTabColorRO =
        widget.dataTabColorRO ?? Colors.transparent.withOpacity(0.5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var dataFromAPI = widget.dataFromAPI;
    // String surnameValue = dataFromAPI?.body?.profileGeneralInfo?.lastname??"-";
    // String nicknameValue = dataFromAPI?.body?.profileGeneralInfo?.nickname??"-";
    return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: dataTabColor,
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.black12),
                          bottom:
                              BorderSide(width: 1, color: Colors.transparent)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            dataFromAPI?.body?.screeninfo?.subtitlegeninfo ??
                                profileSubTitleGenInfo,
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
                                      context
                                          .read<ProfileBloc>()
                                          .add(GeneralSubmitEvent(
                                              nickname: nicknameValue
                                              // , name: nameValueController.text
                                              ,
                                              name: nameValue,
                                              surname: surnameValue));
                                    }
                                  });
                                },
                                child: isUnpressed
                                    // ? Text('บันทึก', style: TextStyle(color: Colors.green))
                                    ? Text(
                                        dataFromAPI
                                                ?.body?.screeninfo?.textedit ??
                                            profileTextEdit,
                                        style:
                                            const TextStyle(color: Colors.red))
                                    : Text(
                                        dataFromAPI
                                                ?.body?.screeninfo?.textsave ??
                                            profileTextSave,
                                        style: const TextStyle(
                                            color: Colors.green)),
                                // : Text('แก้ไข', style: TextStyle(color: Colors.red)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProfileGeneralDataTab(
                    dataTabColor: dataTabColor,
                    textColor: textColor,
                    isUnpressed: isUnpressed,
                    textLeft: dataFromAPI?.body?.screeninfo?.textname ??
                        profileTextName,
                    textRight:
                        dataFromAPI?.body?.profileGeneralTH?.name ?? "-",
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
                    dataTabColor: dataTabColor,
                    textColor: textColor,
                    isUnpressed: isUnpressed,
                    textLeft: dataFromAPI?.body?.screeninfo?.textlname ??
                        profileTextLastName,
                    textRight:
                        dataFromAPI?.body?.profileGeneralTH?.lastname ?? "-",
                    onChange: (value) {
                      surnameValue = value;
                      if (kDebugMode) {
                        print(surnameValue);
                      }
                    },
                  ),
                  ProfileGeneralDataTab(
                      dataTabColor: dataTabColor,
                      textColor: textColor,
                      isUnpressed: isUnpressed,
                      textLeft: dataFromAPI?.body?.screeninfo?.textnickname ??
                          profileTextNickName,
                      textRight:
                          dataFromAPI?.body?.profileGeneralTH?.nickname ??
                              "-",
                      onChange: (value) {
                        nicknameValue = value;
                        if (kDebugMode) {
                          print(nicknameValue);
                        }
                      }),
                  ProfileGeneralDataTab(
                    dataTabColor: dataTabColor,
                    textColor: textColor,
                    isUnpressed: isUnpressed,
                    textLeft: dataFromAPI?.body?.screeninfo?.textacaposit ?? profileTextPosition,
                    textRight:
                        dataFromAPI?.body?.profileGeneralTH?.position ?? '555',
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
  final Color textColor;
  final Color dataTabColor;
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  final TextEditingController? textEditingController;
  const ProfileGeneralDataTab(
      {Key? key,
      required this.textColor,
      required this.dataTabColor,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed,
      this.onChange,
      this.textEditingController})
      : super(key: key);

  @override
  State<ProfileGeneralDataTab> createState() => _ProfileGeneralDataTabState();
}

class _ProfileGeneralDataTabState extends State<ProfileGeneralDataTab> {
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
        padding:
            const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 20),
        child: Row(
          children: [
            Text(
              '$textLeft ',
              style: TextStyle(fontSize: 18, color: textColor),
            ),
            Expanded(
              child: TextFormField(
                cursorColor: textColor,
                autofocus: false,
                style: TextStyle(fontSize: 18, color: textColor),
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
  final Color dataTabColor;
  final Color dataTabColorRO;
  final Color textColor;
  final String textLeft;
  final String textRight;
  final bool isUnpressed;

  const ProfileGeneralDataReadonlyTab(
      {Key? key,
      required this.textColor,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed,
      required this.dataTabColor,
      required this.dataTabColorRO})
      : super(key: key);

  @override
  State<ProfileGeneralDataReadonlyTab> createState() =>
      _ProfileGeneralDataReadonlyTabState();
}

class _ProfileGeneralDataReadonlyTabState
    extends State<ProfileGeneralDataReadonlyTab> {
  @override
  Widget build(BuildContext context) {
    Color textColor = widget.textColor;
    Color dataTabColorRO = widget.dataTabColorRO;
    String textLeft = widget.textLeft;
    String textRight = widget.textRight;
    return Container(
      decoration: BoxDecoration(
        // color: dataTabColorRO,
        color: (dataTabColorRO == Colors.black)
            ? Colors.grey.withOpacity(0.2)
            : Colors.black.withOpacity(0.2),
        border: const Border(
            top: BorderSide(width: 1, color: Colors.black12),
            bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 20),
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
                initialValue: textRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
