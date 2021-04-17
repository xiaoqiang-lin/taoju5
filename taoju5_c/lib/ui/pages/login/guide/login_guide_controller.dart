import 'package:get/get.dart';
import 'package:taoju5_c/routes/capp_routes.dart';

enum UserRole { customer, business }

class CLoginGuideController extends GetxController {
  UserRole role = UserRole.customer;

  loginAsCustomer() {
    return Get.toNamed(CAppRoutes.customerPasswordLogin);
  }

  loginAsBussiness() {
    return Get.toNamed(CAppRoutes.businessPasswordLogin);
  }
}
