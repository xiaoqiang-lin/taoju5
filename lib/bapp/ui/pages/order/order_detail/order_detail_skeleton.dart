/*
 * @Description: 订单详情骨架屏
 * @Author: iamsmiling
 * @Date: 2021-01-28 12:16:53
 * @LastEditTime: 2021-01-28 14:00:55
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailSkeleton extends StatelessWidget {
  const OrderDetailSkeleton({Key key}) : super(key: key);
  final Color bgColor = Colors.black12;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("订单详情"),
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white,
        child: Column(
          children: [
            Container(height: 180.h, width: width, color: bgColor),
            Container(
              padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
              margin: EdgeInsets.symmetric(vertical: BDimens.gap32),
              height: 128.h,
              width: width,
              child: Row(
                children: [
                  Icon(
                    BIcons.add,
                    size: 24,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: BDimens.gap32),
                              width: 196.w,
                              height: 48.h,
                              color: bgColor,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: BDimens.gap32),
                              width: 128.w,
                              height: 48.h,
                              color: bgColor,
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: BDimens.gap32, top: BDimens.gap16),
                          width: 480.w,
                          height: 48.h,
                          color: bgColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
              width: width,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(bottom: BDimens.gap16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 256.w,
                        color: bgColor,
                        height: 48.h,
                      ),
                      Icon(
                        BIcons.next,
                        size: 24,
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: BDimens.gap16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 256.w,
                        color: bgColor,
                        height: 48.h,
                      ),
                      Icon(
                        BIcons.next,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.all(BDimens.gap32),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: BDimens.gap24),
                        color: bgColor,
                        width: 180.h,
                        height: 180.h,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 180.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 192.w, height: 48.h, color: bgColor),
                                Container(
                                    width: 192.w, height: 48.h, color: bgColor)
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: BDimens.gap16),
                                width: 192.w,
                                height: 36.h,
                                color: bgColor),
                            Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(top: BDimens.gap16),
                                  width: width,
                                  color: bgColor),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(top: BDimens.gap16),
                          width: 192.w,
                          height: 48.h,
                          color: bgColor),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: BDimens.gap32),
                child: Column(
                  children: <Widget>[
                        Row(children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: BDimens.gap24),
                            width: 4,
                            height: 20,
                            color: bgColor,
                          ),
                          Text(
                            "订单信息",
                            style: TextStyle(fontSize: BDimens.sp28),
                          ),
                        ]),
                      ] +
                      List<Widget>.generate(
                        5,
                        (index) => Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: BDimens.gap16),
                                width: 272.w,
                                height: 36.h,
                                color: bgColor,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: BDimens.gap16),
                                width: 196.w,
                                height: 36.h,
                                color: bgColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
