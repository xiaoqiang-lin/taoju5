/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-29 09:29:12
 * @LastEditTime: 2021-05-29 14:08:24
 */
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/scene_detail_controller.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/more_scene/more_scene_controller.dart';

class SceneDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SceneDetailController());
    Get.lazyPut(() => MoreSceneController());
  }
}
