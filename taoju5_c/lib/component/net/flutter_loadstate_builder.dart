/*
 * @Description: 网络请求封装
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:11:21
 * @LastEditTime: 2021-04-27 12:46:31
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'future_loadstate_controller.dart';
import 'package:animations/animations.dart';

import 'package:get/get.dart';

enum TransitionAnimationType { none, switcher, fade }

WidgetBuilder _defaultLoadingBuilder = (BuildContext context) {
  return CupertinoActivityIndicator();
};

WidgetBuilder _defaultErrorBuilder = (BuildContext context) {
  return Text("出现异常");
};
WidgetBuilder _defaultNetoffBuilder = (BuildContext context) {
  return Text("掉线----");
};

WidgetBuilder _defaultEmptyBuilder = (BuildContext context) {
  return Text("暂无数据");
};

class FutureLoadStateBuilder<T extends BaseFutureLoadStateController>
    extends StatelessWidget {
  final T controller;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final WidgetBuilder? emptyBuilder;
  final WidgetBuilder? netoffBuilder;
  final GetControllerBuilder<T> builder;
  final TransitionAnimationType animationType;
  const FutureLoadStateBuilder(
      {Key? key,
      required this.controller,
      this.loadingBuilder,
      this.errorBuilder,
      this.emptyBuilder,
      this.netoffBuilder,
      required this.builder,
      this.animationType = TransitionAnimationType.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (_) {
        return _build(context);
      },
    );
  }

  Widget _build(BuildContext context) {
    WidgetBuilder _builder = _defaultLoadingBuilder;

    ///状态
    if (controller.loadState == FutureLoadState.busy) {
      _builder = loadingBuilder ?? _defaultLoadingBuilder;
    }
    if (controller.loadState == FutureLoadState.idle) {
      _builder = (BuildContext context) => builder(controller);
    }
    if (controller.loadState == FutureLoadState.empty) {
      _builder = emptyBuilder ?? _defaultEmptyBuilder;
    }
    if (controller.loadState == FutureLoadState.error) {
      _builder = errorBuilder ?? _defaultErrorBuilder;
    }
    if (controller.loadState == FutureLoadState.offline) {
      _builder = netoffBuilder ?? _defaultNetoffBuilder;
    }

    ///动画
    if (animationType == TransitionAnimationType.switcher) {
      _builder = (BuildContext context) {
        return PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: Builder(builder: _builder),
        );
      };
    }
    return Builder(builder: _builder);
  }
}
