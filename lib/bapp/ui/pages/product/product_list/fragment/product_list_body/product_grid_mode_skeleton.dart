/*
 * @Description: 商品列表骨架屏幕
 * @Author: iamsmiling
 * @Date: 2021-01-28 10:02:12
 * @LastEditTime: 2021-01-28 10:16:16
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class ProductGridModeSkeleton extends StatelessWidget {
  const ProductGridModeSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black26;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: GridView.count(
            children: List.generate(
                8,
                (index) => Column(
                      children: [
                        SizedBox(
                          width: 320.w,
                          child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Container(
                                color: bgColor,
                              )),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: BDimens.gap24),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 36,
                              width: 88,
                              color: bgColor,
                            ),
                          ),
                        )
                      ],
                    )),
            childAspectRatio: 0.84,
            crossAxisCount: 2),
        baseColor: Colors.black12,
        highlightColor: Colors.white);
  }
}
