/*
 * @Description: 商品模型
 * @Author: iamsmiling
 * @Date: 2021-04-23 18:10:58
 * @LastEditTime: 2021-04-23 20:35:12
 */

import 'package:taoju5_bc/utils/json_kit.dart';

class ProductEntity {
  late int id;

  late String name;

  late String cover;

  late String saleCount;

  late String unit;

  late bool isHot;

  late bool isNew;

  ProductEntity.fromJson(Map json) {
    id = json["goods_id"];
    name = json["goods_name"];
    cover = JsonKit.asWebUrl(json["pic_cover_mid"]);
    saleCount = json["sales"];
    unit = json["goods_unit"];
    isHot = JsonKit.asBool(json["is_hot"]);
    isNew = JsonKit.asBool(json["is_new"]);
  }
}
