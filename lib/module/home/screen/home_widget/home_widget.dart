import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_body_widget.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_home.dart';
import '../../../../module/activity/model/response/screen_status_activity_response.dart';
import '../../../../module/activity/screen/add_activity.dart';
import '../../../../module/home/model/response/home_response/alert_no_activity_response.dart';
import '../../../../module/home/model/response/home_response/screen_home_response.dart';
import '../../../../module/home/screen/more_screen/more_screen.dart';
import '../../../../module/home/screen/home_widget/drawer_widget.dart';
import '../../../../module/profile/model/response/api_profile_response.dart';
import '../../../../module/profile/screen/profile_page.dart';

buildContentHomeScreen(
    BuildContext context,
    void Function() toggleLanguageView,
    ScreenHomeResponse? screenHomeResponse,
    ApiProfileResponse? screenProfileResponse,
    userLanguage,
    ScreenStatusActivityResponse? screenStatusActivityResponse,
    AlertNoActivityResponse? alertNoActivityResponse,
    TextEditingController otpCodeController,
    TextEditingController passwordController,
    {required bool activityIsEmpty,
    required String versionApp,
    required bool isHidden}) {
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: Scaffold(
      drawer: Drawer(
        child: drawerHome(context, toggleLanguageView, isHidden, screenHomeResponse, screenProfileResponse,
            otpCodeController, passwordController,
            versionApp: versionApp),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const FaIcon(FontAwesomeIcons.gear,color: tcBlack, size: 20),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(
            child: Text(screenHomeResponse?.body?.screenInfo?.titleact ?? homeTitleAct,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: tcBlack))),
        actions: <Widget>[
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.1,
          //   // child: Text(userLanguage),
          //   // child: Text(userLanguage),
          // ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidBell,color: tcBlack, size: 20),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  NotesPage()));


            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.fileLines,color: tcBlack, size: 20),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  NotesPage()));


            },
          )
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          activityIsEmpty
              ? homeBodyEntryWidget(
                  context,
                  alertNoActivityResponse,
                )
              : homeBodyActivityWidget(context, screenStatusActivityResponse),
          Column(
            children: [
              const Expanded(child: SizedBox()),

              Center(
                child: ButtonIconsCustom(
                  label: screenHomeResponse?.body?.screenInfo?.btnadd ?? homeTextAdd,
                  buttonIcons: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  colortext: tcButtonTextBlack,
                  colorbutton: tcButtonTextWhite,
                  sizetext: 14,
                  colorborder: tcButtonTextWhite,
                  sizeborder: 3,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddActivityScreen()));
                  },
                ),
              ),

              // padding: const EdgeInsets.only(bottom: 10.0),
              Container(
                margin: const EdgeInsets.only(top: 1.0, bottom: 0.0),
                height: 60,
                color: tcButtonTextWhite,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.userLarge,color: tcBlack, size: 40),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                      },
                    )),
                    Expanded(
                        child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.house,color: tcBlack, size: 40),
                      onPressed: () {},
                    )),
                    Expanded(
                        child: IconButton(
                      icon:  const FaIcon(FontAwesomeIcons.layerGroup,color: tcBlack, size: 40),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MoreScreen()));
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
