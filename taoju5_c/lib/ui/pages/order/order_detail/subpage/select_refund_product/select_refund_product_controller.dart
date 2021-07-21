/*
 * @Description:选择需要退款的商品
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:42:27
 * @LastEditTime: 2021-07-16 09:51:38
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/order/refund_product_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';

class SelectRefundProductController extends GetxController {
  RefundProductParamsEntity arg = Get.arguments;
  RxList<ProductAdaptorEntity> products = (<ProductAdaptorEntity>[]).obs;
  String orderId = Get.parameters["order_id"] ?? "";
  bool get isCheckedAll => products.every((e) => e.selected);

  @override
  void onInit() {
    products.value = arg.products;
    super.onInit();
  }

  void select(ProductAdaptorEntity product, bool flag) {
    product.selected = flag;
    update();
  }

  List<ProductAdaptorEntity> get selectedProducts =>
      products.where((e) => e.selected).toList();

  void selectAll(bool flag) {
    products.forEach((e) {
      e.selected = flag;
    });
    update();
  }
}
