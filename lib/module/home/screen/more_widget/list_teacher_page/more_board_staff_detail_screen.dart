import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../customs/progress_dialog.dart';
import '../../../../../customs/size/size.dart';
import '../../../bloc/more_bloc/more_bloc.dart';

class MoreBoardStaffDetailScreen extends StatelessWidget {
  final String name;
  final String lastName;
  final String position;
  final String phone;
  final String email;
  final String titleName;
  final String titlePosition;
  final String titlePhone;
  final String titleEmail;
  final String img;
  const MoreBoardStaffDetailScreen({
    Key? key,
    required this.name,
    required this.position,
    required this.phone,
    required this.email,
    required this.img,
    required this.titleName,
    required this.titlePosition,
    required this.titlePhone,
    required this.titleEmail,
    required this.lastName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreBloc(),
        child: MoreBoardStaffDetailPage(
          name: name,
          position: position,
          phone: phone,
          email: email,
          img: img,
          titleName: titleName,
          titlePosition: titlePosition,
          titlePhone: titlePhone,
          titleEmail: titleEmail,
          lastName: lastName,
        ));
  }
}

class MoreBoardStaffDetailPage extends StatefulWidget {
  final String name;
  final String lastName;
  final String position;
  final String phone;
  final String email;
  final String titleName;
  final String titlePosition;
  final String titlePhone;
  final String titleEmail;
  final String img;
  const MoreBoardStaffDetailPage({
    Key? key,
    required this.name,
    required this.position,
    required this.phone,
    required this.email,
    required this.img,
    required this.titleName,
    required this.titlePosition,
    required this.titlePhone,
    required this.titleEmail,
    required this.lastName,
  }) : super(key: key);

  @override
  State<MoreBoardStaffDetailPage> createState() =>
      _MoreBoardStaffDetailPageState();
}

class _MoreBoardStaffDetailPageState extends State<MoreBoardStaffDetailPage>
    with ProgressDialog {
  // ScreenMoreBoardTeacherResponse? _screenHomeMoreBoardTeacherResponse;

  @override
  Widget build(BuildContext context) {
    String name = widget.name;
    String lastname = widget.lastName;
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: sizeTitle24,
                color: Theme.of(context).bottomAppBarColor,
              ),
            ),
            title: Text(
              '$name  $lastname ',
              style: TextStyle(
                color: Theme.of(context).bottomAppBarColor,
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
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .appBarTheme
                        .foregroundColor
                        ?.withOpacity(0.1),
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
                      _buildStaffDetail(
                          context: context,
                          title: widget.titleName,
                          value: '$name  $lastname '),
                      _buildStaffDetail(
                          context: context,
                          title: widget.titlePosition,
                          value: widget.position),
                      _buildStaffDetail(
                          context: context,
                          title: widget.titlePhone,
                          value: widget.phone),
                      _buildStaffDetail(
                          context: context,
                          title: widget.titleEmail,
                          value: widget.email),
                      const SizedBox(
                        height: 30,
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         _launched = _launchInBrowser(Uri.parse("https://sites.google.com/go.buu.ac.th/apisitp"));
                      //       });
                      //     },
                      //     child: Center(
                      //       child: Text(" > "+
                      //           "รายละเอียดเพิ่มเติม"+ " < ",
                      //         style: TextStyle(
                      //           fontSize: 14,
                      //           color: Colors.blue,
                      //         ),
                      //       ),
                      //     )),
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
                                  image: const AssetImage(
                                      'assets/logo/profile.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.grey.withOpacity(0.5),
                                      BlendMode.dstATop),
                                ),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/logo/profile.png'),
                                  ),
                                ),
                              ))
                          : Container(
                              height: 110,
                              width: 110,
                              margin: const EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: MemoryImage(base64Decode(
                                      base64.normalize(widget.img))),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: ClipRRect(
                                // make sure we apply clip it properly
                                borderRadius:
                                    BorderRadius.circular(100), // Image border
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(40),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      color: Colors.grey.withOpacity(0.1),
                                      alignment: Alignment.center,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: MemoryImage(base64Decode(
                                                base64.normalize(widget.img))),
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

_buildStaffDetail(
    {required BuildContext context,
    required String title,
    required String value}) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 20.0, right: 10.0, top: 6.0, bottom: 6.0),
    child: Table(
      border: TableBorder.symmetric(
          outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: const {
        0: FractionColumnWidth(0.25),
        1: FractionColumnWidth(0.05),
        2: FractionColumnWidth(0.7)
      },
      // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
          Text(
            ':',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
          Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ])
      ],
    ),
  );
}
