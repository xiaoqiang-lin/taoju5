import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/login/modify_telephone/modify_telephone_controller.dart';

class ModifyTelephoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ModifyTelephoneController());
  }
}
