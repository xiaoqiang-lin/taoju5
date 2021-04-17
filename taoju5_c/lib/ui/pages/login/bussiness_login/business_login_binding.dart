import 'package:get/get.dart';

import 'bussiness_login_controller.dart';

class BusinessLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessLoginController());
  }
}
