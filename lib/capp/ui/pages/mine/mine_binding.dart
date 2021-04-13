import 'package:get/get.dart';

import 'mine_controller.dart';
// import 'package:taoju5/capp/pages/mine/mine_controller.dart';

class CMineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CMineController());
  }
}
