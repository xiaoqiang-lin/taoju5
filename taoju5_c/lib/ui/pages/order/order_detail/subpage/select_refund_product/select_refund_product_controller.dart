/*
 * @Description:选择需要退款的商品
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:42:27
 * @LastEditTime: 2021-07-14 16:21:54
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';

class SelectRefundProductController extends GetxController {
  OrderDetailEntity order = Get.arguments;

  void select(OrderProductEntity product, bool flag) {
    product.selected = flag;
    update();
  }

  List<OrderProductEntity> get selectedProducts =>
      order.products.where((e) => e.selected).toList();
}
