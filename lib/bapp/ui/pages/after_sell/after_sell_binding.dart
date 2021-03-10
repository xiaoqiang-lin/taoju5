/*
 * @Description:售后服务
 * @Author: iamsmiling
 * @Date: 2021-02-20 12:45:51
 * @LastEditTime: 2021-02-20 12:45:52
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/after_sell/after_sell_controller.dart';

class AfterSellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AfterSellController());
  }
}
