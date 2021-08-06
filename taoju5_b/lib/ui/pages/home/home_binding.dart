/*
 * @Description: taoju5Binding
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:22:04
 * @LastEditTime: 2021-07-30 06:43:20
 */
import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5_b/ui/pages/home/home_controller.dart';
import 'package:taoju5_b/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5_b/ui/pages/home/user_provider_controller.dart';

import 'app_controller.dart';

class TaojuwuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => TaojuwuController());
    Get.lazyPut(() => BHomeController());
    Get.lazyPut(() => CustomerProviderController(), fenix: true);
    Get.lazyPut(() => UserProviderController(), fenix: true);
    // Get.put(AppController());
    // Get.put(TaojuwuController());
    // Get.put(BHomeController());
    // Get.put(CustomerProviderController(), permanent: true);
    // Get.put(UserProviderController(), permanent: true);
  }
}
