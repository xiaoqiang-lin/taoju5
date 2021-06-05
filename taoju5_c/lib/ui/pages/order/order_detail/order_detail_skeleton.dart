/*
 * @Description:  订单详情骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-02 14:09:26
 * @LastEditTime: 2021-06-02 14:40:26
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/base_skeleton.dart';
import 'package:taoju5_c/res/R.dart';

class OrderDetailSkeleton extends StatelessWidget {
  const OrderDetailSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
        child: Column(
      children: [
        ShimmerContainer(
          width: R.dimen.width,
          height: R.dimen.dp100,
        ),
        Container(
          padding: EdgeInsets.only(
              top: R.dimen.dp14, bottom: R.dimen.dp14, left: R.dimen.dp24),
          child: Row(
            children: [
              ShimmerContainer(
                margin: EdgeInsets.only(right: R.dimen.dp10),
                width: R.dimen.dp56,
                height: R.dimen.dp56,
                radius: R.dimen.dp56 / 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ShimmerContainer(
                        margin: EdgeInsets.only(right: R.dimen.dp10),
                        width: R.dimen.dp64,
                        height: R.dimen.dp20,
                      ),
                      ShimmerContainer(
                        width: R.dimen.dp64,
                        height: R.dimen.dp14,
                      )
                    ],
                  ),
                  ShimmerContainer(
                    margin: EdgeInsets.only(top: R.dimen.dp10),
                    width: R.dimen.dp280,
                    height: R.dimen.dp14,
                  )
                ],
              )
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
        Container(
            margin: EdgeInsets.only(
                left: R.dimen.dp24, right: R.dimen.dp14, bottom: R.dimen.dp18),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(
                        width: R.dimen.dp108,
                        height: R.dimen.dp18,
                      ),
                      ShimmerContainer(
                        width: R.dimen.dp108,
                        height: R.dimen.dp18,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerContainer(
                        width: R.dimen.dp108,
                        height: R.dimen.dp18,
                      ),
                      ShimmerContainer(
                        width: R.dimen.dp108,
                        height: R.dimen.dp18,
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Divider(
          height: R.dimen.dp10,
          thickness: R.dimen.dp10,
        ),
        Expanded(
          child: Column(
            children: List.generate(
              2,
              (index) => Container(
                margin:
                    EdgeInsets.only(bottom: R.dimen.dp10, top: R.dimen.dp18),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
            ),
          ),
        )
      ],
    ));
  }
}
