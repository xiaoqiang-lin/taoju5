// part of R;
import 'package:flutter/material.dart';

class CColor {
  static CColor _singleton = CColor();
  // ignore: unused_element
  CColor._();
  factory CColor() => _singleton;

  Color primaryColor = const Color(0xFF000000);
}
