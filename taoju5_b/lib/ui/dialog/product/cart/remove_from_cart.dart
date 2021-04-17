import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/product/cart/cart_list_controller.dart';
import 'package:taoju5_b/ui/widgets/common/button/x_future_button.dart';

Future showRemoveFromCartDialog(String tag) {
  return showDialog(
      context: Get.context,
      builder: (BuildContext context) {
        return GetBuilder<CartListController>(
          tag: tag,
          builder: (_) {
            // CancelOrderParamsModel params =
            //     CancelOrderParamsModel(orderId: "${_.order.id}");
            return AlertDialog(
              title: Text(
                "你确定要从购物车中移除当前选中的商品吗?",
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: Get.back,
                        child: Text("取消"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: BDimens.gap24),
                        child: XFutureButton(
                            onFuture: _.removeFromCart,
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
