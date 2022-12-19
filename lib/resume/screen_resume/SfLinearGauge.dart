// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class SfLinearGaugePP extends StatefulWidget {
//   const SfLinearGaugePP({Key? key}) : super(key: key);
//
//   @override
//   State<SfLinearGaugePP> createState() => _SfLinearGaugePPState();
// }
//
// class _SfLinearGaugePPState extends State<SfLinearGaugePP> {
//   double widgetPointerValue = 26;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           body: Center(
//               child: Column(
//                   children: [
//                     Text("${widgetPointerValue.toStringAsFixed(0)}",),
//                     SizedBox(height: 25),
//                     SfLinearGauge(
//                       axisTrackStyle: LinearAxisTrackStyle(
//                           thickness: 10
//                       ),
//                       markerPointers: [
//                         LinearShapePointer(
//                             value: widgetPointerValue,
//                             shapeType: LinearShapePointerType.invertedTriangle,
//                             position: LinearElementPosition.cross,
//                             onChanged: (value) {
//                               setState(() {
//                                 widgetPointerValue = value;
//                               });
//                             },
//                             color: widgetPointerValue < 40
//                                 ?  Colors.red
//                                 : widgetPointerValue < 80
//                                 ? Colors.orange
//                                 :Colors.green
//                         ),
//                         LinearWidgetPointer(
//                           value: widgetPointerValue,
//                           onChanged: (value) {
//                             setState(() {
//                               widgetPointerValue = value;
//                             });
//                           },
//                           child: Container(
//                             width: 55,
//                             height: 45,
//                             child: Center(
//                               child: Text(
//                                 widgetPointerValue.toStringAsFixed(0),
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 20,
//                                     color: widgetPointerValue < 40
//                                         ? Colors.red
//                                         : widgetPointerValue < 80
//                                         ? Colors.orange
//                                         : Colors.green
//                                 ),
//                               ),
//                             ),
//                           ),
//                           position: LinearElementPosition.outside,
//                         ),
//                       ],
//                       ranges: [
//                         LinearGaugeRange(
//                             endValue: widgetPointerValue,
//                             color: widgetPointerValue < 40
//                                 ? Colors.red
//                                 : widgetPointerValue < 80
//                                 ? Colors.orange
//                                 : Colors.green,
//                             position: LinearElementPosition.cross)
//                       ],
//                     ),
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.center
//               )),
//         )
//     );
//   }
// }
