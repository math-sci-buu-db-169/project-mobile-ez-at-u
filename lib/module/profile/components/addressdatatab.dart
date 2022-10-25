
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../customs/message/text_profile.dart';
import '../bloc/profile_bloc.dart';
import '../model/response/api_profile_response.dart';

class ProfileAddressDataHead extends StatefulWidget {
  final ApiProfileResponse? dataFromAPI;

  const ProfileAddressDataHead({Key? key, required this.dataFromAPI})
      : super(key: key);

  @override
  State<ProfileAddressDataHead> createState() => _ProfileAddressDataHeadState();
}

class _ProfileAddressDataHeadState extends State<ProfileAddressDataHead> {
  bool isUnpressed = true;
  late dynamic dataFromAPI;
  late String numberValue;
  late String mooValue;
  late String soiValue;
  late String roadValue;
  late String subDistrictValue;
  late String districtValue;
  late String provinceValue;
  late String zipcodeValue;
  @override
  void initState() {
    dataFromAPI = widget.dataFromAPI;
    numberValue = dataFromAPI?.body?.profileAddressInfo?.number??"-";
    mooValue = dataFromAPI?.body?.profileAddressInfo?.moo??"-";
    soiValue = dataFromAPI?.body?.profileAddressInfo?.soi??"-";
    roadValue = dataFromAPI?.body?.profileAddressInfo?.road??"-";
    subDistrictValue = dataFromAPI?.body?.profileAddressInfo?.subdistrict??"-";
    districtValue = dataFromAPI?.body?.profileAddressInfo?.district??"-";
    provinceValue = dataFromAPI?.body?.profileAddressInfo?.province??"-";
    zipcodeValue = dataFromAPI?.body?.profileAddressInfo?.zipcode??"-";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var dataFromAPI = widget.dataFromAPI;
    // String numberValue = dataFromAPI?.body?.profileAddressInfo?.number??"-";
    // String mooValue = dataFromAPI?.body?.profileAddressInfo?.moo??"-";
    // String soiValue = dataFromAPI?.body?.profileAddressInfo?.soi??"-";
    // String roadValue = dataFromAPI?.body?.profileAddressInfo?.road??"-";
    // String subDistrictValue = dataFromAPI?.body?.profileAddressInfo?.subdistrict??"-";
    // String districtValue = dataFromAPI?.body?.profileAddressInfo?.district??"-";
    // String provinceValue = dataFromAPI?.body?.profileAddressInfo?.province??"-";
    // String zipcodeValue = dataFromAPI?.body?.profileAddressInfo?.zipcode??"-";
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                bottom: BorderSide(width: 1, color: Colors.transparent)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
            child: Row(
              children: [
                Text(
                  dataFromAPI?.body?.screeninfo?.subtitleaddress??profileSubTitleAddress,
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
                            context.read<ProfileBloc>().add(AddressSubmitEvent(zipcode: zipcodeValue, district: districtValue, road: roadValue, province: provinceValue, number: numberValue, subDistrict: subDistrictValue, moo: mooValue, soi: soiValue));
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
        ProfileAddressDataTab(
          isUnpressed: isUnpressed,
          textLeft: dataFromAPI?.body?.screeninfo?.texthousenumber??profileTextHouseNumber,
          textRight: dataFromAPI?.body?.profileAddressInfo?.number??"-",
          onChange: (value) {
            numberValue = value;
            if (kDebugMode) {
              print(numberValue);
            }
          },
        ),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textmoo??profileTextMoo,
            textRight: dataFromAPI?.body?.profileAddressInfo?.moo??"-",
          onChange: (value) {
            mooValue = value;
            if (kDebugMode) {
              print(numberValue);
            }
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textsoi??profileTextSoi,
            textRight: dataFromAPI?.body?.profileAddressInfo?.soi??"-",
          onChange: (value) {
            soiValue = value;
            if (kDebugMode) {
              print(numberValue);
            }
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textroad??profileTextRoad,
            textRight: dataFromAPI?.body?.profileAddressInfo?.road??"-",
          onChange: (value) {
            roadValue = value;
            if (kDebugMode) {
              print(roadValue);
            }
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textsubdistrict??profileTextSubDistrict,
            textRight: dataFromAPI?.body?.profileAddressInfo?.subdistrict??"-",
          onChange: (value) {
            subDistrictValue = value;
            if (kDebugMode) {
              print(subDistrictValue);
            }
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textdistrict??profileTextDistrict,
            textRight: dataFromAPI?.body?.profileAddressInfo?.district??"-",
          onChange: (value) {
            districtValue = value;
            if (kDebugMode) {
              print(districtValue);
            }
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textprovince??profileTextProvince,
            textRight: dataFromAPI?.body?.profileAddressInfo?.province??"-",
          onChange: (value) {
            provinceValue = value;
            if (kDebugMode) {
              print(provinceValue);
            }
          },),
        ProfileAddressDataTab(
            isUnpressed: isUnpressed,
            textLeft: dataFromAPI?.body?.screeninfo?.textpostcode??profileTextPostcode,
            textRight: dataFromAPI?.body?.profileAddressInfo?.zipcode??"-",
          onChange: (value) {
            zipcodeValue = value;
            if (kDebugMode) {
              print(zipcodeValue);
            }
          },),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class ProfileAddressDataTab extends StatefulWidget {
  final String textLeft;
  final String textRight;
  final bool isUnpressed;
  final ValueChanged<String>? onChange;
  const ProfileAddressDataTab(
      {Key? key,
      required this.textLeft,
      required this.textRight,
      required this.isUnpressed,
        this.onChange})
      : super(key: key);

  @override
  State<ProfileAddressDataTab> createState() => _ProfileAddressDataTabState();
}

class _ProfileAddressDataTabState extends State<ProfileAddressDataTab> {
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
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: widget.onChange,
                initialValue: textRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
