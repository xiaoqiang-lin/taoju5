/*
 * @Description: 订单详情底部操作栏
 * @Author: iamsmiling
 * @Date: 2021-01-06 17:11:48
 * @LastEditTime: 2021-01-15 10:42:04
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_cancel_button.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_remind_audit_button.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_remind_install_button.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/widget/order_remind_measure_button.dart';

class OrderDetailBottomActionBar extends GetView<OrderDetailController> {
  const OrderDetailBottomActionBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(BDimens.gap16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OrderCancelButton(),
          Container(
            margin: EdgeInsets.only(left: BDimens.gap24),
            child: Row(
              children: [
                OrderRemindAuditButton(),
                OrderRemindMeasureButton(),
                OrderRemindInstallButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
