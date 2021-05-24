/*
 * @Description: 售后
 * @Author: iamsmiling
 * @Date: 2021-05-20 15:02:23
 * @LastEditTime: 2021-05-20 15:03:20
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/aftersell/aftersell_controller.dart';

class AftersellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AftersellController());
  }
}
