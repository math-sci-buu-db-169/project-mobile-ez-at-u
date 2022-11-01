import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

buildCardBoard(BuildContext context, {VoidCallback? onTap, required String title, required iconBoard}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 8,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          // height: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: transparent),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    // Icon(
                    //   Icons.auto_stories_rounded,
                    //   color: IconBoarder,
                    //   size: MediaQuery.of(context).size.width * 0.2,
                    // ),
                    ShaderMask(
                      shaderCallback: (bounds) => const RadialGradient(
                        center: Alignment(0.2, -0.6),
                        radius: 0.5,
                        colors: [
                          Color(0xFF0033B2),
                          Color(0xFF001B60),
                        ],
                        // tileMode: TileMode.clamp,
                        stops: <double>[0.1, 2.6],
                      ).createShader(bounds),
                      child: Icon(
                        iconBoard,
                        size: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ))),
    ),
  );
}

buildCardMore({
  VoidCallback? onTap,
  required String title,

  required BuildContext context,
  required IconData iconsFile,


}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
      child:
          // Container(
          //   padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: TC_White),
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * 0.1,
          Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        child: Container(
          margin: const EdgeInsets.all(1),
          // padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(
            color: const Color(0xFF94CCF9),
            border: Border.all(
              color: transparent,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(12.0),
            gradient: const LinearGradient(stops: [
              0.02,
              0.02,
              0.94
            ], colors: [
              // Color(0xFF000000),
              Colors.white,
              Colors.white,
              // Color(0xFFCECECE),
              Colors.white,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 5,),
                  Icon(
                    iconsFile,
                    color: tcBlack,
                    size: 40,
                  ),
                  Text(
                    "    $title",
                    style: const TextStyle(fontSize: 20, color: tcBlack),
                  ),

                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: tcBlack,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

buildCardStudent(BuildContext context, {VoidCallback? onTap, required String title, required String imgeStudent}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 8,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          // height: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: transparent),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    // Icon(
                    //   Icons.auto_stories_rounded,
                    //   color: IconBoarder,
                    //   size: MediaQuery.of(context).size.width * 0.2,
                    // ),
                    ShaderMask(
                      shaderCallback: (bounds) => const RadialGradient(
                        center: Alignment(0.2, -0.6),
                        radius: 0.5,
                        colors: [
                          Color(0xFF0033B2),
                          Color(0xFF001B60),
                        ],
                        // tileMode: TileMode.clamp,
                        stops: <double>[0.1, 2.6],
                      ).createShader(bounds),
                      child: Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.width * 0.2,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: sizeTextBig20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ))),
    ),
  );
}

buildCardSocial(BuildContext context, {VoidCallback? onTap, required String title, required iconSocial, required Color colorOne, required Color colorTwo}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: Container(
          // width: MediaQuery.of(context).size.width * 0.2,
          // height: MediaQuery.of(context).size.width * 0.3,
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: transparent),
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  children: [
                    // Icon(
                    //   Icons.auto_stories_rounded,
                    //   color: IconBoarder,
                    //   size: MediaQuery.of(context).size.width * 0.2,
                    // ),
                    ShaderMask(
                      shaderCallback: (bounds) =>  RadialGradient(
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
                        size: MediaQuery.of(context).size.width * 0.1,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: sizeTextSmaller14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ))),
    ),
  );
}
