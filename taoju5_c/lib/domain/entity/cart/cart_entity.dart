/*
 * @Description: 购物车模型
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:55:21
 * @LastEditTime: 2021-08-05 17:54:05
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

class CartEntityListWrapperEntity {
  late List<CartEntity> list;

  late int totalPage;

  late int totalCount;

  CartEntityListWrapperEntity.fromJson(Map json) {
    list = JsonKit.asList(json["cart_list"])
        .map((e) => CartEntity.fromJson(e))
        .toList();
    totalPage = JsonKit.asInt(json["page_count"]);

    totalCount = JsonKit.asInt(json["total_count"]);
  }
}

class CartEntity {
  late int id;
  late int productId;
  late String productName;
  late int productTypeCode;
  late String image;
  late int stock;
  late int maxPurchase;
  late int minPurchase;
  late bool offShelves;
  late int skuId;
  late String skuName;
  int count = 1;
  bool checked = false;
  late double totalPrice;
  late double unitPrice;
  late String description;
  late List<CurtainAttributeKeyValuePairEntity> attributes;
  CurtainMeasureDataAttributeEntity? measureData;
  late int measureId;
  late Map args;

  late double length;

  bool removed = false;

  late int craftId;

  late bool isFixedHeight;

  late bool isFixedWidth;

  late bool isCustomSize;

  late double doorWidth;

  late double flowerSize;

  late bool hasFlower;

  late double thresholdHeight = 270;

  BaseProductType get productType => getProductType(productTypeCode);

  CartEntity.fromJson(Map json) {
    id = json["cart_id"];
    measureId = JsonKit.asInt(json["measure_id"]);
    productId = json["goods_id"];
    productName = json["goods_name"];
    productTypeCode = json["goods_type"];
    image = JsonKit.asWebUrl(json["pic_cover_small"]);
    stock = json["stock"];
    skuId = json["sku_id"];
    skuName = json["sku_name"] ?? "";
    maxPurchase = json["max_buy"];
    minPurchase = json["min_buy"];
    offShelves = false;
    length = JsonKit.asDouble(json["length"]);
    count = JsonKit.asInt(json["num"]);
    unitPrice = JsonKit.asDouble(json["price"]);
    totalPrice = JsonKit.asDouble(json["estimated_price"]);
    description = json["goods_attr_str"];
    attributes = JsonKit.asList(json["goods_accessory"])
        .map((e) => CurtainAttributeKeyValuePairEntity.fromJson(e))
        .toList();
    args = JsonKit.asMap(json["wc_attr"]);
    craftId = JsonKit.asInt(json["process_method"]);
    isFixedHeight = json['fixed_height'] == 1;
    isFixedWidth = json['fixed_height'] == 2;
    isCustomSize = json['fixed_height'] == 3;

    ///后台数据以cm为单位
    doorWidth = JsonKit.asDouble(json['larghezza_size']);
    flowerSize = JsonKit.asDouble(json['flower_distance']);

    hasFlower = json['is_flower'] == 1;

    thresholdHeight = JsonKit.asDouble(json["super_height"]);
  }

  void reAssign(CartEntity c) {
    id = c.id;
    count = c.count;
    checked = c.checked;
    description = c.description;
    image = c.image;
    totalPrice = c.totalPrice;
    unitPrice = c.unitPrice;
    productName = c.productName;
    productId = c.productId;
    skuId = c.skuId;
    skuName = c.skuName;
  }
}
