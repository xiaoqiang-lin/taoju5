/*
 * @Description:SingleChildScrollView ListView 去除水波纹
 * @Author: iamsmiling
 * @Date: 2021-06-23 16:23:29
 * @LastEditTime: 2021-06-23 16:25:26
 */
import 'package:flutter/material.dart';

class NoRippleScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      child: child,
      showLeading: false,
      showTrailing: false,
      axisDirection: axisDirection,
      color: Theme.of(context).accentColor,
    );
    // if (getPlatform(context) == TargetPlatform.android ||
    //     getPlatform(context) == TargetPlatform.fuchsia) {
    //   return GlowingOverscrollIndicator(
    //     child: child,
    //     showLeading: false,
    //     showTrailing: false,
    //     axisDirection: axisDirection,
    //     color: Theme.of(context).accentColor,
    //   );
    // } else {
    //   return child;
    // }
  }
}
