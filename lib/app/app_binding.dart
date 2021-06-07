/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-06-07 09:51:15
 * @LastEditTime: 2021-06-07 10:16:13
 */
import 'package:get/get.dart';

import 'package:taoju5_b/ui/pages/home/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());

    // Get.lazyPut(() => );
  }
}
