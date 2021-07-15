/*
 * @Description: easyRefreshuilder
 * @Author: iamsmiling
 * @Date: 2021-06-24 14:09:10
 * @LastEditTime: 2021-07-06 15:51:50
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ChimeraRefreshController<T>
    extends BaseFutureLoadStateController<T> {
  late RefreshController refreshController;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    scrollController = ScrollController();
    print("哈哈哈哈哈哈1111");
  }

  Future refreshData() {
    return loadData().then((value) {
      refreshController.refreshCompleted();
    }).catchError((err) {
      refreshController.refreshFailed();
    }).whenComplete(update);
  }

  Future loadMore({Map? params});

  @override
  void onClose() {
    refreshController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
