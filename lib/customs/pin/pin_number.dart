
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PinNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder  ;
  const PinNumber({Key? key, required this.textEditingController, required this.outlineInputBorder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.0,
      height: 20.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration:  InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.transparent.withOpacity(0.5),

        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white
        ),

      ),
    );
  }
}

class KeyBoarNumber extends StatelessWidget {
  final int n;
  final Function() onPressed ;
  const KeyBoarNumber({Key? key, required this.n, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent.withOpacity(0.3),

      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),

        ),
        height: 90.0,
        child: Text(
          n.toString(),
              textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24*MediaQuery.of(context).textScaleFactor,
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}
