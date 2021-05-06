/*
 * @Description: app颜色
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-29 16:44:00
 */
// part of R;
import 'package:flutter/material.dart';

class CColor {
  static CColor _singleton = CColor._();
  // ignore: unused_element
  CColor._();
  factory CColor() => _singleton;

  ///主题色 应用程序主要部分的背景颜色(toolbars、tab bars 等)
  final Color ffee9b5f = const Color(0xFFEE9B5F);
  final Color ffb5b5b5 = const Color(0xFFB5B5B5);

  final Color ff333333 = const Color(0xFF333333);

  final Color ffff5005 = const Color(0xFFFF5005);

  final Color transparent = Colors.transparent;

  final Color ffc7c8cc = const Color(0xFFC7C8CC);

  final Color ff999999 = const Color(0xFF999999);

  final Color ffff0000 = const Color(0xFFFF0000);

  final Color ffe5e5e5 = const Color(0xFFE5E5E5);

  final Color ffee9b5f_6 = const Color(0xFFEE9B5F).withOpacity(.6);

  final Color ff1b1b1b = const Color(0xFF1B1B1B);

  final Color fff5f5f5 = const Color(0xFFF5F5F5);
  final Color fff8f8f8 = const Color(0xFFF8F8F8);

  final Color ffee9b5f_4 = const Color(0xFFEE9B5F).withOpacity(.4);

  final Color ffb4b4b4 = const Color(0xFFB4B4B4);

  final Color ff666666 = const Color(0xFF666666);

  ///棕色
  final Color ff832f03 = const Color(0xFF832F03);

  final Color ffee7e2d = const Color(0xFFEE7E2D);

  ///评分
  final Color ff5005 = const Color(0xFFFF5005);

  ///黑色
  final Color ff00000 = Colors.black;

  final Color ff181818 = const Color(0xff181818);

  final Color ffffffff = Colors.white;

  final Color ffc1c1c1 = const Color(0xffc1c1c1);

  final Color ffff7b65 = const Color(0xffff7b65);

  final Color ffff593e = const Color(0xffff593e);
}
