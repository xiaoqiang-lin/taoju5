/*
 * @Description: 通用文字字体定义
 * @Author: iamsmiling
 * @Date: 2020-11-27 21:25:26
 * @LastEditTime: 2021-02-02 18:06:16
 */
import 'package:flutter/material.dart';

import 'b_colors.dart';
import 'b_dimens.dart';

class BStyles {
  static TextStyle unselectedLabelStyle = TextStyle(
    fontSize: BDimens.sp32,
    color: BColors.unSelectedTextColor,
  );

  static TextStyle selectedLabelStyle = TextStyle(
      fontSize: BDimens.sp32,
      color: BColors.selectedTextColor,
      fontWeight: FontWeight.bold);

  static TextStyle bodyText1 =
      TextStyle(fontSize: BDimens.sp28, color: BColors.textColor);

  static TextStyle dialogTitle = TextStyle(
      fontSize: BDimens.sp36,
      color: BColors.titleColor,
      fontWeight: FontWeight.w500);

  static TextStyle dialogContent = TextStyle(
      fontSize: 16, color: BColors.contentColor, fontWeight: FontWeight.w400);

  static TextStyle linkText = TextStyle(color: BColors.linkTextColor);

  static TextStyle tipText =
      TextStyle(color: BColors.tipColor, fontSize: BDimens.sp28);

  static TextStyle inputLabelText =
      TextStyle(color: BColors.inputLabelColor, fontSize: BDimens.sp28);

  static TextStyle placeHolderText =
      TextStyle(color: BColors.placeHolderColor, fontSize: BDimens.sp28);
}
