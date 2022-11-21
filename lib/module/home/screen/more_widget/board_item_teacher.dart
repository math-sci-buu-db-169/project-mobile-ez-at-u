import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../customs/message/text_board.dart';
import '../../../../module/home/model/response/more_response/screen_more_board_teacher_response.dart';

String phImg = '';

boardItemTeacherLeft({
  VoidCallback? onTap,
  Screeninfo? titleTeacher,
  Teachermath? dataTeachermath, required BuildContext context,
}) {
  String? name = dataTeachermath?.name ?? '-';
  String? lastname = dataTeachermath?.lastname ?? '-';
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0, right: 3.0, left: 10.0),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.8)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: (dataTeachermath?.img == "" || dataTeachermath?.img == null)
                      ? const CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(
                            'assets/logo/profile.png',
                          ),
                        )
                      //--//dataTeacherstats
                      : Container(
                          height: 100,
                          margin: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: MemoryImage(
                                  base64Decode(base64.normalize(dataTeachermath?.img ?? base64.normalize(phImg)))),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
                            ),
                          ),
                          child: Container(
                            color: Colors.grey.withOpacity(0.01),
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: MemoryImage(
                                      base64Decode(base64.normalize(dataTeachermath?.img ?? base64.normalize(phImg)))),
                                ),
                              ),
                            ),
                          ),
                        )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textname ?? boardPersonalTextName,
                          dataTeacher: '$name  $lastname '),
                      tableAJ(
                          context:context,
                              titleTeacher: titleTeacher?.textpositon ?? boardPersonalTextPosition,
                              dataTeacher: dataTeachermath?.position) ??
                          '-',
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.texttel ?? boardPersonalTextTel,
                          dataTeacher: dataTeachermath?.phone ?? '-'),
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textemail ?? boardPersonalTextEmail,
                          dataTeacher: dataTeachermath?.email ?? '-'),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}

boardItemTeacherRight({
  VoidCallback? onTap,
  Screeninfo? titleTeacher,
  Teacherstats? dataTeacherstats, required BuildContext context,
}) {
  String? name = dataTeacherstats?.name ?? '-';
  String? lastname = dataTeacherstats?.lastname ?? '-';
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0, right: 3.0, left: 10.0),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.8)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: (dataTeacherstats?.img == "" || dataTeacherstats?.img == null)
                      ? const CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(
                            'assets/logo/profile.png',
                          ),
                        )
                      //--//dataTeacherstats
                      : Container(
                          height: 100,
                          margin: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: MemoryImage(
                                  base64Decode(base64.normalize(dataTeacherstats?.img ?? base64.normalize(phImg)))),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
                            ),
                          ),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: MemoryImage(
                                    base64Decode(base64.normalize(dataTeacherstats?.img ?? base64.normalize(phImg)))),
                              ),
                            ),
                          ),
                          // ClipRRect(
                          //   // make sure we apply clip it properly
                          //   borderRadius: BorderRadius.circular(100), // Image border
                          //   child: SizedBox.fromSize(
                          //     size: const Size.fromRadius(100),
                          //     child: BackdropFilter(
                          //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          //       child: Container(
                          //         color: Colors.grey.withOpacity(0.01),
                          //         alignment: Alignment.center,
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             image: DecorationImage(
                          //               image: MemoryImage(base64Decode(base64.normalize(
                          //                   dataTeacherstats?.img ??
                          //                       base64.normalize(phImg) ))),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textname ?? boardPersonalTextName,
                          dataTeacher: '$name  $lastname '),
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textpositon ?? boardPersonalTextPosition,
                          dataTeacher: dataTeacherstats?.position ?? '-'),
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.texttel ?? boardPersonalTextTel,
                          dataTeacher: dataTeacherstats?.phone ?? '-'),
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textemail ?? boardPersonalTextEmail,
                          dataTeacher: dataTeacherstats?.email ?? '-'),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}

tableAJ({String? titleTeacher, String? dataTeacher, required BuildContext context}) {
  return Table(
    border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.7)},
    // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          "$titleTeacher :",
          style:  TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "$dataTeacher",
          style:  TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 14),
        ),
      ])
    ],
  );
}

boardItemStaff({
  VoidCallback? onTap,
  Screeninfo? titleTeacher,
  Staff? dataStaff, required BuildContext context,
}) {
  String? name = dataStaff?.name ?? '-';
  String? lastname = dataStaff?.lastname ?? '-';
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0, right: 3.0, left: 10.0),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.8)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: (dataStaff?.img == "" || dataStaff?.img == null)
                      ? const CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(
                            'assets/logo/profile.png',
                          ),
                        )
                      //--//dataTeacherstats
                      : Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: MemoryImage(
                                  base64Decode(base64.normalize(dataStaff?.img ?? base64.normalize(phImg)))),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
                            ),
                          ),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: MemoryImage(
                                    base64Decode(base64.normalize(dataStaff?.img ?? base64.normalize(phImg)))),
                              ),
                            ),
                          ),
                        )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textname ?? boardPersonalTextName,
                          dataTeacher: '$name  $lastname '),
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textpositon ?? boardPersonalTextPosition,
                          dataTeacher: dataStaff?.position ?? '-'),
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.texttel ?? boardPersonalTextTel,
                          dataTeacher: dataStaff?.phone ?? '-'),
                      tableAJ(
                          context:context,
                          titleTeacher: titleTeacher?.textemail ?? boardPersonalTextEmail,
                          dataTeacher: dataStaff?.email ?? '-'),
                    ],
                  )),
            ])
          ],
        ),
      ),
    ),
  );
}
