/*
 * @Description: 首页窗帘定制
 * @Author: iamsmiling
 * @Date: 2021-07-20 18:33:49
 * @LastEditTime: 2021-07-21 10:27:40
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class HomeCurtainSectionEntity {
  late String title;
  late int layout;
  late String layoutName;
  late List<HomeCurtainEntity> items;
  late String more;
  HomeCurtainSectionEntity.fromJson(Map json) {
    title = json["title"];
    layout = json["layout"];
    layoutName = json["layout_name"];
    items = JsonKit.asList(json["items"])
        .map((e) => HomeCurtainEntity.fromJson(e))
        .toList();
    more = json["more"];
  }
}

class HomeCurtainEntity {
  late String name;
  late int categoryId;
  late String image;
  HomeCurtainEntity.fromJson(Map json) {
    name = json["name"];
    categoryId = json["category_id"];
    image = JsonKit.asWebUrl(json["image"]);
  }
}
