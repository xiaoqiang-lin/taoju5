/*
 * @Description: 物流信息时间轴
 * @Author: iamsmiling
 * @Date: 2021-05-21 15:15:20
 * @LastEditTime: 2021-05-21 17:12:34
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';

class LogisticsTimeLine extends StatelessWidget {
  final List<PackageLogisticsNodeEntity> nodes;
  const LogisticsTimeLine({Key? key, required this.nodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LogisticsNodePainter(nodes: nodes),
    );
  }
}

class _LogisticsNodePainter extends CustomPainter {
  final List<PackageLogisticsNodeEntity> nodes;

  _LogisticsNodePainter({
    required this.nodes,
  });

  Paint _paint = Paint()..color = Color(0xFFE5E5E5);

  @override
  void paint(Canvas canvas, Size size) {
    for (PackageLogisticsNodeEntity node in nodes) {
      canvas.drawLine(Offset(0, 0), Offset(0, 200), _paint);
      print(node);
      print("_________++++++++++++++");
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
