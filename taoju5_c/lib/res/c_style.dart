/*
 * @Description: 字体
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-20 09:53:07
 */
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
      color: R.color.ff333333,
      fontFamily: "PingFang",
      fontWeight: FontWeight.w700);

  TextStyle tileTip = TextStyle(
      fontSize: R.dimen.sp12, fontFamily: "PingFang", color: R.color.ffb4b4b4);

  ///顶部导航栏标题文字等
  TextStyle h1 = TextStyle(
      fontSize: R.dimen.sp18,
      fontFamily: "PingFang",
      fontWeight: FontWeight.w700);

  ///重要标题/首页模块标题/弹窗标题
  TextStyle h2 = TextStyle(
      fontSize: R.dimen.sp15,
      fontFamily: "PingFang",
      fontWeight: FontWeight.w700);

  ///次要标题/加入购物车选项模块标题等
  TextStyle h3 = TextStyle(
      fontSize: R.dimen.sp14,
      fontFamily: "PingFang",
      fontWeight: FontWeight.w500);

  ///次要标题/加入购物车选项模块标题/弹窗按钮文字等
  TextStyle primaryText =
      TextStyle(fontSize: R.dimen.sp14, fontWeight: FontWeight.w700);

  //更多提示文字
  TextStyle moreTip =
      TextStyle(fontSize: R.dimen.sp12, color: R.color.ff999999);
}
