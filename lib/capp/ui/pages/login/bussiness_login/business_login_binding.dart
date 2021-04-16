import 'package:get/get.dart';

import 'bussiness_login_controller.dart';

class CBusinessLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CBusinessLoginController());
  }
}
