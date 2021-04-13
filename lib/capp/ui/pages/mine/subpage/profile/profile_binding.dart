import 'package:get/get.dart';
import 'package:taoju5/capp/entity/user/user_entity.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/profile/profile_controller.dart';

class CProfileBinding extends Bindings {
  @override
  void dependencies() {
    assert(Get.arguments is UserEntity);
    Get.lazyPut(() => CProfileController(Get.arguments));
  }
}
