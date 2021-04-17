import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/login/modify_pwd/modify_password_controller.dart';

class ModifyPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModifyPasswordController());
  }
}
