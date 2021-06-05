/*
 * @Description: 分类骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-04 06:15:38
 * @LastEditTime: 2021-06-04 06:21:13
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/base_skeleton.dart';
import 'package:taoju5_c/res/R.dart';

class CategorySkeleton extends StatelessWidget {
  const CategorySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: List.generate(
                  6,
                  (index) => ShimmerContainer(
                    margin: EdgeInsets.symmetric(vertical: R.dimen.dp20),
                    width: R.dimen.width,
                    height: R.dimen.dp36,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
