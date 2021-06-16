/*
 * @Description: 订单提交成功
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:09:01
 * @LastEditTime: 2021-06-11 17:20:09
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class CommitOrderSuccessPage extends StatelessWidget {
  const CommitOrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "订单已支付",
            style: TextStyle(
                fontSize: R.dimen.sp16,
                color: R.color.ff333333,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
