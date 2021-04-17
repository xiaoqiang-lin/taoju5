import 'package:get/get.dart';

import 'login_guide_controller.dart';

class LoginGuideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginGuideController());
  }
}
