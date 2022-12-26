import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdf/pdf.dart';

import '../../customs/color/color_const.dart';
import '../../customs/color/pdf_color_const.dart';
import '../../customs/size/size.dart';
import '../app.dart';
import '../bloc_resume/resume_bloc.dart';
import '../examples/content_design_resume_color.dart';
import '../model/response/pre_view_resume_response.dart';
import '../screen_resume/edit_certificate_resume_screen.dart';
import '../screen_resume/edit_education_resume_screen.dart';
import '../screen_resume/edit_experience_resume_screen.dart';
import '../screen_resume/edit_position_resume_screen.dart';

class OnSelect {
  int id;
  bool onselect;

  OnSelect({
    required this.id,
    required this.onselect,
  });
  Map<String, dynamic> toJson() => {"id": id, "onselect": onselect};
}

floatingGeneratePDFAndSaveData(
  setState,
  String pdf,
  String save, {
  required BuildContext context,
  required PdfColor colorOfPdfUsTheme,
  required PdfColor colorOfPdfUsButtonTitle,
  required PdfColor colorOfPdfUsName,
  required PdfColor colorOfPdfUsPosition,
  required PdfColor colorOfPdfUsExperience,
  required PdfColor colorOfPdfUsEducations,
  required PdfColor colorOfPdfUsContact,
  required PdfColor colorOfPdfUsCertifications,
  required PdfColor colorOfPdfUsSkills,
  required PdfColor colorOfPdfUsAbout,
  required PdfColor colorOfPdfUsText,
  required double widthSizeCM,
  required double heightSizeCM,
  required isPreViewResumeResponse,
  required List<OnSelect> positionOnSelect,
  required List<OnSelect> educationHSCOnSelect,
  required List<OnSelect> educationBDOnSelect,
  required List<OnSelect> educationMDOnSelect,
  required List<OnSelect> educationDDOnSelect,
  required List<OnSelect> educationHDDOnSelect,
  required List<OnSelect> socialOnSelect,
  required List<OnSelect> addressOnSelect,
  required List<OnSelect> experienceOnSelect,
  required List<OnSelect> certificateOnSelect,
  required List<OnSelect> skillOnSelect,
  required List<OnSelect> languageOnSelect, required SendOnSelectColorListResume sendOnSelectColorSet,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      FloatingActionButton.extended(

        heroTag: "btn1",
        backgroundColor:
            Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyAppResume(
                        colorOfPdfUsButtonTitle: colorOfPdfUsButtonTitle,
                        colorOfPdfUsName: colorOfPdfUsName,
                        colorOfPdfUsPosition: colorOfPdfUsPosition,
                        colorOfPdfUsExperience: colorOfPdfUsExperience,
                        colorOfPdfUsEducations: colorOfPdfUsEducations,
                        colorOfPdfUsContact: colorOfPdfUsContact,
                        colorOfPdfUsCertifications: colorOfPdfUsCertifications,
                        colorOfPdfUsSkills: colorOfPdfUsSkills,
                        colorOfPdfUsAbout: colorOfPdfUsAbout,
                        colorOfPdfUsText: colorOfPdfUsText,
                        colorOfPdfUsTheme: colorOfPdfUsTheme,
                        widthSizeCM: widthSizeCM,
                        heightSizeCM: heightSizeCM,
                        isPreViewResumeResponse: isPreViewResumeResponse,
                      )));
        },
        icon: Icon(
          FontAwesomeIcons.filePdf,
          color: Theme.of(context).iconTheme.color,
          size: 20.0,
        ),
        label: Text('   ${pdf ?? 'PDF'}',
            style: TextStyle(
              fontSize: sizeTextSmaller14,
              color: Theme.of(context).iconTheme.color,
            )),
      ),
      FloatingActionButton.extended(

        heroTag: "btn2",
        backgroundColor:
            Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
        foregroundColor: Colors.black,
        onPressed: () {
          context.read<ResumeBloc>().add(SetOnSelectedAndPreviewResumeEvent(
                positionOnSelect: positionOnSelect,
                educationHSCOnSelect: educationHSCOnSelect,
                educationBDOnSelect: educationBDOnSelect,
                educationMDOnSelect: educationMDOnSelect,
                educationDDOnSelect: educationDDOnSelect,
                educationHDDOnSelect: educationHDDOnSelect,
                socialOnSelect: socialOnSelect,
                addressOnSelect: addressOnSelect,
                experienceOnSelect: experienceOnSelect,
                certificateOnSelect: certificateOnSelect,
                skillOnSelect: skillOnSelect,
                languageOnSelect: languageOnSelect,
              sendOnSelectColorSet:sendOnSelectColorSet,
              ));
        },
        icon: Icon(
          FontAwesomeIcons.paperPlane,
          color: tcButtonGreen.withOpacity(0.8),
          size: 20.0,
        ),
        label: Text('   $save',
            style: TextStyle(
              fontSize: sizeTextSmaller14,
              color: Theme.of(context).iconTheme.color,
            )),
      ),
    ],
  );
}

floatingGoToSetThemePDF(
    setState,
    String pdf, {
      required BuildContext context,
    }) {
  return FloatingActionButton.extended(
    backgroundColor:
    Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.9),
    foregroundColor: Colors.black,
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ContentDesignResumeScreenColor()));
    },
    icon: Icon(
      FontAwesomeIcons.barsStaggered,
      color: Theme.of(context).iconTheme.color,
      size: 20.0,
    ),
    label: Text('   ${pdf ?? 'PDF'}',
        style: TextStyle(
          fontSize: sizeTextSmaller14,
          color: Theme.of(context).iconTheme.color,
        )),
  );
}
class SelectSizeImageResume {
  double sizePhoto;
  double widthSizeCM;
  double heightSizeCM;

  SelectSizeImageResume(
    this.sizePhoto,
    this.widthSizeCM,
    this.heightSizeCM,
  );
}

List<SelectSizeImageResume> sizeImageResume = [
  //(sizePhoto,widthSizeCM,heightSizeCM)
  SelectSizeImageResume(1, 2.50, 3.25),
  SelectSizeImageResume(1.5, 3.00, 4.00),
  SelectSizeImageResume(2, 4.00, 5.23),
  SelectSizeImageResume(2.5, 4.75, 6.25),
  SelectSizeImageResume(3, 6.15, 7.80),
];
buildDetailResumeCustomNotIconsReadOnly(
    {required BuildContext context,
    required String detail,
    required Color appBarForeGroundColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      color: Theme.of(context).primaryColor == Colors.black
          ? Color(0xFF1F222A)
          : Colors.transparent.withOpacity(0.03),
    ),
    child: Text(
      detail,
      style: TextStyle(
        fontSize: 12,
        color: appBarForeGroundColor, // height: 2.0,
      ),
    ),
  );
}

buildDetailResumeCheckboxCustomNotIconsReadOnly(
    {required BuildContext context,
    required String detail,
    required Color appBarForeGroundColor,
    required Checkbox checkbox}) {
  return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(5),
      padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Theme.of(context).primaryColor == Colors.black
            ? Color(0xFF1F222A)
            : Colors.transparent.withOpacity(0.03),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Text(
            detail,
            style: TextStyle(
              fontSize: 12,
              color: appBarForeGroundColor, // height: 2.0,
            ),
          )),
          checkbox,
        ],
      ));
}

buildPositionOnSelectCard(
    {
      required String showAll,
      required String showSome,
      required String activityNot,
      required BuildContext context,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required Color Function(Set<MaterialState> states) getColor,
    required onChangedSetState,
    required List<OnSelect> positionOnSelect,
    required List<Position> positionData,
      required bool boolClick,
      required Null Function() onTap}) {

  int length = positionData.length ?? 0;
  return Column(
    children: [
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
                  (index) {
                return Stack(
                  children: [
                    buildDetailResumeCheckboxCustomNotIconsReadOnly(
                        context: context,
                        detail: positionData[index].position ?? "",
                        appBarForeGroundColor: appBarForegroundColor,
                        checkbox: Checkbox(
                          checkColor: Theme.of(context).primaryColor,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: positionOnSelect[index].onselect,
                          onChanged: (bool? value) {
                            positionOnSelect[index].onselect = value!;
                            onChangedSetState();
                            print(value);
                            print(!value);
                            print(positionOnSelect[index].onselect.toString());
                            print(positionOnSelect[index]);
                            print(jsonEncode(positionOnSelect[index]));
                            print(jsonEncode(positionOnSelect));
                          },
                        )),
                    Positioned(
                        left: -5,
                        top: -5,
                        child: Card(
                          elevation: 0,
                          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: SizedBox(
                              width: 30.0,
                              child: Center(
                                child: Text(
                                  positionData[index].orderchoose.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor, // height: 2.0,
                                  ),
                                ),
                              )),
                        ))
                  ],
                );
              })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              boolClick == false
                  ?showAll
                  : showSome,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor),
            ),
          ),
        ),
      if (positionData.isEmpty)

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            // editInFormations ??
            ">> $activityNot <<",
            style: TextStyle(
              // decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
    ],
  );
}


buildExperienceOnSelectCard(
    {
      required String showAll,
      required String showSome,
      required String activityNot,
      required BuildContext context,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required Color Function(Set<MaterialState> states) getColor,
    required onChangedSetState,
    required List<OnSelect> experienceOnSelect,
    required experienceData,
    required bool boolClick,
      required Null Function() onTap}) {

  int length = experienceData.length ?? 0;
  return Column(
    children: [

      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
                  (index) {
                return Stack(
                  children: [
                    buildDetailResumeCheckboxCustomNotIconsReadOnly(
                        context: context,
                        detail: experienceData[index].position ?? "",
                        appBarForeGroundColor: appBarForegroundColor,
                        checkbox: Checkbox(
                          checkColor: Theme.of(context).primaryColor,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: experienceOnSelect[index].onselect,
                          onChanged: (bool? value) {
                            experienceOnSelect[index].onselect = value!;
                            onChangedSetState();
                            print(value);
                            print(!value);
                            print(experienceOnSelect[index].onselect.toString());
                            print(experienceOnSelect[index]);
                            print(jsonEncode(experienceOnSelect[index]));
                            print(jsonEncode(experienceOnSelect));
                          },
                        )),
                    Positioned(
                        left: -5,
                        top: -5,
                        child: Card(
                          elevation: 0,
                          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: SizedBox(
                              width: 30.0,
                              child: Center(
                                child: Text(
                                  experienceData[index].orderchoose.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor, // height: 2.0,
                                  ),
                                ),
                              )),
                        ))
                  ],
                );
              })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              boolClick == false
                  ?showAll
                  : showSome,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor),
            ),
          ),
        ),
      if (experienceData.isEmpty)


        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            // editInFormations ??
            ">> $activityNot <<",
            style: TextStyle(
              // decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
    ],
  );
}


buildCertificateOnSelectCard(
    {
      required String showAll,
      required String showSome,
      required String activityNot,
      required BuildContext context,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required Color Function(Set<MaterialState> states) getColor,
    required onChangedSetState,
    required List<OnSelect> certificateOnSelect,
    required certificateData,
      required bool boolClick,
      required Null Function() onTap}) {

  int length = certificateData.length ?? 0;
  return Column(
    children: [
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
                  (index) {
                return Stack(
                  children: [
                    buildDetailResumeCheckboxCustomNotIconsReadOnly(
                        context: context,
                        detail: certificateData[index].title ?? "",
                        appBarForeGroundColor: appBarForegroundColor,
                        checkbox: Checkbox(
                          checkColor: Theme.of(context).primaryColor,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: certificateOnSelect[index].onselect,
                          onChanged: (bool? value) {
                            certificateOnSelect[index].onselect = value!;
                            onChangedSetState();
                            print(value);
                            print(!value);
                            print(certificateOnSelect[index].onselect.toString());
                            print(certificateOnSelect[index]);
                            print(jsonEncode(certificateOnSelect[index]));
                            print(jsonEncode(certificateOnSelect));
                          },
                        )),
                    Positioned(
                        left: -5,
                        top: -5,
                        child: Card(
                          elevation: 0,
                          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: SizedBox(
                              width: 30.0,
                              child: Center(
                                child: Text(
                                  certificateData[index].orderchoose.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor, // height: 2.0,
                                  ),
                                ),
                              )),
                        ))
                  ],
                );
              })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              boolClick == false
                  ?showAll
                  : showSome,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor),
            ),
          ),
        ),
      if (certificateData.isEmpty)


        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            // editInFormations ??
            ">> $activityNot <<",
            style: TextStyle(
              // decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
    ],
  );
}


buildLanguageOnSelectCard(
    {

      required String showAll,
      required String showSome,
      required String activityNot,
      required BuildContext context,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required Color Function(Set<MaterialState> states) getColor,
    required onChangedSetState,
    required List<OnSelect> languageOnSelect,
    required languageData,
      required bool boolClick,
      required Null Function() onTap}) {

  int length = languageData.length ?? 0;
  return Column(
    children: [
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
                  (index) {
                return Stack(
                  children: [
                    buildDetailResumeCheckboxCustomNotIconsReadOnly(
                        context: context,
                        detail: languageData[index].language ?? "",
                        appBarForeGroundColor: appBarForegroundColor,
                        checkbox: Checkbox(
                          checkColor: Theme.of(context).primaryColor,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: languageOnSelect[index].onselect,
                          onChanged: (bool? value) {
                            languageOnSelect[index].onselect = value!;
                            onChangedSetState();
                            print(value);
                            print(!value);
                            print(languageOnSelect[index].onselect.toString());
                            print(languageOnSelect[index]);
                            print(jsonEncode(languageOnSelect[index]));
                            print(jsonEncode(languageOnSelect));
                          },
                        )),
                    Positioned(
                        left: -5,
                        top: -5,
                        child: Card(
                          elevation: 0,
                          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: SizedBox(
                              width: 30.0,
                              child: Center(
                                child: Text(
                                  languageData[index].orderchoose.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor, // height: 2.0,
                                  ),
                                ),
                              )),
                        ))
                  ],
                );
              })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              boolClick == false
                  ?
              // editInFormations ??
              "ดูเพิ่มเติม"
                  : "แสดงบางส่วน",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor),
            ),
          ),
        ),
      if (languageData.isEmpty)

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            // editInFormations ??
            ">> คุณยังไม่มีข้อมูลส่วนนี้ <<",
            style: TextStyle(
              // decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
    ],
  );
}

buildSkillOnSelectCard(
    {
      required String showAll,
      required String showSome,
      required String activityNot,
      required BuildContext context,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required Color Function(Set<MaterialState> states) getColor,
    required onChangedSetState,
    required List<OnSelect> skillOnSelect,
    required skillData,
    required bool boolClick,
      required Null Function() onTap}) {

  int length = skillData.length ?? 0;
  return Column(
    children: [
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
                  (index) {
                return Stack(
                  children: [
                    buildDetailResumeCheckboxCustomNotIconsReadOnly(
                        context: context,
                        detail: skillData[index].skill ?? "",
                        appBarForeGroundColor: appBarForegroundColor,
                        checkbox: Checkbox(
                          checkColor: Theme.of(context).primaryColor,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: skillOnSelect[index].onselect,
                          onChanged: (bool? value) {
                            skillOnSelect[index].onselect = value!;
                            onChangedSetState();
                            print(value);
                            print(!value);
                            print(skillOnSelect[index].onselect.toString());
                            print(skillOnSelect[index]);
                            print(jsonEncode(skillOnSelect[index]));
                            print(jsonEncode(skillOnSelect));
                          },
                        )),
                    Positioned(
                        left: -5,
                        top: -5,
                        child: Card(
                          elevation: 0,
                          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: SizedBox(
                              width: 30.0,
                              child: Center(
                                child: Text(
                                  skillData[index].orderchoose.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor, // height: 2.0,
                                  ),
                                ),
                              )),
                        ))
                  ],
                );
              })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              boolClick == false
                  ?showAll
                  : showSome,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor),
            ),
          ),
        ),
      if (skillData.isEmpty)


        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            // editInFormations ??
            ">> $activityNot <<",
            style: TextStyle(
              // decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
    ],
  );
}


buildEducationOnSelectCard({
  required String showAll,
  required String showSome,
  required String activityNot,
  required BuildContext context,
  required Color appBarForegroundColor,
  required String title,
  required Function() returnResumeEdit,
  required Color Function(Set<MaterialState> states) getColor,
  required onChangedSetState,
  required List<OnSelect> educationOnSelect,
  required educationData,
  required bool boolClick,
  required Null Function() onTap}) {

  int length = educationData.length ?? 0;
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(5),
        child: Text(title),
      ),

      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
                  (index) {
                return Stack(
                  children: [
                    buildDetailResumeCheckboxCustomNotIconsReadOnly(
                        context: context,
                        detail: educationData[index].placeofstudy.toString(),
                        appBarForeGroundColor: appBarForegroundColor,
                        checkbox: Checkbox(
                          checkColor: Theme.of(context).primaryColor,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: educationOnSelect[index].onselect,
                          onChanged: (bool? value) {
                            educationOnSelect[index].onselect = value!;
                            onChangedSetState();
                            print(value);
                            print(!value);
                            print(educationOnSelect[index].onselect.toString());
                            print(educationData[index]);
                            print(jsonEncode(educationData[index]));
                            print(jsonEncode(educationOnSelect));
                          },
                        )),
                    Positioned(
                        left: -5,
                        top: -5,
                        child: Card(
                          elevation: 0,
                          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
                          color: Theme.of(context).appBarTheme.foregroundColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: SizedBox(
                              width: 30.0,
                              child: Center(
                                child: Text(
                                  educationData[index].orderchoose.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor, // height: 2.0,
                                  ),
                                ),
                              )),
                        ))
                  ],
                );
              })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              boolClick == false
                  ?showAll
                  : showSome,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor),
            ),
          ),
        ),
      if (educationData.isEmpty)


        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            // editInFormations ??
            ">> $activityNot <<",
            style: TextStyle(
              // decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
    ],
  );
}


// List<OnSelect> positionOnSelect =[
//   OnSelect(id:1,select:true ),
//   OnSelect(id:2,select:false ),
//   OnSelect(id:3,select:true ),
//   OnSelect(id:4,select:true )];

buildTitleEditDataResume(
    {required String isPreViewResumeTitle,
    required BuildContext context,
    required String isPreViewResumeEditData,
    // required Color materialColorOfPdfUsTheme,
    required Null Function() ontap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(isPreViewResumeTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            isPreViewResumeEditData ?? "Edit Information",
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
      ],
    ),
  );
}
// class BuildTitleEditColorResume extends StatefulWidget {
//   final String isPreViewResumeTitle;
//   final BuildContext context;
//   final String isPreViewResumeEditData;
//   final Color materialColorOfPdfUsTheme;
//   final  PdfColor colorOfPdfUsTheme;
//   final  Function(int optionSearchResult) callbackFromOptionSearch;
//   final Null Function() ontap;
//   const BuildTitleEditColorResume({Key? key,
//     required this.isPreViewResumeTitle,
//     required this.context,
//     required this.isPreViewResumeEditData,
//     required this.materialColorOfPdfUsTheme,
//     required this.colorOfPdfUsTheme,
//     required this.callbackFromOptionSearch,
//     required this.ontap}) : super(key: key);
//
//   @override
//   State<BuildTitleEditColorResume> createState() => _BuildTitleEditColorResumeState();
// }
//
// late Color isColor;
// late PdfColor isPdfColor  ;
//
//
// class _BuildTitleEditColorResumeState extends State<BuildTitleEditColorResume> {
//   @override
//   void initState() {
//       isColor =  widget.materialColorOfPdfUsTheme ;
//      isPdfColor =   widget.colorOfPdfUsTheme ;
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 5, right: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(5.0),
//             child: Text(widget.isPreViewResumeTitle,
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Theme.of(context).appBarTheme.foregroundColor)),
//           ),
//           GestureDetector(
//               onTap: () async {
//                 await showMenu<int>(
//                     context: context,
//                     position: RelativeRect.fromLTRB(0, 0, 0, 0),
//                     items: List.generate(
//                         colorOfPdfList.length ?? 0, (index) {
//                       return PopupMenuItem(
//                         value: index,
//                         child: Text(
//                           colorOfPdfList[index].nameColor,
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: (colorOfPdfList[index]
//                                   .materialColor ==
//                                   Colors.black) ||
//                                   (colorOfPdfList[index]
//                                       .materialColor ==
//                                       Colors.white)
//                                   ? Theme.of(context)
//                                   .appBarTheme
//                                   .foregroundColor
//                                   : colorOfPdfList[index]
//                                   .materialColor),
//                         ),
//                         onTap: () {
//                           setState(() {
//                             widget.callbackFromOptionSearch(index);
//                             isColor =
//                                 colorOfPdfList[index]
//                                     .materialColor;
//                             // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
//                             //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
//                             // }
//                             isPdfColor =
//                                 colorOfPdfList[index]
//                                     .pdfOfColor;
//                           });
//
//
//                         },
//                       );
//                     }));
//               },
//               child: Container(
//                 color: (isColor ==
//                     Colors.black &&
//                     isColor ==
//                         Colors.black)
//                     ? Colors.white
//                     : (isColor ==
//                     Colors.white &&
//                     isColor ==
//                         Colors.white)
//                     ? Colors.black
//                     : Theme.of(context)
//                     .scaffoldBackgroundColor,
//                 child: Icon(FontAwesomeIcons.droplet,
//                     size: 20, color: isColor),
//               )),
//
//         ],
//       ),
//     );
//   }
// }

buildTitleEditColorResume({
  required String isPreViewResumeTitle,
  required BuildContext context,
  required Color materialColorOfPdfUsTheme,
  required PdfColor colorOfPdfUsTheme,
  required Function(int optionSearchResult) callbackFromOptionSearch,
}) {
  late Color isColor = materialColorOfPdfUsTheme;
  late PdfColor isPdfColor = colorOfPdfUsTheme;
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(isPreViewResumeTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        GestureDetector(
            onTap: () async {
              await showMenu<int>(
                  context: context,
                  position: RelativeRect.fromLTRB(0, 0, 0, 0),
                  items: List.generate(colorOfPdfList.length ?? 0, (index) {
                    return PopupMenuItem(
                      value: index,
                      child: Text(
                        colorOfPdfList[index].nameColor,
                        style: TextStyle(
                            fontSize: 20,
                            color: (colorOfPdfList[index].materialColor ==
                                        Colors.black) ||
                                    (colorOfPdfList[index].materialColor ==
                                        Colors.white)
                                ? Theme.of(context).appBarTheme.foregroundColor
                                : colorOfPdfList[index].materialColor),
                      ),
                      onTap: () {
                        callbackFromOptionSearch(index);
                        isColor = colorOfPdfList[index].materialColor;
                        // if(colorOfPdfList[index].materialColor ==Colors.black ||colorOfPdfList[index].materialColor ==Colors.white){
                        //   materialColorOfPdfUsAbout = Theme.of(context).appBarTheme.foregroundColor ??Colors.black;
                        // }
                        isPdfColor = colorOfPdfList[index].pdfOfColor;
                      },
                    );
                  }));
            },
            child: Container(
              color: (isColor == Colors.black && isColor == Colors.black)
                  ? Colors.white
                  : (isColor == Colors.white && isColor == Colors.white)
                      ? Colors.black
                      : Theme.of(context).scaffoldBackgroundColor,
              child: Icon(FontAwesomeIcons.droplet, size: 20, color: isColor),
            )),
      ],
    ),
  );
}

buildCardPositionEditResumeScreen(
    {required BuildContext context,
    required String editInFormations,
    required String title,
    required String type,
    required positionData,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required bool boolClick,
    // required int count,
    required Null Function() onTap}) {
  int length = positionData?.length ?? 0;
  return Column(
    children: [
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
              (index) {
        return Stack(
          children: [
            buildDetailResumeCustomNotIconsReadOnly(
                context: context,
                detail: positionData[index].position ?? "",
                appBarForeGroundColor: appBarForegroundColor),
            Positioned(
              // height: 0,
              // width: 0,
              // left: 0,
              right: MediaQuery.of(context).padding.right + 15,
              bottom: MediaQuery.of(context).padding.bottom + 15,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditPositionsResumeScreen(
                        id: positionData?[index].id ?? 0,
                      count: 10,);
                  })).then(
                    (value) => returnResumeEdit,
                  );
                },
                child: Text(
                  editInFormations ?? "Edit Information",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).appBarTheme.foregroundColor),
                ),
              ),
            )
          ],
        );
      })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Text(
            boolClick == false
                ?
                // editInFormations ??
                "ดูเพิ่มเติม"
                : "แสดงบางส่วน",
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const EditPositionsResumeScreen(id: 0, count: 10,);
            //
          })).then(
            (value) => returnResumeEdit,
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                .withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 20, //height of inner container
                width: MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                        .withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

buildExperienceCard(
    {required BuildContext context,
    required String editInFormations,
    required String title,
    required String type,
    required experienceData,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required bool boolClick,
    required Null Function() onTap}) {
  int length = experienceData?.length ?? 0;
  return Column(
    children: [
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
              (index) {
        return Stack(
          children: [
            buildDetailResumeCustomNotIconsReadOnly(
                context: context,
                detail:
                    "     ${experienceData[index].startdate ?? ""} - ${experienceData[index].startdate ?? ""} "
                    "${experienceData[index].position ?? ""} \n"
                    "${experienceData[index].detail ?? ""}",
                appBarForeGroundColor: appBarForegroundColor),
            Positioned(
              // height: 0,
              // width: 0,
              // left: 0,
              right: MediaQuery.of(context).padding.right + 15,
              bottom: MediaQuery.of(context).padding.bottom + 15,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditExperienceResumeScreen(
                        id: experienceData?[index].id ?? 0);
                  })).then(
                    (value) => returnResumeEdit,
                  );
                },
                child: Text(
                  editInFormations ?? "Edit Information",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).appBarTheme.foregroundColor),
                ),
              ),
            )
          ],
        );
      })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Text(
            boolClick == false
                ?
                // editInFormations ??
                "ดูเพิ่มเติม"
                : "แสดงบางส่วน",
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const EditExperienceResumeScreen(id: 0);
          })).then(
            (value) => returnResumeEdit,
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                .withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 20, //height of inner container
                width: MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                        .withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

buildCertificateCard(
    {required BuildContext context,
    required String editInFormations,
    required String title,
    required String type,
    required certificateData,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required bool boolClick,
    required Null Function() onTap}) {
  int length = certificateData?.length ?? 0;
  return Column(
    children: [
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
              (index) {
        return Stack(
          children: [
            buildDetailResumeCustomNotIconsReadOnly(
                context: context,
                detail: "  ${certificateData?[index].title ?? ""} "
                    "\n"
                    "${certificateData?[index].description ?? ""}",
                appBarForeGroundColor: appBarForegroundColor),
            Positioned(
              // height: 0,
              // width: 0,
              // left: 0,
              right: MediaQuery.of(context).padding.right + 15,
              bottom: MediaQuery.of(context).padding.bottom + 15,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditCertificateResumeScreen(
                        id: (certificateData?[index].id ?? 0).toInt());
                  })).then(
                    (value) => returnResumeEdit,
                  );
                },
                child: Text(
                  editInFormations ?? "Edit Information",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).appBarTheme.foregroundColor),
                ),
              ),
            )
          ],
        );
      })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Text(
            boolClick == false
                ?
                // editInFormations ??
                "ดูเพิ่มเติม"
                : "แสดงบางส่วน",
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const EditCertificateResumeScreen(id: 0);
          })).then(
            (value) => returnResumeEdit,
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                .withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 20, //height of inner container
                width: MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                        .withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

buildEducationCard(
    {required BuildContext context,
    required String editInFormations,
    required String title,
    required String type,
    required educationData,
    required Color appBarForegroundColor,
    required Function() returnResumeEdit,
    required bool boolClick,
    required Null Function() onTap}) {
  int length = educationData?.length ?? 0;
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(5),
        child: Text(title),
      ),
      Column(
          children: List.generate(
              (length) > 3 ? (boolClick == false ? 3 : length) : (length),
              (index) {
        return Stack(
          children: [
            buildDetailResumeCustomNotIconsReadOnly(
                context: context,
                detail:
                    "     ${educationData?[index].startdate ?? ""} - ${educationData?[index].startdate ?? ""} "
                    "${educationData?[index].placeofstudy ?? ""} \n"
                    "${educationData?[index].detail ?? ""}",
                appBarForeGroundColor: appBarForegroundColor),
            Positioned(
              // height: 0,
              // width: 0,
              // left: 0,
              right: MediaQuery.of(context).padding.right + 15,
              bottom: MediaQuery.of(context).padding.bottom + 15,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditEducationResumeScreen(
                      id: educationData?[index].id ?? 0,
                      type: educationData?[index].type ?? 'HSC',
                    );
                  })).then(
                    (value) => returnResumeEdit,
                  );
                },
                child: Text(
                  editInFormations ?? "Edit Information",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).appBarTheme.foregroundColor),
                ),
              ),
            )
          ],
        );
      })),
      if ((length) > 3)
        InkWell(
          onTap: onTap,
          child: Text(
            boolClick == false
                ?
                // editInFormations ??
                "ดูเพิ่มเติม"
                : "แสดงบางส่วน",
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditEducationResumeScreen(id: 0, type: type);
          })).then(
            (value) => returnResumeEdit,
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: DottedBorder(
            color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                .withOpacity(0.5),
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                //inner container

                height: 20, //height of inner container
                width: MediaQuery.of(context).size.width,

                child: Center(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: (Theme.of(context).iconTheme.color ?? Colors.grey)
                        .withOpacity(0.5),
                    size: 20.0,
                  ),
                ), //background color of inner container
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
class BoolOnSelectClickResume {
  bool isBool;

  BoolOnSelectClickResume({
    required this.isBool,
  });
  Map<String, dynamic> toJson() =>
      {"bool": bool};
}class OnSelectClickEducationResume {
  bool hsc;
  bool bd;
  bool md;
  bool dd;
  bool hdd;

  OnSelectClickEducationResume({
    required this.hsc,
    required this.bd,
    required this.md,
    required this.dd,
    required this.hdd,
  });
  Map<String, dynamic> toJson() =>
      {"hsc": hsc,
        "bd": bd,
        "md": md,
        "dd": dd,
        "hdd": hdd,};
}
class OnSelectClickResume {
  bool theme;
  bool aboutMe;
  bool position;
  OnSelectClickEducationResume education;
  bool contact;
  bool address;
  bool experience;
  bool certificate;
  bool skill;
  bool language;
  bool text;
  bool name;

  OnSelectClickResume({
  required this.theme,
  required this.aboutMe,
  required this.position,
  required this.education,
  required this.contact,
  required this.address,
  required this.experience,
  required this.certificate,
  required this.skill,
  required this.language,
  required this.text,
  required this.name,
  });
  Map<String, dynamic> toJson() => {
  "fromInt": text,
  "fromInt": name,
  "fromInt": theme,
  "aboutMe": aboutMe,
  "position": position,
  "education": education,
  "contact": contact,
  "address": address,
  "experience": experience,
  "certificate": certificate,
  "skill": skill,
  "language": language,
  };
  }
enum ParameterColor {
  theme ,
  aboutMe ,
  position ,
  education ,
  contact ,
  address ,
  experience ,
  certificate ,
  skill,
  language ,
  text ,
  name ,
}
class OnSelectColorResume {
  int id;
  String nameColor;
  Color materialColor;
  PdfColor pdfColor;

  OnSelectColorResume({
    required this.id,
    required this.nameColor,
    required this.materialColor,
    required this.pdfColor,
  });
  Map<String, dynamic> toJson() =>
      {"id": id,"nameColor": nameColor, "Color": materialColor, "PdfColor": materialColor};
}
class OnSelectColorListResume {
  OnSelectColorResume theme;
  OnSelectColorResume aboutMe;
  OnSelectColorResume position;
  OnSelectColorResume education;
  OnSelectColorResume contact;
  OnSelectColorResume address;
  OnSelectColorResume experience;
  OnSelectColorResume certificate;
  OnSelectColorResume skill;
  OnSelectColorResume language;
  OnSelectColorResume text;
  OnSelectColorResume name;

  OnSelectColorListResume({
    required this.theme,
    required this.aboutMe,
    required this.position,
    required this.education,
    required this.contact,
    required this.address,
    required this.experience,
    required this.certificate,
    required this.skill,
    required this.language,
    required this.text,
    required this.name,
  });
  Map<String, List<OnSelectColorResume> > toJson() => {

   'dj':[text,name,theme,aboutMe,position,education,contact,address,experience,certificate,skill,language,]
      };
}

class SendOnSelectColorResume {
  int id;
  String nameColor;
  String parameter;

  SendOnSelectColorResume({
    required this.id,
    required this.nameColor,
    required this.parameter,
  });
  Map<String, dynamic> toJson() =>
      {"id": id,"nameColor": nameColor,"parameter": parameter, };
}
class SendOnSelectColorListResume {

  SendOnSelectColorResume text;
  SendOnSelectColorResume name;
  SendOnSelectColorResume theme;
  SendOnSelectColorResume aboutMe;
  SendOnSelectColorResume position;
  SendOnSelectColorResume education;
  SendOnSelectColorResume contact;
  SendOnSelectColorResume address;
  SendOnSelectColorResume experience;
  SendOnSelectColorResume certificate;
  SendOnSelectColorResume skill;
  SendOnSelectColorResume language;

  SendOnSelectColorListResume({
    required this.theme,
    required this.aboutMe,
    required this.position,
    required this.education,
    required this.contact,
    required this.address,
    required this.experience,
    required this.certificate,
    required this.skill,
    required this.language,
    required this.text,
    required this.name,
  });
  Map<String, dynamic> toJson() => {
        // "text": text,
        // "name": name,
        // "theme": theme,
        // "aboutMe": aboutMe,
        // "position": position,
        // "education": education,
        // "contact": contact,
        // "address": address,
        // "experience": experience,
        // "certificate": certificate,
        // "skill": skill,
        // "language": language,

    'color':[text,name,theme,aboutMe,position,education,contact,address,experience,certificate,skill,language,]
      };
}

int colorInt = 8;
// OnSelectColorListResume onSelectColor = OnSelectColorListResume(
//   text: OnSelectColorResume(
//       id: 0,
//       nameColor: 'black',
//       materialColor: colorOfPdfList[0].materialColor,
//       pdfColor: colorOfPdfList[0].pdfOfColor, ),
//   name: OnSelectColorResume(
//       id: 0,
//       nameColor: 'black',
//       materialColor: colorOfPdfList[0].materialColor,
//       pdfColor: colorOfPdfList[0].pdfOfColor, ),
//   theme: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor, ),
//   aboutMe: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   position: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   education: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   contact: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   address: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   experience: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   certificate: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   skill: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
//   language: OnSelectColorResume(
//       id: colorInt,
//       nameColor: 'lightBlue',
//       materialColor: colorOfPdfList[colorInt].materialColor,
//       pdfColor: colorOfPdfList[colorInt].pdfOfColor),
// );
