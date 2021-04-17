/*
 * @Description: 商品列表数据模型
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:39:17
 * @LastEditTime: 2021-01-26 10:09:06
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_b/domain/model/product/product_attr_model.dart';
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_bc/utils/json_kit.dart';

import 'product_type.dart';

class ProductModelListWrapper {
  List<ProductModel> list;
  int totalCount;
  int targetCategoryType;

  ProductModelListWrapper.fromJson(Map json) {
    totalCount =
        JsonKit.getValueInComplexMap(json, ["goods_list", "total_count"]);
    list = JsonKit.asList(
            JsonKit.getValueInComplexMap(json, ["goods_list", "data"]))
        .map((e) => ProductModel.fromJson(e))
        .toList();
    targetCategoryType = JsonKit.asInt(json["category_type"]);
  }
}

class CurtainProductAttrAdapterModel {
  String id;
  String key;
  String value;
  String type;
  double price;
  String typeName;

  CurtainProductAttrAdapterModel(
      {@required this.id,
      @required this.value,
      @required this.key,
      @required this.type,
      @required this.price,
      @required this.typeName});

  Map get params {
    return {
      "$type": {"id": id, "name": key, "value": value, "price": price}
    };
  }

  ProductAttrAdapterModel adapt() {
    ProductAttrAdapterModel e = ProductAttrAdapterModel();
    e.type = int.parse(type);
    e.key = typeName;
    e.value = value;
    e.totalPrice = price;
    return e;
  }
}

///[ProductModel]商品列表页 商品数据模型
class ProductModel {
  int id;
  String name;
  String image;
  double marketPrice;
  double displayPrice;
  double price;
  String unit;
  int picId;
  int code;

  String thumbnail;

  String measureId;

  String attribute;

  String skuId;
  String count = "1";
  String skuName;

  int categoryType;

  ProductModel.fromJson(Map json) {
    id = json['goods_id'];
    name = json['goods_name'];
    thumbnail = JsonKit.asWebUrl(json['pic_cover_small'] ?? "");
    image = JsonKit.asWebUrl((json['pic_cover_mid'] ??
        json["pic_cover_small"] ??
        json['image'] ??
        json['picture']));
    code = json["goods_type"];
    marketPrice = JsonKit.asDouble(json['market_price']);
    displayPrice = JsonKit.asDouble(json["displya_price"]);
    unit = "${json["goods_unit"] ?? json["unit"]}"?.trim();

    picId = json["pic_id"];
    price = JsonKit.asDouble(
        (json['price'] ?? json['display_price'] ?? json['market_price']));
    skuId = json["sku_id"];
    skuName = json["sku_name"];
    categoryType = JsonKit.asInt(json["category_type"]);
  }
}

extension ProductModelKit on ProductModel {
  BaseProductType get productType => getProductType(code);

  bool get isOnsale =>
      !CommonKit.isNullOrZero(marketPrice) && marketPrice > price;
}
