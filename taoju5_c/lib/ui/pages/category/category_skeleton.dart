/*
 * @Description: 分类骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-04 06:15:38
 * @LastEditTime: 2021-06-07 14:17:18
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/base_skeleton.dart';
import 'package:taoju5_c/res/R.dart';

class CategorySkeleton extends StatelessWidget {
  const CategorySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double assignableWidth = R.dimen.width * (4 / 5) - R.dimen.dp20 * 2;
    double factor = 3.001;

    return ShimmerSkeleton(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: R.dimen.dp14, vertical: R.dimen.dp20),
                child: Column(
                  children: List.generate(
                    6,
                    (index) => ShimmerContainer(
                      margin: EdgeInsets.symmetric(vertical: R.dimen.dp20),
                      width: R.dimen.width,
                      height: R.dimen.dp36,
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  ShimmerContainer(
                    margin: EdgeInsets.all(R.dimen.dp20),
                    width: R.dimen.width,
                    height: R.dimen.dp120,
                  ),
                  Wrap(
                    spacing: R.dimen.dp15,
                    runSpacing: R.dimen.dp20,
                    children: List.generate(
                        8,
                        (index) => Column(
                              children: [
                                ShimmerContainer(
                                  width: (assignableWidth - R.dimen.dp15 * 2) /
                                      factor,
                                  height: (assignableWidth - R.dimen.dp15 * 2) /
                                      factor,
                                ),
                                ShimmerContainer(
                                  margin: EdgeInsets.only(top: R.dimen.dp5),
                                  width: (assignableWidth - R.dimen.dp15 * 2) /
                                      factor,
                                  height: R.dimen.dp18,
                                  radius: R.dimen.sp32,
                                ),
                              ],
                            )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
