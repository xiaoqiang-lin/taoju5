import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/login/reset_pwd/reset_pwd_controller.dart';

class ResetPwdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPwdController());
  }
}
