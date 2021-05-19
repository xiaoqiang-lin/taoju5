/*
 * @Description: 商品适配器模型
 * @Author: iamsmiling
 * @Date: 2021-05-14 16:35:07
 * @LastEditTime: 2021-05-18 10:24:52
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

class ProductAdaptorEntity {
  late List<CurtainAttributeKeyValuePairEntity> attributes;
  late String description;
  late String image;
  double unitPrice = 0;
  double totalPrice = 0;
  late String name;
  int count = 1;
  int cartId = -1;
  int skuId = -1;
  String skuName = "";
  int measureId = -1;
  BaseProductType? productType;
  String status = "";
  int id = 0;

  List<OrderActionButtonEntity> actions = [];

  ///型材长度
  // late double length;

  late Map? args;
  ProductAdaptorEntity.fromCartEntity(CartEntity cart) {
    attributes = cart.attributes;
    description = cart.description;
    image = cart.image;
    unitPrice = cart.unitPrice;
    totalPrice = cart.totalPrice;
    name = cart.productName;
    count = cart.count;
    cartId = cart.id;
    measureId = cart.measureId;
    args = cart.args;
    skuId = cart.skuId;
    skuName = cart.skuName;
    productType = cart.productType;

    // measureId =
  }

  ProductAdaptorEntity.fromProduct(ProductDetailEntity product) {
    // attributes = cart.attributes;
    // description = cart.description;
    // image = cart.image;
    // unitPrice = cart.unitPrice;
    // totalPrice = cart.totalPrice;
    // name = cart.productName;
    // count = cart.count;
    // cartId = cart.id;
  }

  ProductAdaptorEntity.fromJson(Map json) {
    id = json["order_goods_id"];
    name = json["goods_name"];
    description = json["goods_attr_str"];
    image = JsonKit.asWebUrl(json["image"]);
    attributes = JsonKit.asList(json["goods_accessory"])
        .map((e) => CurtainAttributeKeyValuePairEntity.fromJson(e))
        .toList();
    status = json["status_name"];
    actions = JsonKit.asList(json["goods_button"])
        .map((e) => OrderActionButtonEntity.fromJson(e))
        .toList();
  }
}
