/*
 * @Description: 网络状态
 * @Author: iamsmiling
 * @Date: 2020-12-21 13:04:29
 * @LastEditTime: 2021-01-29 10:49:36
 */

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_empty_widget.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_error_widget.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loading_widget.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_netoff_widget.dart';

import 'x_view_state.dart';

enum TransitionAnimationType { none, switcher, fade }

class XLoadStateBuilder extends StatelessWidget {
  final Widget loadingWidget;
  final Widget errorWidget;
  final Widget emptyWidget;
  final Widget netoffWidget;
  final XLoadState loadState;
  final WidgetBuilder builder;
  final TransitionAnimationType animationType;
  final Function retry;

  XLoadStateBuilder(
      {Key key,
      this.loadingWidget = const XLoadingWidget(),
      @required this.builder,
      this.loadState = XLoadState.busy,
      this.retry,
      this.animationType = TransitionAnimationType.none})
      : errorWidget = XErrorWidget(onTap: retry),
        emptyWidget = XEmptyWidget(onTap: retry),
        netoffWidget = XNetoffWidget(onTap: retry),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (animationType == TransitionAnimationType.fade)
      return _buildWithFader(context);
    if (animationType == TransitionAnimationType.switcher)
      return _buildWithSwitcher(context);
    return _buildWithoutAnimation(context);
  }

  Widget _buildWithoutAnimation(BuildContext context) {
    return _build(context);
  }

  Widget _buildWithFader(BuildContext context) {
    return PageTransitionFader(child: _build(context));
  }

  Widget _buildWithSwitcher(BuildContext context) {
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
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    if (loadState == XLoadState.busy) {
      return loadingWidget;
    }
    if (loadState == XLoadState.error) {
      return errorWidget;
    }
    if (loadState == XLoadState.empty) {
      return emptyWidget;
    }
    return Builder(builder: builder);
  }
}

class PageTransitionFader extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const PageTransitionFader(
      {Key key,
      @required this.child,
      this.duration = const Duration(milliseconds: 500)})
      : super(key: key);

  @override
  _PageTransitionFaderState createState() => _PageTransitionFaderState();
}

class _PageTransitionFaderState extends State<PageTransitionFader>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
