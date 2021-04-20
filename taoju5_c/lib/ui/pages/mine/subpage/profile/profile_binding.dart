/*
 * @Description: 个人资料
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-19 15:56:39
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    assert(Get.arguments is UserEntity);
    Get.lazyPut(() => ProfileController(Get.arguments));
  }
}
