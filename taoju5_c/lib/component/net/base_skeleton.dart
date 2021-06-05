/*
 * @Description: 骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-01 16:23:18
 * @LastEditTime: 2021-06-02 10:21:09
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSkeleton extends StatelessWidget {
  final Widget child;
  final Duration period;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerSkeleton({
    Key? key,
    required this.child,
    this.period = const Duration(milliseconds: 1000),
    this.baseColor = const Color(0xFFF5F5F5),
    this.highlightColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Shimmer.fromColors(
          period: period,
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: DefaultTextStyle(
            child: child,
            style: TextStyle(),
          )),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final double radius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  const ShimmerContainer(
      {Key? key,
      this.width,
      this.height,
      this.color = Colors.white,
      this.radius = 10,
      this.margin,
      this.padding,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      child: child,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );
  }
}

class ShimmerDivider extends StatelessWidget {
  final double? height;
  final double indent;
  final double endIndent;
  final Color color;
  final double radius;
  const ShimmerDivider({
    Key? key,
    this.indent = 0,
    this.endIndent = 0,
    this.height = .8,
    this.color = Colors.white,
    this.radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: indent, right: endIndent),
      height: height,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );
  }
}
