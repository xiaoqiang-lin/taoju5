/*
 * @Description:选择需要退款的商品
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:42:27
 * @LastEditTime: 2021-07-15 18:25:20
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';

class SelectRefundProductController extends GetxController {
  OrderDetailEntity order = Get.arguments;
  late RxList<OrderProductEntity> products = (<OrderProductEntity>[]).obs;

  bool get isCheckedAll => products.every((e) => e.selected);

  @override
  void onInit() {
    products = (order.products).obs;
    super.onInit();
  }

  void select(OrderProductEntity product, bool flag) {
    product.selected = flag;
    update();
  }

  List<OrderProductEntity> get selectedProducts =>
      order.products.where((e) => e.selected).toList();

  void selectAll(bool flag) {
    order.products.forEach((e) {
      e.selected = flag;
    });
    update();
  }
}
