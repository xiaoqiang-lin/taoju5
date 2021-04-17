import 'package:get/get.dart';

import 'home_controller.dart';

class CHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CHomeController());
  }
}
