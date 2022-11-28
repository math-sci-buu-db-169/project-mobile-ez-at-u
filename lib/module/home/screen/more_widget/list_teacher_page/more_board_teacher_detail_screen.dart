import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../customs/progress_dialog.dart';
import '../../../../../customs/size/size.dart';

class MoreBoardTeacherDetailScreen extends StatefulWidget {
  final String name;
  final String lastname;
  final String position;
  final String phone;
  final String email;
  final String url;
  final String titleName;
  final String titlePosition;
  final String titlePhone;
  final String titleEmail;
  final String titleUrl;
  final String img;
  const MoreBoardTeacherDetailScreen({
    Key? key,
    required this.name,
    required this.position,
    required this.phone,
    required this.email,
    required this.url,
    required this.img,
    required this.titleName,
    required this.titlePosition,
    required this.titlePhone,
    required this.titleEmail,
    required this.titleUrl,
    required this.lastname,
  }) : super(key: key);

  @override
  State<MoreBoardTeacherDetailScreen> createState() => _MoreBoardTeacherDetailScreenState();
}

class _MoreBoardTeacherDetailScreenState extends State<MoreBoardTeacherDetailScreen> with ProgressDialog {
  @override
  Widget build(BuildContext context) {
    Future<void> islaunchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

    String name = widget.name;
    String lastname = widget.lastname;
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
              '$name  $lastname ',
              style:  TextStyle(
                color: Theme.of(context).appBarTheme.foregroundColor,
                fontSize: sizeSubtitle22,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                left: 5,
                right: 5,
                top: 70,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(2, 5, 2, 10),
                  decoration:  BoxDecoration(
                    color:Theme.of(context).appBarTheme.foregroundColor?.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      _buildTeacherDetail(context:context,title: widget.titleName, value: '$name  $lastname '),
                      _buildTeacherDetail(context:context,title: widget.titlePosition, value: widget.position),
                      _buildTeacherDetail(context:context,title: widget.titlePhone, value: widget.phone),
                      _buildTeacherDetail(context:context,title: widget.titleEmail, value: widget.email),
                      const SizedBox(
                        height: 30,
                      ),
                      if (widget.url != '-' || widget.url == '')
                        TextButton(
                            onPressed: () {
                              setState(() {
                                islaunchInBrowser(Uri.parse(widget.url));
                              });
                            },
                            child: Center(
                              child: Text(
                                " > ".toString() + widget.titleUrl + " < ".toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF0647FD),
                                ),
                              ),
                            )),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                right: 40,
                top: 0,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (widget.img == "-" || widget.img == "")
                          ? Container(
                              height: 110,
                              width: 110,
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
                          //--//widget.image
                          : Container(
                              height: 110,
                              width: 110,
                              margin: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: MemoryImage(base64Decode(base64.normalize(widget.img))),
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
                                            image: MemoryImage(base64Decode(base64.normalize(widget.img))),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )

                      // child: CircleAvatar(
                      //   radius: 50.0,
                      //   backgroundImage: NetworkImage(
                      //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&usqp=CAU"),
                      // ),
                      ),
                ),
              ),
            ]),
          ),
        ));
  }
}

_buildTeacherDetail({
  required BuildContext context,required String title, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 6.0, bottom: 6.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: const {0: FractionColumnWidth(0.25), 1: FractionColumnWidth(0.05), 2: FractionColumnWidth(0.7)},
      // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          // if (_screenprofileResponse?.body?.profileGeneralInfo?.img == null)
          Text(
            title,
            style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
              color:Theme.of(context).appBarTheme.foregroundColor),
          ),
           Text(
            ':',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12,
                color:Theme.of(context).appBarTheme.foregroundColor),
          ),
          Text(
            value,
            textAlign: TextAlign.start,
            style:  TextStyle(fontSize: 12,
                color:Theme.of(context).appBarTheme.foregroundColor),
          ),
        ])
      ],
    ),
  );
}
