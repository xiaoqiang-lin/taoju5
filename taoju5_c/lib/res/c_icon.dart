import 'package:flutter/material.dart';

class CIcon {
  static CIcon _singleton = CIcon._();
  // ignore: unused_element
  CIcon._();
  factory CIcon() => _singleton;

  final IconData next = _CIconData(0xe6a2);
}

class _CIconData extends IconData {
  final String fontFamily;
  const _CIconData(int codePoint, {this.fontFamily = 'Taojuwu'})
      : super(codePoint);
}
