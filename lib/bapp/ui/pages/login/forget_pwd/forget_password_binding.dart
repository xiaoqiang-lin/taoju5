/*
 * @Description:忘记密码
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:42:56
 * @LastEditTime: 2020-12-28 16:42:58
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/login/forget_pwd/forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
