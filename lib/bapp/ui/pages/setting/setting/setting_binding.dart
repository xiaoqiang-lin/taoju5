/*
 * @Description: SettngBinding
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:54:12
 * @LastEditTime: 2020-12-31 17:49:02
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/setting/setting/setting_controller.dart';

class SettngBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
