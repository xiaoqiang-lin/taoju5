/*
 * @Description: 网络请求封装
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:11:21
 * @LastEditTime: 2021-04-28 10:50:39
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

import 'future_loadstate_controller.dart';
// import 'package:animations/animations.dart';

import 'package:get/get.dart';

enum TransitionAnimationType { none, switcher, fade }

WidgetBuilder _defaultLoadingBuilder = (BuildContext context) {
  return Center(
      child: CupertinoActivityIndicator(
    radius: 18,
  ));
};

WidgetBuilder _defaultErrorBuilder = (BuildContext context) {
  return Text("出现异常");
};
// WidgetBuilder _defaultNetoffBuilder = (BuildContext context) {
//   return Text("掉线----");
// };

WidgetBuilder _defaultEmptyBuilder = (BuildContext context) {
  return Container(
    height: R.dimen.height,
    width: R.dimen.width,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(R.image.empty),
        Container(
          margin: EdgeInsets.only(top: R.dimen.dp30),
          child: Text(
            "这里暂时是空的哦~",
            style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ff666666),
          ),
        )
      ],
    ),
  );
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
    ///状态
    // if (controller. == FutureLoadState.busy) {
    //   _builder = loadingBuilder ?? _defaultLoadingBuilder;
    // }
    // if (controller.loadState == FutureLoadState.idle) {
    //   _builder = (BuildContext context) => builder(controller);
    // }
    // if (controller.loadState == FutureLoadState.empty) {
    //   _builder = emptyBuilder ?? _defaultEmptyBuilder;
    // }
    // if (controller.loadState == FutureLoadState.error) {
    //   _builder = errorBuilder ?? _defaultErrorBuilder;
    // }
    // if (controller.loadState == FutureLoadState.offline) {
    //   _builder = netoffBuilder ?? _defaultNetoffBuilder;
    // }

    // ///动画
    // if (animationType == TransitionAnimationType.switcher) {
    //   _builder = (BuildContext context) {
    //     return PageTransitionSwitcher(
    //       transitionBuilder: (
    //         Widget child,
    //         Animation<double> animation,
    //         Animation<double> secondaryAnimation,
    //       ) {
    //         return FadeThroughTransition(
    //           animation: animation,
    //           secondaryAnimation: secondaryAnimation,
    //           child: child,
    //         );
    //       },
    //       child: Builder(builder: _builder),
    //     );
    //   };
    // }
    return controller.obx(
        (state) =>
            Builder(builder: (context) => GetBuilder<T>(builder: builder)),
        onEmpty: Builder(builder: emptyBuilder ?? _defaultEmptyBuilder),
        onError: (String? text) =>
            Builder(builder: errorBuilder ?? _defaultErrorBuilder),
        onLoading: Builder(builder: loadingBuilder ?? _defaultLoadingBuilder));
  }
}
