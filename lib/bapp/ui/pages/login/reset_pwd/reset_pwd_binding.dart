import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/login/reset_pwd/reset_pwd_controller.dart';

class ResetPwdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPwdController());
  }
}
