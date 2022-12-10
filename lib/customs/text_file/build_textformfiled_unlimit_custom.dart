import 'package:ez_at_u/customs/size/size.dart';
import 'package:flutter/material.dart';

import '../color/color_const.dart';

class BuildTextformfieldUnlimitCustom extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  final IconData iconsFile;
  const BuildTextformfieldUnlimitCustom(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue, required this.iconsFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // padding: EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          textInputAction: TextInputAction.newline,
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: sizeText18, color: appBarforegroundColor // height: 2.0,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          // controller: textEditingController,
          initialValue: initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: onChanged,
          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
            prefixIcon: Icon(iconsFile, color: appBarforegroundColor,),
              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 2.0),
              )),
        ));
  }
}

class BuildTextFormFieldUnLimitCustomResume extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  final IconData iconsFile;
  const BuildTextFormFieldUnLimitCustomResume(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue, required this.iconsFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // padding: EdgeInsets.all(12),

        margin: const EdgeInsets.all(5),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          textInputAction: TextInputAction.newline,
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: 12, color: appBarforegroundColor,  /// height: 2.0,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          // controller: textEditingController,
          initialValue: initialvalue,

          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: onChanged,
          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
              prefixIcon: Icon(iconsFile, color: appBarforegroundColor,size: 20,),
              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              labelText: "$hintLabel",

              labelStyle: TextStyle(
                  color: appBarforegroundColor,
                  fontSize:16,
                  letterSpacing: 2
              ),
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 2.0),
              )),
        ));
  }
}

class BuildTextFormFieldUnLimitCustomNotIconsReadOnly extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  const BuildTextFormFieldUnLimitCustomNotIconsReadOnly(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // padding: EdgeInsets.all(12),

        margin: const EdgeInsets.all(5),
        child: TextFormField(

          readOnly: true,
          textInputAction: TextInputAction.newline,
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: 12, color: appBarforegroundColor,  // height: 2.0,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          initialValue: initialvalue,
          onChanged: onChanged,
          decoration: InputDecoration(

              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.transparent ),
              )),
        ));
  }
}
class BuildTextFormFieldUnLimitCustomNotIcons extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  final int? maxLength;
  const BuildTextFormFieldUnLimitCustomNotIcons(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue, this.
  maxLength,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // padding: EdgeInsets.all(12),

        margin: const EdgeInsets.all(5),
        child: TextFormField(
          maxLength: maxLength,
          readOnly: false,
          textInputAction: TextInputAction.newline,
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: 12, color: appBarforegroundColor,  // height: 2.0,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          initialValue: initialvalue,
          onChanged: onChanged,
          decoration: InputDecoration(

              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor.withOpacity(0.3), width: 1.0),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 1.0),
              )),
        ));
  }
}

class BuildTextFormFieldNotLimitCustomCheckboxReadOnly extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
   final bool isChecked;
  final    Function(bool? value) isCheckedSetState;
  const BuildTextFormFieldNotLimitCustomCheckboxReadOnly(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue,  required this.isChecked, required this.isCheckedSetState})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Theme.of(context).bottomAppBarColor;
    }

    return Container(
      // padding: EdgeInsets.all(12),

        margin: const EdgeInsets.all(5),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(

          readOnly: true,
          textInputAction: TextInputAction.newline,
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: 12, color: appBarforegroundColor, // height: 2.0,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          // controller: textEditingController,
          initialValue: initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: onChanged,
          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
              // prefixIcon: Icon(iconsFile, color: appBarforegroundColor,),
              suffixIcon:
              Checkbox(
                checkColor: Theme.of(context).primaryColor ,
                fillColor: MaterialStateProperty.resolveWith(
                    getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  isCheckedSetState(value);
                },
              ),
              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.transparent ),
              )),
        ));
  }
}

class BuildTextformFieldUnLimitCustomNotIcons extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  const BuildTextformFieldUnLimitCustomNotIcons(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    return Container(
      // padding: EdgeInsets.all(12),

        margin: const EdgeInsets.all(5),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(

          readOnly: false,
          textInputAction: TextInputAction.newline,
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: sizeText18, color: appBarforegroundColor // height: 2.0,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          initialValue: initialvalue,
          onChanged: onChanged,
          decoration: InputDecoration(

              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 2.0),
              )),
        ));
  }
}

class BuildTextformfieldNotlimitCustomCheckbox extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintLabel;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? initialvalue;
  final bool isChecked;
  final    Function(bool? value) isCheckedSetState;
  const BuildTextformfieldNotlimitCustomCheckbox(
      {Key? key, this.textEditingController, required this.hintLabel, this.onChanged, required this.textInputType, this.initialvalue,  required this.isChecked, required this.isCheckedSetState})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    Color? appBarBackgroundColor = Theme.of(context).appBarTheme.backgroundColor??Colors.white;
    Color? appBarforegroundColor = Theme.of(context).appBarTheme.foregroundColor??Colors.black;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Theme.of(context).bottomAppBarColor;
    }

    return Container(
      // padding: EdgeInsets.all(12),

        margin: const EdgeInsets.all(5),
        // decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(

          readOnly: false,
          textInputAction: TextInputAction.newline,
          cursorColor: appBarforegroundColor,
          style: TextStyle(fontSize: sizeText18, color: appBarforegroundColor // height: 2.0,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          // controller: textEditingController,
          initialValue: initialvalue,
          // decoration: InputDecoration.collapsed(hintText: hint_label), style: TextStyle(fontSize: 18)
          onChanged: onChanged,
          // {
          //   onChangedtest!(value);
          //   print(hint_label + "    :" + value);
          // },
          decoration: InputDecoration(
            // prefixIcon: Icon(iconsFile, color: appBarforegroundColor,),
              suffixIcon:
              Checkbox(
                checkColor: Theme.of(context).primaryColor ,
                fillColor: MaterialStateProperty.resolveWith(
                    getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  isCheckedSetState(value);
                },
              ),
              filled: true,
              fillColor: Theme.of(context).primaryColor == Colors.black ?fillColorDark:fillColorLight,
              hintText: " $hintLabel",
              enabledBorder:   OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent ),
                borderRadius:const BorderRadius.all(Radius.circular(10)),
              ),
              contentPadding:  const EdgeInsets.all(10),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color:  Theme.of(context).bottomAppBarColor, width: 2.0),
              )),
        ));
  }
}

