/*
 * @Description: 账号安全
 * @Author: iamsmiling
 * @Date: 2021-06-07 14:37:55
 * @LastEditTime: 2021-06-07 14:38:53
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/account/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
