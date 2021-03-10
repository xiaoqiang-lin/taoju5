/*
 * @Description: 订单列表卡片
 * @Author: iamsmiling
 * @Date: 2021-01-04 15:26:24
 * @LastEditTime: 2021-01-28 13:12:41
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_model.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/widgets/order_product_card.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({Key key, @required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        BAppRoutes.orderDetail + "/${order?.id}",
      ),
      child: Container(
        child: Column(
          children: [
            ListBody(
              children: [
                for (OrderProductModel e in order.productList)
                  OrderProductCard(product: e, order: order)
              ],
            )
          ],
        ),
      ),
    );
  }
}
