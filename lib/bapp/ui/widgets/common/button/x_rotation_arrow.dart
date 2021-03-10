/*
 * @Description: 待旋转动画的按钮
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:00:08
 * @LastEditTime: 2020-12-25 15:01:59
 */

import 'package:flutter/material.dart';
import 'package:taoju5/type_defs/type_defs.dart';

class XRotationArrow extends StatefulWidget {
  final String label;
  final Widget child;
  final FutureCallback onTap;

  XRotationArrow({
    Key key,
    this.child = const Icon(
      Icons.expand_more,
      size: 24,
    ),
    this.onTap,
    this.label,
  }) : super(key: key);

  @override
  _XRotationArrowState createState() => _XRotationArrowState();
}

class _XRotationArrowState extends State<XRotationArrow>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconTurns;
  AnimationController _controller;

  @override
  void initState() {
    Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);
    Animatable<double> _easeInTween = CurveTween(curve: Curves.linear);
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    super.initState();
  }

  _onTap() {
    if (widget.onTap != null) {
      widget?.onTap().whenComplete(() {
        _controller.reverse();
      });
    }

    if (_controller.status == AnimationStatus.dismissed) {
      _controller
        ..reset()
        ..forward()?.then<void>((void value) {
          // if (widget.onTap != null)
          //   widget?.onTap().whenComplete(() {
          //     _controller.reverse();
          //   });
        });
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          widget.label == null ? SizedBox.shrink() : Text(widget.label),
          RotationTransition(
            turns: _iconTurns,
            child: widget?.child,
          )
        ],
      ),
    );
  }
}
