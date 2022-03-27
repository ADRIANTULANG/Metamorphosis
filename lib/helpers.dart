import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppStyle {
  static TextStyle headers({
    required Color color,
    required int fontsize,
  }) {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: fontsize.sp, color: color);
    // return
  }

  static TextStyle bodyText({
    required Color color,
    required int fontsize,
  }) {
    return TextStyle(
        fontWeight: FontWeight.w700, fontSize: fontsize.sp, color: color);
  }

  static TextStyle normalText({
    required Color color,
    required int fontsize,
  }) {
    return TextStyle(
        fontWeight: FontWeight.normal, fontSize: fontsize.sp, color: color);
  }
}
