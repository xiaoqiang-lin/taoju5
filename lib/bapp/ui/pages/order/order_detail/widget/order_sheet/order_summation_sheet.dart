import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderSummationSheet extends GetView<OrderDetailController> {
  final bool shouldEmphasize;

  OrderSummationSheet({this.shouldEmphasize = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              "${(controller.order.orderStatus > OrderStatus.toBePaid || controller.order.orderType == OrderType.endProductOrder) ? '合计' : '预计总价'}:"),
          Text(
            "¥${controller.order.payAmount}",
            style: shouldEmphasize
                ? TextStyle(
                    color: BColors.pinkColor,
                    fontSize: BDimens.sp36,
                    fontWeight: FontWeight.w500)
                : TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
