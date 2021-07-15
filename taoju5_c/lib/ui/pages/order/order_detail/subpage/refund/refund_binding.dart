/*
 * @Description: 退款
 * @Author: iamsmiling
 * @Date: 2021-07-09 14:00:00
 * @LastEditTime: 2021-07-09 14:02:05
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/refund/refund_controller.dart';

class RefundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RefundController());
  }
}
