import 'package:get/get.dart';
import 'package:taoju5/capp/ui/pages/login/modify_telephone/modify_telephone_controller.dart';

class CModifyTelephoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CModifyTelephoneController());
  }
}
