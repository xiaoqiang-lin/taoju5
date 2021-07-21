/*
 * @Description: 软装
 * @Author: iamsmiling
 * @Date: 2021-07-21 11:19:05
 * @LastEditTime: 2021-07-21 14:02:36
 */
import 'package:get/get.dart';

import 'soft_decoration_list_controller.dart';

class SoftDecorationListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SoftDecorationListController());
  }
}
