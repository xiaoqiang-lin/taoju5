/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-29 09:29:12
 * @LastEditTime: 2021-07-29 17:09:47
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/modal/scene_product_controller.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/scene_detail_controller.dart';

class SceneDetailBinding extends Bindings {
  @override
  void dependencies() {
    String id = Get.parameters["id"] ?? "";
    Get.lazyPut(() => SceneDetailController(), tag: id);
    Get.lazyPut(() => SceneProductController());
  }
}
