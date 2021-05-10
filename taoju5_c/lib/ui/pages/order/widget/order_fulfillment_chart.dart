/*
 * @Description: 订单流程图
 * @Author: iamsmiling
 * @Date: 2021-05-06 16:22:10
 * @LastEditTime: 2021-05-06 16:25:51
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class OrderFulfillmentProcessChart extends StatelessWidget {
  const OrderFulfillmentProcessChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(R.image.orderProcessChart),
    );
  }
}
