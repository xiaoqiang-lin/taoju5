/*
 * @Description: 场景
 * @Author: iamsmiling
 * @Date: 2021-05-28 10:04:05
 * @LastEditTime: 2021-05-28 10:17:18
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/scene/scene_category/scene_category_controller.dart';

class SceneCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SceneCategoryListParentController());
  }
}
