/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-05-29 09:30:01
 * @LastEditTime: 2021-05-29 10:02:11
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/scene/scene_detail_entity.dart';
import 'package:taoju5_c/domain/repository/scene_repository.dart';

class SceneDetailController
    extends BaseFutureLoadStateController<SceneDetailEntity> {
  late SceneDetailEntity scene;

  String id = Get.parameters["id"] ?? "";
  @override
  Future<SceneDetailEntity> loadData({Map? params}) {
    SceneRepository _repository = SceneRepository();

    return _repository.sceneDetail(params: {"scenes_id": id}).then((value) {
      scene = value;
      return value;
    });
  }
}
