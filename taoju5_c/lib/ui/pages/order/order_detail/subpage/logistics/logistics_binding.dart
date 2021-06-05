/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:31:09
 * @LastEditTime: 2021-05-28 18:00:41
 */
import 'package:get/get.dart';

import 'logistics_controller.dart';

class LogisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogisticsController());
  }
}
