import 'package:flutter/material.dart';
import '../../../../customs/common/change_theme_button_widget.dart';
import '../../../../customs/size/size.dart';

changLanguage(
  BuildContext context,
  void Function() toggleLanguageView,
  bool isHidden, {
  required String textLeftTitle,
  required String textRightDetail,
  required tb1,
  required tb2,
  required tb3,
}) {
  return Table(
    border: TableBorder.symmetric(
        outside: const BorderSide(width: 2, color: Colors.transparent)),
    columnWidths: {
      0: FractionColumnWidth(tb1),
      1: FractionColumnWidth(tb2),
      2: FractionColumnWidth(tb3)
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          textLeftTitle,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor,
              fontSize: sizeTextSmaller14,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textRightDetail,
              style: TextStyle(
                  color: Theme.of(context).bottomAppBarColor,
                  fontSize: sizeTextSmaller14,
                  fontWeight: FontWeight.normal),
            ),
            //
            // _toggle(),
            // IconButton(
            //     onPressed: () {
            //       toggleLanguageView();
            //     },
            //     icon: isHidden
            //         ? const Icon(Icons.toggle_on, color: Color(0xFF00A80A))
            //         : const Icon(Icons.toggle_off, color: Color(0xFF4F4F4F))),
            SizedBox(
              width: 40,
              height: 40,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Switch.adaptive(
                  value: isHidden == true?true:false,
                  onChanged: (value) {
                    toggleLanguageView();
                  },
                    activeColor:Colors.green,
                    activeTrackColor:Colors.green,


                ),
              ),
            )

            // IconButton(
            //     onPressed: () {
            //       _isVisible = !_isVisible;
            //     },
            //     icon: _isVisible
            //         ? Icon(Icons.toggle_off, color: Color(0xFF4F4F4F))
            //         : Icon(Icons.toggle_on, color: Color(0xFF00A80A))),
          ],
        ),
      ])
    ],
  );
}

changModeTheme(
  BuildContext context,
  void Function() toggleLanguageView,
  bool isHidden, {
  required String textLeftTitle,
  required String textRightDetail,
  required tb1,
  required tb2,
  required tb3,
}) {
  return Table(
    border: TableBorder.symmetric(
        outside: const BorderSide(width: 0, color: Colors.transparent)),
    columnWidths: {
      0: FractionColumnWidth(tb1),
      1: FractionColumnWidth(tb2),
      2: FractionColumnWidth(tb3)
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: [
      TableRow(children: [
        Text(
          textLeftTitle,
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Theme.of(context).bottomAppBarColor,
              fontSize: sizeTextSmaller14,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textRightDetail,
              style: TextStyle(
                  color: Theme.of(context).bottomAppBarColor,
                  fontSize: sizeTextSmaller14,
                  fontWeight: FontWeight.normal),
            ),
            //
            // _toggle(),
            ChangeThemeButtonWidget(),
            // IconButton(
            //     onPressed: () {
            //       _isVisible = !_isVisible;
            //     },
            //     icon: _isVisible
            //         ? Icon(Icons.toggle_off, color: Color(0xFF4F4F4F))
            //         : Icon(Icons.toggle_on, color: Color(0xFF00A80A))),
          ],
        ),
      ])
    ],
  );
}

// class ChangLanguageFul extends StatefulWidget {
//   final String textLeftTitle;
//   final String textRightDetail;
//   final double tb1;
//   final double tb2;
//   final double tb3;
//
//   const ChangLanguageFul({Key? key,
//     required this.textLeftTitle,
//     required this.textRightDetail,
//     required this.tb1,
//     required this.tb2,
//     required this.tb3}) : super(key: key);
//
//   @override
//   State<ChangLanguageFul> createState() => _ChangLanguageFulState();
// }
//
//
// class _ChangLanguageFulState extends State<ChangLanguageFul> {
//    String _isuserLanguage="EN";
//    bool _isHiddenLanguage=true;
//
//   @override
//   void initState() {
//
//     _getDefaultChangeLanguage();
//
//     // context.read<HomeBloc>().add(HomeScreenInfoEvent(isChangeLanguage:false));
//     super.initState();
//   }
//   _getDefaultChangeLanguage() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _isuserLanguage = prefs.getString('userChangeLanguage')!;
//       if (_isuserLanguage == "TH") {
//         _isHiddenLanguage = true;
//       } else {
//         _isHiddenLanguage = false;
//       }
//     });
//
//   }
//   void _toggleLanguageView() async {
//     final prefs = await SharedPreferences.getInstance();
//     _isuserLanguage = prefs.getString('userChangeLanguage')!;
//     _isuserLanguage =='EN' ? _isuserLanguage = "TH" : _isuserLanguage = "EN";
//
//     setState(
//           () {
//
//       },
//     );
//     context.read<HomeBloc>().add(OnClickChangeLanguageHomeEvent(userLanguage: _isuserLanguage));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Table(
//       border: TableBorder.symmetric(outside: const BorderSide(width: 2, color: Colors.transparent)),
//       columnWidths: {0: FractionColumnWidth(widget.tb1), 1: FractionColumnWidth(widget.tb2), 2: FractionColumnWidth(widget.tb3)},
//       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//       children: [
//         TableRow(children: [
//           Text(
//             widget.textLeftTitle,
//             textAlign: TextAlign.start,
//             style: const TextStyle(fontSize: sizeTextSmaller14, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 widget.textRightDetail,
//                 style: const TextStyle(fontSize: sizeTextSmaller14),
//               ),
//               //
//               // _toggle(),
//               IconButton(
//
//                   onPressed: () {
//
//                     // context.read<HomeBloc>().add(HomeScreenInfoEvent(isChangeLanguage:true));
//                     _toggleLanguageView();
//                   },
//                   icon: _isHiddenLanguage
//                       ? const Icon(Icons.toggle_on, color: Color(0xFF00A80A))
//                       : const Icon(Icons.toggle_off, color: Color(0xFF4F4F4F)))
//               // IconButton(
//               //     onPressed: () {
//               //       _isVisible = !_isVisible;
//               //     },
//               //     icon: _isVisible
//               //         ? Icon(Icons.toggle_off, color: Color(0xFF4F4F4F))
//               //         : Icon(Icons.toggle_on, color: Color(0xFF00A80A))),
//             ],
//           ),
//         ])
//       ],
//     );
//   }
// }
