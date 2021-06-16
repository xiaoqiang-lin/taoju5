/*
 * @Description: 提交订单成功
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:12:13
 * @LastEditTime: 2021-06-11 17:13:10
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/commit_order_success/commit_order_success_controller.dart';

class CommitOrderSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommitOrderSuccessController());
  }
}
