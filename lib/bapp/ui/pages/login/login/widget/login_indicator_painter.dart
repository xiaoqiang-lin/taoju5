/*
 * @Description:绘制指示器的三角形状
 * @Author: iamsmiling
 * @Date: 2021-01-12 10:54:16
 * @LastEditTime: 2021-01-12 13:55:23
 */
import 'package:flutter/material.dart';

class LoginIndicatorPainter extends CustomPainter {
  final double startX1;
  final double startX2;
  final double height;
  final double width;
  const LoginIndicatorPainter(
      {Key key, this.startX1, this.startX2, this.height = 8, this.width = 8});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xff666666)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    Path path = Path();

    // path.lineTo(startX1, 0);
    // path.moveTo(0, 0);
    // path.lineTo(-startX1 - width, 0);
    // path.lineTo(-startX1, -height);
    // path.lineTo(-startX1 + width, 0);
    // path.lineTo(-startX1 + Get.width, 0);
    // path.lineTo(-startX1, 0);

    // path.moveTo(-startX2, 0);1
    // path.moveTo(-Get.width, 0);
    // path.lineTo(startX1, 0);

    canvas.drawPath(path, paint);
    // canvas.drawLine(Offset(-Get.width, 0), Offset(startX1, 0), paint);
    // canvas.drawLine(
    //     Offset(startX1 + width, -height), Offset(startX1, 0), paint);
    // canvas.drawLine(Offset(startX1 + width, -height),
    //     Offset(startX1 + 2.2 * width, 0), paint);
    // canvas.drawLine(
    //     Offset(startX1 + 2.2 * width, 0), Offset(startX2, 0), paint);
    // canvas.drawLine(Offset(-Get.width, 0), Offset(startX2, 0), paint);
    // canvas.drawLine(
    //     Offset(startX2 + width, -height), Offset(startX2, 0), paint);
    // canvas.drawLine(Offset(startX2 + width, -height),
    //     Offset(startX2 + 2.2 * width, 0), paint);
    // canvas.drawLine(
    //     Offset(startX2 + 2.2 * width, 0), Offset(startX2, 0), paint);
    // canvas.drawLine(Offset(0, 0), Offset(-startX1, 0), paint);
    // canvas.drawLine(Offset(0, 0), Offset(-startX1, 0), paint);
    // canvas.drawLine(
    //     Offset(-2 * startX1, 0), Offset(startX1 - width / 2, 0), paint);
    // canvas.drawLine(Offset(0, 0), Offset(startX1 - 4, 0), paint);
    // canvas.drawLine(Offset(startX1 - 4, 0), Offset(startX1 + 4, -8), paint);
    // canvas.drawLine(Offset(startX1 + 4, -8), Offset(startX1 + 12, 0), paint);
    // canvas.drawLine(Offset(startX1 + 12, 0), Offset(startX2, 0), paint);

    // canvas.drawLine(Offset(-startX1, 0), Offset(-2 * startX1, 0), paint);
    // canvas.drawLine(Offset(-Get.width, 0), Offset(Get.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
