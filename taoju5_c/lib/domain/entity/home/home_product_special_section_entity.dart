/*
 * @Description: 首页特价专区
 * @Author: iamsmiling
 * @Date: 2021-07-21 10:07:04
 * @LastEditTime: 2021-07-21 10:28:23
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';

class HomeProductSpecialSectionEntity {
  late String title;
  late String hint;
  late int layout;
  late String layoutName;
  late List<ProductEntity> items;
  late String more;

  HomeProductSpecialSectionEntity.fromJson(Map json) {
    title = json["title"];
    hint = json["message"];
    layout = json["layout"];
    layoutName = json["layout_name"];
    items = JsonKit.asList(json["items"])
        .map((e) => ProductEntity.fromJson(e))
        .toList();
    more = json["more"];
  }
}
