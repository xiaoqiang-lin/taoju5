/*
 * @Description: 网络请求封装
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:11:21
 * @LastEditTime: 2021-07-01 15:46:38
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'future_loadstate_controller.dart';
// import 'package:animations/animations.dart';

import 'package:get/get.dart';

enum TransitionAnimationType { none, switcher, fade }

WidgetBuilder defaultLoadingBuilder = (BuildContext context) {
  return Center(
      child: CupertinoActivityIndicator(
    radius: 12,
  ));
};

WidgetBuilder defaultErrorBuilder = (BuildContext context) {
  return Text("出现异常");
};
// WidgetBuilder _defaultNetoffBuilder = (BuildContext context) {
//   return Text("掉线----");
// };

WidgetBuilder defaultEmptyBuilder = (BuildContext context) {
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
  final Object? id;
  final String? tag;
  const FutureLoadStateBuilder(
      {Key? key,
      required this.controller,
      this.loadingBuilder,
      this.errorBuilder,
      this.emptyBuilder,
      this.netoffBuilder,
      required this.builder,
      this.animationType = TransitionAnimationType.none,
      this.id,
      this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Builder(
            builder: (context) => GetBuilder<T>(
                  builder: builder,
                  id: id,
                  tag: tag,
                )),
        onEmpty: Builder(builder: emptyBuilder ?? defaultEmptyBuilder),
        onError: (String? text) =>
            Builder(builder: errorBuilder ?? defaultErrorBuilder),
        onLoading: Builder(builder: (loadingBuilder ?? defaultLoadingBuilder)));
  }
}
