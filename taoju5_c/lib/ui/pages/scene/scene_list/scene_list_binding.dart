/*
 * @Description: 场景列表
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:26:20
 * @LastEditTime: 2021-05-28 09:53:13
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/scene/scene_list/scene_list_controller.dart';

class SceneListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SceneListParentController());
  }
}
