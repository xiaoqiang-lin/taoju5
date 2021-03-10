/*
 * @Description:订单列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:23:58
 * @LastEditTime: 2021-01-05 10:31:28
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderListParentController());

    // Get.lazyPut(() => null);
  }
}
