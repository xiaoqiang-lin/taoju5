/*
 * @Description: 收藏相关
 * @Author: iamsmiling
 * @Date: 2021-06-08 17:07:32
 * @LastEditTime: 2021-07-16 15:29:25
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class CollectionAPI {
  HttpKit _http = HttpKit();

  ///收藏
  Future<BaseEntity> collect(Map params) =>
      _http.post("/app/user/addCollection", formData: params);

  ///取消收藏
  Future<BaseEntity> cancelCollect(Map params) =>
      _http.post("/app/user/cancelCollection", formData: params);

  ///文章收藏列表
  Future<BaseEntity> articleCollection({Map? params}) =>
      _http.get("/app/user/favoriteArticleList", params: params);

  ///门店收藏列表
  Future<BaseEntity> storeCollection(Map params) =>
      _http.get("/app/user/favoriteArticleList", params: params);

  ///场景收藏列表
  Future<BaseEntity> sceneCollection(Map params) =>
      _http.get("/app/user/favoriteScenesList", params: params);

  ///商品收藏列表
  Future<BaseEntity> productCollection({Map? params}) =>
      _http.get("/app/user/favoriteGoodsList", params: params);
}
