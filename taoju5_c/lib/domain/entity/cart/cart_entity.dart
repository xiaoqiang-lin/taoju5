/*
 * @Description: 购物车模型
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:55:21
 * @LastEditTime: 2021-05-14 16:52:26
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

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
  late int measureId;
  late Map args;

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
    count = JsonKit.asInt(json["num"]);
    unitPrice = JsonKit.asDouble(json["price"]);
    totalPrice = JsonKit.asDouble(json["estimated_price"]);
    description = json["goods_attr_str"];
    attributes = JsonKit.asList(json["app_wc_attr"])
        .map((e) => CurtainAttributeKeyValuePairEntity.fromJson(e))
        .toList();
    args = json["wc_attr"];
  }
}
