/*
 * @Description: 首页专题推荐
 * @Author: iamsmiling
 * @Date: 2021-07-21 17:27:18
 * @LastEditTime: 2021-07-21 17:29:36
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class TopicArticleEntity {
  late String name;
  late String image;
  late int classId;

  TopicArticleEntity.fromJson(Map json) {
    name = json["name"];
    classId = json["class_id"];
    image = JsonKit.asWebUrl(json["picture"]);
  }
}
