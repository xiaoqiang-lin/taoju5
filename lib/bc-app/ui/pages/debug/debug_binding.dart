/*
 * @Description: 调试
 * @Author: iamsmiling
 * @Date: 2021-02-02 22:30:08
 * @LastEditTime: 2021-02-03 09:37:33
 */
import 'package:get/get.dart';
import 'debug_controller.dart';

class DebugBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DebugController());
  }
}
