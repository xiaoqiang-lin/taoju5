import 'package:flutter/material.dart';
import 'package:taoju5_b/domain/model/order/order_status.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_detail_model.dart';

class OrderDepositSheet extends GetView<OrderDetailController> {
  final bool shouldEmphasize;

  OrderDepositSheet({this.shouldEmphasize = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              "${controller.order.orderStatus >= OrderStatus.toBeMeasured ? '已收定金' : '首款定金'}:"),
          Text(
            "¥${controller.order.deposit}",
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
