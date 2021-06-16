/*
 * @Description: 我的骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-07 17:38:54
 * @LastEditTime: 2021-06-07 18:01:24
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/base_skeleton.dart';
import 'package:taoju5_c/res/R.dart';

class MineSkeleton extends StatelessWidget {
  const MineSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
        child: Container(
      margin: EdgeInsets.only(
          left: R.dimen.dp20, right: R.dimen.dp20, top: R.dimen.dp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerContainer(
                margin: EdgeInsets.only(right: R.dimen.dp14),
                width: R.dimen.dp60,
                height: R.dimen.dp60,
                radius: R.dimen.dp60 / 2,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(
                    margin: EdgeInsets.only(bottom: R.dimen.dp8),
                    width: R.dimen.dp128,
                    height: R.dimen.dp22,
                    radius: R.dimen.sp30,
                  ),
                  ShimmerContainer(
                    width: R.dimen.dp200,
                    height: R.dimen.dp16,
                    radius: R.dimen.sp30,
                  ),
                ],
              )),
              ShimmerContainer(
                child: Image.asset(R.image.next),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp30, bottom: R.dimen.dp20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(
                  child: Text(
                    "我的订单",
                    style: TextStyle(fontSize: R.dimen.sp16),
                  ),
                ),
                Spacer(),
                ShimmerContainer(
                    child: Text(
                  "查看更多",
                  style: TextStyle(fontSize: R.dimen.sp12),
                )),
                ShimmerContainer(
                  child: Image.asset(R.image.next),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  5,
                  (index) => Container(
                        child: Column(
                          children: [
                            ShimmerContainer(
                              margin: EdgeInsets.only(bottom: R.dimen.dp7),
                              width: R.dimen.dp32,
                              height: R.dimen.dp32,
                            ),
                            ShimmerContainer(
                              width: R.dimen.dp32,
                              height: R.dimen.dp16,
                            ),
                          ],
                        ),
                      )),
            ),
          ),
          ShimmerContainer(
            margin: EdgeInsets.only(top: R.dimen.dp30, bottom: R.dimen.dp27),
            child: Text(
              "其他",
              style: TextStyle(
                  fontSize: R.dimen.dp16, fontWeight: FontWeight.w600),
            ),
          ),
          Column(
            children: List.generate(
                6,
                (index) => Container(
                      padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                      child: Row(
                        children: [
                          ShimmerContainer(
                            width: R.dimen.dp18,
                            height: R.dimen.dp18,
                            radius: R.dimen.sp9,
                          ),
                          ShimmerContainer(
                            margin: EdgeInsets.only(left: R.dimen.dp10),
                            width: R.dimen.dp56,
                            height: R.dimen.dp18,
                            radius: R.dimen.sp9,
                          ),
                          Spacer(),
                          ShimmerContainer(
                            child: Image.asset(R.image.next),
                          )
                        ],
                      ),
                    )),
          )
        ],
      ),
    ));
  }
}
