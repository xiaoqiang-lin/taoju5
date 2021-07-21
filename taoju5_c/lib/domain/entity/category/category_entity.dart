/*
 * @Description: 商品分类
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:58:17
 * @LastEditTime: 2021-07-21 18:04:17
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class CategoryEntity {
  int id = -1;
  String name = "";
  String image = "";
  int type = -1;
  String isHot = "";

  CategoryEntity(
      {required this.id, required this.name, this.type = -1, this.isHot = ""});

  List<CategoryEntity> children = [];

  CategoryEntity.fromJson(Map json) {
    id = JsonKit.asInt(json["category_id"] ?? json["class_id"]);
    name = json["category_name"] ?? json["name"];
    image = JsonKit.asWebUrl(json["category_pic"]);
    children = JsonKit.asList(json["child_list"])
        .map((e) => CategoryEntity.fromJson(e))
        .toList();
    type = json["type"] ?? -1;
  }
}
