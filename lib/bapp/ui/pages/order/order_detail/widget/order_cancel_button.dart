/*
 * @Description: 订单取消
 * @Author: iamsmiling
 * @Date: 2021-01-06 17:43:35
 * @LastEditTime: 2021-01-15 12:57:49
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';

import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderCancelButton extends StatelessWidget {
  const OrderCancelButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      id: "buttonState",
      builder: (_) {
        return Visibility(
            child: OutlinedButton(
                onPressed: _.order.canRefund ? _.openCancelOrderDialog : null,
                child: Text("取消订单")),

            ///商品是窗帘商品 并且处于待审核状态
            visible: _.order.orderStatus < OrderStatus.producing);
      },
    );
  }
}
