import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_link/text_link_otp_custom.dart';

class CountTimeOTPWidget extends StatefulWidget {
  final TextSendOTPCustom sendOTP;
  final CustomTimerController controller;
  const CountTimeOTPWidget({
    Key? key,
    required this.sendOTP,
    required this.controller,
  }) : super(key: key);

  @override
  State<CountTimeOTPWidget> createState() => _CountTimeOTPWidgetState();
}

class _CountTimeOTPWidgetState extends State<CountTimeOTPWidget> {
  // @override
  // void dispose() {
  //   widget.controller.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTimer(
          controller: widget.controller,
          begin: const Duration(minutes: 3),
          end: const Duration(minutes: 0),
          builder: (CustomTimerRemainingTime remaining) {
            return (int.parse(remaining.minutes) <= 1)
                ? (int.parse(remaining.minutes) == 0 && int.parse(remaining.seconds) == 0)
                    ? Center(
                        child: widget.sendOTP,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "${remaining.minutes}:${remaining.seconds}",
                              style: const TextStyle(fontSize: sizeTextSmall16),
                            ),
                          ),
                          widget.sendOTP,
                        ],
                      )
                : Center(
                    child: Text(
                      "${remaining.minutes}:${remaining.seconds}",
                      style: const TextStyle(fontSize: sizeTextSmall16),
                    ),
                  );
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
