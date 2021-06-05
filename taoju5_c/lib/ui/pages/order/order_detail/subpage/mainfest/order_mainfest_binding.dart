/*
 * @Description: 商品清单
 * @Author: iamsmiling
 * @Date: 2021-05-20 16:43:57
 * @LastEditTime: 2021-06-02 15:22:52
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_controller.dart';

class OrderMainfestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderMainfestController());
  }
}
