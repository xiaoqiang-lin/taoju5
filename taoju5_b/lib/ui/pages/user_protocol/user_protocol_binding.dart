import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/user_protocol/user_protocol_controller.dart';

class UserProtocolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProtocolController());
  }
}
