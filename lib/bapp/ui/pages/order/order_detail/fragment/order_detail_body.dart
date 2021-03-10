/*
 * @Description: 底单详情主体信息
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:36:29
 * @LastEditTime: 2021-01-28 13:10:54
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_detail_product_card.dart';

class OrderDetailBody extends GetView<OrderDetailController> {
  const OrderDetailBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.order.productList.length,
          separatorBuilder: (BuildContext context, int i) {
            return Divider(
              thickness: BDimens.gap16,
            );
          },
          itemBuilder: (BuildContext context, int i) {
            return OrderDetailProductCard(controller.order.productList[i]);
          }),
    );
  }
}
