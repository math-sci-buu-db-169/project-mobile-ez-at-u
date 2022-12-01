/*
 * Copyright (C) 2017, David PHAM-VAN <dev.nfet.net@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../customs/color/pdf_color_const.dart';
import '../../customs/message/text_demo_resume.dart';
import '../data.dart';

const sep = 150.0;

Future<Uint8List> generateResume(
    PdfPageFormat format,
    CustomData data,
    PdfColor colorOfPdfUs,
    PdfColor colorOfPdfUsTwo,
    PdfColor colorOfPdfUsThree) async {
  final doc = pw.Document(title: 'Resume', author: 'EZ@U');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load(isProfileImage)).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format, colorOfPdfUs);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Container(
                    padding: const pw.EdgeInsets.only(left: 0, bottom: 10),
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.SizedBox(width: 10),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('$isName $isLastName',
                                  textScaleFactor: 2,
                                  style: pw.Theme.of(context)
                                      .defaultTextStyle
                                      .copyWith(
                                          fontWeight: pw.FontWeight.bold)),
                              pw.Padding(
                                  padding: const pw.EdgeInsets.only(top: 5)),
                              pw.Text(isPosition,
                                  textScaleFactor: 1.2,
                                  style: pw.Theme.of(context)
                                      .defaultTextStyle
                                      .copyWith(
                                          fontWeight: pw.FontWeight.bold,
                                          color: colorOfPdfUs)),
                              pw.Padding(
                                  padding: const pw.EdgeInsets.only(top: 1)),
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: <pw.Widget>[
                                  pw.Container(
                                    width: 400,
                                    margin: const pw.EdgeInsets.only(left: 5),
                                    child: pw.Column(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: <pw.Widget>[
                                          pw.Row(
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: <pw.Widget>[
                                                pw.Container(
                                                  width: 6,
                                                  height: 6,
                                                  margin:
                                                      const pw.EdgeInsets.only(
                                                          top: 5.5,
                                                          left: 2,
                                                          right: 5),
                                                  decoration: pw.BoxDecoration(
                                                    color: colorOfPdfUs,
                                                    shape: pw.BoxShape.circle,
                                                  ),
                                                ),
                                                pw.Text(isAboutMe,
                                                    style: pw.Theme.of(context)
                                                        .defaultTextStyle
                                                        .copyWith(
                                                            fontWeight: pw
                                                                .FontWeight
                                                                .bold,
                                                            fontSize: 12)),
                                                pw.Spacer(),
                                                // if (icon != null) pw.Icon(icon!, color: colorOfPdfUsTwo, size: 18),
                                              ]),
                                          pw.Container(
                                            decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                    left: pw.BorderSide(
                                                        color: colorOfPdfUs,
                                                        width: 2))),
                                            padding: const pw.EdgeInsets.only(
                                                left: 10, top: 5, bottom: 5),
                                            margin: const pw.EdgeInsets.only(
                                                left: 5),
                                            child: pw.Column(
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: <pw.Widget>[
                                                  pw.Text(isAboutMeValue,
                                                      style:
                                                          pw.Theme.of(context)
                                                              .defaultTextStyle
                                                              .copyWith(
                                                                  fontSize:
                                                                      10)),
                                                ]),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ]),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(10.0),
                            child: pw.Container(
                              width: 100,
                              height: 100,
                              color: colorOfPdfUs,
                              child: pw.Image(profileImage),
                            )),
                        // pw.Row(
                        //   crossAxisAlignment: pw.CrossAxisAlignment.start,
                        //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        //   children: <pw.Widget>[
                        //     pw.Column(
                        //       crossAxisAlignment: pw.CrossAxisAlignment.start,
                        //       children: <pw.Widget>[
                        //         pw.Text(isAboutMe,
                        //             textScaleFactor: 1.2,
                        //             style: pw.Theme.of(context)
                        //                 .defaultTextStyle
                        //                 .copyWith(
                        //                 fontWeight: pw.FontWeight.bold,
                        //                 color: colorOfPdfUs)),
                        //
                        //         pw.Text(isAddress),
                        //         pw.Text(isAddress2),
                        //         pw.Text(isAddress3),
                        //       ],
                        //     ),
                        //     pw.Column(
                        //       crossAxisAlignment: pw.CrossAxisAlignment.start,
                        //       children: <pw.Widget>[
                        //         pw.Text(isPhone),
                        //         _UrlText(isEmail, 'mailto:$isEmail'),
                        //         // _UrlText(
                        //         //     'wholeprices.ca', 'https://wholeprices.ca'),
                        //       ],
                        //     ),
                        //     pw.Padding(padding: pw.EdgeInsets.zero)
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  // pw.Row(
                  //   crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  //   children: <pw.Widget>[
                  //     pw.Column(
                  //       crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //       children: <pw.Widget>[
                  //         pw.Text(isAboutMe,
                  //             textScaleFactor: 1.2,
                  //             style: pw.Theme.of(context)
                  //                 .defaultTextStyle
                  //                 .copyWith(
                  //                 fontWeight: pw.FontWeight.bold,
                  //                 color: colorOfPdfUs)),
                  //
                  //         pw.Text(isAddress),
                  //         pw.Text(isAddress2),
                  //         pw.Text(isAddress3),
                  //       ],
                  //     ),
                  //     // _Block(
                  //     //   title: isAddress,
                  //     //   detail: isAddressValue,
                  //     //   colorOfPdfUs:colorOfPdfUs,
                  //     //   colorOfPdfUsTwo:colorOfPdfUsTwo,
                  //     //   colorOfPdfUsThree:colorOfPdfUsThree,
                  //     // ),
                  //     pw.Padding(padding: pw.EdgeInsets.zero)
                  //   ],
                  // ),

                  _Category(
                    title: 'EXPERIENCE',
                    colorOfPdfUs: colorOfPdfUs,
                    colorOfPdfUsTwo: colorOfPdfUsTwo,
                    colorOfPdfUsThree: colorOfPdfUsThree,
                  ),
                  _Block(
                    title: 'Bachelor Of Commerce',
                    detail: 'Bachelor Interior Design',
                    colorOfPdfUs: colorOfPdfUs,
                    colorOfPdfUsTwo: colorOfPdfUsTwo,
                    colorOfPdfUsThree: colorOfPdfUsThree,
                  ),
                  _Block(
                    title: 'Bachelor Interior Design',
                    detail: 'Bachelor Interior Design',
                    colorOfPdfUs: colorOfPdfUs,
                    colorOfPdfUsTwo: colorOfPdfUsTwo,
                    colorOfPdfUsThree: colorOfPdfUsThree,
                  ),
                  _Category(
                    title: 'Education',
                    colorOfPdfUs: colorOfPdfUs,
                    colorOfPdfUsTwo: colorOfPdfUsTwo,
                    colorOfPdfUsThree: colorOfPdfUsThree,
                  ),
                  _Block(
                    title: isBachelor,
                    detail: '$isBachelorValue     ( $isBachelorValueDate )',
                    colorOfPdfUs: colorOfPdfUs,
                    colorOfPdfUsTwo: colorOfPdfUsTwo,
                    colorOfPdfUsThree: colorOfPdfUsThree,
                  ),
                  _Block(
                    title: isHighSchool,
                    detail: '$isHighSchoolValue     ( $isHighSchoolValueDate )',
                    colorOfPdfUs: colorOfPdfUs,
                    colorOfPdfUsTwo: colorOfPdfUsTwo,
                    colorOfPdfUsThree: colorOfPdfUsThree,
                  ),
                ],
              ),
            ),

            pw.Partition(
                width: sep,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(left: 15),
                  child: pw.Column(
                    children: [
                      pw.Container(
                        height: pageTheme.pageFormat.availableHeight - 5,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Container(
                              height: 150,
                            ),
                            _Category(
                              title: 'CONTACT',
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _BlockOneLine(
                              title: isFacebook,
                              detail: isFacebookValue,
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _BlockOneLine(
                              title: isLine,
                              detail: isLineValue,
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _BlockOneLine(
                              title: isIG,
                              detail: isIGValue,
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _BlockOneLine(
                              title: isEmail,
                              detail: isEmailVAlue,
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _Block(
                              title: isAddress,
                              detail: isAddressValue,
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _Category(
                              title: isCertifications,
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _Block(
                              title: isBachelorValueDate,
                              detail: 'Bachelor Interior Design',
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            _Block(
                              title: isHighSchoolValueDate,
                              detail: 'Bachelor Interior Design',
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            pw.Expanded(child: pw.SizedBox()),
                            _Category(
                              title: 'isSKILLS',
                              colorOfPdfUs: colorOfPdfUs,
                              colorOfPdfUsTwo: colorOfPdfUsTwo,
                              colorOfPdfUsThree: colorOfPdfUsThree,
                            ),
                            pw.Column(children: <pw.Widget>[
                              _Percent(
                                size: 50,
                                value: .9,
                                title: pw.Text(isWord),
                                colorOfPdfUs: colorOfPdfUs,
                                colorOfPdfUsTwo: colorOfPdfUsTwo,
                                colorOfPdfUsThree: colorOfPdfUsThree,
                              ),
                              _Percent(
                                size: 50,
                                value: .7,
                                title: pw.Text(isExcel),
                                colorOfPdfUs: colorOfPdfUs,
                                colorOfPdfUsTwo: colorOfPdfUsTwo,
                                colorOfPdfUsThree: colorOfPdfUsThree,
                              ),
                              _Percent(
                                size: 50,
                                value: .6,
                                title: pw.Text(isPowerPoint),
                                colorOfPdfUs: colorOfPdfUs,
                                colorOfPdfUsTwo: colorOfPdfUsTwo,
                                colorOfPdfUsThree: colorOfPdfUsThree,
                              ),
                              _Percent(
                                size: 50,
                                value: .6,
                                title: pw.Text(isEnglish),
                                colorOfPdfUs: colorOfPdfUs,
                                colorOfPdfUsTwo: colorOfPdfUsTwo,
                                colorOfPdfUsThree: colorOfPdfUsThree,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            // pw.Partition(
            //   width: 100,
            //   child: pw.Column(
            //     children: [
            //       pw.Container(
            //         height: pageTheme.pageFormat.availableHeight -5,
            //         child: pw.Column(
            //           crossAxisAlignment: pw.CrossAxisAlignment.center,
            //           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            //           children: <pw.Widget>[
            //             pw.Container(
            //               width: 100,
            //               height: 100,
            //               color: colorOfPdfUs,
            //               child: pw.Image(profileImage),
            //             ),
            //             pw.Column(children: <pw.Widget>[
            //               _Percent(size: 60, value: .9, title: pw.Text('Word'),
            //                 colorOfPdfUs:colorOfPdfUs,
            //                 colorOfPdfUsTwo:colorOfPdfUsTwo,
            //                 colorOfPdfUsThree:colorOfPdfUsThree,),
            //               _Percent(
            //                   size: 60, value: .7, title: pw.Text('Excel'),
            //                 colorOfPdfUs:colorOfPdfUs,
            //                 colorOfPdfUsTwo:colorOfPdfUsTwo,
            //                 colorOfPdfUsThree:colorOfPdfUsThree,), _Percent(
            //                   size: 60, value: .6, title: pw.Text('PowerPoint'),
            //                 colorOfPdfUs:colorOfPdfUs,
            //                 colorOfPdfUsTwo:colorOfPdfUsTwo,
            //                 colorOfPdfUsThree:colorOfPdfUsThree,),
            //             ]),
            //             // pw.BarcodeWidget(
            //             //   data: 'Parnella Charlesbois',
            //             //   width: 60,
            //             //   height: 60,
            //             //   barcode: pw.Barcode.qrCode(),
            //             //   drawText: false,
            //             // ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(
  PdfPageFormat format,
  PdfColor colorOfPdfUs,
) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      // left: 2.0 * PdfPageFormat.cm,
      // top: 4.0 * PdfPageFormat.cm,
      // right: 2.0 * PdfPageFormat.cm,
      // bottom: 2.0 * PdfPageFormat.cm);
      left: 0.01 * PdfPageFormat.cm,
      top: 0.01 * PdfPageFormat.cm,
      right: 0.01 * PdfPageFormat.cm,
      bottom: 0.01 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              // child: pw.SvgImage(svg: bgShape),
              child: pw.Container(width: 60, height: 850, color: colorOfPdfUs),
              left: 0,
              top: 0,
            ),
            // pw.Positioned(
            //   child: pw.Container(width: 150, height: 850, color: colorOfPdfUs),
            //   right: 0,
            //   bottom: 0,
            // ),
            // pw.Positioned(
            //   child: pw.Transform.rotate(
            //       angle: pi, child: pw.SvgImage(svg: bgShape)),
            //   right: 0,
            //   bottom: 0,
            // ),
          ],
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    required this.detail,
    required this.colorOfPdfUs,
    required this.colorOfPdfUsTwo,
    required this.colorOfPdfUsThree,
    this.icon,
  });

  final String title;
  final String detail;
  final PdfColor colorOfPdfUs;
  final PdfColor colorOfPdfUsTwo;
  final PdfColor colorOfPdfUsThree;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: pw.BoxDecoration(
                    color: colorOfPdfUs,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context).defaultTextStyle.copyWith(
                        fontWeight: pw.FontWeight.bold, fontSize: 12)),
                pw.Spacer(),
                if (icon != null)
                  pw.Icon(icon!, color: colorOfPdfUsTwo, size: 18),
              ]),
          pw.Container(
            decoration: pw.BoxDecoration(
                border: pw.Border(
                    left: pw.BorderSide(color: colorOfPdfUs, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Text(detail,
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(fontSize: 10)),
                ]),
          ),
        ]);
  }
}

class _BlockOneLine extends pw.StatelessWidget {
  _BlockOneLine({
    required this.title,
    required this.detail,
    required this.colorOfPdfUs,
    required this.colorOfPdfUsTwo,
    required this.colorOfPdfUsThree,
    this.icon,
  });

  final String title;
  final String detail;
  final PdfColor colorOfPdfUs;
  final PdfColor colorOfPdfUsTwo;
  final PdfColor colorOfPdfUsThree;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: pw.BoxDecoration(
                    color: colorOfPdfUs,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context).defaultTextStyle.copyWith(
                        fontWeight: pw.FontWeight.bold, fontSize: 12)),
                pw.Padding(
                    padding: pw.EdgeInsets.only(left: 10),
                    child: pw.Text(detail,
                        style: pw.Theme.of(context)
                            .defaultTextStyle
                            .copyWith(fontSize: 10))),
                pw.Spacer(),
                if (icon != null)
                  pw.Icon(icon!, color: colorOfPdfUsTwo, size: 18),
              ]),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({
    required this.title,
    required this.colorOfPdfUs,
    required this.colorOfPdfUsTwo,
    required this.colorOfPdfUsThree,
  });

  final String title;
  final PdfColor colorOfPdfUs;
  final PdfColor colorOfPdfUsTwo;
  final PdfColor colorOfPdfUsThree;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: pw.BoxDecoration(
        color: colorOfPdfUs,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 10),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        style: pw.Theme.of(context)
            .defaultTextStyle
            .copyWith(fontWeight: pw.FontWeight.bold),
        textScaleFactor: 1,
      ),
    );
  }
}

class _PercentCircularProgress extends pw.StatelessWidget {
  _PercentCircularProgress({
    required this.size,
    required this.value,
    required this.title,
    required this.colorOfPdfUs,
    required this.colorOfPdfUsTwo,
    required this.colorOfPdfUsThree,
  });

  final double size;

  final double value;

  final pw.Widget title;
  final PdfColor colorOfPdfUs;
  final PdfColor colorOfPdfUsTwo;
  final PdfColor colorOfPdfUsThree;

  static const fontSize = 1.2;

  PdfColor get color => colorOfPdfUs;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 65.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
    required this.colorOfPdfUs,
    required this.colorOfPdfUsTwo,
    required this.colorOfPdfUsThree,
  });

  final double size;

  final double value;

  final pw.Widget title;
  final PdfColor colorOfPdfUs;
  final PdfColor colorOfPdfUsTwo;
  final PdfColor colorOfPdfUsThree;

  static const fontSize = 1.2;

  PdfColor get color => colorOfPdfUs;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.LinearProgressIndicator(
        value: value,
        backgroundColor: backgroundColor,
        minHeight: 5,
      ),
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
