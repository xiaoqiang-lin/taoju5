import 'package:get/get.dart';
import 'package:taoju5/capp/ui/pages/login/modify_password/modify_password_controller.dart';

class CModifyPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CModifyPasswordController());
  }
}
