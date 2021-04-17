/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-17 18:30:08
 */
import 'package:get/get.dart';

import 'mine_controller.dart';
// import 'package:taoju5_c/pages/mine/mine_controller.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
  }
}
