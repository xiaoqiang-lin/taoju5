import 'package:get/get.dart';
import 'package:taoju5_c/routes/capp_routes.dart';

enum UserRole { customer, business }

class LoginGuideController extends GetxController {
  UserRole role = UserRole.customer;

  loginAsCustomer() {
    return Get.toNamed(AppRoutes.customerPasswordLogin);
  }

  loginAsBussiness() {
    return Get.toNamed(AppRoutes.businessPasswordLogin);
  }
}
