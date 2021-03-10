/*
 * @Description: /售后维权
 * @Author: iamsmiling
 * @Date: 2021-01-06 18:00:22
 * @LastEditTime: 2021-01-06 18:02:37
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderAfterSellButton extends GetView<OrderDetailController> {
  const OrderAfterSellButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: controller.order.orderStatus == OrderStatus.finished,
        child: ElevatedButton(
          child: Text("售后维权"),
          onPressed: () =>
              Get.toNamed(BAppRoutes.afterSell + "/${Get.parameters["id"]}"),
        ));
  }
}
