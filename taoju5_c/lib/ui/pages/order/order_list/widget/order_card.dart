/*
 * @Description: 订单卡片
 * @Author: iamsmiling
 * @Date: 2021-05-17 17:33:37
 * @LastEditTime: 2021-07-20 11:07:04
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/mixin/order_product_operation_mixin.dart';
import 'package:taoju5_c/ui/pages/order/widget/product_adaptor_card.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderCard extends StatelessWidget with OrderProductOperationMixin {
  final OrderEntity order;
  OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: R.dimen.dp10),
          color: R.color.ffffffff,
          padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
          child: Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: jump,
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
                            fontSize: R.dimen.sp14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: R.dimen.dp16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (OrderActionButtonEntity a in order.actions.reversed)
                      PrimaryButton(
                        text: a.text,
                        margin: EdgeInsets.only(left: R.dimen.dp10),
                        onPressed: () => (orderActionMap[a.actionCode] ??
                            (_) => Future.value())(order),
                        textStyle: TextStyle(
                            fontSize: R.dimen.sp13,
                            fontWeight: FontWeight.normal),
                        mode: a.mode,
                        constraints: BoxConstraints(
                            minWidth: R.dimen.dp84, minHeight: R.dimen.dp32),
                        padding: EdgeInsets.symmetric(
                            horizontal: R.dimen.dp16, vertical: R.dimen.dp7),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: R.dimen.dp10,
          thickness: R.dimen.dp10,
          color: R.color.fff5f5f5,
        )
      ],
    );
  }

  void jump() {
    Get.toNamed(AppRoutes.orderDetail + "/${order.id}");
  }
}
