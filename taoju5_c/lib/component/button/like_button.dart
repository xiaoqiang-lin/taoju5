/*
 * @Description: 点赞按钮
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:11:21
 * @LastEditTime: 2021-04-27 17:14:18
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class LikeButton extends StatefulWidget {
  final Function()? onPressed;
  final bool like;
  const LikeButton({Key? key, this.onPressed, this.like = false})
      : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _iconAnimation;

  bool _like = false;

  _onTap() {
    if (_iconAnimation.status == AnimationStatus.forward ||
        _iconAnimation.status == AnimationStatus.reverse) {
      return;
    }
    setState(() {
      _like = !_like;
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
    _like = widget.like;
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
          child: _like
              ? Image.asset(R.image.heartFilled)
              : Image.asset(R.image.heartBlank)),
    );
  }
}
