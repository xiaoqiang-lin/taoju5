/*
 * @Description: 订单列表骨架
 * @Author: iamsmiling
 * @Date: 2021-01-28 10:19:57
 * @LastEditTime: 2021-01-28 12:14:23
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5_b/res/b_dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionSkeleton extends StatelessWidget {
  const CollectionSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black26;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    4,
                    (index) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: BDimens.gap32,
                              vertical: BDimens.gap16),
                          height: 180.h,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: BDimens.gap32),
                                width: 180.h,
                                height: 180.h,
                                color: bgColor,
                              ),
                              Expanded(
                                  child: Container(
                                height: 180.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: BDimens.gap16),
                                      width: 180.h,
                                      height: 32.h,
                                      color: bgColor,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: BDimens.gap16),
                                      width: 180.h,
                                      height: 32.h,
                                      color: bgColor,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: BDimens.gap16),
                                      color: bgColor,
                                      width: 326.w,
                                      height: 64.h,
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        )))),
        loop: 3,
        baseColor: Colors.black12,
        highlightColor: Colors.white);
  }
}
