/*
 * @Description: 订单列表骨架
 * @Author: iamsmiling
 * @Date: 2021-01-28 10:19:57
 * @LastEditTime: 2021-01-28 12:14:23
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderListSkeleton extends StatelessWidget {
  const OrderListSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black26;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: ListView(
          children: List.generate(
              4,
              (index) => Container(
                    margin: EdgeInsets.symmetric(vertical: BDimens.gap32),
                    child: Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: BDimens.gap32),
                          child: Row(
                            children: [
                              Container(
                                width: 180.h,
                                height: 180.h,
                                color: bgColor,
                              ),
                              Expanded(
                                  child: Container(
                                margin: EdgeInsets.only(left: BDimens.gap32),
                                height: 180.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 128.w,
                                            height: 36.h,
                                            color: bgColor),
                                        Container(
                                            width: 128.w,
                                            height: 36.h,
                                            color: bgColor)
                                      ],
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: BDimens.gap8),
                                        width: 128.w,
                                        height: 36.h,
                                        color: bgColor),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: BDimens.gap8),
                                        width: 196.w,
                                        height: 36.h,
                                        color: bgColor),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: BDimens.gap8),
                                        width: 272.w,
                                        height: 36.h,
                                        color: bgColor),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: BDimens.gap8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  Container(
                                      width: 128.w,
                                      height: 48.w,
                                      color: bgColor),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: BDimens.gap16),
                                      width: 96.w,
                                      height: 48.w,
                                      color: bgColor)
                                ],
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: BDimens.gap16),
                                      width: 272.w,
                                      height: 48.w,
                                      color: bgColor)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: bgColor,
                          height: 16,
                          thickness: 8,
                        )
                      ],
                    ),
                  )),
        ),
        loop: 3,
        baseColor: Colors.black12,
        highlightColor: Colors.white);
  }
}
