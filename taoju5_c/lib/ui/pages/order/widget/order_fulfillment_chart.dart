/*
 * @Description: 订单流程图
 * @Author: iamsmiling
 * @Date: 2021-05-06 16:22:10
 * @LastEditTime: 2021-07-13 11:04:22
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';

class OrderFulfillmentProcessChart extends StatelessWidget {
  final PreOrderInfoEntity order;
  const OrderFulfillmentProcessChart({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(order.chart),
    );
  }
}
