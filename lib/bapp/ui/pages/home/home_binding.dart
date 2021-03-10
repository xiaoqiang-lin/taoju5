/*
 * @Description: taoju5Binding
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:22:04
 * @LastEditTime: 2021-02-02 21:21:40
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
    Get.put(AppController());
    Get.put(TaojuwuController());
    Get.put(HomeController());
    Get.put(CustomerProviderController(), permanent: true);
    Get.put(UserProviderController(), permanent: true);
  }
}
