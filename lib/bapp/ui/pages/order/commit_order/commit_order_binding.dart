/*
 * @Description: CommitOrderBinding
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:50:00
 * @LastEditTime: 2020-12-22 15:58:31
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order/commit_order_controller.dart';

class CommitOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommitOrderController());
  }
}
