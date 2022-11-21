import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/size/size.dart';

contactThreeRow(
    { required BuildContext context,
  required String title,
  required String textCenter,
  required String value,
  required double sizeColumnOne,
  required double sizeColumnTwo,
  required double sizeColumnThree,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 0.0, bottom: 0.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 0, color: Colors.transparent)),
      columnWidths: const {0: FractionColumnWidth(0.2), 1: FractionColumnWidth(0.65), 2: FractionColumnWidth(0.15)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Text(
            title,
            style:  TextStyle(fontSize: sizeTextSmall16, fontWeight: FontWeight.bold,
                color: Theme.of(context).appBarTheme.foregroundColor),),
          Text(
            value,
            textAlign: TextAlign.start,
            style:  TextStyle(fontSize: sizeTextSmaller14,
                color: Theme.of(context).appBarTheme.foregroundColor),
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
        ])
      ],
    ),
  );
}

contactUnderlineOneRow({
  required BuildContext context,
  required String title,
  required double sizeColumnOne,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 0.0, bottom: 5.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {
        0: FractionColumnWidth(sizeColumnOne),
      },
      children: [
        TableRow(children: [
          Text(
            title,
            style:  TextStyle(
                fontSize: sizeTextSmall16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Theme.of(context).appBarTheme.foregroundColor),
          ),
        ])
      ],
    ),
  );
}

contactOneRow({
  required String title,
  required double sizeColumnOne, required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 0.0, bottom: 5.0),
    child: Table(
      border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
      columnWidths: {
        0: FractionColumnWidth(sizeColumnOne),
      },
      children: [
        TableRow(children: [
          Text(
            title,
            style:  TextStyle(
              fontSize: sizeTextSmall16,
              fontWeight: FontWeight.bold,
                color: Theme.of(context).appBarTheme.foregroundColor),
  ),
            
         
        ])
      ],
    ),
  );
}
