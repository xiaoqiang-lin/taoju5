/*
 * @Description: 场景软装
 * @Author: iamsmiling
 * @Date: 2021-07-22 11:16:16
 * @LastEditTime: 2021-07-23 10:03:10
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/scene/scene_product_entity.dart';

class SceneDecorationEntity {
  late String image;
  late String name;
  late double totalPrice;
  late List<SceneProductEntity> products = [];
  SceneDecorationEntity();

  SceneDecorationEntity.fromJson(Map json) {
    image = json["image"];
    name = json["scenes_name"];
    totalPrice = JsonKit.asDouble(json["total_money"]);
    products = JsonKit.asList(json["goods_list"])
        .map((e) => SceneProductEntity.fromJson(e))
        .toList();
  }
}
