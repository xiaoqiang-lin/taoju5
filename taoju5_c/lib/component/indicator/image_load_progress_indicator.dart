/*
 * @Description: 仿新浪微博图片加载动画
 * @Author: iamsmiling
 * @Date: 2021-04-23 21:13:12
 * @LastEditTime: 2021-04-23 21:44:36
 */

import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class ImageLoadingProgressIndicator extends StatelessWidget {
  final double progress;
  final Size size;
  const ImageLoadingProgressIndicator(
      {Key? key, required this.progress, this.size = const Size.fromRadius(20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: _ImageLoadingProgressIndicatorPainter(progess: progress),
    );
  }
}

class _ImageLoadingProgressIndicatorPainter extends CustomPainter {
  final double progess;
  _ImageLoadingProgressIndicatorPainter({required this.progess});

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = 0;
    double endAngle = startAngle + math.pi * 2 * progess;

    double innerRadius = 48;
    double outerRadius = innerRadius + 8;

    Paint paint = Paint()..color = Colors.white.withOpacity(.2);

    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: outerRadius,
            height: outerRadius),
        startAngle,
        endAngle,
        true,
        paint);
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: outerRadius,
            height: outerRadius),
        startAngle,
        endAngle,
        true,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
