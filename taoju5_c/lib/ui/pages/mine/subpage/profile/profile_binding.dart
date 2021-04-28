/*
 * @Description: 个人资料
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-27 15:14:20
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(Get.arguments));
  }
}
