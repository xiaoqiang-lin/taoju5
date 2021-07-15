/*
 * @Description: 带刷新功能的list
 * @Author: iamsmiling
 * @Date: 2021-05-19 14:26:16
 * @LastEditTime: 2021-06-25 14:47:18
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5_c/component/noripple_scroll_behavior/noripple_scroll_behavior.dart';

import 'flutter_loadstate_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

abstract class PullToRefreshListViewBuilderController<T> extends GetxController
    with StateMixin<List<T>> {
  Future<List<T>> loadData({Map? params});

  RefreshController? refreshController;

  List<T> list = [];

  late String pageIndexKey;

  late String pageSizeKey;

  late int pageSize;

  late int currentPage;

  late Map initialParams;

  setRefreshController(RefreshController controller) {
    refreshController = controller;
  }

  PullToRefreshListViewBuilderController(
      {this.pageIndexKey = "page_index",
      this.pageSizeKey = "page_size",
      this.currentPage = 1,
      this.pageSize = 20,
      this.refreshController}) {
    this.initialParams = {
      pageSizeKey: pageSize,
    };
  }

  @override
  void onInit() {
    _fetchData();
    print(refreshController == null);
    print("+++++++++");
    refreshController ??= RefreshController();
    super.onInit();
  }

  Future _fetchData() {
    return loadData().then((List<T> val) {
      if (val.isEmpty) {
        change(value, status: RxStatus.empty());
      } else {
        list = val;
        change(val, status: RxStatus.success());
      }
    }).catchError((err, s) {
      print(err);
      print(s);
      change(list, status: RxStatus.error());
    });
  }

  Future refreshData({Map? params}) {
    print("刷新数据");

    currentPage = 1;
    params ??= {};
    params.addAll({pageIndexKey: currentPage});
    params.addAll(initialParams);
    change(list, status: RxStatus.loading());
    print("请求参数------$params");
    return loadData(params: params).then((List<T> val) {
      if (val.isEmpty) {
        change(val, status: RxStatus.empty());
        refreshController?.loadNoData();
      } else {
        change(val, status: RxStatus.success());
        refreshController?.refreshCompleted();
      }
    }).catchError((err, StackTrace stackTrace) {
      print(err);
      print(stackTrace);
      change(list, status: RxStatus.success());
      refreshController?.refreshFailed();
    }).whenComplete(update);
  }

  Future loadMore({Map? params}) {
    params ??= {};
    currentPage++;
    params.addAll({pageIndexKey: currentPage, pageSizeKey: pageSize});
    print("上拉加载更多");
    print(params);
    return loadData(params: params).then((List<T> val) {
      // change(val, status: RxStatus.success());
      List<T> arr = [];
      arr.addAll(list);
      arr.addAll(val);
      list = arr;

      if (val.isEmpty) {
        print(arr.length);
        print('哈哈哈哈哈哈');
        refreshController?.loadNoData();
      } else {
        print(arr.length);
        print("啦啦啦啦啦啦啦");
        refreshController?.loadComplete();
      }
    }).catchError((err, StackTrace stackTrace) {
      print(err);
      print(stackTrace);
      change(list, status: RxStatus.success());
      refreshController?.loadFailed();
    }).whenComplete(update);
  }

  @override
  void onClose() {
    refreshController?.dispose();
    return super.onClose();
  }
}

class PullToRefreshGridViewBuilder<
    T extends PullToRefreshListViewBuilderController,
    R> extends StatelessWidget {
  final bool autoRemove;
  final bool enablePullDown;
  final bool enablePullUp;
  final String? tag;
  final T? init;
  final Object? id;
  final Widget Function(R) itemBuilder;
  final SliverGridDelegate gridDelegate;
  final EdgeInsets? padding;

  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final WidgetBuilder? emptyBuilder;
  final WidgetBuilder? netoffBuilder;

  const PullToRefreshGridViewBuilder({
    Key? key,
    this.autoRemove = true,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.tag,
    this.init,
    this.id,
    required this.gridDelegate,
    required this.itemBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.netoffBuilder,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(tag);
    print("))))=====");
    return Get.find<T>(tag: tag).obx(
        (state) => Builder(
              builder: (context) => GetBuilder<T>(
                tag: tag,
                autoRemove: autoRemove,
                builder: (_) {
                  return SmartRefresher(
                      controller: _.refreshController!,
                      enablePullDown: enablePullDown,
                      enablePullUp: enablePullUp,
                      onRefresh: _.refreshData,
                      onLoading: _.loadMore,
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: padding,
                        gridDelegate: gridDelegate,
                        itemBuilder: (BuildContext context, int i) =>
                            itemBuilder(_.list[i]),
                        itemCount: _.list.length,
                      ));
                },
                id: id,
              ),
            ),
        onEmpty: Builder(builder: emptyBuilder ?? defaultEmptyBuilder),
        onError: (String? text) =>
            Builder(builder: errorBuilder ?? defaultErrorBuilder),
        onLoading: Builder(builder: loadingBuilder ?? defaultLoadingBuilder));
  }
}

class PullToRefreshListViewBuilder<
    T extends PullToRefreshListViewBuilderController,
    R> extends StatelessWidget {
  final bool autoRemove;
  final bool enablePullDown;
  final bool enablePullUp;
  final String? tag;
  final T? init;

  final Object? id;
  final Widget Function(R) itemBuilder;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final WidgetBuilder? emptyBuilder;
  final WidgetBuilder? netoffBuilder;
  const PullToRefreshListViewBuilder({
    Key? key,
    this.autoRemove = true,
    this.enablePullDown = true,
    this.enablePullUp = true,
    this.tag,
    this.init,
    this.id,
    required this.itemBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.netoffBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get.find<T>(tag: tag).obx(
        (state) => Builder(
              builder: (context) => GetBuilder<T>(
                tag: tag,
                autoRemove: autoRemove,
                builder: (_) {
                  return SmartRefresher(
                      controller: _.refreshController!,
                      enablePullDown: enablePullDown,
                      enablePullUp: enablePullUp,
                      onRefresh: _.refreshData,
                      onLoading: _.loadMore,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int i) =>
                            itemBuilder(_.list[i]),
                        itemCount: _.list.length,
                      ));
                },
                id: id,
              ),
            ),
        onEmpty: Builder(builder: emptyBuilder ?? defaultEmptyBuilder),
        onError: (String? text) =>
            Builder(builder: errorBuilder ?? defaultErrorBuilder),
        onLoading: Builder(builder: loadingBuilder ?? defaultLoadingBuilder));
  }
}

class PullToRefreshStaggeredGridViewBuilder<
    T extends PullToRefreshListViewBuilderController,
    R> extends StatelessWidget {
  final bool autoRemove;
  final bool enablePullDown;
  final bool enablePullUp;
  final String? tag;
  final T? init;

  final Object? id;

  final ScrollController? scrollController;

  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final WidgetBuilder? emptyBuilder;
  final WidgetBuilder? netoffBuilder;

  final EdgeInsets padding;

  final Widget Function(R) itemBuilder;

  final bool shrinkWrap;

  final StaggeredTile? Function(int) staggeredTileBuilder;

  final int crossAxisCount;

  final double mainAxisSpacing;

  final double crossAxisSpacing;

  const PullToRefreshStaggeredGridViewBuilder(
      {Key? key,
      this.autoRemove = true,
      this.enablePullDown = true,
      this.enablePullUp = true,
      this.tag,
      this.init,
      this.id,
      this.loadingBuilder,
      this.errorBuilder,
      this.emptyBuilder,
      this.netoffBuilder,
      required this.itemBuilder,
      this.padding = EdgeInsets.zero,
      this.shrinkWrap = true,
      required this.staggeredTileBuilder,
      this.crossAxisCount = 4,
      this.mainAxisSpacing = 15,
      this.crossAxisSpacing = 16,
      this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get.find<T>(tag: tag).obx(
        (state) => Builder(
              builder: (context) => GetBuilder<T>(
                tag: tag,
                autoRemove: autoRemove,
                global: true,
                builder: (_) {
                  return ScrollConfiguration(
                    behavior: NoRippleScrollBehavior(),
                    child: StaggeredGridView.builder(
                        padding: padding,
                        gridDelegate:
                            SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                                staggeredTileBuilder: staggeredTileBuilder,
                                crossAxisCount: crossAxisCount,
                                mainAxisSpacing: mainAxisSpacing,
                                crossAxisSpacing: crossAxisSpacing,
                                staggeredTileCount: _.list.length),
                        // padding: padding,
                        shrinkWrap: shrinkWrap,
                        itemCount: _.list.length,
                        controller: scrollController,
                        itemBuilder: (BuildContext context, int i) =>
                            itemBuilder(_.list[i])),
                  );
                },
                id: id,
              ),
            ),
        onEmpty: Builder(builder: emptyBuilder ?? defaultEmptyBuilder),
        onError: (String? text) =>
            Builder(builder: errorBuilder ?? defaultErrorBuilder),
        onLoading: Builder(builder: loadingBuilder ?? defaultLoadingBuilder));
  }
}
