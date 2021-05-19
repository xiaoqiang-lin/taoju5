/*
 * @Description: 订单卡片
 * @Author: iamsmiling
 * @Date: 2021-05-17 17:33:37
 * @LastEditTime: 2021-05-18 09:13:45
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/widget/product_adaptor_card.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.toNamed(AppRoutes.orderDetail + "/${order.id}"),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
        child: Column(
          children: [
            for (ProductAdaptorEntity p in order.products)
              ProductAdaptorCard(
                product: p,
                rightTopCorner: Text(
                  "${p.status}",
                  style: TextStyle(
                      fontSize: R.dimen.sp12, color: R.color.ffff5005),
                ),
              ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(bottom: R.dimen.dp16),
              child: Text(
                order.tip,
                style: TextStyle(
                    fontSize: R.dimen.sp14, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: R.dimen.dp16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (OrderActionButtonEntity a in order.actions)
                    PrimaryButton(
                      text: a.text,
                      margin: EdgeInsets.only(left: R.dimen.dp10),
                      onPressed: () {},
                      size: PrimaryButtonSize.middle,
                      textStyle: TextStyle(fontSize: R.dimen.sp13),
                      mode: a.mode,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
