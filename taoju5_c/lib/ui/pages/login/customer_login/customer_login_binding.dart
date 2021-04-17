import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/login/customer_login/customer_login_controller.dart';

class CustomerLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerLoginController());
  }
}
