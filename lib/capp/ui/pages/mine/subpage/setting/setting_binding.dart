import 'package:get/get.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/setting/setting_controller.dart';

class CSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CSettingController());
  }
}
