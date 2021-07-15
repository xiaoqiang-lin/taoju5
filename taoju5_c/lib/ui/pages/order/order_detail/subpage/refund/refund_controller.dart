/*
 * @Description: 退款
 * @Author: iamsmiling
 * @Date: 2021-07-09 13:59:44
 * @LastEditTime: 2021-07-12 15:15:02
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/refund_product_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/ui/pages/order/mixin/order_product_operation_mixin.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/modal/cancel_order_modal.dart'
    as cancelProduct;

class RefundController extends GetxController with OrderProductOperationMixin {
  RefundProductParamsEntity arg = Get.arguments;
  List<ProductAdaptorEntity> products =
      (Get.arguments as RefundProductParamsEntity).products;
  OrderDetailEntity order = (Get.arguments as RefundProductParamsEntity).order;

  String get totalPrice {
    double t = 0;
    products.forEach((e) {
      t += e.totalPrice;
    });
    return t.toStringAsFixed(2);
  }

  String description = "请选择";

  openCancelOrderModal() {
    return cancelProduct
        .openCancelOrderModal(Get.context!, order.cancelOrderReason)
        .then((value) {
      if (value is String) {
        description = value;
      }
    }).whenComplete(update);
  }
}
