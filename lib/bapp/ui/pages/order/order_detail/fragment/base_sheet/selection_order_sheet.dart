import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_sheet/order_balance_sheet.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_sheet/order_delta_price_sheet.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_sheet/order_deposit_sheet.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_sheet/order_editable_balance_sheet.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_sheet/order_origin_price_sheet.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_sheet/order_summation_sheet.dart';

class SelectionOrderSheet extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Container(
          margin: EdgeInsets.only(bottom: BDimens.gap16),
          child: Column(
            children: [
              OrderDepositSheet(),
              OrderOriginPriceSheet(),
              OrderDeltaPriceSheet(),
              if (controller.order.orderStatus == OrderStatus.toBePaid)
                Column(
                  children: [
                    OrderSummationSheet(shouldEmphasize: false),
                    OrderEditableBalanceSheet()
                  ],
                )
              else
                Column(
                  children: [
                    OrderBalanceSheet(),
                    OrderSummationSheet(),
                  ],
                )
            ],
          )),
    );
  }
}
