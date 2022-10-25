import 'package:flutter/material.dart';

class ButtonCustom1 extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const ButtonCustom1({Key? key, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(14)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
      child: Text(label),
    );
  }
}
