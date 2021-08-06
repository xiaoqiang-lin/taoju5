/*
 * @Description: 更多场景
 * @Author: iamsmiling
 * @Date: 2021-05-29 13:56:36
 * @LastEditTime: 2021-07-29 16:24:10
 */
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/domain/repository/scene_repository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MoreSceneController
    extends PullToRefreshListViewBuilderController<SceneEntity> {
  String id = Get.parameters["id"] ?? "";

  MoreSceneController({required RefreshController controller}) {
    this.setRefreshController(controller);
  }
  @override
  Future<List<SceneEntity>> loadData({Map? params}) {
    SceneRepository repository = SceneRepository();
    return repository
        .moreScene(params: {"scenes_id": id, ...(params ?? {})}).then((value) {
      list = [...list, ...value.list];
      totalPage = value.totalPage;
      return value.list;
    });
  }
}
