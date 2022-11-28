import 'package:ez_at_u/module/home/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_preferences.dart';
import '../size/size.dart';
dialogThemeMode(BuildContext context, {required List<String> optionsThemeMode,
  required Null Function(int optionSearchResult) callbackFromOptionThemeMode})
{
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
            padding:
            const EdgeInsets.fromLTRB(0, 5, 0, 5),
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(
                  optionsThemeMode.length,
                      (index) => Column(
                    children: [

                      InkWell(
                          onTap: () {
                            setThemeModeApp( intMode: index,);
                            callbackFromOptionThemeMode(index);
                            // Navigator.pop(context);

                            // iniGetThemeMode();
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));

                          },
                          child:Padding(
                            padding: EdgeInsets.all(10),
                            child: Table(
                              border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
                              columnWidths: {0: FractionColumnWidth(1)},
                              defaultVerticalAlignment: TableCellVerticalAlignment.top,
                              children: [
                                TableRow(children: [
                                  Text(
                                    optionsThemeMode[index].toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: sizeTextSmaller14),
                                  ),
                                ])
                              ],
                            ),
                          )
                      ),
                      index > 1 || index == optionsThemeMode.length-1
                          ? const SizedBox()
                          : const Divider(
                        color: Colors.grey,
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),

                    ],
                  )
              ),
            )
        )
    );

      }
      );
}