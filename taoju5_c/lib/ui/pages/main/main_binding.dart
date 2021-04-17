import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/home/home_controller.dart';
import 'package:taoju5_c/ui/pages/main/main_controller.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());

    Get.lazyPut(() => HomeController());

    Get.lazyPut(() => MineController());
  }
}
