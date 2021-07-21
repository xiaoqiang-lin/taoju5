/*
 * @Description:首页门店
 * @Author: iamsmiling
 * @Date: 2021-07-21 09:46:16
 * @LastEditTime: 2021-07-21 16:49:57
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/store/store_entity.dart';

class HomeStoreSectionEntity {
  late String title;
  late int layout;
  late String layoutName;
  late List<StoreEntity> items;
  late String more;

  HomeStoreSectionEntity.fromJson(Map json) {
    title = json["title"];
    layout = json["layout"];
    layoutName = json["layout_name"];
    items = JsonKit.asList(json["items"])
        .map((e) => StoreEntity.fromJson(e))
        .toList();
    more = json["more"];
  }
}
