/*
 * @Description: 场景
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:46:17
 * @LastEditTime: 2021-07-30 14:31:51
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_category_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_decoration_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_detail_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_product_entity.dart';
import 'package:taoju5_c/domain/provider/scene_api.dart';

class SceneRepository {
  SceneAPI _api = SceneAPI();

  ///场景分类tab
  Future<List<CategoryEntity>> sceneCategoryTabList({Map? params}) =>
      _api.sceneCategoryTabList().then((BaseEntity response) {
        return JsonKit.asList(response.data)
            .map((e) => CategoryEntity.fromJson(e))
            .toList();
      });

  ///场景分类列表
  Future<List<SceneCategoryEntity>> sceneCategoryList({Map? params}) =>
      _api.sceneCategoryList(params: params).then((BaseEntity response) {
        return JsonKit.asList(response.data)
            .map((e) => SceneCategoryEntity.fromJson(e))
            .toList();
      });

  ///场景列表
  Future<SceneEntityListWrapperEntity> sceneList({Map? params}) =>
      _api.sceneList(params: params).then((BaseEntity response) {
        return SceneEntityListWrapperEntity.fromJson(response.data);
      });

  ///场景列表
  Future<SceneDetailEntity> sceneDetail({Map? params}) =>
      _api.sceneDetail(params: params).then((BaseEntity response) {
        return SceneDetailEntity.fromJson(response.data);
      });

  ///更多场景
  Future<SceneEntityListWrapperEntity> moreScene({Map? params}) =>
      _api.moreScene(params: params).then((BaseEntity response) {
        return SceneEntityListWrapperEntity.fromJson(response.data);
      });

  ///获取软装方案商品详情
  Future<SceneDecorationEntity> sceneProductDetail({Map? params}) =>
      _api.sceneProductDetail(params: params).then((BaseEntity response) {
        return SceneDecorationEntity.fromJson(response.data);
      });

  ///修改场景商品属性
  Future<SceneProductEntity> modifySceneProductAttribute({Map? params}) => _api
          .modifySceneProductAttribute(params: params)
          .then((BaseEntity response) {
        return SceneProductEntity.fromJson(response.data);
      });
}
