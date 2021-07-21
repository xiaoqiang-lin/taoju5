/*
 * @Description: 首页
 * @Author: iamsmiling
 * @Date: 2021-07-20 16:46:47
 * @LastEditTime: 2021-07-21 17:56:13
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/home/home_ad_entity.dart';
import 'package:taoju5_c/domain/entity/home/home_product_special_section_entity.dart';
import 'package:taoju5_c/domain/entity/home/home_store_section_entity.dart';
import 'package:taoju5_c/domain/entity/home/home_topic_article_section_entity.dart';

import 'home_curtain_section_entity.dart';
import 'home_scene_section_entity.dart';
import 'home_soft_decoration_section_entity.dart';

class HomeEntity {
  late HomeSceneSectionEntity scene;
  late HomeCurtainSectionEntity curtain;
  late HomeSoftDecorationSectionEntity soft;
  late HomeStoreSectionEntity store;
  late HomeProductSpecialSectionEntity special;
  late HomeTopicArticleSectionEntity topic;
  late List<HomeAdEntity> ads;
  HomeEntity.fromJson(Map json) {
    scene = HomeSceneSectionEntity.fromJson(json["scenes_category"]);
    curtain = HomeCurtainSectionEntity.fromJson(json["curtain_category"]);
    soft = HomeSoftDecorationSectionEntity.fromJson(json["soft_category"]);
    store = HomeStoreSectionEntity.fromJson(json["shop_list"]);
    special = HomeProductSpecialSectionEntity.fromJson(json["hot_goods"]);
    topic = HomeTopicArticleSectionEntity.fromJson(json["hot_article"]);
    ads = JsonKit.asList(json["adv_list"])
        .map((e) => HomeAdEntity.fromJson(e))
        .toList();
  }
}
