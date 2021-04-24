/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-22 13:25:50
 * @LastEditTime: 2021-04-23 17:23:06
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/subpage/modify_user_avatar/modify_user_avatar_controller.dart';

class ModifyUserAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModifyUserAvatarController());
  }
}
