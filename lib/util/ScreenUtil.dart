import 'package:flutter/material.dart';

class ScreenUtil {
  static double screenW(context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenH(context) {
    return MediaQuery.of(context).size.height;
  }
}
