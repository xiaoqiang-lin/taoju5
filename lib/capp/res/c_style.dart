import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'R.dart';

class CStyle {
  static CStyle _singleton = CStyle._();
  // ignore: unused_element
  CStyle._();
  factory CStyle() => _singleton;

  TextStyle headline6 = TextStyle(
      fontSize: R.dimen.sp16,
      color: R.color.primaryTextColor,
      fontWeight: FontWeight.w500);

  TextStyle tileTip =
      TextStyle(fontSize: R.dimen.sp12, color: R.color.tileTipColor);
}
