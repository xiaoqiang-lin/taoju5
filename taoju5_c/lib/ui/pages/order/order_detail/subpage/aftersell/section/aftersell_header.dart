/*
 * @Description: 顶部
 * @Author: iamsmiling
 * @Date: 2021-05-24 15:05:37
 * @LastEditTime: 2021-06-04 06:25:43
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/widget/product_adaptor_card.dart';

class AfterSellHeader extends StatelessWidget {
  final OrderDetailEntity order;
  const AfterSellHeader({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderProductEntity p = order.wrapper.customProduct.products.first;
    return Container(
        margin: EdgeInsets.only(
            top: R.dimen.dp13,
            left: R.dimen.dp24,
            right: R.dimen.dp24,
            bottom: R.dimen.dp18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "售后订单",
              style: TextStyle(
                  fontSize: R.dimen.sp14,
                  color: R.color.ff181818,
                  fontWeight: FontWeight.bold),
            ),
            ProductAdaptorCard(
              product: p.product,
              rightTopCorner: Text(
                "¥${p.product.unitPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: R.dimen.sp12),
              ),
            )
          ],
        ));
  }
}
