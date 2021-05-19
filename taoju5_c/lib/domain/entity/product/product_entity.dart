/*
 * @Description: 商品模型
 * @Author: iamsmiling
 * @Date: 2021-04-23 18:10:58
 * @LastEditTime: 2021-05-18 17:40:04
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class MallEntity {
  late List<CategoryEntity> categories;

  late List<ProductEntity> products;

  MallEntity.fromJson(Map json) {
    categories = json["category_list"];
    products = json["goods_list"];
  }
}

class CategoryEntity {
  late String name;
  late int id;
  CategoryEntity.fromJson(Map json) {
    name = json["category_name"];
    id = json["category_id"];
  }
}

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
