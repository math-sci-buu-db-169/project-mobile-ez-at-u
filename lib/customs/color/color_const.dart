import 'dart:ui';
import 'package:flutter/material.dart';


const colorBoxDotted = Color(0xFFEBEBEB);
const colorDottedBorder= Color(0xFFFFFF00);
const colorBoxOne = Color(0xFFFFFF00);
const colorBoxTwo = Color(0xFFFFFFFF);
const tcRegiter = Color(0xfff79c4f);
const tcForgot = Color(0xFF737373);
const tcForgotTwo = 0xFF0647FD;
const tcWhite = Color(0xFFFFFFFF);
const tcBlack = Color(0xFF000000);
const tcHint = Color(0xFFAFAFAF);
const tcOTPSent = Color(0xFF5E5E6B);
const tcButtonGreen = Color(0xFFA5D6A7);
const tcButtonRed = Color(0xFFEF9A9A);
const tcButtonADD = Color(0xFF474554);
const tcButtonLogin = Color(0xFF737373);
const tcButtonTextWhite = Color(0xFFFFFFFF);
const tcButtonTextBlack = Color(0xFF474554);
const tcButtonTextColor = Color(0xFF000000);
const tcButtonLine =  Color(0xFF00B900);
const tcButtonLineTwo =  Color(0xFF4CC764);
const tcButtonTextRed = Color(0xFFFF8F8F);
const tcButtonTextBoarder = Color(0xFF4F4F4F);
const tcButtonTextRedBoarder = Color(0xFFFCA6A6);
const bcButtonLogout = Color(0xFFFA6C6C);
const bcButtonDelete = Color(0xFFFA6C6C);
const bscBlack = Color(0xFF6F6C7A);
const bscTransparent = Color(0x00000000);
const tcTextfile = Color(0xFFFFFFFF);
const fcBlue = Color(0xFF0647FD);
const transparent = Color(0x0);
const backgroundAppBar = Color(0xFFFFFFFF);
const backgroundDawer = Color(0xFFD7DBFF);
const circleprogresscolor = Color(0xFFF73D93);
const iconBoarder = Color(0xFF000000);
const tcNoActivity = Color(0xFF6A6775);
String drawerColor = "#FFF7FD";
const contactUsMath = Color(0xFF050000);
const contactUsFaulty = Color(0xFFFFEA11);
const fillColorDark = Color(0xFF1F222A);
const fillColorLight = Color(0xFFFAFAFA);
const fillColorLight2 = Colors;
List<int>  pointerColorList =[0xFFCC2C32,0xFFE54B2F,0xFFEB552A,0xFFF2AB3C, 0xFFF1C249, 0xFFEFCE45,0xFFF8E64D,0xFFE6CF45,0xFFC3D846,0xFF69B434];
widgetPointerValueColor(double pointerValue)  {
  Color colorP;

  colorP = pointerValue < 10
      ? Color(pointerColorList[0])
      : pointerValue < 20
      ? Color(pointerColorList[1])
      : pointerValue < 30
      ? Color(pointerColorList[2])
      : pointerValue < 40
      ? Color(pointerColorList[3])
      : pointerValue < 50
      ? Color(pointerColorList[4])
      :pointerValue < 60
      ? Color(pointerColorList[5])
      :pointerValue < 70
      ? Color(pointerColorList[6])
      :pointerValue < 80
      ? Color(pointerColorList[7])
      :pointerValue < 90
      ? Color(pointerColorList[8])
      :  Color(pointerColorList[9]);
  return colorP;
}