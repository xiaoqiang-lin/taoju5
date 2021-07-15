/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:37:50
 * @LastEditTime: 2021-04-21 13:39:33
 */

import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/school/school_controller.dart';

class SchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchoolParentController());
  }
}
