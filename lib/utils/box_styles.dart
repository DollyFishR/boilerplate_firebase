import 'package:flutter/material.dart';

// template for box styles
class AppBoxStyle {
  AppBoxStyle._();
  // box with regular
  static BoxDecoration boxRegular(
          {Color color = Colors.white,
          double radius = 0.0,
          double blurRadius = 0.0,
          double spreadRadius = 0.0,
          Color shadowColor = Colors.transparent}) =>
      BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius)
          ]);
  // box with shadow
  static BoxDecoration boxWithShadow(
          {Color color = Colors.white,
          double radius = 0.0,
          double blurRadius = 0.0,
          double spreadRadius = 0.0,
          Color shadowColor = Colors.black}) =>
      BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius)
          ]);
  // box with border
  static BoxDecoration boxWithBorder(
          {Color color = Colors.white,
          double radius = 0.0,
          double blurRadius = 0.0,
          double spreadRadius = 0.0,
          Color shadowColor = Colors.transparent,
          Color borderColor = Colors.transparent,
          double borderWidth = 0.0}) =>
      BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius)
          ],
          border: Border.all(color: borderColor, width: borderWidth));
  // box with gradient
  static BoxDecoration boxWithGradient(
          {Color color = Colors.white,
          double radius = 0.0,
          double blurRadius = 0.0,
          double spreadRadius = 0.0,
          Color shadowColor = Colors.transparent,
          Gradient? gradient}) =>
      BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: blurRadius,
                spreadRadius: spreadRadius)
          ],
          gradient: gradient);
}
