/*
 * @Description: 场景
 * @Author: iamsmiling
 * @Date: 2021-05-28 10:03:44
 * @LastEditTime: 2021-05-28 14:45:32
 */
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_category_entity.dart';
import 'package:taoju5_c/domain/repository/scene_repository.dart';

class SceneCategoryListParentController
    extends BaseFutureLoadStateController<List<CategoryEntity>>
    with SingleGetTickerProviderMixin {
  late SceneCategoryEntityListWrapper wrapper;

  List<CategoryEntity> categoryList = [];

  late TabController tabController;
  @override
  Future<List<CategoryEntity>> loadData({Map? params}) {
    SceneRepository repository = SceneRepository();
    return repository.sceneCategoryTabList().then((value) {
      categoryList = value;

      tabController = TabController(length: categoryList.length, vsync: this);
      for (CategoryEntity c in categoryList) {
        print(c);
        print(c.id);
        print("******************______________");
        print(c.name);
        Get.lazyPut(() => SceneCategoryListController(category: c),
            tag: "${c.type}");
        print("**************_________");
      }
      return value;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class SceneCategoryListController
    extends PullToRefreshListViewBuilderController<SceneCategoryEntity> {
  late CategoryEntity category;

  SceneCategoryListController({required this.category});

  @override
  Future<List<SceneCategoryEntity>> loadData({Map? params}) {
    SceneRepository repository = SceneRepository();
    return repository.sceneCategoryList(params: {"type": category.type});
  }
}
