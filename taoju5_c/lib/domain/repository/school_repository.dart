/*
 * @Description: 陶学院相关的api
 * @Author: iamsmiling
 * @Date: 2021-07-08 10:42:35
 * @LastEditTime: 2021-07-12 16:12:29
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/entity/school/article_detail_entity.dart';
import 'package:taoju5_c/domain/entity/school/course_entity.dart';
import 'package:taoju5_c/domain/provider/school_api.dart';

class SchoolRepository {
  SchoolAPI _api = SchoolAPI();

  ///文章表头
  Future<List<CategoryEntity>> getCategoryList(Map? params) =>
      _api.getCategoryList(params).then((value) {
        return JsonKit.asList(value.data)
            .map((e) => CategoryEntity.fromJson(e))
            .toList();
      });

  ///文章列表
  Future<List<CourseEntity>> getCourseList(Map? params) =>
      _api.getCourseList(params).then((value) {
        return JsonKit.asList(value.data["data"])
            .map((e) => CourseEntity.fromJson(e))
            .toList();
      });

  ///文章详情
  Future<ArticleDetailEntity> getArticleDetail(Map? params) =>
      _api.getCourseList(params).then((value) {
        return ArticleDetailEntity.fromJson(value.data);
      });
}