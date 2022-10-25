import 'package:flutter/material.dart';
import '../../../../customs/size/size.dart';

buildTableDrawerTwoTable(
  BuildContext context, {
  required textLeftTitle,
  required String textRightDetail,
  required double tb1,
  required double tb2,
  required double tb3,
  required bool underline,
}) {
  return Table(
    border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {0: FractionColumnWidth(tb1), 1: FractionColumnWidth(tb2), 2: FractionColumnWidth(tb3)},
    defaultVerticalAlignment: TableCellVerticalAlignment.top,
    children: [
      TableRow(children: [
        underline
            ? Text(
                textLeftTitle,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: sizeTextSmaller14, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
              )
            : Text(
                textLeftTitle,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
              ),
        const SizedBox(),
        Text(
          textRightDetail,
          textAlign: TextAlign.end,
          style: const TextStyle(fontSize: sizeTextSmaller14),
        ),
      ])
    ],
  );
}
