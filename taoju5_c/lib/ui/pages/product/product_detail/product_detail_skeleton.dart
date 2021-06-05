/*
 * @Description:商品详情骨架瓶
 * @Author: iamsmiling
 * @Date: 2021-06-02 09:43:52
 * @LastEditTime: 2021-06-02 10:35:03
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/base_skeleton.dart';
import 'package:taoju5_c/res/R.dart';

class ProductDetailSkeleton extends StatelessWidget {
  const ProductDetailSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: ShimmerSkeleton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: R.dimen.width,
              height: R.dimen.width * .72,
              radius: 0,
            ),
            ShimmerContainer(
              margin: EdgeInsets.only(
                  left: R.dimen.dp20, top: R.dimen.dp20, bottom: R.dimen.dp10),
              height: R.dimen.dp20,
              width: R.dimen.dp165,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerContainer(
                  margin: EdgeInsets.only(left: R.dimen.dp20),
                  height: R.dimen.dp16,
                  width: R.dimen.dp68,
                ),
                ShimmerContainer(
                  margin: EdgeInsets.only(right: R.dimen.dp20),
                  height: R.dimen.dp16,
                  width: R.dimen.dp128,
                ),
              ],
            ),
            ShimmerContainer(
              margin: EdgeInsets.only(
                  left: R.dimen.dp20, top: R.dimen.dp20, bottom: R.dimen.dp10),
              height: R.dimen.dp20,
              width: R.dimen.dp165,
            ),
            Divider(
              indent: R.dimen.dp20,
              endIndent: R.dimen.dp20,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: R.dimen.dp20,
                  right: R.dimen.dp20,
                  top: R.dimen.dp20,
                  bottom: R.dimen.dp10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainer(
                    height: R.dimen.dp20,
                    width: R.dimen.dp165,
                  ),
                  ShimmerContainer(
                    height: R.dimen.dp20,
                    width: R.dimen.dp68,
                  ),
                ],
              ),
            ),
            Divider(
              indent: R.dimen.dp20,
              endIndent: R.dimen.dp20,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: R.dimen.dp20,
                  right: R.dimen.dp20,
                  top: R.dimen.dp20,
                  bottom: R.dimen.dp10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainer(
                    height: R.dimen.dp20,
                    width: R.dimen.dp165,
                  ),
                  ShimmerContainer(
                    height: R.dimen.dp20,
                    width: R.dimen.dp68,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: R.dimen.dp20,
                  right: R.dimen.dp20,
                  top: R.dimen.dp14,
                  bottom: R.dimen.dp10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerContainer(
                    height: R.dimen.dp20,
                    width: R.dimen.dp68,
                  ),
                  ShimmerContainer(
                    height: R.dimen.dp20,
                    width: R.dimen.dp56,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                    3,
                    (int index) => Container(
                          margin: EdgeInsets.only(
                              left: R.dimen.dp20, bottom: R.dimen.dp15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ShimmerContainer(
                                    margin: EdgeInsets.only(right: R.dimen.dp6),
                                    width: R.dimen.dp36,
                                    height: R.dimen.dp36,
                                    radius: R.dimen.dp36 / 2,
                                  ),
                                  Column(
                                    children: [
                                      ShimmerContainer(
                                        width: R.dimen.dp36,
                                        height: R.dimen.dp20,
                                      ),
                                      ShimmerContainer(
                                        margin:
                                            EdgeInsets.only(top: R.dimen.dp6),
                                        width: R.dimen.dp36,
                                        height: R.dimen.dp12,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              ShimmerContainer(
                                margin: EdgeInsets.only(top: R.dimen.dp10),
                                width: R.dimen.width,
                                height: R.dimen.dp36,
                              ),
                            ],
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
