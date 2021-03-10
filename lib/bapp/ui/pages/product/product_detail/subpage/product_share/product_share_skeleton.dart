/*
 * @Description: 分享页面骨架屏
 * @Author: iamsmiling
 * @Date: 2021-01-29 09:13:23
 * @LastEditTime: 2021-01-29 09:15:01
 */
/*
 * @Description: 商品详情骨架屏页面
 * @Author: iamsmiling
 * @Date: 2021-01-27 17:43:13
 * @LastEditTime: 2021-01-29 09:04:32
 */
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class ProductShareSkeleton extends StatelessWidget {
  const ProductShareSkeleton({Key key}) : super(key: key);

  final Color bgColor = Colors.black26;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
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
                    Image.asset("assets/images/share.png"),
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
    );
  }
}
