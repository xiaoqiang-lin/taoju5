/*
 * @Description: HomeController
 * @Author: iamsmiling
 * @Date: 2021-01-11 18:02:13
 * @LastEditTime: 2021-01-12 09:49:23
 */

import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/app/app_module_model.dart';
import 'package:taoju5_b/ui/pages/home/app_controller.dart';

class HomeController extends GetxController {
  List<AppModuleModel> moduleList;

  @override
  void onInit() {
    AppModuleModelListWrapper wrapper = AppModuleModelListWrapper();
    moduleList = wrapper.appModuleList;
    AppController appController = Get.find<AppController>();
    appController.requestPermission().then((value) {
      appController.upgradeApp();
    });
    super.onInit();
  }
}
