import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/widget/order_sheet/order_deposit_sheet.dart';

class MeasureOrderSheet extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: BDimens.gap16),
      child: OrderDepositSheet(shouldEmphasize: true),
    );
  }
}
