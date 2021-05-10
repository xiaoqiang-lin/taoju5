/*
 * @Description: 购物车模型
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:55:21
 * @LastEditTime: 2021-05-06 13:37:32
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:get/get.dart';
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

  BaseProductType get productType => getProductType(productTypeCode);

  CartEntity.fromJson(Map json) {
    id = json["cart_id"];
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
  }
}
