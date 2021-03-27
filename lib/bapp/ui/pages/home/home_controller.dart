/*
 * @Description: HomeController
 * @Author: iamsmiling
 * @Date: 2021-01-11 18:02:13
 * @LastEditTime: 2021-01-12 09:49:23
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/app/app_module_model.dart';
import 'package:taoju5/bapp/ui/pages/home/app_controller.dart';

class HomeController extends GetxController {
  List<AppModuleModel> moduleList;

  @override
  void onInit() {
    AppModuleModelListWrapper wrapper = AppModuleModelListWrapper();
    moduleList = wrapper.appModuleList;
    Get.find<AppController>().upgradeApp();
    super.onInit();
  }
}
