/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-05-29 09:30:01
 * @LastEditTime: 2021-08-05 09:39:51
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_product_entity.dart';
import 'package:taoju5_c/domain/repository/scene_repository.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/modal/scene_product_modal.dart';
import 'package:taoju5_c/ui/pages/scene/scene_detail/section/more_scene/more_scene_controller.dart';

class SceneDetailController
    extends ChimeraRefreshController<SceneDetailEntity> {
  SceneRepository _repository = SceneRepository();
  late SceneDetailEntity scene = SceneDetailEntity();

  String id = Get.parameters["id"] ?? "";
  @override
  Future<SceneDetailEntity> loadData({Map? params}) {
    return _repository.sceneDetail(params: {"scenes_id": 601}).then((value) {
      scene = value;

      return value;
    });
  }

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => MoreSceneController(controller: refreshController),
        tag: id);
  }

  Future openModal() {
    return openSceneProductModal(Get.context!, scene: scene)
        .whenComplete(update);
  }

  // @override
  // void onClose() {
  //   Get.delete<SceneDetailController>(tag: id, force: true);

  //   if (Get.isRegistered<MoreSceneController>(tag: id)) {
  //     Get.delete<MoreSceneController>(tag: id, force: true);
  //   }

  //   super.onClose();
  // }

  @override
  void onClose() {
    Get.delete<SceneDetailController>(tag: id, force: true);

    if (Get.isRegistered<MoreSceneController>(tag: id)) {
      Get.delete<MoreSceneController>(tag: id, force: true);
    }

    for (SceneProductEntity p in scene.decoration.products) {
      if (p.productType is FabricCurtainProductType &&
          Get.isRegistered<CurtainProductAttributeController>(tag: "${p.id}")) {
        Get.delete<CurtainProductAttributeController>(
            tag: "${p.id}", force: true);
      }
    }

    super.onClose();
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<MoreSceneController>(tag: "$id").loadMore();
  }
}
