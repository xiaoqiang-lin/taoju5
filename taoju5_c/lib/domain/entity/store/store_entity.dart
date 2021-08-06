/*
 * @Description:门店列表数据模型
 * @Author: iamsmiling
 * @Date: 2021-07-21 16:49:33
 * @LastEditTime: 2021-07-28 16:24:18
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class StoreEntityListWrapper {
  late List<StoreEntity> stores;
  late int totalPage;
  StoreEntityListWrapper.fromJson(Map json) {
    stores = JsonKit.asList(json["data"])
        .map((e) => StoreEntity.fromJson(e))
        .toList();
    totalPage = json["page_count"];
  }
}

class StoreEntity {
  late int id;
  late String name;
  late String avatar;

  late String image;
  late String score;
  late String description;

  StoreEntity.fromJson(Map json) {
    id = json["shop_id"];
    name = json["shop_name"];
    avatar = JsonKit.asWebUrl(json["shop_avatar"]);
    description = json["shop_collect"];
    score = "${json["grade"]}";
    image = JsonKit.asWebUrl(json["image"]);
  }
}
