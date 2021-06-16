/*
 * @Description: 商品适配器模型
 * @Author: iamsmiling
 * @Date: 2021-05-14 16:35:07
 * @LastEditTime: 2021-06-11 16:09:08
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
  double? length;

  bool signet = false;

  late Map arg;

  List<OrderActionButtonEntity> actions = [];
  int craftId = -1;

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
    arg = cart.args;
    craftId = cart.craftId;
    length = cart.length;

    // measureId =
  }

  ProductAdaptorEntity.fromProductWithAttribute(ProductDetailEntity product,
      List<CurtainAttributeKeyValuePairEntity> attributes) {
    this.attributes = attributes;
    description = product.attributeDesc;
    image = product.currentSku?.picture.cover ?? "";
    unitPrice = product.currentSku?.price ?? product.price;
    totalPrice = product.totalPrice;
    name = product.name;
    count = product.count;
    productType = product.productType;
    id = product.id;
    cartId = 0;
    length = product.length;
    measureId = product.measureId;
    craftId = product.craftId;
    skuId = product.currentSku?.id ?? -1;
    skuName = product.currentSku?.name ?? "";
    arg = product.args;
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
    signet = "${json["measure_status"]}" == "2";
    actions = JsonKit.asList(json["goods_button"])
        .map((e) => OrderActionButtonEntity.fromJson(e))
        .toList();
  }

  Map get params => {
        "sku_id": skuId,
        "num": count,
        "length": length,
        "cart_id": cartId,
        "measure_id": measureId,
        "craft_id": craftId,
        "wc_attr": arg
      };
}
