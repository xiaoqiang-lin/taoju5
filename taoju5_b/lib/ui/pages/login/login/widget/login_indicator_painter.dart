/*
 * @Description:绘制指示器的三角形状
 * @Author: iamsmiling
 * @Date: 2021-01-12 10:54:16
 * @LastEditTime: 2021-01-12 13:55:23
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginIndicatorPainter extends CustomPainter {
  final double height;
  final double width;
  final double start;
  const LoginIndicatorPainter(
      {Key key, this.start = 0, this.height = 10, this.width = 8});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff666666)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    Path path = Path();

    // path.lineTo(0, Get.width);
    path.moveTo(0, 0);

    // path.lineTo(Get.width, 0);
    path.lineTo(start - width, 0);

    path.lineTo(start + width / 2, -height);
    path.lineTo(start + width * 1.8, 0);

    path.moveTo(start + width * 1.8, 0);
    path.lineTo(Get.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
