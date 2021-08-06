/*
 * @Description: 搜索订单
 * @Author: iamsmiling
 * @Date: 2021-07-28 14:50:02
 * @LastEditTime: 2021-07-28 15:18:25
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';

import 'search_order_controller.dart';

class SearchOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchOrderController());
    Get.lazyPut(
        () => OrderListController(category: OrderTabEntity(status: "-1")),
        tag: "-1");
  }
}
