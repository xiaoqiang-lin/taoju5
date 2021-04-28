/*
 * @Description: 定位
 * @Author: iamsmiling
 * @Date: 2021-04-28 16:53:06
 * @LastEditTime: 2021-04-28 16:54:36
 */
import 'package:get/get.dart';
import 'location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
  }
}
