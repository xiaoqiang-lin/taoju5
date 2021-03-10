/*
 * @Description: 登录binding
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:08:22
 * @LastEditTime: 2020-12-28 16:40:41
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/login/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
