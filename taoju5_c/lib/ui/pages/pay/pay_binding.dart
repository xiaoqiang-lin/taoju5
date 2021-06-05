/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:05:04
 * @LastEditTime: 2021-06-01 10:15:23
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/pay/pay_controller.dart';

class PayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayController(arg: Get.arguments));
  }
}
