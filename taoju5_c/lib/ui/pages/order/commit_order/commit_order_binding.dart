/*
 * @Description: 提交订单
 * @Author: iamsmiling
 * @Date: 2021-04-28 11:15:12
 * @LastEditTime: 2021-04-28 11:18:25
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commit_order_controller.dart';

class CommitOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommitOrderController());
  }
}
