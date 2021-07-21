/*
 * @Description: 首页场景
 * @Author: iamsmiling
 * @Date: 2021-07-20 16:34:04
 * @LastEditTime: 2021-07-21 10:27:02
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class HomeSceneSectionEntity {
  late String title;
  late int layout;
  late String layoutName;
  late List<HomeSceneEntity> items;
  late String more;

  HomeSceneSectionEntity.fromJson(Map json) {
    title = json["title"];
    layout = json["layout"];
    layoutName = json["layout_name"];
    items = JsonKit.asList(json["items"])
        .map((e) => HomeSceneEntity.fromJson(e))
        .toList();
    more = json["more"];
  }
}

class HomeSceneEntity {
  late String name;
  late int type;
  late String image;

  HomeSceneEntity({
    this.name = "",
    this.type = 0,
    this.image = "",
  });

  HomeSceneEntity.fromJson(Map json) {
    name = json["name"];
    type = json["type"];
    image = JsonKit.asWebUrl(json["image"]);
  }
}
