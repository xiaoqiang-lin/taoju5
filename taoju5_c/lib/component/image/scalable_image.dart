/*
 * @Description: 可以点击放大的图片
 * @Author: iamsmiling
 * @Date: 2021-05-15 09:37:27
 * @LastEditTime: 2021-05-15 09:47:11
 */
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class ScalableImage extends StatelessWidget {
  final String src;
  final List<String>? images;
  final int? currentIndex;

  ///是否可滑动
  final bool slidable;
  const ScalableImage(
      {Key? key,
      required this.src,
      this.images,
      this.currentIndex,
      this.slidable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(closedBuilder: (BuildContext context, _) {
      return Container(
        child: Stack(
          children: [
            Image.network(src),
          ],
        ),
      );
    }, openBuilder: (BuildContext context, _) {
      return Container();
    });
  }
}
