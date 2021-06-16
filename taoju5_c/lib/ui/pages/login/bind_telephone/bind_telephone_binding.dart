/*
 * @Description: 绑定手机号
 * @Author: iamsmiling
 * @Date: 2021-06-07 17:04:28
 * @LastEditTime: 2021-06-07 17:08:16
 */

import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/login/bind_telephone/bind_telephone_controller.dart';

class BindTelephoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindTelephoneController());
  }
}
