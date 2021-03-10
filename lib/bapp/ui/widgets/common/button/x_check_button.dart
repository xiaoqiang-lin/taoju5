/*
 * @Description: XCheckButton 带三角边框的按钮
 * @Author: iamsmiling
 * @Date: 2020-12-24 14:24:44
 * @LastEditTime: 2021-01-19 13:52:14
 */
import 'package:flutter/material.dart';

import 'x_border_frame.dart';

class XCheckButton extends StatelessWidget {
  ///[isChecked]当前是否选中
  final bool isChecked;

  ///[callback]点击时的回调
  final Function onPresss;

  final BoxConstraints constraints;

  final Color unCheckedColor;

  final double width;

  final double height;

  ///[child]  按钮视图
  final Widget child;

  const XCheckButton(
      {Key key,
      @required this.isChecked,
      @required this.onPresss,
      @required this.child,
      this.unCheckedColor = const Color(0xFFCBCBCB),
      this.constraints = const BoxConstraints(minWidth: 72, minHeight: 32),
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPresss,
      behavior: HitTestBehavior.translucent,
      child: ConstrainedBox(
        constraints: constraints,
        child: XBorderFrame(
          width: width,
          height: height,
          unCheckedBorderColor: unCheckedColor,
          visible: isChecked ?? false,
          child: child ?? Container(),
        ),
      ),
    );
  }
}
