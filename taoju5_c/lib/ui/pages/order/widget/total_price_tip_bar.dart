/*
 * @Description: 商品总价
 * @Author: iamsmiling
 * @Date: 2021-05-17 14:22:05
 * @LastEditTime: 2021-07-17 16:04:59
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class TotalPriceTipBar extends StatelessWidget {
  final String label;
  final double totalPrice;
  const TotalPriceTipBar(
      {Key? key, required this.label, required this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: R.dimen.dp15, bottom: R.dimen.dp20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              label,
              style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ff181818),
            ),
          ),
          Text(
            "¥${totalPrice.toStringAsFixed(2)}",
            style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ffff5005),
          )
        ],
      ),
    );
  }
}
