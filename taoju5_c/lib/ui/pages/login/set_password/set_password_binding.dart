/*
 * @Description: 设置密码
 * @Author: iamsmiling
 * @Date: 2021-06-07 14:54:14
 * @LastEditTime: 2021-06-07 14:55:37
 */

import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/login/set_password/set_password_controller.dart';

class SetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetPasswordController());
  }
}
