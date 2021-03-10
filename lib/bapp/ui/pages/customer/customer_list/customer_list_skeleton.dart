/*
 * @Description: 用户列表骨架屏
 * @Author: iamsmiling
 * @Date: 2021-01-28 14:02:11
 * @LastEditTime: 2021-02-01 14:16:30
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerListSkeleton extends StatelessWidget {
  const CustomerListSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white,
        child: Container(
            child: Column(
          children: List.generate(
              8,
              (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: bgColor, shape: BoxShape.circle),
                        padding: EdgeInsets.symmetric(
                            horizontal: BDimens.gap32, vertical: BDimens.gap4),
                        child: Text(
                          "#",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        color: bgColor,
                        width: MediaQuery.of(context).size.width,
                        height: 48.h,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: BDimens.gap32, vertical: BDimens.gap4),
                      )
                    ],
                  )),
        )),
      ),
    );
  }
}
