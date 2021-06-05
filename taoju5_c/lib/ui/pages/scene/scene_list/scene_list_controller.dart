/*
 * @Description: 场景
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:26:01
 * @LastEditTime: 2021-06-04 07:41:48
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_category_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/domain/repository/scene_repository.dart';

class SceneListParentController
    extends BaseFutureLoadStateController<List<SceneCategoryEntity>>
    with SingleGetTickerProviderMixin {
  CategoryEntity category = Get.arguments;

  List<SceneCategoryEntity> categoryList = [];

  late TabController tabController;
  @override
  Future<List<SceneCategoryEntity>> loadData({Map? params}) {
    SceneRepository repository = SceneRepository();
    return repository
        .sceneCategoryList(params: {"type": category.type}).then((value) {
      categoryList = value;
      tabController = TabController(length: categoryList.length, vsync: this);
      for (SceneCategoryEntity c in categoryList) {
        Get.lazyPut(() => SceneListController(category: c, type: category.type),
            tag: "${c.id}");
      }
      return value;
    });
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}

class SceneListController
    extends PullToRefreshListViewBuilderController<SceneEntity> {
  late SceneCategoryEntity category;
  late int type;

  SceneListController({required this.category, required this.type});

  @override
  Future<List<SceneEntity>> loadData({Map? params}) {
    SceneRepository repository = SceneRepository();
    return repository
        .sceneList(params: {"category_id": category.id, "type": type});
  }
}
