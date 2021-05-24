/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-20 16:52:42
 * @LastEditTime: 2021-05-20 16:53:50
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/edit_log/order_edit_log_controller.dart';

class OrderEditLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderEditLogController());
  }
}
