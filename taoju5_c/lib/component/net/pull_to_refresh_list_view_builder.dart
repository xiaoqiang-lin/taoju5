/*
 * @Description: 带刷新功能的list
 * @Author: iamsmiling
 * @Date: 2021-05-19 14:26:16
 * @LastEditTime: 2021-07-29 16:22:19
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5_c/component/noripple_scroll_behavior/noripple_scroll_behavior.dart';

import 'flutter_loadstate_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'future_loadstate_controller.dart';

import 'package:flutter/widgets.dart' as prefix0;

class ChimeraPager<T> {
  late List<T> list;
  late int totalPage;

  ChimeraPager({required this.list, required this.totalPage});
}

// A Sliver for  Expanding empty space
class SliverFillEmptySpace extends SingleChildRenderObjectWidget {
  /// Creates a sliver that contains a single box widget.
  SliverFillEmptySpace({
    Key? key,
  }) : super(key: key, child: Container());

  @override
  RenderSliverFillEmptySpace createRenderObject(BuildContext context) =>
      RenderSliverFillEmptySpace();
}

class RenderSliverFillEmptySpace extends RenderSliverSingleBoxAdapter {
  /// Creates a [RenderSliver] that wraps a [RenderBox].
  RenderSliverFillEmptySpace({
    RenderBox? child,
  }) : super(child: child);

  @override
  void performLayout() {
    double emptySpaceExtent =
        constraints.viewportMainAxisExtent - constraints.precedingScrollExtent;

    if (emptySpaceExtent > 0) {
      child?.layout(constraints.asBoxConstraints(maxExtent: emptySpaceExtent),
          parentUsesSize: true);
      double childExtent = emptySpaceExtent;
      final double paintedChildSize =
          calculatePaintOffset(constraints, from: 0.0, to: childExtent);
      final double cacheExtent =
          calculateCacheOffset(constraints, from: 0.0, to: childExtent);
      geometry = SliverGeometry(
        scrollExtent: childExtent,
        paintExtent: paintedChildSize,
        cacheExtent: cacheExtent,
        maxPaintExtent: childExtent,
      );
      setChildParentData(child!, constraints, geometry!);
    } else {
      geometry = SliverGeometry.zero;
    }
  }
}

class FillEmptyCustomScrollView extends prefix0.CustomScrollView {
  final bool enableFillEmpty;
  const FillEmptyCustomScrollView({
    Key? key,
    required this.enableFillEmpty,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    Key? center,
    double anchor = 0.0,
    double? cacheExtent,
    this.slivers = const <Widget>[],
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) : super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          center: center,
          anchor: anchor,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
        );

  /// The slivers to place inside the viewport.
  final List<Widget> slivers;

  @override
  List<Widget> buildSlivers(BuildContext context) {
    if (enableFillEmpty) slivers.add(SliverFillEmptySpace());
    return slivers;
  }
}

abstract class PullToRefreshListViewBuilderController<T>
    extends BaseFutureLoadStateController<List<T>> {
  Future<List<T>> loadData({Map? params});

  RefreshController? refreshController;

  late ScrollController scrollController;

  List<T> list = [];

  late String pageIndexKey;

  late String pageSizeKey;

  late int pageSize = 10;

  late int currentPage = 1;

  late int totalPage = double.maxFinite ~/ 1;

  late Map initialParams;

  setRefreshController(RefreshController controller) {
    print("先执行构造韩素");
    refreshController = controller;
  }

  PullToRefreshListViewBuilderController(
      {this.pageIndexKey = "page_index",
      this.pageSizeKey = "page_size",
      this.currentPage = 1,
      this.pageSize = 10,
      this.refreshController}) {
    this.initialParams = {
      pageSizeKey: pageSize,
    };
  }

  @override
  void onInit() {
    print("在执行构造Init");
    _fetchData();

    refreshController ??= RefreshController();
    scrollController = ScrollController();
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
    params.addAll({pageIndexKey: currentPage, ...initialParams});
    change(list, status: RxStatus.loading());

    return loadData(params: params).then((List<T> val) {
      if (val.isEmpty) {
        change(val, status: RxStatus.empty());
        refreshController?.loadNoData();
      } else {
        list = val;
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
    if (currentPage >= totalPage) {
      refreshController?.loadNoData();
      return Future.value();
    }
    print(params);
    return loadData(params: params).then((List<T> val) {
      // change(val, status: RxStatus.success());
      // List<T> arr = [];
      // arr.addAll(list);
      // arr.addAll(val);
      // list = arr.toSet().toList();

      if (val.isEmpty) {
        refreshController?.loadNoData();
      } else {
        list = [...list, ...val];
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
    scrollController.dispose();
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
                        cacheExtent: 500,
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
                        cacheExtent: 500,
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
  final void Function(GetBuilderState<T> state)? initState;

  final Object? id;

  final ScrollController? scrollController;

  final RefreshController? refreshController;

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
      this.scrollController,
      this.refreshController,
      this.initState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get.find<T>(tag: tag).obx(
        (state) => Builder(
              builder: (context) => GetBuilder<T>(
                tag: tag,
                autoRemove: autoRemove,
                initState: initState,
                global: true,
                builder: (_) {
                  return StaggeredGridView.builder(
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
                          itemBuilder(_.list[i]));
                  // return SmartRefresher(
                  //   controller: _.refreshController!,
                  //   scrollController: scrollController,
                  //   cacheExtent: 500,
                  //   enablePullDown: enablePullDown,
                  //   enablePullUp: enablePullDown,
                  //   onLoading: _.loadMore,
                  //   onRefresh: _.refreshData,
                  //   child: ScrollConfiguration(
                  //     behavior: NoRippleScrollBehavior(),
                  //     child: StaggeredGridView.builder(
                  //         padding: padding,
                  //         gridDelegate:
                  //             SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                  //                 staggeredTileBuilder: staggeredTileBuilder,
                  //                 crossAxisCount: crossAxisCount,
                  //                 mainAxisSpacing: mainAxisSpacing,
                  //                 crossAxisSpacing: crossAxisSpacing,
                  //                 staggeredTileCount: _.list.length),
                  //         // padding: padding,
                  //         shrinkWrap: shrinkWrap,
                  //         itemCount: _.list.length,
                  //         controller: scrollController,
                  //         itemBuilder: (BuildContext context, int i) =>
                  //             itemBuilder(_.list[i])),
                  //   ),
                  // );
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
