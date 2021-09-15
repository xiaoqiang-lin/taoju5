/*
 * @Description: taoju5Binding
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:22:04
 * @LastEditTime: 2021-09-11 14:37:35
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/home_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/user_provider_controller.dart';

import 'app_controller.dart';

class TaojuwuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());

    Get.put(TaojuwuController());
    // Get.put(HomeController());
    // Get.lazyPut(() => TaojuwuController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CustomerProviderController(), fenix: true);
    Get.lazyPut(() => UserProviderController(), fenix: true);
    // Get.put(CustomerProviderController(), permanent: true);
    // Get.put(UserProviderController(), permanent: true);
  }
}
