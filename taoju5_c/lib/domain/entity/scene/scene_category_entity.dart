/*
 * @Description:  场景分类
 * @Author: iamsmiling
 * @Date: 2021-05-28 10:07:13
 * @LastEditTime: 2021-05-28 14:48:22
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';

class SceneCategoryEntityListWrapper {
  late List<CategoryEntity> categoryList;

  late List<SceneCategoryEntity> list;

  SceneCategoryEntityListWrapper.fromJson(Map json) {
    categoryList = JsonKit.asList(json["category_list"])
        .map((e) => CategoryEntity.fromJson(e))
        .toList();
    list = JsonKit.asList(json["category_data"])
        .map((e) => SceneCategoryEntity.fromJson(e))
        .toList();
  }
}

class SceneCategoryEntity {
  late String name;

  late String image;

  late int id;

  SceneCategoryEntity.fromJson(Map json) {
    id = json["category_id"];
    name = json["name"];
    image = JsonKit.asWebUrl(json["category_pic"]);
  }
}
