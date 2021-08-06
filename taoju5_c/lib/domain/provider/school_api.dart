/*
 * @Description: 陶学院
 * @Author: iamsmiling
 * @Date: 2021-07-08 10:42:56
 * @LastEditTime: 2021-07-23 16:59:13
 */

import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class SchoolAPI {
  HttpKit _http = HttpKit();

  ///文章表头
  Future<BaseEntity> getCategoryList(Map? params) =>
      _http.get("/app/article/articleTitle", params: params);

  ///文章列表
  Future<BaseEntity> getCourseList(Map? params) =>
      _http.get("/app/article/articleList", params: params);

  ///文章详情
  Future<BaseEntity> getArticleDetail(Map? params) =>
      _http.get("/app/article/articleDetail", params: params);

  ///专题列表表头
  Future<BaseEntity> getTopicTabs(Map? params) =>
      _http.get("/app/article/articleSecondTitle", params: params);
}
