/*
 * @Description: 软装专区
 * @Author: iamsmiling
 * @Date: 2021-07-21 09:32:53
 * @LastEditTime: 2021-07-21 11:21:34
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class HomeSoftDecorationSectionEntity {
  late String title;
  late int layout;
  late String layoutName;
  late List<SoftDecorationEntity> items;
  late String more;

  HomeSoftDecorationSectionEntity.fromJson(Map json) {
    title = json["title"];
    layout = json["layout"];
    layoutName = json["layout_name"];
    items = JsonKit.asList(json["items"])
        .map((e) => SoftDecorationEntity.fromJson(e))
        .toList();
    more = json["more"];
  }
}

class SoftDecorationEntity {
  late String name;
  late int categoryId;
  late String image;

  SoftDecorationEntity.fromJson(Map json) {
    name = json["name"];
    categoryId = json["category_id"];
    image = JsonKit.asWebUrl(json["image"]);
  }
}
