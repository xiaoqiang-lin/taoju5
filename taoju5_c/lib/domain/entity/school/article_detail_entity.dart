/*
 * @Description: 文章详情
 * @Author: iamsmiling
 * @Date: 2021-07-12 16:01:21
 * @LastEditTime: 2021-07-12 16:35:36
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class ArticleDetailEntity {
  late int id;
  late String title;
  late String subtitle;
  late String date;
  late String description;
  late String content;
  late bool isCollect;
  late String image;

  ArticleDetailEntity.fromJson(Map json) {
    id = json["id"];
    title = json["title"] ?? "";
    subtitle = json["summary"];
    image = JsonKit.asWebUrl(json["image"]);
    date = json["date"];
    isCollect = JsonKit.asBool(json["is_collect"]);
    content = json["content"];
    description = json["browse"];
  }
}
