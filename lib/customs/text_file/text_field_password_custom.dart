import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldPasswordCustom extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;

  final IconData iconsFile;
  const TextFieldPasswordCustom({
    Key? key,
    this.textEditingController,
    required this.hintLabel,
    this.onChanged,
    required this.textInputType,
    this.initialvalue,
    required this.iconsFile,
  }) : super(key: key);
  @override
  State<TextFieldPasswordCustom> createState() =>
      _TextFieldPasswordCustomState();
}

class _TextFieldPasswordCustomState extends State<TextFieldPasswordCustom> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
        // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          style:  TextStyle(
              fontSize: sizeText18, color: Theme.of(context).bottomAppBarColor, // height: 2.0,
              ),
          cursorColor: Theme.of(context).appBarTheme.foregroundColor,
          keyboardType: widget.textInputType,
          // controller: textEditingController,
          initialValue: widget.initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: widget.onChanged,
          obscureText: !_isVisible,
          decoration: InputDecoration(
              filled: true,
              fillColor:   Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: widget.hintLabel,
              prefixIcon: Icon(
                widget.iconsFile,
                color: Theme.of(context).iconTheme.color,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ?  Icon(FontAwesomeIcons.eye,size:15, color:Theme.of(context).iconTheme.color)
                      :  Icon(FontAwesomeIcons.eyeSlash,size:15,
                          color: Theme.of(context).iconTheme.color)),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Theme.of(context).bottomAppBarColor, width: 2.0),
              )),
        ));
  }
}
