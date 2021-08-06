/*
 * @Description: 订单详情
 * @Author: iamsmiling
 * @Date: 2021-05-17 18:25:51
 * @LastEditTime: 2021-07-27 11:21:28
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    // String? id = Get.parameters["order_id"];
    Get.lazyPut(() => OrderDetailController());
  }
}
