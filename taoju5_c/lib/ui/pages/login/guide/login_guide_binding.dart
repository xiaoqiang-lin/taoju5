import 'package:get/get.dart';

import 'login_guide_controller.dart';

class CLoginGuideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CLoginGuideController());
  }
}
