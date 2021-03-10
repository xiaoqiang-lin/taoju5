/*
 * @Description: 取消订单
 * @Author: iamsmiling
 * @Date: 2021-01-15 09:16:47
 * @LastEditTime: 2021-01-15 09:38:31
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_sized_text_field.dart';

Future showCancelOrderDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<OrderDetailController>(
          builder: (_) {
            CancelOrderParamsModel params =
                CancelOrderParamsModel(orderId: "${_.order.id}");
            return AlertDialog(
              title: Text(
                "你确定要取消订单吗?",
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  XSizedTextField(
                    autoFocus: true,
                    onChanged: (String text) {
                      params.reason = text;
                    },
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: Get.back,
                        child: Text("取消"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: BDimens.gap24),
                        child: XFutureButton(
                            onFuture: () => _.cancelOrder(params),
                            onSuccess: Get.back,
                            child: Text("确定")),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      });
}
