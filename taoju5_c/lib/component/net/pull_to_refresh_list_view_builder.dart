/*
 * @Description: 带刷新功能的list
 * @Author: iamsmiling
 * @Date: 2021-05-19 14:26:16
 * @LastEditTime: 2021-05-19 15:10:16
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'future_loadstate_controller.dart';

abstract class PullToRefreshListViewBuilderController<T>
    extends BaseFutureLoadStateController<T> {
  Future<T> loadData({Map? params});

  late RefreshController refreshController;

  String pageIndexKey = "page_index";

  String pageSizeKey = "page_size";

  int pageSize = 20;

  int currentPage = 1;

  @override
  void onInit() {
    refreshController = RefreshController();
    super.onInit();
  }

  Future refreshData({Map? params}) {
    Map map = {pageIndexKey: currentPage, pageSizeKey: pageSize};
    map.addAll(params ?? {});
    return loadData(params: map).then((value) {
      if (value is Iterable) {
        if (value.isEmpty) {
          change(value, status: RxStatus.empty());
          refreshController.loadNoData();
        } else {
          refreshController.refreshCompleted();
        }
      }
    }).catchError((err) {
      refreshController.refreshFailed();
    }).whenComplete(update);
  }

  Future loadMore({Map? params}) {
    currentPage++;
    Map map = {pageIndexKey: currentPage, pageSizeKey: pageSize};
    map.addAll(params ?? {});
    return loadData(params: map).then((value) {
      if (value is Iterable) {
        if (value.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
          if (data is List) {
            List list = data as List;
            list.addAll(value);
            data = list.toSet().toList() as T;
          } else {
            data = value;
          }
        }
      }
    }).catchError((err) {
      print(err);
      refreshController.loadFailed();
    }).whenComplete(update);
  }

  @override
  onClose() {
    refreshController.dispose();
    return super.onClose();
  }
}

class PullToRefreshListViewBuilder<T> extends StatelessWidget {
  final bool autoRemove;
  final Widget child;
  final bool enablePullDown;
  final bool enablePullUp;
  final String tag;

  const PullToRefreshListViewBuilder({
    Key? key,
    this.autoRemove = true,
    this.enablePullDown = true,
    this.enablePullUp = true,
    required this.child,
    this.tag = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PullToRefreshListViewBuilderController<T>>(
      autoRemove: autoRemove,
      tag: tag,
      builder: (_) {
        return SmartRefresher(
            controller: _.refreshController,
            enablePullDown: enablePullDown,
            enablePullUp: enablePullUp,
            onRefresh: _.refreshData,
            onLoading: _.loadMore,
            child: child);
      },
    );
  }
}
