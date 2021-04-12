import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5/capp/component/net/base/future_empty_view.dart';
import 'package:taoju5/capp/component/net/base/future_error_view.dart';
import 'package:taoju5/capp/component/net/base/future_loading_view.dart';
import 'package:taoju5/capp/netkit/exception.dart';

enum FutureLoadState {
  idle,
  busy, //加载中
  empty, //无数据
  error, //加载失败
}

enum AnimateTransitionType { none, fade, sharedAxis, hero, fadeThrough }

abstract class FutureLoadStateController<T> extends GetxController {
  FutureLoadState loadState = FutureLoadState.busy;

  AnimateTransitionType transitionType = AnimateTransitionType.none;

  Future<T> loadData();

  Future<T> onSuccess(T data);

  WidgetBuilder builder;

  WidgetBuilder errorBuilder;

  WidgetBuilder emptyBuilder;

  WidgetBuilder loadingBuilder;

  Map<FutureLoadState, Widget> viewBuilder;

  FutureLoadStateController({@required this.builder})
      : assert(builder != null) {
    _initView();
  }

  @mustCallSuper
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  Future _loadData() {
    loadState = FutureLoadState.busy;
    update();
    return loadData().then((data) {
      loadState = FutureLoadState.idle;
      onSuccess(data);
    }).catchError((err) {
      if (err is UnAuthorizedException) {
        return Get.toNamed("/login");
      }
      loadState = FutureLoadState.error;
    }).whenComplete(update);
  }

  void _initView() {
    errorBuilder ??= (_) => FutureErrorView();
    emptyBuilder ??= (_) => FutureEmptyView();
    loadingBuilder ??= (_) => FutureLoadingView();

    viewBuilder = {
      FutureLoadState.idle: Builder(builder: builder),
      FutureLoadState.error: Builder(builder: errorBuilder),
      FutureLoadState.empty: Builder(builder: emptyBuilder),
      FutureLoadState.busy: Builder(builder: loadingBuilder)
    };
  }

  Widget get view => viewBuilder[loadState];
}
