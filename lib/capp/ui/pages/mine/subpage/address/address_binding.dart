import 'package:get/get.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/address/address_controller.dart';

class CAddressBinding extends Bindings {
  @override
  void dependencies() {
    String userId = Get.parameters["userId"];
    assert(userId != null);
    Get.lazyPut(() => CAddressController(userId));
  }
}
