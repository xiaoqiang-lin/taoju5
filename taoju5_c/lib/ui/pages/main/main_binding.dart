import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/home/home_controller.dart';
import 'package:taoju5_c/ui/pages/main/main_controller.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';

class CMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CMainController());

    Get.lazyPut(() => CHomeController());

    Get.lazyPut(() => CMineController());
  }
}
