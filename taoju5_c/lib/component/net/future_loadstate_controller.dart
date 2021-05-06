/*
 * @Description: 网络请求加载
 * @Author: iamsmiling
 * @Date: 2021-04-06 09:15:12
 * @LastEditTime: 2021-04-30 10:09:57
 */
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/httpkit/exception/base_exception.dart';

abstract class BaseFutureLoadStateController<T> extends GetxController
    with StateMixin<T> {
  Future<T> loadData({Map? params});

  @mustCallSuper
  @override
  void onInit() {
    loadData().then((T value) {
      if (value is Iterable && value.isEmpty) {
        change(value, status: RxStatus.empty());
      } else {
        change(value, status: RxStatus.success());
      }
    }).catchError((err) {
      change(null,
          status: RxStatus.error(
              err is BaseHttpException ? err.message : err.toString()));
    });
    super.onInit();
  }
}
