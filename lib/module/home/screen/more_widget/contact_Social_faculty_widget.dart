
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../customs/card/card_more.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/home/model/response/more_response/screen_more_contact_us_response.dart';

contactSocialFacultyWidget(
    BuildContext context, setState, launchInBrowser, ScreenMoreContactUsResponse? screenMoreContactUsResponse) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 60),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildCardSocial(
            context,
            iconSocial: Icons.facebook_outlined,
            title: screenMoreContactUsResponse?.body?.screeninfo?.textfacebook ?? 'Facebook',
            colorOne: const Color(0xFF4267B2),
            colorTwo: const Color(0xFF4267B2),
            onTap: () {
              setState(() {
                launchInBrowser(Uri.parse(screenMoreContactUsResponse?.body?.datamain?.facebook ?? ""));
              });
            },
          ),
          buildCardSocial(
            context,
            iconSocial: FontAwesomeIcons.twitter,
            title: screenMoreContactUsResponse?.body?.screeninfo?.texttwitter ?? 'Twitter',
            colorOne: const Color(0xff1DA1F2),
            colorTwo: const Color(0xff1DA1F2),
            onTap: () {
              setState(() {
                launchInBrowser(Uri.parse(screenMoreContactUsResponse?.body?.datamain?.twitter ?? " "));
              });
            },
          ),
          buildCardSocial(
            context,
            iconSocial: FontAwesomeIcons.instagram,
            title: screenMoreContactUsResponse?.body?.screeninfo?.textinstagram ?? 'Instagram',
            colorOne: const Color(0xFF833AB4),
            colorTwo: const Color(0xFFE1306C),
            onTap: () {
              setState(() {
                launchInBrowser(Uri.parse(screenMoreContactUsResponse?.body?.datamain?.instagram ?? " "));
              });
            },
          ),
        ],
      ),
    ),
  );
}

floatingLineOffice(setState, launchInBrowser, ScreenMoreContactUsResponse? screenMoreContactUsResponse) {
  return FloatingActionButton.extended(
    backgroundColor: const Color(0xFFFFFFFF),
    foregroundColor: Colors.black,
    onPressed: () {
      setState(() {
        launchInBrowser(
            Uri.parse(screenMoreContactUsResponse?.body?.datamain?.line ?? "https://line.me/R/ti/p/%40ffy9217v"));
      });
    },
    icon: const Icon(
      FontAwesomeIcons.line,
      color: tcButtonLine,
    ),
    label: Text('   ${screenMoreContactUsResponse?.body?.datamain?.lineid ?? '@ffy9217v'}',
        style: const TextStyle(
          fontSize: sizeTextSmaller14,
          color: tcButtonLine,
        )),
  );
}
