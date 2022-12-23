import 'package:ez_at_u/module/activity/model/response/activity_list_teacher_screen.dart';
import 'package:ez_at_u/module/activity/screen/activity_list_for_teacher_role.dart';
import 'package:ez_at_u/module/activity/screen/activity_name_by_teacher_page.dart';
import 'package:ez_at_u/module/activity/screen/add_activity_by_teacher.dart';
import 'package:ez_at_u/module/activity/screen/select_activity_by_student.dart';
import 'package:ez_at_u/module/home/model/response/home_response/no_activity_teacher_response.dart';
import 'package:ez_at_u/module/home/screen/home_widget/drawer_teacher_widget.dart';
import 'package:ez_at_u/module/home/screen/home_widget/setting_screen.dart';
import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:ez_at_u/module/profile/screen/profile_page_teacher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../resume/examples/content_design_resume_edit.dart';
import 'home_body_widget.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/message/text_home.dart';
import '../../../../module/activity/model/response/screen_status_activity_response.dart';
import '../../../../module/home/model/response/home_response/alert_no_activity_response.dart';
import '../../../../module/home/model/response/home_response/screen_home_response.dart';
import '../../../../module/home/screen/more_screen/more_screen.dart';
import '../../../../module/home/screen/home_widget/drawer_student_widget.dart';
import '../../../../module/profile/model/response/api_profile_response.dart';
import '../../../../module/profile/screen/profile_page.dart';

buildContentHomeScreen(
    BuildContext context,
    void Function() toggleLanguageView,
    ScreenHomeResponse? screenHomeResponse,
    ApiProfileResponse? screenProfileResponse,
    ProfileTeacherScreenApi? screenProfileTeacherResponse,
    userLanguage,
    ScreenStatusActivityStudentResponse? screenStatusActivityStudentResponse,
    ActivityListTeacherScreen? screenStatusActivityTeacherResponse,
    AlertNoActivityStudentResponse? alertNoActivityStudentResponse,
    NoActivityTeacherResponse? alertNoActivityTeacherResponse,
    TextEditingController otpCodeController,
    TextEditingController passwordController,
    {
      required bool activityStudentIsEmpty,
      required bool activityTeacherIsEmpty,
    required String versionApp,
    required bool isHidden,
    required int intThemeMode,
    required void Function() iniGetThemeMode,
    required String role}) {
  String userRole = role;
  return WillPopScope(
    onWillPop: () async {
        return false;
    },
    child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer:
      (userRole == 'ST')?
      Drawer(
        child: drawerStudentHome(
          context,
          toggleLanguageView,
          isHidden,
          screenHomeResponse,
          screenProfileResponse,
          screenProfileTeacherResponse,
          otpCodeController,
          passwordController,
          versionApp: versionApp,
          iniGetThemeMode: iniGetThemeMode,
          intThemeMode: intThemeMode,
        ),
      )
          :
      (userRole == 'TC')?
      Drawer(
        child: drawerTeacherHome(
          context,
          toggleLanguageView,
          isHidden,
          screenHomeResponse,
          screenProfileResponse,
          screenProfileTeacherResponse,
          otpCodeController,
          passwordController,
          versionApp: versionApp,
          iniGetThemeMode: iniGetThemeMode,
          intThemeMode: intThemeMode,
        ),
      )
      :
      Drawer(
        child: drawerStudentHome(
          context,
          toggleLanguageView,
          isHidden,
          screenHomeResponse,
          screenProfileResponse,
          screenProfileTeacherResponse,
          otpCodeController,
          passwordController,
          versionApp: versionApp,
          iniGetThemeMode: iniGetThemeMode,
          intThemeMode: intThemeMode,
        ),
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: FaIcon(FontAwesomeIcons.bars,
                    color: Theme.of(context).iconTheme.color, size: 20),
                onPressed: () {
                  print("ชื่ออาจารย์ =" "${screenProfileTeacherResponse?.body?.profileGeneralTH?.name}");
                  print("นามสกุลอาจารย์ =" "${screenProfileTeacherResponse?.body?.profileGeneralTH?.lastname}");
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Center(
              child:
              (userRole == "ST")?
              Text(
                  screenHomeResponse?.body?.screenInfo?.titleact ??
                      homeTitleAct,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).appBarTheme.foregroundColor)):
              (userRole == "TC")?
              Text(
                  screenHomeResponse?.body?.screenInfo?.titleactteacher ?? homeTitleActTeacher,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).appBarTheme.foregroundColor)):Text(
                  screenHomeResponse?.body?.screenInfo?.titleact ??
                      homeTitleAct,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).appBarTheme.foregroundColor))
          ),
          actions: (userRole == "TC")
              ? <Widget>[
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.1,
                  //   // child: Text(userLanguage),
                  //   // child: Text(userLanguage),
                  // ),

                  // ChangeThemeButtonWidget(),
                  // IconButton(
                  //   icon: FaIcon(FontAwesomeIcons.solidBell,
                  //       color: Theme.of(context).iconTheme.color, size: 20),
                  //   onPressed: () {
                  //     // Navigator.push(context, MaterialPageRoute(builder: (context) =>  NotesPage()));
                  //   },
                  // ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.fileLines,
                        color: Theme.of(context).iconTheme.color, size: 20),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityNameListByTeacherScreen()));
                    },
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.plus,
                        color: Theme.of(context).iconTheme.color, size: 20),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const AddActivityByTeacherScreen()));
                    },
                  )
                ]
              : (userRole == "ST")
                  ? <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        // child: Text(userLanguage),
                        // child: Text(userLanguage),
                      ),
                    ]
                  : <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        // child: Text(userLanguage),
                        // child: Text(userLanguage),
                      ),
                    ]),
      body: SafeArea(
        child: Stack(children: [
          (userRole == "ST")?
          (activityStudentIsEmpty
              ? homeStudentBodyEmptyActivityWidget(
                  context,
                  alertNoActivityStudentResponse,
                )
              : homeBodyActivityWidget(context, screenStatusActivityStudentResponse, screenStatusActivityTeacherResponse, role)
          )
              : (userRole == "TC")?
          (activityTeacherIsEmpty
              ? homeTeacherBodyEmptyActivityWidget(
            context,
            alertNoActivityTeacherResponse,
          )
              : homeBodyActivityWidget(context, screenStatusActivityStudentResponse, screenStatusActivityTeacherResponse, role)
          )
              : Text("ไม่พบ Role ของผู้ใช้"),
          Column(
            children: [
              const Expanded(child: SizedBox()),
              (userRole == "ST")
                  ? Center(
                      child: ButtonIconsCustom(
                        label: screenHomeResponse?.body?.screenInfo?.btnadd ??
                            homeTextAdd,
                        buttonIcons: Icon(
                          Icons.add,
                          color: Theme.of(context).iconTheme.color,
                          size: 20.0,
                        ),
                        // colortext: Theme.of(context).bottomAppBarColor,
                        colortext: Theme.of(context).bottomAppBarColor,
                        colorbutton: Theme.of(context).scaffoldBackgroundColor,
                        sizetext: 14,
                        colorborder: Theme.of(context).scaffoldBackgroundColor,
                        sizeborder: 3,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectActivityByStudentScreen()));
                        },
                      ),
                    )
                  //Student role button
                  : (userRole == "TC")
                      ? Center(
                          child: ButtonIconsCustom(
                            label: screenHomeResponse?.body?.screenInfo?.btnseeall ?? homeTextSeeAll,
                            // label: "ดูทั้งหมด",
                            buttonIcons: Icon(
                              FontAwesomeIcons.bars,
                              color: Theme.of(context).iconTheme.color,
                              size: 20.0,
                            ),
                            colortext: Theme.of(context).bottomAppBarColor,
                            colorbutton:
                                Theme.of(context).scaffoldBackgroundColor,
                            sizetext: 14,
                            colorborder:
                                Theme.of(context).scaffoldBackgroundColor,
                            sizeborder: 3,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ActivityListForTeacher()));
                            },
                          ),
                        )
                      : Center(),
              //Teacher role button
              Container(
                margin: const EdgeInsets.only(top: 1.0, bottom: 0.0),
                height: 60,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (userRole == "ST") ?
                    Expanded(
                        child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.userLarge,
                          color: Theme.of(context).iconTheme.color, size: 40),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                      },
                    )):(userRole == "TC") ?
                Expanded(
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.userLarge,
                          color: Theme.of(context).iconTheme.color, size: 40),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreenTeacher()));
                      },
                    )):
                    Expanded(
                        child: IconButton(
                          icon: FaIcon(FontAwesomeIcons.userLarge,
                              color: Theme.of(context).iconTheme.color, size: 40),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfileScreen()));
                          },
                        )),
                    if(userRole == "ST")
                    Expanded(
                        child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.solidFilePdf,
                          color: Theme.of(context).iconTheme.color, size: 40),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContentDesignResumeEditScreen()));
                      },
                      // icon: const FaIcon(FontAwesomeIcons.house,color: tcBlack, size: 40),
                      // onPressed: () {},
                    )),
                    Expanded(
                        child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.gear,
                          color: Theme.of(context).iconTheme.color, size: 40),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingScreen()));
                      },
                    )),
                    Expanded(
                        child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.layerGroup,
                          color: Theme.of(context).iconTheme.color, size: 40),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MoreScreen()));
                      },
                    )),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    ),
  );
}
