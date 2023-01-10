import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../customs/card/card_more.dart';
import '../../../../../customs/message/text_more.dart';
import '../../../../../customs/size/size.dart';
import '../../../model/response/more_response/screen_more_response.dart';
import '../../more_screen/board_screen/more_board_student_list_gen_screen.dart';
import '../../more_screen/board_screen/more_board_teacher_screen.dart';
import '../../more_screen/contact_us_screen.dart';
import '../../more_screen/course_screen.dart';
import '../../more_screen/faq_screen.dart';
import '../../more_screen/pdpa_screen.dart';
import '../../more_screen/related_links_screen.dart';

moreBodyWidget(BuildContext context, ScreenMoreResponse? screenMoreResponse,
    Future<void> Function(Uri url) launchInBrowser, setState) {

  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:  Icon(
                Icons.arrow_back,
                size: sizeTitle24,
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
            ),
            title: Text(
              screenMoreResponse?.body?.screeninfo?.titlemore ?? moreTitleMore,
              style:  TextStyle(
                // color: Colors.black,
                fontSize: sizeTitle24,
                color: Theme.of(context).appBarTheme.foregroundColor,)),
            // Bypass imge
            // actions: <Widget>[
            //   IconButton(
            //     icon: const Icon(
            //       Icons.book,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //           const Bypass(),
            //         ),
            //       );
            //     },
            //   )
            // ],
          ),
          body: SafeArea(
            child: Container(
              color: Colors.transparent.withOpacity(0.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: Text(
                      screenMoreResponse?.body?.screeninfo?.subtitileboard ?? moreSubTitleBoard,
                      style:  TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).bottomAppBarColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCardBoard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MoreBoardListStudentListGenScreen(),
                            ),
                          );
                        },
                        context,
                        title: screenMoreResponse?.body?.screeninfo?.btnstd ?? moreBtnStd,
                        // iconBoard: Icons.auto_stories_outlined,
                        iconBoard: FontAwesomeIcons.leanpub,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      buildCardBoard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MoreBoardListTeacherScreen(),
                            ),
                          );
                        },
                        context,
                        title: screenMoreResponse?.body?.screeninfo?.btntc ?? moreBtnTc,
                        // iconBoard: Icons.badge_outlined,
                        iconBoard: FontAwesomeIcons.graduationCap,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: Text(
                      screenMoreResponse?.body?.screeninfo?.subtitiledepart ?? moreSubTitleDepart,
                      style:  TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).bottomAppBarColor,
                      ),
                    ),
                  ),
                  buildCardMore(
                    context: context,
                    onTap: () {
                      setState(() {
                        launchInBrowser(Uri.parse("${screenMoreResponse?.body?.pavatUrl}"));
                      });
                    },
                    title: screenMoreResponse?.body?.screeninfo?.btndeparthis ?? moreBtnDepartHis,
                    iconsFile :FontAwesomeIcons.hourglassHalf,

                  ),
                  buildCardMore(
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const CourseScreen(),
                        ),
                      );
                      // setState(() {
                      //   launchInBrowser(Uri.parse("${screenMoreResponse?.body?.luksuitUrl}"));
                      // });
                    },
                    title: screenMoreResponse?.body?.screeninfo?.btncou ?? moreBtnCou,
                    iconsFile : FontAwesomeIcons.usersViewfinder,
                  ),
                  // buildCardMore(
                  //   context: context,
                  //   onTap: () {
                  //     setState(() {
                  //       launchInBrowser(Uri.parse("http://msd.buu.ac.th/ServiceTest/resume/generatepdftest?id=62030340"));
                  //     });
                  //   },
                  //   title: 'Gen PDF',
                  //   iconsFile : FontAwesomeIcons.usersViewfinder,
                  // ),
                  buildCardMore(
                    context: context,
                    onTap: () {
                      setState(() {
                        launchInBrowser(Uri.parse("${screenMoreResponse?.body?.facebookUrl}"));
                      });
                    },
                    title: screenMoreResponse?.body?.screeninfo?.btnface ?? moreBtnFace,
                    iconsFile :FontAwesomeIcons.facebook,
                  ),
                  buildCardMore(
                    context: context,
                    onTap: () {
                      setState(() {
                        launchInBrowser(Uri.parse("${screenMoreResponse?.body?.websiteUrl}"));
                      });
                    },
                    title: screenMoreResponse?.body?.screeninfo?.btnweb ?? moreBtnWeb,
                    iconsFile : FontAwesomeIcons.satelliteDish,
                  ),
                   buildCardMore(
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RelatedLinksScreen(),
                        ),
                      );
                    },
                    title: screenMoreResponse?.body?.screeninfo?.relatedlinks ?? moreBtnRelatedLinks,
                    iconsFile : FontAwesomeIcons.shuffle,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: Text(
                      screenMoreResponse?.body?.screeninfo?.subtitilesup ?? moreSubTitleSup,
                      style:  TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).bottomAppBarColor,

                      ),
                    ),
                  ),
                  buildCardMore(
                    context: context,
                    title: screenMoreResponse?.body?.screeninfo?.btntermandcon ?? moreBtnAndTitleTermAndCon,
                    iconsFile : FontAwesomeIcons.userShield,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PDPAMoreScreen(load: false,),
                        ),
                      );
                    },
                  ),
                  buildCardMore(
                    context: context,
                    title: screenMoreResponse?.body?.screeninfo?.btnfaq ?? moreBtnAndTitleFaq,
                    iconsFile : FontAwesomeIcons.question ,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqScreen(module: '',),
                        ),
                      );
                    },
                  ),
                  buildCardMore(
                    context: context,
                    title: screenMoreResponse?.body?.screeninfo?.btncontactus ?? moreBtnContactus,
                    iconsFile : FontAwesomeIcons.message ,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUsScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ]),
              ),
            ),
          )));
}
