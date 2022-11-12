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
        // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          style: const TextStyle(
              fontSize: sizeText18, color: Colors.black // height: 2.0,
              ),
          cursorColor: Colors.black,
          keyboardType: widget.textInputType,
          // controller: textEditingController,
          initialValue: widget.initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: widget.onChanged,
          obscureText: !_isVisible,
          decoration: InputDecoration(
              filled: true,
              fillColor: tcTextfile,
              hintText: widget.hintLabel,
              prefixIcon: Icon(
                widget.iconsFile,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? const Icon(FontAwesomeIcons.eye,size:20, color: Color(0xFF4F4F4F))
                      : const Icon(FontAwesomeIcons.eyeSlash,size:20,
                          color: Color(0xFF4F4F4F))),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: tcHint),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: fcBlue, width: 2.0),
              )),
        ));
  }
}
