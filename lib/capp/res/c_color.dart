// part of R;
import 'package:flutter/material.dart';

class CColor {
  static CColor _singleton = CColor._();
  // ignore: unused_element
  CColor._();
  factory CColor() => _singleton;

  ///主题色 应用程序主要部分的背景颜色(toolbars、tab bars 等)
  final Color primaryColor = const Color(0xFFEE9B5F);

  final Color appBarColor = Colors.white;

  final Color scaffoldBackgroundColor = Colors.white;

  final Color iconColor = const Color(0xFFB5B5B5);

  final Color primaryTextColor = const Color(0xFF333333);

  final Color badgeColor = const Color(0xFFFF5005);

  final Color splashColor = Colors.transparent;

  final Color hintColor = const Color(0xFFC7C8CC);

  final Color errorColor = const Color(0xFFFF0000);

  final Color dividerColor = const Color(0xFFE5E5E5);

  final Color barrierColor = Colors.black.withOpacity(.6);

  final Color textFieldEnabledBorderColor = const Color(0xFFE5E5E5);

  final Color textFieldErrorBorderColor = const Color(0xFFFF0000);

  final Color dialogTitleColor = const Color(0xFF1B1B1B);

  final Color textButtonBackgroudColor = const Color(0xFFF5F5F5);

  final Color materialButtonBackgroudColor = const Color(0xFFF5F5F5);

  final Color textButtonForegroudColor = const Color(0xFF666666);

  final Color elevatedButtonDisabledColor =
      const Color(0xFFEE9B5F).withOpacity(.4);

  ///
  final Color tabBarIndicatorColor = const Color(0xFFEE9B5F);

  final Color unselectedTabBarLabelColor = const Color(0xFF999999);

  final Color lightShimmerColor = const Color(0xFFEFEFEF);

  final Color lightShimmerBgColor = Colors.transparent;

  final Color tileTipColor = const Color(0xFFB4B4B4);

  final Color subtitleColor = const Color(0xFFB5B5B5);

  final Color greyTextColor = const Color(0xFF999999);
}
