/*
 * @Description: 更多场景
 * @Author: iamsmiling
 * @Date: 2021-05-29 13:56:36
 * @LastEditTime: 2021-05-29 14:13:45
 */
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/domain/repository/scene_repository.dart';
import 'package:get/get.dart';

class MoreSceneController
    extends PullToRefreshListViewBuilderController<SceneEntity> {
  String id = Get.parameters["id"] ?? "";
  @override
  Future<List<SceneEntity>> loadData({Map? params}) {
    SceneRepository repository = SceneRepository();
    return repository.moreScene(params: {"scenes_id": id});
  }
}
