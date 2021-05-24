/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 10:57:47
 * @LastEditTime: 2021-05-19 10:59:01
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/footprint/foot_print_controller.dart';

class FootPrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FootPrintController());
  }
}
