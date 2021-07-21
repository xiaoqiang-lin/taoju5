/*
 * @Description: 测量单
 * @Author: iamsmiling
 * @Date: 2021-07-20 15:40:30
 * @LastEditTime: 2021-07-20 15:59:29
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5_c/ui/pages/order/widget/install_time_picker_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/measure_time_picker_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_note_fill_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/window_count_picker_bar.dart';

import 'pre_order_bill_sheet_section.dart';

class MeasureOrderSection extends StatelessWidget {
  final CommitOrderController controller;
  const MeasureOrderSection({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
      child: Column(
        children: [
          MeasureTimePickerBar(
            onValueChanged: controller.setMeasureTime,
          ),
          InstallTimePickerBar(
            onValueChanged: controller.setInstallTime,
          ),
          WindowCountPickerBar(
            onValueChanged: controller.setWindowCount,
          ),
          PreOrderBillSheetSection(
              bill: controller.order!.bill,
              orderType: OrderType.measureOrder,
              needMeasure: true),
          OrderNoteFillBar(onValueChanged: controller.setOrderRemark)
        ],
      ),
    );
  }
}
