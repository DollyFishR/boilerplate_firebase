import 'package:flutter/material.dart';

// template for get size of the screen
class SizeUtils {
  SizeUtils._();
  // get size of the screen
  static Size displaySize(BuildContext context) => MediaQuery.of(context).size;
  // get height of the screen
  static double displayHeight(BuildContext context) =>
      displaySize(context).height;
  // get width of the screen
  static double displayWidth(BuildContext context) =>
      displaySize(context).width;
  // get scaled size of the screen
  static double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? displayWidth(context)
          : displayHeight(context));
  // get scaled width of the screen
  static double getScaledWidth(BuildContext context, double scale) =>
      scale * displayWidth(context);
  // get scaled height of the screen
  static double getScaledHeight(BuildContext context, double scale) =>
      scale * displayHeight(context);
}
