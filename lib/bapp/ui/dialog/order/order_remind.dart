/*
 * @Description: 提醒按钮
 * @Author: iamsmiling
 * @Date: 2021-01-15 14:00:05
 * @LastEditTime: 2021-01-15 14:16:55
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

Future showOrderRemindDialog() {
  Map<OrderStatus, String> map = {
    OrderStatus.toBeAudited: "1",
    OrderStatus.toBeMeasured: "2",
    OrderStatus.toBeInstalled: "2",
  };
  return showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return GetBuilder<OrderDetailController>(
          builder: (_) {
            RemindOrderParamsModel params = RemindOrderParamsModel(
                orderId: "${_.order.id}", status: map[_.order.orderStatus]);

            return AlertDialog(
              title: Text(
                "是否提醒测量?",
                textAlign: TextAlign.center,
              ),
              content: Row(
                children: [
                  OutlinedButton(
                    onPressed: Get.back,
                    child: Text("取消"),
                  ),
                  XFutureButton(
                      onFuture: () => _.remind(params),
                      onSuccess: Get.back,
                      child: Text("确定")),
                ],
              ),
            );
          },
        );
      });
}
