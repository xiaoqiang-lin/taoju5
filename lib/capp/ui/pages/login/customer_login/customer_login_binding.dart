import 'package:get/get.dart';
import 'package:taoju5/capp/ui/pages/login/customer_login/customer_login_controller.dart';

class CCustomerLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CCustomerLoginController());
  }
}
