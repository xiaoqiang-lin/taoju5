/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:50:42
 * @LastEditTime: 2021-01-23 16:18:35
 */
import 'package:get/get.dart';

import 'scene_product_detail_controller.dart';

class SceneProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SceneProductDetailController());
  }
}
