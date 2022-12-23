
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../customs/dialog/dialog_widget.dart';
import '../../../../../customs/message/text_button.dart';
import '../../../../../customs/message/text_error.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../utils/shared_preferences.dart';
import '../../customs/button/button_custom.dart';
import '../../customs/size/size.dart';
import '../../customs/text_file/build_textformfiled_unlimit_custom.dart';
import '../../module/login/screen/login_screen/login_screen.dart';
import '../bloc_resume/resume_bloc.dart';
import '../examples/content_design_resume_edit.dart';
import '../model/response/get_address_resume_response.dart';
import '../model/response/get_district_list_address_resume_response.dart';
import '../model/response/get_province_address_resume_response.dart';
import '../model/response/get_sub_district_list_address_resume_response.dart';
import '../model/response/get_zip_code_address_resume_response.dart';

class EditAddressResumeScreen extends StatelessWidget {
  const EditAddressResumeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            ResumeBloc()..add(GetEditScreenAddressResumeEvent()),
        // child: const GenerativeWidget());
        child:  const EditAddressResumePage());
  }
}

class EditAddressResumePage extends StatefulWidget {
  const EditAddressResumePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditAddressResumePage> createState() => _EditAddressResumePageState();
}

class _EditAddressResumePageState extends State<EditAddressResumePage>
    with ProgressDialog {
  late String valueLanguage;
  late SharedPreferences prefs;
  late String textSessionExpired;
  late String textSubSessionExpired;
  late String _buttonOk;

  late int searchStatus;
  late int isSearchStatus;
  late String provinceName;
  late String districtName;
  late String subDistrictName;
  late String getZipCode;
  late String districtID;
  late String provinceID;
  late String subDistrictID;
   late GetAddressResumeResponse isGetAddressResumeResponse;
   late GetProvinceAddressResumeResponse   isGetProvinceAddressResumeResponse;
   late GetDistrictListAddressResumeResponse   isGetDistrictListAddressResumeResponse;
   late GetSubDistrictListAddressResumeResponse   isGetSubDistrictListAddressResumeResponse;
   late GetZipCodeAddressResumeResponse   isGetZipCodeAddressResumeResponse;

  TextEditingController houseControllerTHEN = TextEditingController();
  TextEditingController mooControllerTHEN = TextEditingController();
  TextEditingController soiControllerEN = TextEditingController();
  TextEditingController soiControllerTH = TextEditingController();
  TextEditingController roadControllerTH = TextEditingController();
  TextEditingController roadControllerEN= TextEditingController();
  TextEditingController subDistrictControllerTH = TextEditingController();
  TextEditingController subDistrictControllerEN = TextEditingController();
  TextEditingController districtControllerEN = TextEditingController();
  TextEditingController districtControllerTH = TextEditingController();
  TextEditingController zipCodeControllerTH = TextEditingController();
  late List<ContentAddress> addressProvinceList = [];
  late List<ContentAddress> addressDistrictList = [];
  late List<ContentAddress> addressSubDistrictList = [];
  @override
  void initState() {
    valueLanguage = "TH";
    getUserLanguage();
    _isSessionUnauthorized();
    searchStatus = 0;
    isSearchStatus = 0;
    provinceName ='';
    districtName ='';
    subDistrictName ='';
    getZipCode ='';
    subDistrictID='';
    districtID ='';
    provinceID = '';
    context.read<ResumeBloc>().add(GetEditScreenAddressResumeEvent());
    super.initState();
  }

  getUserLanguage() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
  }

  Future<void> _isSessionUnauthorized() async {
    prefs = await SharedPreferences.getInstance();
    valueLanguage = prefs.getString('userLanguage') ?? 'TH';
    textSessionExpired =
        valueLanguage == 'EN' ? textUnauthorizedEN : textUnauthorizedTH;
    textSubSessionExpired =
        valueLanguage == 'EN' ? textSubUnauthorizedEN : textSubUnauthorizedTH;
    _buttonOk = valueLanguage == 'EN' ? buttonOkEN : buttonOkTH;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResumeBloc, ResumeState>(
      listener: (context, state) {
        if (state is GetEditScreenAddressResumeSuccessState) {

          setState(() {
            isGetAddressResumeResponse =
              state.isGetAddressResumeResponse;
          isGetProvinceAddressResumeResponse =
              state.isGetProvinceAddressResumeResponse;
             subDistrictID=isGetAddressResumeResponse.body?.data?.subdistrictId??'';
            districtID=isGetAddressResumeResponse.body?.data?.districtId??'';
            provinceID=isGetAddressResumeResponse.body?.data?.provinceId??'';
            addressDistrictList.clear();
            addressSubDistrictList.clear();
            provinceName ="${isGetAddressResumeResponse.body?.data?.provinceTh??''}/${isGetAddressResumeResponse.body?.data?.provinceEn??''}" ;
            districtName ="${isGetAddressResumeResponse.body?.data?.districtTh??''}/${isGetAddressResumeResponse.body?.data?.districtEn??''}" ;
            subDistrictName ="${isGetAddressResumeResponse.body?.data?.subdistrictTh??''}/${isGetAddressResumeResponse.body?.data?.subdistrictEn??''}" ;
            getZipCode =isGetAddressResumeResponse.body?.data?.zipcode??'' ;
            isGetProvinceAddressResumeResponse.body?.provincelist?.forEach((element) {
              addressProvinceList.add(
                  ContentAddress(addressID: element.provinceid ?? 0,  contentTH: element.provincenameth ?? '', contentEN: element.provincenameen ?? ''));
            });

            isGetAddressResumeResponse.body?.districtlist?.forEach((element) {
              addressDistrictList.add(
                  ContentAddress(addressID: element.districtid ?? 0,  contentTH: element.districtnameth ?? '', contentEN: element.districtnameen ?? ''));
            });


            isGetAddressResumeResponse.body?.tambonlist?.forEach((element) {
              addressSubDistrictList.add(
                  ContentAddress(addressID: element.tambonid ?? 0,  contentTH: element.tambonnameth ?? '', contentEN: element.tambonnameen ?? ''));
            });

          });
        }
        if (state is SentEditAddressResumeSuccessState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ContentDesignResumeEditScreen()));
        }
        if (state is ResumeLoading) {
          showProgressDialog(context);
        }
        if (state is ResumeEndLoading) {
          hideProgressDialog(context);
        }
        if (state is ResumeError) {
          if (state.errorMessage.toString() == 'Unauthorized') {
            dialogSessionExpiredOneBtn(
                context, textSessionExpired, textSubSessionExpired, _buttonOk,
                onClickBtn: () {
              cleanDelete();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()));
            });
          } else {
            dialogOneLineOneBtn(context, '${state.errorMessage}\n ', _buttonOk,
                onClickBtn: () {
              Navigator.of(context).pop();
            });
          }

          // show dialog error
          if (kDebugMode) {
            print(state.errorMessage);
          }
        }

        if (state is GetEditScreenDistrictAddressResumeSuccessState) {
          isGetDistrictListAddressResumeResponse =
              state.isGetDistrictListAddressResumeResponse;
          print(jsonEncode(isGetDistrictListAddressResumeResponse));

          setState(() {
            isGetDistrictListAddressResumeResponse =
                state.isGetDistrictListAddressResumeResponse;
            isGetDistrictListAddressResumeResponse.body?.districtlist?.forEach((element) {
              addressDistrictList.add(
                  ContentAddress(addressID: element.districtid ?? 0,  contentTH: element.districtnameth ?? '', contentEN: element.districtnameen ?? ''));
            });

          });

        }
        if (state is GetEditScreenSubDistrictAddressResumeSuccessState) {
          isGetSubDistrictListAddressResumeResponse =
              state.isGetSubDistrictListAddressResumeResponse;
          print(jsonEncode(isGetSubDistrictListAddressResumeResponse));

          setState(() {
            isGetSubDistrictListAddressResumeResponse =
                state.isGetSubDistrictListAddressResumeResponse;
            isGetSubDistrictListAddressResumeResponse.body?.tambonlist?.forEach((element) {
              addressSubDistrictList.add(
                  ContentAddress(addressID: element.tambonid ?? 0,  contentTH: element.tambonnameth ?? '', contentEN: element.tambonnameen ?? ''));
            });

          });

        }
        if (state is GetEditScreenZipCodeAddressResumeSuccessState) {
          isGetZipCodeAddressResumeResponse =
              state.isGetZipCodeAddressResumeResponse;
          print(jsonEncode(isGetZipCodeAddressResumeResponse));

          setState(() {
            isGetZipCodeAddressResumeResponse =
                state.isGetZipCodeAddressResumeResponse;
            getZipCode =isGetZipCodeAddressResumeResponse.body?.zipcode??'';
            zipCodeControllerTH.text  =isGetZipCodeAddressResumeResponse.body?.zipcode??'';

          });

        }
      },
      builder: (context, state) {
        if (state is GetEditScreenAddressResumeSuccessState)
        {isGetAddressResumeResponse =
            state.isGetAddressResumeResponse;
        isGetProvinceAddressResumeResponse =
            state.isGetProvinceAddressResumeResponse;

        String? textEditInfo=
            isGetAddressResumeResponse.body?.screeninfo?.editinfomations;
        String? textSave =
            isGetAddressResumeResponse.body?.screeninfo?.save;
        String? textHouse =isGetAddressResumeResponse.body?.screeninfo?.number ??'บ้านเลขที่ / House no.';
        String? textMoo =isGetAddressResumeResponse.body?.screeninfo?.moo ??'หมู่ / Moo.';
        String? textSoiTh =isGetAddressResumeResponse.body?.screeninfo?.soiTh ??'ซอย';
        String? textSoiEn =isGetAddressResumeResponse.body?.screeninfo?.soiEn ??'Soi';
        String? textZipCode =isGetAddressResumeResponse.body?.screeninfo?.zipcode ??'รหัสไปรษณีย์ / Zip Code"';
        String? textRoadTh =isGetAddressResumeResponse.body?.screeninfo?.roadTh ??'Soi';
        String? textRoadEn =isGetAddressResumeResponse.body?.screeninfo?.roadEn ??'Soi';
        String? textSubDistrictTh = isGetAddressResumeResponse.body?.screeninfo?.subdistrictTh??'ตำบล';
        String? textSubDistrictEn =isGetAddressResumeResponse.body?.screeninfo?.subdistrictEn??'SubDistrict';
        String? textDistrictTh =isGetAddressResumeResponse.body?.screeninfo?.districtTh??'อำเภอ';
        String? textDistrictEn =isGetAddressResumeResponse.body?.screeninfo?.districtEn??'District';
        String? textProvinceTh = isGetAddressResumeResponse.body?.screeninfo?.provinceTh??'จังหวัด';
        String? textProvinceEn =isGetAddressResumeResponse.body?.screeninfo?.provinceEn??'Province' ;
        String? house = isGetAddressResumeResponse.body?.data?.number;
        String? moo = isGetAddressResumeResponse.body?.data?.moo;
        String? soiTh = isGetAddressResumeResponse.body?.data?.soiTh;
        String? soiEn = isGetAddressResumeResponse.body?.data?.soiEn;
        String? roadTh = isGetAddressResumeResponse.body?.data?.roadTh;
        String? roadEn = isGetAddressResumeResponse.body?.data?.roadEn;
        String? subDistrictTh = isGetAddressResumeResponse.body?.data?.subdistrictTh;
        String? subDistrictEn = isGetAddressResumeResponse.body?.data?.subdistrictEn;
        String? districtTh = isGetAddressResumeResponse.body?.data?.districtTh;
        String? districtEn = isGetAddressResumeResponse.body?.data?.districtEn;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: sizeTitle24,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
              title: Text(textEditInfo ??
                  '',
                  style: TextStyle(
                    // color: Colors.black,
                    fontSize: sizeTitle24,
                    color: Theme.of(context).appBarTheme.foregroundColor,
                  )),
            ),
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: houseControllerTHEN,
                        onChanged: (houseValueControllerTH) {
                          setState(() {
                            houseControllerTHEN.text = houseValueControllerTH;
                          });
                          if (kDebugMode) {
                            print(houseControllerTHEN.text);
                          }
                        },
                        hintLabel: textHouse,
                        initialvalue: house,
                        textInputType: TextInputType.number,
                      ),

                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: mooControllerTHEN,
                        onChanged: (mooValueControllerTH) {
                          setState(() {
                            mooControllerTHEN.text = mooValueControllerTH;
                          });
                          if (kDebugMode) {
                            print(mooControllerTHEN.text);
                          }
                        },
                        hintLabel: textMoo,
                        initialvalue: moo,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: soiControllerTH,
                        onChanged: (soiValueControllerTH) {
                          setState(() {
                            soiControllerTH.text = soiValueControllerTH;
                          });
                          if (kDebugMode) {
                            print(soiControllerTH.text);
                          }
                        },
                        hintLabel: textSoiTh,
                        initialvalue: soiTh,
                        textInputType: TextInputType.text,
                      ),

                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: soiControllerEN,
                        onChanged: (soiValueControllerEN) {
                          setState(() {
                            soiControllerEN.text = soiValueControllerEN;
                          });
                          if (kDebugMode) {
                            print(soiControllerEN.text);
                          }
                        },
                        hintLabel: textSoiEn,
                        initialvalue: soiEn,
                        textInputType: TextInputType.text,
                      ),
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: roadControllerTH,
                        onChanged: (roadValueControllerTH) {
                          setState(() {
                            roadControllerTH.text = roadValueControllerTH;
                          });
                          if (kDebugMode) {
                            print(roadControllerTH.text);
                          }
                        },
                        hintLabel: textRoadTh,
                        initialvalue: roadTh,
                        textInputType: TextInputType.text,
                      ),

                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: roadControllerEN,
                        onChanged: (roadValueControllerEN) {
                          setState(() {
                            roadControllerEN.text = roadValueControllerEN;
                          });
                          if (kDebugMode) {
                            print(roadControllerEN.text);
                          }
                        },
                        hintLabel: textRoadEn,
                        initialvalue: roadEn,
                        textInputType: TextInputType.text,
                      ),
                      PopupMenuButton(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 15, 10,0),
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                      right: 5, left: 15, top: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Theme.of(context).primaryColor ==
                                        Colors.black
                                        ? Color(0xFF1F222A)
                                        : Colors.transparent.withOpacity(0.03),
                                  ),
                                  child: Text(
                                    provinceName == ''
                                        ?  "โปรดเลือก จังหวัด":provinceName,
                                    maxLines: 3,
                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),),
                                Positioned(
                                  top: 0,
                                  left: 15,
                                  child: Text(
                                    "$textProvinceTh/$textProvinceEn *",
                                  
                                  style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .appBarTheme
                                          .foregroundColor),
                                  ),)
                              ],
                            )
                          ),
                        ),
                        itemBuilder: (context) {
                          return List.generate(addressProvinceList.length??0,
                                  (index) {
                                return PopupMenuItem(
                                  value: index ,
                                  child: Text('${addressProvinceList[index].contentTH} / ${addressProvinceList[index].contentEN}',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                );
                              });
                        },
                        onSelected: (value) {
                          provinceName ='${addressProvinceList[value].contentTH} / ${addressProvinceList[value].contentEN}';
                          setState(() {
                            addressDistrictList.clear();
                            districtName = '';
                            addressSubDistrictList.clear();
                            subDistrictName ='';
                            getZipCode ='';

                            subDistrictID='';
                            districtID ='';
                            provinceID = addressProvinceList[value].addressID.toString();
                            context.read<ResumeBloc>().add(GetEditScreenDistrictAddressResumeEvent(provinceId: addressProvinceList[value].addressID.toString()?? '-'));
                            provinceName ='${addressProvinceList[value].contentTH} / ${addressProvinceList[value].contentEN}';

                          });
                        },
                      ),
                     if( addressDistrictList.isNotEmpty)
                      PopupMenuButton(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10,0),
                            child:
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                      right: 5, left: 15, top: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Theme.of(context).primaryColor ==
                                        Colors.black
                                        ? Color(0xFF1F222A)
                                        : Colors.transparent.withOpacity(0.03),
                                  ),
                                  child: Text(
                                    districtName == ''
                                        ?  "โปรดเลือก อำเภอ": districtName,
                                    maxLines: 3,
                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),),
                                Positioned(
                                  top: 0,
                                  left: 15,
                                  child: Text(
                                    "$textDistrictTh/$textDistrictEn *",

                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        itemBuilder: (context) {
                          return List.generate(addressDistrictList.length??0,
                                  (index) {
                                return PopupMenuItem(
                                  value: index ,
                                  child: Text('${addressDistrictList[index].contentTH} / ${addressDistrictList[index].contentEN}',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                );
                              });
                        },
                        onSelected: (value) {
                          districtName ='${addressDistrictList[value].contentTH} / ${addressDistrictList[value].contentEN}';
                          setState(() {
                            addressSubDistrictList.clear();
                            subDistrictName ='';
                            getZipCode ='';
                            subDistrictID='';
                            districtID =addressDistrictList[value].addressID.toString();
                            context.read<ResumeBloc>().add(GetEditScreenTamBonAddressResumeEvent(tamBonId: addressDistrictList[value].addressID.toString()?? '-'));
                            districtName ='${addressDistrictList[value].contentTH} / ${addressDistrictList[value].contentEN}';

                          });
                        },
                      ),
                     if( addressSubDistrictList.isNotEmpty)
                      PopupMenuButton(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10,0),
                            child:
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                      right: 5, left: 15, top: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Theme.of(context).primaryColor ==
                                        Colors.black
                                        ? Color(0xFF1F222A)
                                        : Colors.transparent.withOpacity(0.03),
                                  ),
                                  child: Text(
                                    subDistrictName == ''
                                        ?  "โปรดเลือก ตำบล": subDistrictName,
                                    maxLines: 3,
                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),),
                                Positioned(
                                  top: 0,
                                  left: 15,
                                  child: Text(
                                    "$textSubDistrictTh/$textSubDistrictEn*",

                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        itemBuilder: (context) {
                          return List.generate(addressSubDistrictList.length??0,
                                  (index) {
                                return PopupMenuItem(
                                  value: index ,
                                  child: Text('${addressSubDistrictList[index].contentTH} / ${addressSubDistrictList[index].contentEN}',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor),
                                  ),
                                );
                              });
                        },
                        onSelected: (value) {
                          subDistrictName ='${addressSubDistrictList[value].contentTH} / ${addressSubDistrictList[value].contentEN}';
                          setState(() {

                            getZipCode ='';
                            subDistrictID=addressSubDistrictList[value].addressID.toString();
                            context.read<ResumeBloc>().add(GetEditScreenZipCodeAddressResumeEvent(subDistrictID: addressSubDistrictList[value].addressID.toString()));
                            subDistrictName ='${addressSubDistrictList[value].contentTH} / ${addressSubDistrictList[value].contentEN}';

                          });
                        },
                      ),
                      if( getZipCode.isNotEmpty)
                      BuildTextFormFieldUnLimitCustomNotIconsNotContainer(
                        textEditingController: zipCodeControllerTH,
                        onChanged: (zipCodeVControllerTH) {
                          setState(() {
                            zipCodeControllerTH.text = zipCodeVControllerTH;
                          });
                          if (kDebugMode) {
                            print(zipCodeControllerTH.text);
                          }
                        },
                        hintLabel: textZipCode,
                        initialvalue: getZipCode,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Container(

                            width:MediaQuery.of(context).size.width-50,
                            child: ButtonIconsCustomLimit(
                              label:
                              isGetAddressResumeResponse.body?.screeninfo?.save??"บันทึก",
                              buttonIcons: Icon(
                                FontAwesomeIcons.paperPlane,
                                color: Theme.of(context).iconTheme.color,
                                size: 20.0,
                              ),
                              colortext: Theme.of(context).bottomAppBarColor,
                              colorbutton:
                              Theme.of(context).scaffoldBackgroundColor,
                              sizetext: 14,
                              colorborder: Theme.of(context).bottomAppBarColor.withOpacity(0.65),
                              sizeborder: 3,
                              onPressed: () {
                                context.read<ResumeBloc>().add(SendEditAddressResumeEvent(
                                    house: (houseControllerTHEN.text == ''
                                        ? house
                                        : houseControllerTHEN.text) ??
                                        '',
                                    moo:  (mooControllerTHEN.text == ''
                                        ? moo
                                        : mooControllerTHEN.text) ??
                                        '',
                                    soiTH:  (soiControllerTH.text == ''
                                        ? soiTh
                                        : soiControllerTH.text) ??
                                        '',
                                    soiEN:   (soiControllerEN.text == ''
                                        ? soiEn
                                        : soiControllerEN.text) ??
                                        '',
                                    roadTH:   (roadControllerTH.text == ''
                                        ? roadTh
                                        : roadControllerTH.text) ??
                                        '',
                                    roadEN: (roadControllerEN.text == ''
                                        ? roadEn
                                        : roadControllerEN.text) ??
                                        '',
                                    subDistrictID: subDistrictID,
                                    districtID: districtID,
                                    provinceID: provinceID,
                                    zipcode:(zipCodeControllerTH.text == ''
                                        ? getZipCode
                                        : zipCodeControllerTH.text) ??
                                        '',

                                ));
                              },
                            ),
                          )
                          ,

                        ],
                      ),

                      const SizedBox(
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          );
        }

        return Container();
      },
      buildWhen: (context, state) {
        return state is GetEditScreenAddressResumeSuccessState ;
      },
    );
  }
}

class ContentAddress {
  int addressID;
  String contentTH;
  String contentEN;

  ContentAddress({
    required this.addressID,
    required this.contentTH,
    required this.contentEN,
  });
  Map<String, dynamic> toJson() => {"address_id": addressID, "content_th": contentTH, "content_en": contentEN};
}
