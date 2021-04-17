import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5_b/domain/model/order/order_detail_model.dart';
import 'package:taoju5_b/ui/widgets/common/button/x_future_button.dart';

Future showSelectProductDialog() {
  return showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return GetBuilder<OrderDetailController>(
          builder: (_) {
            return AlertDialog(
              title: Text(
                "您还有${_.order.unselectedCount}窗未选品,是否提交?",
                textAlign: TextAlign.center,
              ),
              content: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: Get.back,
                      child: Text("取消"),
                    ),
                    SizedBox(width: 24),
                    XFutureButton(
                        onFuture: _.submitSelectedProduct,
                        onSuccess: Get.back,
                        child: Text("确定")),
                  ],
                ),
              ),
            );
          },
        );
      });
}
