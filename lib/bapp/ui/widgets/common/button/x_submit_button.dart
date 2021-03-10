/*
 * @Description: 提交按钮封装
 * @Author: iamsmiling
 * @Date: 2021-01-12 16:33:37
 * @LastEditTime: 2021-01-22 15:16:22
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/type_defs/type_defs.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

class XSubmitButton extends StatelessWidget {
  final Widget child;
  final FutureCallback onFuture;
  final Function onSuccess;
  final Function(dynamic message) onError;
  final Function onComplete;
  final bool showLoading;
  const XSubmitButton(
      {Key key,
      @required this.child,
      @required this.onFuture,
      this.onSuccess,
      this.onError,
      this.onComplete,
      this.showLoading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight + 16,
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap48, vertical: 8),
      child: XFutureButton(
        onFuture: onFuture,
        onComplete: onComplete,
        onError: onError,
        onSuccess: onSuccess,
        showLoading: showLoading,
        child: child,
      ),
    );
  }
}
