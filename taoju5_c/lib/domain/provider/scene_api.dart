/*
 * @Description: 场景
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:43:49
 * @LastEditTime: 2021-07-30 14:31:35
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class SceneAPI {
  HttpKit _http = HttpKit();

  ///场景tab
  Future<BaseEntity> sceneCategoryTabList({Map? params}) =>
      _http.get("/app/scenes/scenesCategoryTitle", params: params);

  ///场景分类
  Future<BaseEntity> sceneCategoryList({Map? params}) =>
      _http.get("/app/scenes/scenesCategoryList", params: params);

  ///场景列表
  Future<BaseEntity> sceneList({Map? params}) =>
      _http.get("/app/scenes/scenesList", params: params);

  ///场景详情
  Future<BaseEntity> sceneDetail({Map? params}) =>
      _http.get("/app/scenes/scenesDetail", params: params);

  ///场景详情
  Future<BaseEntity> moreScene({Map? params}) =>
      _http.get("/app/scenes/moreScenes", params: params);

  ///获取软装方案商品详情
  Future<BaseEntity> sceneProductDetail({Map? params}) =>
      _http.get("/app/scenes/softProjectGoodsDetail", params: params);

  ///修改场景商品属性
  Future<BaseEntity> modifySceneProductAttribute({Map? params}) =>
      _http.get("/app/scenes/editGoodsAttr", params: params);
}
