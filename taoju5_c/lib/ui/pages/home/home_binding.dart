/*
 * @Description:
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-06-24 15:32:52
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
