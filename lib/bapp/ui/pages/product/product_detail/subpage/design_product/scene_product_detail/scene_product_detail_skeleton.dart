/*
 * @Description: 相关场景骨架屏幕
 * @Author: iamsmiling
 * @Date: 2021-01-28 14:09:20
 * @LastEditTime: 2021-01-28 14:30:54
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SceneProductDetailSkeleton extends StatelessWidget {
  const SceneProductDetailSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black26;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: width, height: 396.h, color: bgColor),
            Container(
                margin: EdgeInsets.only(top: BDimens.gap24),
                width: width,
                height: 192.h,
                color: bgColor),
            Container(
              margin: EdgeInsets.only(top: BDimens.gap24),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    width: 192.w,
                    height: 64.w,
                  ),
                  SizedBox(width: BDimens.gap24),
                  Container(
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.all(Radius.circular(32))),
                    width: 192.w,
                    height: 64.w,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: BDimens.gap24),
              child: Text(
                "相关商品",
                style: TextStyle(fontSize: BDimens.sp28),
              ),
            ),
            Expanded(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: BDimens.gap16,
                  mainAxisSpacing: BDimens.gap16,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: List.generate(
                      6,
                      (index) => Container(
                            width: 216.h,
                            height: 216.h,
                            color: bgColor,
                          ))),
            )
            // Container(
            //     margin: EdgeInsets.only(top: BDimens.gap24),
            //     width: 272.w,
            //     height: 36.h,
            //     color: bgColor)
          ],
        ),
      ),
    );
  }
}
