/*
 * @Description: 分类
 * @Author: iamsmiling
 * @Date: 2021-04-19 17:05:08
 * @LastEditTime: 2021-05-27 10:41:52
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/domain/provider/category_api.dart';

class CategoryRepository {
  CategoryAPI _api = CategoryAPI();

  Future<List<CategoryEntity>> getCategoryList({Map? params}) {
    return _api.getCategoryList(params: params).then((BaseEntity entity) {
      return JsonKit.asList(entity.data)
          .map((e) => CategoryEntity.fromJson(e))
          .toList();
    });
  }

  Future<List<CategoryEntity>> categoryList({Map? params}) {
    return _api.categoryList(params: params).then((BaseEntity entity) {
      return JsonKit.asList(entity.data)
          .map((e) => CategoryEntity.fromJson(e))
          .toList();
    });
  }
}
