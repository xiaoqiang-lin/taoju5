/*
 * @Description: 订单列表卡片
 * @Author: iamsmiling
 * @Date: 2021-01-04 15:26:24
 * @LastEditTime: 2021-01-28 13:12:41
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_model.dart';
import 'package:taoju5_b/routes/bapp_routes.dart';
import 'package:taoju5_b/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_b/ui/pages/order/order_list/widgets/order_card_sheet.dart';
import 'package:taoju5_b/ui/pages/order/order_list/widgets/order_product_card.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({Key key, @required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        BAppRoutes.orderDetail + "/${order?.id}",
      ).then((value) {
        if (value == true) {
          OrderListParentController parentController =
              Get.find<OrderListParentController>();
          parentController.refreshData();
          Get.find<OrderListController>(tag: parentController.tag)
              .refreshData();
        }
      }),
      child: Container(
        color: Get.theme.primaryColor,
        child: Column(
          children: [
            ListBody(
              children: [
                for (OrderProductModel e in order.productList)
                  OrderProductCard(product: e, order: order),
                OrderCardSheet(order: order)
              ],
            )
          ],
        ),
      ),
    );
  }
}
