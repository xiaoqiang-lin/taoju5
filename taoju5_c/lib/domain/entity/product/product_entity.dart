/*
 * @Description: 商品模型
 * @Author: iamsmiling
 * @Date: 2021-04-23 18:10:58
 * @LastEditTime: 2021-07-21 10:19:14
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/rendering.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';

class MallEntity {
  late List<CategoryEntity> categories;

  late List<ProductEntity> products;

  late int totalPage;

  MallEntity.fromJson(Map json) {
    categories = JsonKit.asList(json["category_list"])
        .map((e) => CategoryEntity.fromJson(e))
        .toList();
    products = JsonKit.asList(json["goods_list"])
        .map((e) => ProductEntity.fromJson(e))
        .toList();
    totalPage = JsonKit.asInt(json["page_count"]);
    print("---$totalPage");
  }
}

class ProductEntity {
  late int id;

  late String name;

  late String cover;

  late String saleCount;

  late String unit;

  late String size;

  late bool isHot;

  late bool isNew;

  late String brand;

  /// 材质名称
  late String material;

  late String price;

  int browseId = -1;

  bool removed = false;

  late double marketPrice;

  ProductEntity.fromJson(Map json) {
    id = json["goods_id"];
    name = json["goods_name"];
    cover = JsonKit.asWebUrl(json["pic_cover_mid"] ?? json["image"]);
    saleCount = "${json["sales"]}";
    unit = json["goods_unit"];
    isHot = JsonKit.asBool(json["is_hot"]);
    isNew = JsonKit.asBool(json["is_new"]);
    brand = json["show_name"];
    material = json["material_name"];
    price = json["price"];
    browseId = json["browse_id"];
    size = json["pic_spec"];
    marketPrice = JsonKit.asDouble(json["market_price"]);
  }

  double get _width {
    if (size.contains(",")) {
      String val = size.split(",").first;
      return CommonKit.asDouble(val);
    }
    if (size.contains("*")) {
      String val = size.split("*").first;
      return CommonKit.asDouble(val);
    }
    return 0;
  }

  double get _height {
    if (size.contains(",")) {
      String val = size.split(",").last;
      return CommonKit.asDouble(val);
    }
    if (size.contains("*")) {
      String val = size.split("*").last;
      return CommonKit.asDouble(val);
    }
    return 0;
  }

  double get aspectRatio => _height == 0 ? 1 : _width / _height;

  BoxFit get fit => aspectRatio > 1 ? BoxFit.fitHeight : BoxFit.contain;
}
