/*
 * @Description: 商品适配器模型
 * @Author: iamsmiling
 * @Date: 2021-05-14 16:35:07
 * @LastEditTime: 2021-07-19 17:33:54
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

///测量状态
enum MeasureStatus {
  ///未测量
  unMeasure,

  ///未确认
  unConfirm,

  ///已确认
  confirmed
}

class ProductMeasureStatusEntity {
  late String key;

  late String value;

  ProductMeasureStatusEntity.fromJson(Map json) {
    key = json["name"];
    value = json["value"];
  }
}

class ProductSelectTipEntity {
  late String message;
  late String phone;

  ProductSelectTipEntity.fromJson(Map json) {
    message = json["message"];
    phone = json["phone"];
  }
}

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
  late ProductMeasureStatusEntity? productMeasureStatus;
  late Map arg;

  List<OrderActionButtonEntity> actions = [];
  int craftId = -1;

  ShakeAnimationController shakeAnimationController =
      ShakeAnimationController();

  ///型材长度
  // late double length;

  late Map? args;
  late int measureStatusCode = 0;
  late ProductSelectTipEntity? tip;

  MeasureStatus get measureStatus =>
      {
        0: MeasureStatus.unMeasure,
        1: MeasureStatus.unConfirm,
        2: MeasureStatus.confirmed
      }[measureStatusCode] ??
      MeasureStatus.unMeasure;
  bool get signet => measureStatus == MeasureStatus.confirmed;

  bool selected = false;

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
      List<CurtainAttributeKeyValuePairEntity>? attributes) {
    this.attributes = attributes ?? [];
    description = product.specTip;
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
    measureStatusCode = json["measure_status"] ?? 0;

    actions = JsonKit.asList(json["goods_button"])
        .map((e) => OrderActionButtonEntity.fromJson(e))
        .toList();
    Map map1 = JsonKit.asMap(json["confirm_measure"]);
    productMeasureStatus = map1.isNotEmpty
        ? ProductMeasureStatusEntity.fromJson(
            JsonKit.asMap(json["confirm_measure"]))
        : null;
    Map map2 = JsonKit.asMap(json["goods_message"]);
    tip = map2.isNotEmpty ? ProductSelectTipEntity.fromJson(map2) : null;
  }

  Map get params => {
        "sku_id": skuId,
        "num": count,
        "length": length ?? "",
        "cart_id": cartId,
        "measure_id": measureId,
        "craft_id": craftId,
        ...arg
      };
}
