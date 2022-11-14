import 'package:flutter/services.dart';

import '../../../../customs/color/color_const.dart';
import '../../../../customs/message/text_board.dart';
import '../../../../customs/size/size.dart';
import '../../../../module/home/model/response/more_response/screen_more_board_student_list_detail_response.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

studentDetailBody(BuildContext context, ScreenMoreBoardStudentDetailResponse? screenMoreBoardStudentDetailResponse) {
  String sName = screenMoreBoardStudentDetailResponse?.body?.data?.name ?? '-';
  String sLastName = screenMoreBoardStudentDetailResponse?.body?.data?.lastname ?? '-';
  String phImg = '';

  return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: sizeTitle24,
              color: Colors.black,
            ),
          ),
          title: Text(
            screenMoreBoardStudentDetailResponse?.body?.data?.studentcode ?? '-',
            style: const TextStyle(
              color: Colors.black,
              fontSize: sizeTitle24,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Stack(children: [
                      // Container(
                      //   height: MediaQuery.of(context).size.height*1.5,
                      //   color: Colors.grey[200],
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey[200],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 70),
                        // padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              _buildListStudentDetail(
                                  context:context,
                                  title: screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textname ?? boardDetailNiSitTextName,
                                  value: '$sName  $sLastName'),
                              _buildListStudentDetail(
                                  context:context,
                                  title: screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textnickname ??
                                      boardDetailNiSitTextNickName,
                                  value: screenMoreBoardStudentDetailResponse?.body?.data?.nickname ?? '-'),
                              _buildListStudentDetail(
                                  context:context,
                                  title: screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textgen ?? boardDetailNiSitTextGen,
                                  value: screenMoreBoardStudentDetailResponse?.body?.data?.gen ?? '-'),
                              _buildListStudentDetail(
                                  context:context,
                                  title: screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textstudentcode ??
                                      boardDetailNiSitTextStudentCode,
                                  value: screenMoreBoardStudentDetailResponse?.body?.data?.studentcode ?? '-'),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
                                child: Center(
                                  child: Text(
                                    screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textadvisor ??
                                        boardDetailNiSitTextAdvisor,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              _buildAdvisor(
                                  context:context,screenMoreBoardStudentDetailResponse: screenMoreBoardStudentDetailResponse),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
                                child: Center(
                                  child: Text(
                                    screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textcontact ??
                                        boardDetailNiSitTextConfirmAct,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              _buildListContactUser(
                                context:context,
                                contactUser: screenMoreBoardStudentDetailResponse?.body?.data?.phone ?? '-',
                                iconSocial: FontAwesomeIcons.phone,
                                colorOne: const Color(0xff4f4f4f),
                                colorTwo: const Color(0xff000000),
                              ),
                              _buildListContactUser(
                                context:context,
                                contactUser: screenMoreBoardStudentDetailResponse?.body?.data?.line ?? '-',
                                iconSocial: FontAwesomeIcons.line,
                                colorOne: const Color(0xff00a80a),
                                colorTwo: const Color(0xff00a80a),
                              ),
                              _buildListContactUser(
                                context:context,
                                contactUser: screenMoreBoardStudentDetailResponse?.body?.data?.facebook ?? '-',
                                iconSocial: FontAwesomeIcons.facebook,
                                colorOne: const Color(0xff0647fd),
                                colorTwo: const Color(0xff0647fd),
                              ),
                              _buildListContactUser(
                                  context:context,
                                  contactUser: screenMoreBoardStudentDetailResponse?.body?.data?.instagram ?? '-',
                                  iconSocial: FontAwesomeIcons.instagram,
                                  colorOne: const Color(0xFFE1306C),
                                  colorTwo: const Color(0xFFE1306C)),
                              _buildListContactUser(
                                context:context,
                                contactUser: screenMoreBoardStudentDetailResponse?.body?.data?.twitter ?? '-',
                                iconSocial: FontAwesomeIcons.twitter,
                                colorOne: const Color(0xff1DA1F2),
                                colorTwo: const Color(0xff1DA1F2),
                              ),
                              _buildListContactUser(
                                context:context,
                                contactUser: screenMoreBoardStudentDetailResponse?.body?.data?.youtube ?? '-',
                                iconSocial: FontAwesomeIcons.youtube,
                                colorOne: const Color(0xffff0000),
                                colorTwo: const Color(0xffff0000),
                              ),
                              _buildListStudentDetail(
                                  context:context,
                                  title: screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textcareer ?? boardDetailNiSitTextCareer,
                                  value: screenMoreBoardStudentDetailResponse?.body?.data?.attention ?? '-'),
                              _buildListStudentDetail(
                                  context:context,
                                  title: screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textworkstatus ??
                                      boardDetailNiSitTextWorkStatus,
                                  value: screenMoreBoardStudentDetailResponse?.body?.data?.status ?? '-'),
                              _buildListStudentDetail(
                                  context:context,
                                  title:
                                      screenMoreBoardStudentDetailResponse?.body?.screeninfo?.textcompany ?? boardDetailNiSitTextCompany,
                                  value: screenMoreBoardStudentDetailResponse?.body?.data?.usercompany ?? '-'),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 0,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),

                            child: (screenMoreBoardStudentDetailResponse?.body?.data?.img == "" ||
                                    screenMoreBoardStudentDetailResponse?.body?.data?.img == null)
                                ? const CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: AssetImage(
                                      'assets/logo/profile.png',
                                    ),
                                  )
                                //--//widget.image
                                : Container(
                                    height: 100,
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: MemoryImage(base64Decode(base64.normalize(
                                            screenMoreBoardStudentDetailResponse?.body?.data?.img ??
                                                base64.normalize(phImg)))),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: MemoryImage(base64Decode(base64.normalize(
                                              screenMoreBoardStudentDetailResponse?.body?.data?.img ??
                                                  base64.normalize(phImg)))),
                                        ),
                                      ),
                                    )),

                            // child: CircleAvatar(
                            //   radius: 50.0,
                            //   backgroundImage: NetworkImage(
                            //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"),
                            // ),
                          ),

                          // child: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: CircleAvatar(
                          //     radius: 50.0,
                          //     backgroundImage: MemoryImage(base64Decode(base64.normalize(
                          //         screenMoreBoardStudentDetailResponse?.body?.data?.img ?? base64.normalize(phImg)))),
                          //   ),
                          // ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
}

_buildListStudentDetail({required BuildContext context,required String title, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 6.0, bottom: 6.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: const {0: FractionColumnWidth(0.35), 1: FractionColumnWidth(0.03), 2: FractionColumnWidth(0.65)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Text(
            ':',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                value,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 12),
              ),

              IconButton(
                icon: const Icon(
                  Icons.copy_outlined,
                  color: tcHint,
                  size: sizeTextSmaller14,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: value)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$value copied to clipboard",
                          style: const TextStyle(fontSize: sizeTextSmaller14, color: Colors.black)),
                      duration: const Duration(seconds: 1),
                      backgroundColor: const Color(0xFFFFF9D1),
                    ));
                  });
                },
              ),

            ],
          )

        ])
      ],
    ),
  );
}

_buildListNameTeacher({required BuildContext context, required String title, required String name, required String lastname}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 1.0, bottom: 1.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: const {0: FractionColumnWidth(0.02), 1: FractionColumnWidth(0.98)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Text(
                '$title  $name $lastname',
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 12),
              ),

              IconButton(
                icon: const Icon(
                  Icons.copy_outlined,
                  color: tcHint,
                  size: sizeTextSmaller14,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: title + name+ lastname)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$title  $name $lastname copied to clipboard",
                          style: const TextStyle(fontSize: sizeTextSmaller14, color: Colors.black)),
                      duration: const Duration(seconds: 1),
                      backgroundColor: const Color(0xFFFFF9D1),
                    ));
                  });
                },
              ),
            ],
          )

        ])
      ],
    ),
  );
}

_buildAdvisor({required BuildContext context,ScreenMoreBoardStudentDetailResponse? screenMoreBoardStudentDetailResponse}) {
  if (int.parse("${screenMoreBoardStudentDetailResponse?.body?.data?.advisor?.length}") == 0) {
    return const Center(
      child: Text('-'),
    );
  }

  return Column(
      children: List.generate(
          int.parse("${screenMoreBoardStudentDetailResponse?.body?.data?.advisor?.length}"),
          (index) => _buildListNameTeacher(
              context:context,
              title: screenMoreBoardStudentDetailResponse?.body?.data?.advisor?[index].position ?? "-",
              name: screenMoreBoardStudentDetailResponse?.body?.data?.advisor?[index].teachername ?? '-',
              lastname: screenMoreBoardStudentDetailResponse?.body?.data?.advisor?[index].teacherlastname ?? '-')));
}

_buildListContactUser({
  required BuildContext context,
  required String contactUser,
  required IconData iconSocial,
  required Color colorOne,
  required Color colorTwo,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 6.0, bottom: 6.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.75)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          ShaderMask(
            shaderCallback: (bounds) => RadialGradient(
              center: const Alignment(0.2, -0.6),
              radius: 0.5,
              colors: [
                colorOne,
                colorTwo,
              ],
              // tileMode: TileMode.clamp,
              stops: const <double>[0.1, 2.6],
            ).createShader(bounds),
            child: Icon(
              iconSocial,
              size: 20,
              color: Colors.white,
            ),
          ),
          const Text(
            ':',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14),
          ),
          Row(
            children: [
              Text(
                contactUser,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 12),
              ),


              IconButton(
                icon: const Icon(
                  Icons.copy_outlined,
                  color: tcHint,
                  size: sizeTextSmaller14,
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: contactUser)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$contactUser copied to clipboard",
                          style: const TextStyle(fontSize: sizeTextSmaller14, color: Colors.black)),
                      duration: const Duration(seconds: 1),
                      backgroundColor: const Color(0xFFFFF9D1),
                    ));
                  });
                },
              ),
            ],
          )

        ])
      ],
    ),
  );
}
