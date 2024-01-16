import 'package:flutter/material.dart';

class SizeUtils {
  SizeUtils._();

  static Size displaySize(BuildContext context) => MediaQuery.of(context).size;

  static double displayHeight(BuildContext context) =>
      displaySize(context).height;

  static double displayWidth(BuildContext context) =>
      displaySize(context).width;

  static double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? displayWidth(context)
          : displayHeight(context));

  static double getScaledWidth(BuildContext context, double scale) =>
      scale * displayWidth(context);

  static double getScaledHeight(BuildContext context, double scale) =>
      scale * displayHeight(context);
}
