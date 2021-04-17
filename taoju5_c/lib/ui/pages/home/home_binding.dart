/*
 * @Description:
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-17 18:21:38
 */
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
