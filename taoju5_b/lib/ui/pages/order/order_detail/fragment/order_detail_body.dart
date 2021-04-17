/*
 * @Description: 底单详情主体信息
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:36:29
 * @LastEditTime: 2021-01-28 13:10:54
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/widget/order_detail_product_card.dart';

class OrderDetailBody extends StatelessWidget {
  const OrderDetailBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(builder: (_) {
      return Container(
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _.order.productList.length,
            separatorBuilder: (BuildContext context, int i) {
              return Divider(
                thickness: BDimens.gap16,
              );
            },
            itemBuilder: (BuildContext context, int i) {
              return GetBuilder<OrderDetailController>(
                  id: "${_.order.productList[i].id}",
                  builder: (_) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.toNamed(
                          BAppRoutes.orderMainfest + "/${_.order.id}"),
                      child: OrderDetailProductCard(
                        _.order.productList[i],
                        order: _.order,
                      ),
                    );
                  });
            }),
      );
    });
  }
}
