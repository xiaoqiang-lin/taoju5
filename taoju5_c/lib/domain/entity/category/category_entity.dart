/*
 * @Description: 商品分类
 * @Author: iamsmiling
 * @Date: 2021-04-19 16:58:17
 * @LastEditTime: 2021-04-19 17:34:54
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class CategoryEntity {
  late int id;
  late String name;
  late String image;

  late List<CategoryEntity> children;

  CategoryEntity.fromJson(Map json) {
    id = json["category_id"];
    name = json["category_name"];
    image = JsonKit.asWebUrl(json["category_pic"]);
    children = JsonKit.asList(json["child_list"])
        .map((e) => CategoryEntity.fromJson(e))
        .toList();
  }
}
