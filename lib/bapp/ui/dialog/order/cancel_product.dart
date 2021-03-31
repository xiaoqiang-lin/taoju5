/*
 * @Description: 取消商品
 * @Author: iamsmiling
 * @Date: 2021-01-15 13:16:54
 * @LastEditTime: 2021-01-15 13:32:36
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_product_model.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

Future showCancelProductDialog({@required OrderDetailProductModel product}) {
  return showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return GetBuilder<OrderDetailController>(
          builder: (_) {
            CancelProductParamsModel params = CancelProductParamsModel(
              orderId: "${_.order.id}",
              productId: "${product.id}",
            );
            return AlertDialog(
              title: Text(
                "你确定要取消该商品吗?",
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: Get.back,
                        child: Text("取消"),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      XFutureButton(
                          onFuture: () =>
                              _.cancelProduct(params, product: product),
                          onSuccess: Get.back,
                          child: Text("确定")),
                    ],
                  )
                ],
              ),
            );
          },
        );
      });
}
