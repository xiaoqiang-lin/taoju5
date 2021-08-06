/*
 * @Description: 选品单
 * @Author: iamsmiling
 * @Date: 2021-07-20 15:48:28
 * @LastEditTime: 2021-07-23 11:30:05
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_note_fill_bar.dart';

import 'custom_product_section.dart';
import 'finished_product_section.dart';

class SelectOrderSection extends StatelessWidget {
  final CommitOrderController controller;
  const SelectOrderSection({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
              child: CustomProductSection(
                onNeedMeasureChanged: controller.setNeedMeasure,
                onInstallTimeChanged: controller.setInstallTime,
                onMeasureTimeChanged: controller.setMeasureTime,
                products: controller.customProducts,
                order: controller.order!,
                orderType: controller.orderType,
                needMeasure: controller.args.needMeasure,
              )),
          Container(
            height: R.dimen.dp10,
            color: R.color.fff5f5f5,
            width: R.dimen.width,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
              child: FinishedProductSection(
                  products: controller.finishedProducts)),
          Container(
            height: R.dimen.dp10,
            color: R.color.fff5f5f5,
            width: R.dimen.width,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
              child: OrderNoteFillBar(
                onValueChanged: controller.setOrderRemark,
              )),
        ],
      ),
    );
  }
}
