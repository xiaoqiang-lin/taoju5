/*
 * @Description: 商品列表骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-01 16:22:17
 * @LastEditTime: 2021-06-02 10:36:01
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/base_skeleton.dart';
import 'package:taoju5_c/res/R.dart';

class ProductListSkeleton extends StatelessWidget {
  const ProductListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = (R.dimen.width - R.dimen.dp20 * 2 - R.dimen.dp15) / 2.0001;
    return GridView.count(
        // padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
        crossAxisCount: 2,
        mainAxisSpacing: R.dimen.dp15,
        crossAxisSpacing: R.dimen.dp18,
        childAspectRatio: 160 / 256,
        children: List.generate(
            8,
            (index) => ShimmerSkeleton(
                  period: Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(
                        width: w,
                        height: w,
                        radius: R.dimen.sp7,
                      ),
                      ShimmerContainer(
                        margin: EdgeInsets.only(top: R.dimen.dp7),
                        height: R.dimen.dp18,
                        width: R.dimen.dp56,
                        radius: R.dimen.sp10,
                      ),
                      ShimmerContainer(
                        margin: EdgeInsets.only(
                            top: R.dimen.dp3,
                            bottom: R.dimen.dp8,
                            left: R.dimen.dp3,
                            right: R.dimen.dp3),
                        height: R.dimen.dp18,
                        radius: R.dimen.sp10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerContainer(
                              height: R.dimen.dp18,
                              width: R.dimen.dp36,
                              radius: R.dimen.sp10,
                            ),
                            ShimmerContainer(
                              height: R.dimen.dp18,
                              width: R.dimen.dp36,
                              radius: R.dimen.sp10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
