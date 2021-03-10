/*
 * @Description: 商品详情骨架屏页面
 * @Author: iamsmiling
 * @Date: 2021-01-27 17:43:13
 * @LastEditTime: 2021-01-29 09:15:24
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class ProductDetailSkeleton extends StatelessWidget {
  const ProductDetailSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black26;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: BDimens.gap32),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/customer_badge.png",
                  color: BColors.disabledColor,
                ),
                Text(
                  "请选择",
                  style: TextStyle(color: BColors.disabledColor),
                )
              ],
            ),
          )
        ],
      ),
      body: Shimmer.fromColors(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: BDimens.gap16),
                  height: 240,
                  color: bgColor),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: BDimens.gap16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 128, height: 44, color: bgColor),
                      Container(
                          margin: EdgeInsets.only(left: BDimens.gap16),
                          width: 144,
                          height: 36,
                          color: bgColor),
                      Spacer(),
                      Row(
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.only(left: 8),
                          //   child: Image.asset("assets/images/blank_heart.png"),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: 4, left: 8),
                          //   child: Image.asset(
                          //       "assets/images/product_detail_cart.png"),
                          // )
                        ],
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap16),
                child: Row(
                  children: [
                    Container(height: 44, width: 88, color: bgColor),
                    Container(
                        margin: EdgeInsets.only(left: BDimens.gap16),
                        height: 36,
                        width: 88,
                        color: bgColor),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: List.generate(
                      2,
                      (index) => Flexible(
                            child: Container(
                              margin: EdgeInsets.only(top: BDimens.gap32),
                              height: 196,
                              color: bgColor,
                            ),
                          )),
                ),
              )
            ],
          ),
        ),
        baseColor: Colors.black12,
        highlightColor: Colors.white,
      ),
    );
  }
}
