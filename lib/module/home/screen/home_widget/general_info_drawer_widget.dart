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
    border: TableBorder.symmetric(
        outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {
      0: FractionColumnWidth(tb1),
      1: FractionColumnWidth(tb2),
      2: FractionColumnWidth(tb3)
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.top,
    children: [
      TableRow(children: [
        underline
            ? Text(
                textLeftTitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Theme.of(context).bottomAppBarColor,
                    fontSize: sizeTextSmaller14,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                textLeftTitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Theme.of(context).bottomAppBarColor,
                    fontSize: sizeTextSmaller14,
                    fontWeight: FontWeight.bold),
              ),
        const SizedBox(),
        Text(
          textRightDetail,
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor,
              fontSize: sizeTextSmaller14,
              fontWeight: FontWeight.normal),
        ),
      ])
    ],
  );
}

buildTableDrawerTwoTableIcons(
  BuildContext context, {
  required textLeftTitle,
  required String textRightDetail,
  required bool textDelete,
  required double tb1,
  required double tb2,
  required double tb3,
  required bool underline,
  required Icon leftIcon,
}) {
  return Table(
    border: TableBorder.symmetric(
        outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {
      0: FractionColumnWidth(tb1),
      1: FractionColumnWidth(tb2),
      2: FractionColumnWidth(tb3)
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.top,
    children: [
      TableRow(children: [
        leftIcon,
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: underline
              ? Text(
                  textLeftTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: textDelete == true
                          ? Theme.of(context).bottomAppBarColor == Colors.black?Colors.red:Colors.red.withOpacity(0.5)
                          : Theme.of(context).bottomAppBarColor,
                      fontSize: sizeTextSmaller14,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                )
              : Text(
                  textLeftTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: textDelete == true
                          ? Theme.of(context).bottomAppBarColor == Colors.black?Colors.red:Colors.red.withOpacity(0.5)
                          : Theme.of(context).bottomAppBarColor,
                      fontSize: sizeTextSmaller14,
                      fontWeight: FontWeight.bold),
                ),
        ),
        Text(
          textRightDetail,
          textAlign: TextAlign.end,
          style: TextStyle(
              color: textDelete == true
                  ? Colors.red.withOpacity(0.8)
                  : Theme.of(context).bottomAppBarColor,
              fontSize: sizeTextSmaller14,
              fontWeight: FontWeight.normal),
        ),
      ])
    ],
  );
}
