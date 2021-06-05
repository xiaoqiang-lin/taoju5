/*
 * @Description: 网络请求加载
 * @Author: iamsmiling
 * @Date: 2021-04-06 09:15:12
 * @LastEditTime: 2021-06-01 16:39:42
 */
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:taoju5_c/httpkit/exception/base_exception.dart';
import 'package:taoju5_c/httpkit/exception/data_format_exception.dart';
// class PullToRefreshMixin {

// late RefreshController refreshController;
// onInit() {
//   refreshController = RefreshController();
// }

// onClose() {
//   refreshController.dispose();
//   print("初始化下拉刷新控制器-------------");
// }

// onRfresh() {}
// }

abstract class BaseFutureLoadStateController<T> extends GetxController
    with StateMixin<T> {
  Future<T> loadData({Map? params});

  @mustCallSuper
  @override
  void onInit() {
    fetchData();
    // loadData().then((T value) {
    //   if (value is Iterable && value.isEmpty) {
    //     change(value, status: RxStatus.empty());
    //   } else {
    //     change(value, status: RxStatus.success());
    //   }
    // }).catchError((err) {
    //   change(null,
    //       status: RxStatus.error(
    //           err is BaseHttpException ? err.message : err.toString()));
    // });
    super.onInit();
  }

  Future fetchData() {
    return loadData().then((
      T value,
    ) {
      if (value is Iterable && value.isEmpty) {
        change(value, status: RxStatus.empty());
      } else {
        change(value, status: RxStatus.success());
      }
    }, onError: (err, StackTrace stackTrace) {
      String e = "$stackTrace".substring(0, 99);
      print(stackTrace);
      throw DataFormatException(
          "$T json转模型失败  数据格式异常$err\n $e", RequestOptions(path: ""));
    }).catchError((err) {
      if (err is BaseHttpException) {
        err.onException();
      }
      change(null,
          status: RxStatus.error(
              err is BaseHttpException ? err.message : err.toString()));
    });
  }
}
