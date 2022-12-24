import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../customs/color/color_const.dart';
import '../../../model/response/more_response/screen_more_board_student_list_response.dart';
import '../../../model/response/more_response/screen_more_list_name_gen_response.dart';

String phImg = "";
boardItemStudent({
  required BuildContext context,
  VoidCallback? onTap,
  ListGen? data,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        margin: EdgeInsets.all(5),
        width:double.infinity,

        decoration:  BoxDecoration(
          color:HexColor("${data?.colorgen}"),
          borderRadius:  BorderRadius.only(
            topRight: Radius.circular(10),
            // bottomLeft: Radius.circular(40),
          ),
          gradient: LinearGradient(stops: [
            0.02,
            0.02,
            1,
          ], colors: [
            HexColor("${data?.colorgen}"),

            HexColor("${data?.colorgen}").withOpacity(0.1),


            HexColor("${data?.colorgen}").withOpacity(0.1),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          // boxShadow:[
          //   BoxShadow(
          //     color: Colors.white.withOpacity(0.5), //color of shadow
          //     spreadRadius:1, //spread radius
          //     blurRadius: 2, // blur radius
          //     offset: Offset(0, 2), // changes position of shadow
          //     //first paramerter of offset is left-right
          //     //second parameter is top to down
          //   ),
          //   //you can set more BoxShadow() here
          // ],
        ),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.01), 2: FractionColumnWidth(0.69)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            HexColor('#F5F5F5'),
                            HexColor("${data?.colorgen}"),
                          ],
                          // stops: <double>[ 0.1, 1],
                          radius: 0.02,
                          tileMode: TileMode.repeated,
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      "${data?.numgen}",
                      style:  const TextStyle(color: Colors.black, fontSize: 30),
                    )),
                  ]),
                ),
              ),
              const SizedBox(),
              Text(
                "${data?.namegen}",
                style:  TextStyle(color: Theme.of(context).bottomAppBarColor ,fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ])
          ],
        ),
      ),
    ),
  );
}

boardItemStudentUser({
  required BuildContext context,
  VoidCallback? onTap,
  UserGen? dataUserStudent,
}) {
  return GestureDetector(
    onTap: onTap,
    child:  Container(
      margin: EdgeInsets.all(5),
      // height: 200,
      width:double.infinity,

      decoration: BoxDecoration(
        gradient:LinearGradient(
            colors: [
              HexColor("${dataUserStudent?.colorgen}"),
              HexColor("${dataUserStudent?.colorgen}"),

              HexColor('#F5F5F5'),
              HexColor('#F5F5F5'),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.1, 0.9, 0.2]
        ),

        borderRadius: BorderRadius.circular(10),
        //border corner radius

      ),
      child: Table(
        border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
        columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.01), 2: FractionColumnWidth(0.69)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          HexColor('#F5F5F5'),
                          HexColor("${dataUserStudent?.colorgen}"),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: const [0.2, 0.7],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                        "${dataUserStudent?.numgen}",
                        style:  const TextStyle(color: Colors.black, fontSize: 30),
                      )),
                ]),
              ),
            ),
            const SizedBox(),
            Text(
              "${dataUserStudent?.namegen}",
              style:  TextStyle(color: Theme.of(context).bottomAppBarColor ,fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ])
        ],
      ),
    ),
  //   child:  Card(
  //     elevation: 8,
  //     shadowColor: Theme.of(context).appBarTheme.foregroundColor,
  //     color:Theme.of(context).appBarTheme.backgroundColor,
  // shape: const RoundedRectangleBorder(
  // borderRadius: BorderRadius.only(
  // bottomRight: Radius.circular(15),
  // ),
  // ),
  //     child: Table(
  //       border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
  //       columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.01), 2: FractionColumnWidth(0.69)},
  //       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
  //       children: [
  //         TableRow(children: [
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: CircleAvatar(
  //               radius: 30,
  //               child: Stack(children: [
  //                 Container(
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     gradient: LinearGradient(
  //                       colors: [
  //                         HexColor('#F5F5F5'),
  //                         HexColor("${dataUserStudent?.colorgen}"),
  //                       ],
  //                       begin: Alignment.bottomLeft,
  //                       end: Alignment.topRight,
  //                       stops: const [0.2, 0.7],
  //                       tileMode: TileMode.repeated,
  //                     ),
  //                   ),
  //                 ),
  //                 Center(
  //                     child: Text(
  //                   "${dataUserStudent?.numgen}",
  //                   style:  const TextStyle(color: Colors.black, fontSize: 30),
  //                 )),
  //               ]),
  //             ),
  //           ),
  //           const SizedBox(),
  //           Text(
  //             "${dataUserStudent?.namegen}",
  //             style:  TextStyle(color: Theme.of(context).bottomAppBarColor ,fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         ])
  //       ],
  //     ),
  //   ),
  );
}

boardItemListStudent({
  required BuildContext context,
  VoidCallback? onTap,
  Data? data,
}) {
  String sName = data?.textstudentname ?? '';
  String sLastName = data?.textstudentlastname ?? '';
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 8,
      shadowColor: Theme.of(context).appBarTheme.foregroundColor,
      color:Theme.of(context).appBarTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Table(
          border: TableBorder.symmetric(outside: const BorderSide(width: 10, color: Colors.transparent)),
          columnWidths: const {0: FractionColumnWidth(0.3), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.65)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: (data?.textstudentimg == "" || data?.textstudentimg == null)
                      ?
                      // CircleAvatar(
                      //   radius: 40,
                      //   backgroundColor: Colors.deepOrangeAccent,
                      //   child: ClipOval(
                      //     child: Image.asset(
                      //       "assets/logo/profile.png",
                      //       fit: BoxFit.cover,
                      //       width: 80,
                      //       height: 80,
                      //     ),
                      //   ),
                      // )
                      Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: const AssetImage('assets/logo/profile.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/logo/profile.png'),
                              ),
                            ),
                          ))
                      // data?.textstudentimg
                      : Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: MemoryImage(
                                  base64Decode(base64.normalize(data?.textstudentimg ?? base64.normalize(phImg)))),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: MemoryImage(
                                    base64Decode(base64.normalize(data?.textstudentimg ?? base64.normalize(phImg)))),
                              ),
                            ),
                          ))),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$sName  $sLastName ',
                    style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                      color:Theme.of(context).bottomAppBarColor,),
                  ),
                  Table(children: [
                    TableRow(children: [
                      Text(
                        data?.textstudentcode ?? '',
                        textAlign: TextAlign.start,
                        style:  TextStyle(fontSize: 14,
                          color:Theme.of(context).bottomAppBarColor,),
                      ),
                    ]),
                  ]),
                ],
              ),
            ])
          ],
        ),
      ),
    ),
  );
}
