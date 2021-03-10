/*
 * @Description:  xcheckbox状态边框
 * @Author: iamsmiling
 * @Date: 2020-12-24 14:26:47
 * @LastEditTime: 2021-01-19 13:43:16
 */
import 'package:flutter/material.dart';

class XTriangle extends StatelessWidget {
  final Size size;
  final Color color;
  const XTriangle(
      {Key key, this.size = const Size(12, 12), this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size, //指定画布大小
      painter: TriAnglePainter(),
    );
  }
}

class TriAnglePainter extends CustomPainter {
  final Color color;
  TriAnglePainter({this.color = Colors.black});
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;
    Paint paint = Paint()..color = color;
    Path path = Path();
    path.moveTo(w / 2, h);
    path.lineTo(w, h);
    path.lineTo(w, h / 2);
    path.lineTo(w / 2, h);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class XBorderFrame extends StatelessWidget {
  /// [visible] 边框是否可见
  /// [child] 边框里面的视图元素
  final bool visible;
  final Widget child;
  final Color borderColor;
  final Color unCheckedBorderColor;
  final double width;
  final double height;
  const XBorderFrame(
      {Key key,
      @required this.visible,
      @required this.child,
      this.borderColor = Colors.black,
      this.unCheckedBorderColor = Colors.transparent,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
                color: visible ? borderColor : unCheckedBorderColor)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            width == null || height == null
                ? FittedBox(
                    child: child,
                  )
                : SizedBox.expand(
                    child: child,
                  ),
            Visibility(
              child: Positioned(
                child: XTriangle(
                  color: borderColor,
                ),
                right: 0,
                bottom: 0,
              ),
              visible: visible,
            )
          ],
        ));
  }
}
