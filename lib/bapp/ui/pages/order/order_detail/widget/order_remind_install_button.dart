/*
 * @Description: 提醒安装
 * @Author: iamsmiling
 * @Date: 2021-01-06 17:43:35
 * @LastEditTime: 2021-01-15 14:18:34
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderRemindInstallButton extends GetView<OrderDetailController> {
  const OrderRemindInstallButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: OutlinedButton(
          onPressed: controller.openRemindOrderDialog, child: Text("提醒安装")),

      ///商品是窗帘商品 并且处于待审核状态
      visible: controller.order.productType is CurtainProductType &&
          controller.order.orderStatus == OrderStatus.toBeInstalled,
    );
  }
}
