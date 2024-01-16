import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle regular(Color color, double size) =>
      style(color, size, FontWeight.w400);

  static TextStyle medium(Color color, double size) =>
      style(color, size, FontWeight.w500);

  static TextStyle bold(Color color, double size) =>
      style(color, size, FontWeight.w600);

  static TextStyle semiBold(Color color, double size) =>
      style(color, size, FontWeight.w700);

  static TextStyle style(Color color, double size, FontWeight fontWeight,
          {String fontFamily = "Kanit"}) =>
      _textStyle(fontFamily, color, size, fontWeight);
}

TextStyle _textStyle(
        String fontFamily, Color color, double size, FontWeight fontWeight) =>
    TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight);
