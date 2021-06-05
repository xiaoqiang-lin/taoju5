/*
 * @Description:订单列表骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-02 10:41:13
 * @LastEditTime: 2021-06-02 14:08:35
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/base_skeleton.dart';
import 'package:taoju5_c/res/R.dart';

class OrderListSkeleton extends StatelessWidget {
  const OrderListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: R.dimen.dp24),
      itemBuilder: (BuildContext context, int i) {
        return ShimmerSkeleton(
          child: Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp10),
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      margin: EdgeInsets.only(right: R.dimen.dp6),
                      width: R.dimen.dp85,
                      height: R.dimen.dp85,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShimmerContainer(
                                width: R.dimen.dp85,
                                height: R.dimen.dp20,
                              ),
                              ShimmerContainer(
                                width: R.dimen.dp32,
                                height: R.dimen.dp20,
                              ),
                            ],
                          ),
                          ShimmerContainer(
                            margin: EdgeInsets.only(top: R.dimen.dp10),
                            width: R.dimen.width,
                            height: R.dimen.dp36,
                            radius: R.dimen.sp5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp10),
                  child: ShimmerContainer(
                    width: R.dimen.width,
                    height: R.dimen.dp64,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: R.dimen.dp10),
                  child: ShimmerContainer(
                    width: R.dimen.dp90,
                    height: R.dimen.dp24,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShimmerContainer(
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                        width: R.dimen.dp84,
                        height: R.dimen.dp32,
                        radius: R.dimen.sp32 / 2,
                      ),
                      ShimmerContainer(
                        width: R.dimen.dp84,
                        height: R.dimen.dp32,
                        radius: R.dimen.sp32 / 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 5,
    );
  }
}
