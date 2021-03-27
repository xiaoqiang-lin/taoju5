import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/login/modify_pwd/modify_password_controller.dart';

class ModifyPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModifyPasswordController());
  }
}
