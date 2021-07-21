/*
 * @Description: 退款
 * @Author: iamsmiling
 * @Date: 2021-07-09 13:59:44
 * @LastEditTime: 2021-07-19 09:30:15
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/upload_image_button.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/refund_product_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/ui/pages/order/mixin/order_product_operation_mixin.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/modal/cancel_order_modal.dart'
    as cancelProduct;

class RefundController extends GetxController with OrderProductOperationMixin {
  RefundProductParamsEntity arg = Get.arguments;
  List<ProductAdaptorEntity> products =
      (Get.arguments as RefundProductParamsEntity).products;
  CancelOrderReasonEntity cancelOrderReason =
      (Get.arguments as RefundProductParamsEntity).cancelOrderReason;

  String get totalPrice {
    double t = 0;
    products.forEach((e) {
      t += e.totalPrice;
    });
    return t.toStringAsFixed(2);
  }

  void setDescription(String val) {
    arg.description = val;
  }

  openCancelOrderModal() {
    return cancelProduct
        .openCancelOrderModal(Get.context!, cancelOrderReason)
        .then((value) {
      if (value is String) {
        arg.reason = value;
      }
    }).whenComplete(update);
  }

  Future submit() {
    OrderRepository repository = OrderRepository();

    if (Get.isRegistered<UploadImageController>()) {
      arg.formData = Get.find<UploadImageController>().formData;
    }
    // return Future.value();
    return repository.refund(params: arg.params).then((value) {
      Get.back();
    });
  }
}
