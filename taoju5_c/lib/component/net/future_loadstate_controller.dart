/*
 * @Description: 网络请求加载
 * @Author: iamsmiling
 * @Date: 2021-04-06 09:15:12
 * @LastEditTime: 2021-05-19 14:39:53
 */
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/httpkit/exception/base_exception.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  late dynamic data;
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
    return loadData().then((T value) {
      if (value is Iterable && value.isEmpty) {
        change(value, status: RxStatus.empty());
      } else {
        change(value, status: RxStatus.success());
      }
      data = value;
    }).catchError((err) {
      change(null,
          status: RxStatus.error(
              err is BaseHttpException ? err.message : err.toString()));
    });
  }
}

abstract class PullToRefreshListLoadStateController<T>
    extends BaseFutureLoadStateController<T> {
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

  Future loadMoreData({Map? params}) {
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
            print("____________________+++++++++++");
            print((data as List).length);
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
