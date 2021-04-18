/*
 * @Description: 网络请求框架
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-17 23:55:09
 */
import 'package:flutter/material.dart';

import 'future_loadstate_controller.dart';
import 'package:get/get.dart';

class FutureLoadStateBuilder<T extends FutureLoadStateController>
    extends StatelessWidget {
  final T futureController;
  const FutureLoadStateBuilder({Key? key, required this.futureController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (_) {
        return futureController.view;
      },
    );
  }
}
