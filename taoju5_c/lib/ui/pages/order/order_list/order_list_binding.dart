/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:45:37
 * @LastEditTime: 2021-06-02 14:15:31
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderListParentController());
  }
}
