import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderOriginPriceSheet extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.order.orderStatus == OrderStatus.toBePaid &&
          controller.order.isPriceModified,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("原价:"),
            Text(
              "¥${controller.order.originalPrice}",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
