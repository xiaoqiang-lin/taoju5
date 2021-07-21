/*
 * @Description:首页专题推荐
 * @Author: iamsmiling
 * @Date: 2021-07-21 17:24:00
 * @LastEditTime: 2021-07-21 17:32:24
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/school/topic_article_entity.dart';

class HomeTopicArticleSectionEntity {
  late String title;
  late String more;
  late int layout;
  late String layoutName;
  late List<TopicArticleEntity> items;

  HomeTopicArticleSectionEntity.fromJson(Map json) {
    title = json["title"];
    more = json["more"];
    layout = json["layout"];
    layoutName = json["layout_name"];
    items = JsonKit.asList(json["items"])
        .map((e) => TopicArticleEntity.fromJson(e))
        .toList();
  }
}
