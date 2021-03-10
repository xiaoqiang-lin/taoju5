/*
 * @Description: 获取验证码的按钮
 * @Author: iamsmiling
 * @Date: 2020-12-29 09:24:43
 * @LastEditTime: 2020-12-29 10:33:56
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/type_defs/type_defs.dart';

enum ButtonState { idle, busy, succeed, failed }

class XSmsController extends GetxController {
  ButtonState buttonState = ButtonState.idle;
  static const int maxCount = 10;
  final countDown = maxCount.obs;
  void changeState(ButtonState state) {
    buttonState = state;
    update();
  }

  Timer timer;

  void _startCountDown() async {
    ///如果当前值小于等于0 则重新开始计时
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDown.value <= 0) {
        countDown.value = maxCount;
        changeState(ButtonState.idle);
        timer.cancel();
        return;
      }
      countDown.value--;
    });
  }

  ///开始倒计时
  void getSms(FutureCallback onFuture) {
    changeState(ButtonState.busy);
    onFuture().then((_) {
      changeState(ButtonState.succeed);
      _startCountDown();
    }).catchError((err) {
      changeState(ButtonState.failed);
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}

class XSmsButton extends StatelessWidget {
  final FutureCallback onFuture;
  const XSmsButton({Key key, @required this.onFuture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<XSmsController>(
        init: XSmsController(),
        builder: (_) {
          // if (_.buttonState == ButtonState.idle) {
          //   return ElevatedButton(
          //       onPressed: () => _.getSms(onFuture), child: Text("获取验证码"));
          // }
          if (_.buttonState == ButtonState.busy) {
            return ElevatedButton(
              onPressed: () {},
              child: CupertinoActivityIndicator(),
            );
          }
          if (_.buttonState == ButtonState.succeed) {
            return XCountDownButton(
              countDown: _.countDown,
            );
          }
          return ElevatedButton(
              onPressed: () => _.getSms(onFuture), child: Text("获取验证码"));
        });
  }
}

class XCountDownController extends GetxController {
  final countDown = 60.obs;
}

class XCountDownButton extends StatelessWidget {
  final RxInt countDown;
  const XCountDownButton({Key key, @required this.countDown}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Text("${countDown.value}", key: ValueKey(countDown.value)));
  }
}
