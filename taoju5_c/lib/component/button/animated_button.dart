/*
 * @Description: 点赞按钮
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:11:21
 * @LastEditTime: 2021-06-08 17:30:00
 */
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Future<bool> Function() onPressed;
  final bool active;
  final Widget activeWidget;
  final Widget deactiveWidget;

  const AnimatedButton(
      {Key? key,
      required this.onPressed,
      this.active = false,
      required this.activeWidget,
      required this.deactiveWidget})
      : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconAnimation;

  bool _like = false;

  _onTap() {
    if (_iconAnimation.status == AnimationStatus.forward ||
        _iconAnimation.status == AnimationStatus.reverse) {
      return;
    }
    widget.onPressed().then((value) {
      _like = value;
    }).whenComplete(() {
      setState(() {});
    });
    if (_iconAnimation.status == AnimationStatus.dismissed) {
      _animationController.forward();
    } else if (_iconAnimation.status == AnimationStatus.completed) {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _like = widget.active;
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _iconAnimation = Tween(begin: 1.0, end: 1.3).animate(_animationController);

    _iconAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 1.3)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: ScaleTransition(
          scale: _iconAnimation,
          child: _like ? widget.activeWidget : widget.deactiveWidget),
    );
  }
}
