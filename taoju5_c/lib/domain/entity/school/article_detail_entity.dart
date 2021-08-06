/*
 * @Description: 文章详情
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:01:21
 * @LastEditTime: 2021-07-23 17:22:10
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class ArticleDetailEntity {
  late int id;
  late String title;
  late String subtitle;
  late String date;
  late String description;
  late List<String> content;
  late bool isCollect = false;
  late String image;

  ArticleDetailEntity();

  ArticleDetailEntity.fromJson(Map json) {
    id = json["id"];
    title = json["title"] ?? "";
    subtitle = json["summary"];
    image = JsonKit.asWebUrl(json["image"]);
    date = json["date"];
    isCollect = JsonKit.asBool(json["is_collect"]);
    content = JsonKit.asList(json["content_image"])
        .map((e) => JsonKit.asWebUrl(e))
        .toList();
    description = json["browse"];
  }
}
