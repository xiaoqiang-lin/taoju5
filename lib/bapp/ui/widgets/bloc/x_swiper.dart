/*
 * @Description: 自定义封装swiper
 * @Author: iamsmiling
 * @Date: 2021-01-19 17:47:39
 * @LastEditTime: 2021-08-06 11:16:36
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class XSwiper extends StatelessWidget {
  final int itemCount;
  final bool loop;
  final Color paginationColor;
  final double viewportFraction;
  final double itemHeight;
  final double itemWidth;
  final IndexedWidgetBuilder itemBuilder;
  const XSwiper(
      {Key key,
      this.itemCount,
      this.loop = false,
      this.paginationColor = Colors.black45,
      this.itemBuilder,
      this.viewportFraction = 1.0,
      this.itemHeight,
      this.itemWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      loop: loop,
      itemCount: itemCount,
      viewportFraction: viewportFraction,
      itemBuilder: itemBuilder,
      itemHeight: itemHeight,
      itemWidth: itemWidth,
      pagination: new SwiperPagination(
          margin: EdgeInsets.symmetric(horizontal: 5),
          builder: DotSwiperPaginationBuilder(
              size: 8.0,
              activeSize: 8.0,
              activeColor: itemCount < 2
                  ? Colors.transparent
                  : Colors.black.withOpacity(.8),
              color: Colors.black.withOpacity(.3))),
    );
  }
}
