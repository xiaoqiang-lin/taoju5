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

import 'fragment/customer_detail_kongo.dart';

class CustomerDetailSkeleton extends StatelessWidget {
  const CustomerDetailSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white,
          child: Container(
            child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 80.sp,
                      backgroundColor: bgColor,
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: BDimens.gap16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("姓名"),
                              Container(
                                margin: EdgeInsets.only(left: BDimens.gap16),
                                width: 180.w,
                                height: 32.h,
                                color: bgColor,
                              )
                            ],
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: BDimens.gap10),
                            child: Row(
                              children: [
                                Text("年龄"),
                                Container(
                                  margin: EdgeInsets.only(left: BDimens.gap16),
                                  width: 180.w,
                                  height: 32.h,
                                  color: bgColor,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("收货地址"),
                              Container(
                                margin: EdgeInsets.only(left: BDimens.gap16),
                                width: 180.w,
                                height: 32.h,
                                color: bgColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              CustomerDetailKongo(
                backgroundColor: Colors.transparent,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: BDimens.gap16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("来源"),
                          Container(
                            width: 180.w,
                            height: 32.h,
                            color: bgColor,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: .1,
                      thickness: .5,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: BDimens.gap16, top: BDimens.gap32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("微信"),
                          Container(
                            width: 180.w,
                            height: 32.h,
                            color: bgColor,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: .1,
                      thickness: .5,
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
