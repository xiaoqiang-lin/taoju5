/*
 * @Description: 网络请求加载
 * @Author: iamsmiling
 * @Date: 2021-04-06 09:15:12
 * @LastEditTime: 2021-04-27 13:44:03
 */
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/httpkit/exception/offline_exception.dart';

enum FutureLoadState {
  idle,
  busy, //加载中
  empty, //无数据
  error, //加载失败
  offline
}

abstract class BaseFutureLoadStateController<T> extends GetxController {
  Future<T> loadData({Map? params});
  FutureLoadState loadState = FutureLoadState.busy;

  @mustCallSuper
  @override
  void onInit() {
    loadData().then((T value) {
      if (value is Iterable && value.isEmpty) {
        loadState = FutureLoadState.empty;
      } else {
        loadState = FutureLoadState.idle;
      }
    }).catchError((err) {
      if (err is OfflineException) {
        loadState = FutureLoadState.offline;
      } else {
        loadState = FutureLoadState.error;
      }
    }).whenComplete(update);
    super.onInit();
  }
}
