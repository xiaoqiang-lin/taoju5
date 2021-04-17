import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/order/order_type.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5_b/domain/model/order/order_detail_model.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/widget/order_sheet/order_summation_sheet.dart';

class FinishedProductOrderSheet extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.order.orderType == OrderType.endProductOrder,
      child: Container(
        margin: EdgeInsets.only(bottom: BDimens.gap16),
        child: OrderSummationSheet(),
      ),
    );
  }
}
