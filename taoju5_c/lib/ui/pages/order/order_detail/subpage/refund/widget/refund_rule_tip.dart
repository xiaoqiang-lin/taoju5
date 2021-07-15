/*
 * @Description: 退款退货规则说明
 * @Author: iamsmiling
 * @Date: 2021-07-12 09:37:55
 * @LastEditTime: 2021-07-12 09:43:44
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class RefundRuleTip extends StatelessWidget {
  const RefundRuleTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: R.dimen.dp15),
      child: Text.rich(
        TextSpan(
            text: "商品退换规则详见",
            style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff999999),
            children: [
              TextSpan(text: "退换说明", style: TextStyle(color: R.color.ffff5005))
            ]),
      ),
    );
  }
}
