/*
 * @Description: OrderDetailBinding
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:35:18
 * @LastEditTime: 2020-12-22 15:39:16
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailController());
  }
}
