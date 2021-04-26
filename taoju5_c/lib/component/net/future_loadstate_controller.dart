/*
 * @Description: 网络请求加载
 * @Author: iamsmiling
 * @Date: 2021-04-06 09:15:12
 * @LastEditTime: 2021-04-22 13:00:07
 */
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/base/future_empty_view.dart';
import 'package:taoju5_c/component/net/base/future_error_view.dart';
import 'package:taoju5_c/component/net/base/future_loading_view.dart';
import 'package:taoju5_c/httpkit/exception.dart';

enum FutureLoadState {
  idle,
  busy, //加载中
  empty, //无数据
  error //加载失败
}

abstract class BaseFutureLoadStateController<T> extends GetxController {
  Future<T> loadData();
  FutureLoadState loadState = FutureLoadState.busy;
}

abstract class FutureLoadStateController<T>
    extends BaseFutureLoadStateController {
  FutureLoadState loadState = FutureLoadState.busy;

  // AnimateTransitionType transitionType = AnimateTransitionType.none;

  late WidgetBuilder builder;

  Future<T> loadData();

  Future<T> onSuccess(T data);

  late WidgetBuilder? errorBuilder;

  late WidgetBuilder? emptyBuilder;

  late WidgetBuilder? loadingBuilder;

  late Map<FutureLoadState, Widget> viewBuilder;

  @mustCallSuper
  FutureLoadStateController({required this.builder}) {
    _initView();
  }

  @mustCallSuper
  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  Future? _loadData() {
    loadState = FutureLoadState.busy;
    update();
    return loadData().then((data) {
      loadState = FutureLoadState.idle;
      onSuccess(data);
    }).catchError((err) {
      if (err is UnAuthorizedException) {
        // ignore: return_of_invalid_type_from_catch_error
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
      // FutureLoadState.error: Builder(builder: errorBuilder),
      // FutureLoadState.empty: Builder(builder: emptyBuilder),
      // FutureLoadState.busy: Builder(builder: loadingBuilder)
    };
  }

  Widget get view => viewBuilder[loadState]!;
}
