/*
 * @Description: 网络请求按钮
 * @Author: iamsmiling
 * @Date: 2021-01-11 15:27:45
 * @LastEditTime: 2021-01-22 15:15:07
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/type_defs/type_defs.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_tick_widget.dart';

enum ButtonMode { outline, elevated }

class XFutureButton extends StatelessWidget {
  final FutureCallback onFuture;
  final ButtonMode buttonMode;
  final Widget child;
  final Function onComplete;
  final Function onSuccess;
  final Function onError;
  final String successTip;
  final String failTip;
  final bool showLoading;
  const XFutureButton(
      {Key key,
      @required this.onFuture,
      this.buttonMode = ButtonMode.elevated,
      this.child,
      this.onComplete,
      this.onSuccess,
      this.onError,
      this.successTip = "提交成功",
      this.failTip = "提交失败",
      this.showLoading = true})
      : super(key: key);

  _onTap() {
    if (showLoading) {
      EasyLoading.show(
          dismissOnTap: false,
          indicator: XTikerWidget(
            onFuture: onFuture,
            onComplete: onComplete,
            onError: onError,
            onSuccess: onSuccess,
          ));
    } else {
      onFuture().then((value) {
        if (onSuccess != null) onSuccess();
      }).catchError((err) {
        if (onError != null) onError();
      }).whenComplete(() {
        if (onComplete != null) onComplete();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (buttonMode == ButtonMode.elevated) {
      return ElevatedButton(onPressed: _onTap, child: child);
    }
    return OutlinedButton(onPressed: _onTap, child: child);
  }
}
