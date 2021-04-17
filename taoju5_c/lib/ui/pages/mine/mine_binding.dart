import 'package:get/get.dart';

import 'mine_controller.dart';
// import 'package:taoju5_c/pages/mine/mine_controller.dart';

class CMineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CMineController());
  }
}
