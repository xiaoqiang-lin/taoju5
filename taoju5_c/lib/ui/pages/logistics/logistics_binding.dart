/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:31:09
 * @LastEditTime: 2021-05-20 14:32:15
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/logistics/logistics_controller.dart';

class LogisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogisticsController());
  }
}
