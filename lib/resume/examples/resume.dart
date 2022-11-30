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

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../customs/message/text_demo_resume.dart';
import '../data.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 150.0;

Future<Uint8List> generateResume(PdfPageFormat format, CustomData data) async {
  final doc = pw.Document(title: 'Resume', author: 'David PHAM-VAN');

  final profileImage = pw.MemoryImage(
    (await rootBundle.load(isProfileImage)).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

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
                    padding: const pw.EdgeInsets.only(left: 10, bottom: 10),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Text('$isName $isLastName',
                            textScaleFactor: 2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: pw.FontWeight.bold)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                        pw.Text('Electrotyper',
                            textScaleFactor: 1.2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    color: green)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text(isAddress),
                                pw.Text(isAddress2),
                                pw.Text(isAddress3),
                              ],
                            ),
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text('+1 403-721-6898'),
                                _UrlText(isEmail, 'mailto:$isEmail'),
                                // _UrlText(
                                //     'wholeprices.ca', 'https://wholeprices.ca'),
                              ],
                            ),
                            pw.Padding(padding: pw.EdgeInsets.zero)
                          ],
                        ),
                      ],
                    ),
                  ),
                  _Category(title: 'CONTACT'),
                  _BlockOneLine(
                    title: isFacebook,
                    detail: isFacebookValue,
                  ),
                  _BlockOneLine(
                    title: isLine,
                    detail: isLineValue,
                  ),
                  _BlockOneLine(
                    title: isIG,
                    detail: isIGValue,
                  ),
                  _Category(title: 'Education'),
                  _Block(
                    title: isBachelor,
                    detail: '$isBachelorValue     ( $isBachelorValueDate )',
                  ),
                  _Block(
                    title: isHighSchool,
                    detail:  '$isHighSchoolValue     ( $isHighSchoolValueDate )',
                  ),
                  _Category(title: 'SKILLS'),
                  _Block(
                    title: 'Bachelor Of Commerce',
                    detail: 'Bachelor Interior Design',
                  ),
                  _Block(
                    title: 'Bachelor Interior Design',
                    detail: 'Bachelor Interior Design',
                  ),
                  _Category(title: 'EXPERIENCE'),
                  _Block(
                    title: 'Bachelor Of Commerce',
                    detail: 'Bachelor Interior Design',
                  ),
                  _Block(
                    title: 'Bachelor Interior Design',
                    detail: 'Bachelor Interior Design',
                  ),
                ],
              ),
            ),
            pw.Partition(
              width: sep,
              child: pw.Column(
                children: [
                  pw.Container(
                    height: pageTheme.pageFormat.availableHeight -5,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.Container(
                          width: 100,
                          height: 100,
                          color: lightGreen,
                          child: pw.Image(profileImage),
                        ),
                        pw.Column(children: <pw.Widget>[
                          _Percent(size: 60, value: .9, title: pw.Text('Word')),
                          _Percent(
                              size: 60, value: .7, title: pw.Text('Excel')), _Percent(
                              size: 60, value: .6, title: pw.Text('PowerPoint')),
                        ]),
                        // pw.BarcodeWidget(
                        //   data: 'Parnella Charlesbois',
                        //   width: 60,
                        //   height: 60,
                        //   barcode: pw.Barcode.qrCode(),
                        //   drawText: false,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      // left: 2.0 * PdfPageFormat.cm,
      // top: 4.0 * PdfPageFormat.cm,
      // right: 2.0 * PdfPageFormat.cm,
      // bottom: 2.0 * PdfPageFormat.cm);
      left:0.1 * PdfPageFormat.cm,
      top:0.1 * PdfPageFormat.cm,
      right:0.1 *  PdfPageFormat.cm,
      bottom:0.1 *  PdfPageFormat.cm);
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
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
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
    this.icon,
  });

  final String title;
  final String detail;

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
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context).defaultTextStyle.copyWith(
                        fontWeight: pw.FontWeight.bold, fontSize: 12)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
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
    this.icon,
  });

  final String title;
  final String detail;

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
                  decoration: const pw.BoxDecoration(
                    color: green,
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
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
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

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

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
