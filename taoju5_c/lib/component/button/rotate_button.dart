/*
 * @Description: 可以旋转的按钮
 * @Author: iamsmiling
 * @Date: 2021-04-29 15:45:15
 * @LastEditTime: 2021-04-29 16:12:46
 */
import 'package:flutter/material.dart';

class RotateButton extends StatefulWidget {
  final Widget? label;
  final Widget? child;
  final Future Function() onPressed;

  RotateButton({Key? key, this.label, this.child, required this.onPressed})
      : super(key: key);

  @override
  _RotateButtonState createState() => _RotateButtonState();
}

class _RotateButtonState extends State<RotateButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _iconTurns;
  late AnimationController _controller;

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
    widget.onPressed().whenComplete(() {
      _controller.reverse();
    });
    if (_controller.status == AnimationStatus.dismissed) {
      _controller
        ..reset()
        ..forward().then<void>((void value) {
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.label == null ? SizedBox.shrink() : widget.label!,
          RotationTransition(
            turns: _iconTurns,
            child: widget.child == null
                ? Image.asset("resources/images/dropdown.png")
                : widget.child!,
          )
        ],
      ),
    );
  }
}
