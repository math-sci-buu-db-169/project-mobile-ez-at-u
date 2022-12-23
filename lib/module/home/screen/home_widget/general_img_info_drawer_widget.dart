import 'dart:convert';
import 'dart:ui';
import 'package:ez_at_u/module/profile/model/response/profile_teacher_screen_api.dart';
import 'package:flutter/material.dart';
import '../../../../module/profile/model/response/api_profile_response.dart';

buildTableGeneralImageInfo(
    BuildContext context, ApiProfileResponse? screenProfileResponse,ProfileTeacherScreenApi? screenProfileTeacherResponse,
    {required tb1, required tb2, required tb3}) {
  String phimg = "";
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Table(
      border: TableBorder.symmetric(
          outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {
        0: FractionColumnWidth(tb1),
        1: FractionColumnWidth(tb2),
        2: FractionColumnWidth(tb3)
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              screenProfileResponse?.body?.profileGeneralInfo?.role == "ST"
                  ? Text(
                      screenProfileResponse
                              ?.body?.profileGeneralInfo?.generation ??
                          '-',
                      style: TextStyle(
                          color: Theme.of(context).bottomAppBarColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      screenProfileResponse?.body?.profileGeneralInfo?.branchname ?? '-',
                      // 'AAA',
                      style: TextStyle(
                          color: Theme.of(context).bottomAppBarColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
              Table(children: [
                TableRow(children: [
                  screenProfileResponse?.body?.profileGeneralInfo?.role == "ST"
                      ? Text(
                          screenProfileResponse
                                  ?.body?.profileGeneralInfo?.genname ??
                              '-',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Theme.of(context).bottomAppBarColor,
                              fontSize: 18),
                        )
                      : Text(
                          // 'BBB',
                          screenProfileResponse?.body?.profileGeneralInfo?.facultyname ?? '-',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Theme.of(context).bottomAppBarColor,
                              fontSize: 18),
                        ),
                ]),
              ]),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          (screenProfileResponse?.body?.profileGeneralInfo?.role == "ST") ?
          //-----------------------ST--------------------------------//
          (screenProfileResponse?.body?.profileGeneralInfo?.img == "" ||
                  screenProfileResponse?.body?.profileGeneralInfo?.img == null)
              ? const CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(
                    'assets/logo/profile.png',
                  ),
                )
              : Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: MemoryImage(base64Decode(base64.normalize(
                          screenProfileResponse
                                  ?.body?.profileGeneralInfo?.img ??
                              base64.normalize(phimg)))),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRRect(
                    // make sure we apply clip it properly
                    borderRadius: BorderRadius.circular(100), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: MemoryImage(base64Decode(
                                    base64.normalize(screenProfileResponse
                                            ?.body?.profileGeneralInfo?.img ??
                                        base64.normalize(phimg)))),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
          :
          (screenProfileResponse?.body?.profileGeneralInfo?.role == "TC") ?
          //-----------------------TC--------------------------------//
            (screenProfileResponse?.body?.profileGeneralInfo?.img == "" ||
              screenProfileResponse?.body?.profileGeneralInfo?.img == null)
              ? const CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage(
              'assets/logo/profile.png',
            ),
          )
              : Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: MemoryImage(base64Decode(base64.normalize(
                    screenProfileTeacherResponse
                        ?.body?.profileGeneralTH?.img ??
                        base64.normalize(phimg)))),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              // make sure we apply clip it properly
              borderRadius: BorderRadius.circular(100), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: MemoryImage(base64Decode(
                              base64.normalize(screenProfileResponse
                                  ?.body?.profileGeneralInfo?.img ??
                                  base64.normalize(phimg)))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          //-----------------------TC--------------------------------//
              :
          const CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage(
                'assets/logo/profile.png',
              ),
          )
        ])
      ],
    ),
  );
}
