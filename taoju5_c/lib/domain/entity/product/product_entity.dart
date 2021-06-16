/*
 * @Description: 商品模型
 * @Author: iamsmiling
 * @Date: 2021-04-23 18:10:58
 * @LastEditTime: 2021-06-08 14:50:16
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';

class MallEntity {
  late List<CategoryEntity> categories;

  late List<ProductEntity> products;

  MallEntity.fromJson(Map json) {
    categories = JsonKit.asList(json["category_list"])
        .map((e) => CategoryEntity.fromJson(e))
        .toList();
    products = JsonKit.asList(json["goods_list"])
        .map((e) => ProductEntity.fromJson(e))
        .toList();
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

  late String brand;

  /// 材质名称
  late String material;

  late String price;

  int browseId = -1;

  bool removed = false;

  ProductEntity.fromJson(Map json) {
    id = json["goods_id"];
    name = json["goods_name"];
    cover = JsonKit.asWebUrl(json["pic_cover_mid"] ?? json["image"]);
    saleCount = "${json["sales"]}";
    unit = json["goods_unit"];
    isHot = JsonKit.asBool(json["is_hot"]);
    isNew = JsonKit.asBool(json["is_new"]);
    brand = "品牌名称";
    material = "材质名称";
    price = json["price"];
    browseId = json["browse_id"];
  }
}
