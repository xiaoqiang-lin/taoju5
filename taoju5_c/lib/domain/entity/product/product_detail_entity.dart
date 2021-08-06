/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 14:11:33
 * @LastEditTime: 2021-08-06 10:43:33
 */
// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_sku_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';
import 'package:taoju5_c/domain/entity/scene/scene_product_entity.dart';

import 'curtain_attribute_entity.dart';

abstract class BaseProductType {}

///成品
class FinishedProductType extends BaseProductType {}

///定制品
class CustomProductType extends BaseProductType {}

///布艺帘
class FabricCurtainProductType extends CustomProductType {}

///卷帘
class RollingCurtainProductType extends CustomProductType {}

///窗纱
class FabricScreenProductType extends FabricCurtainProductType {}

/// 型材视为成品
class SectionbarProductType extends FinishedProductType {}

BaseProductType getProductType(int code) =>
    {
      0: FinishedProductType(),
      1: FabricCurtainProductType(),
      2: RollingCurtainProductType(),
      3: FabricScreenProductType(),
      4: SectionbarProductType()
    }[code] ??
    FabricCurtainProductType();

class ProductMaterialEntity {
  late String key;

  late String value;

  ProductMaterialEntity.fromJson(Map json) {
    key = json["attr_value"];
    value = json["attr_value_name"];
  }
}

class ProductDetailEntity {
  late int id = 0;
  late String name = "";
  late int type = 0;
  late double marketPrice = 0;
  late double promotionPrice = 0;
  late double price = 0;
  late String description = "";
  late String unit = "";
  late int stock = 0;
  late int maxPurchase = 0;
  late int minPurchase = 0;
  late String saleCount = "";

  late bool isFixedHeight = true; // 窗帘是否定高
  late bool isFixedWidth = false; //窗帘是否定宽
  late bool isCustomSize = false; //自定义宽高

  late double doorWidth = 0; //门幅
  late double flowerSize = 0; //花距
  late bool hasFlower = true; // 窗帘是否有拼花
  late List<PictureEntity> images = [];

  late int count = 1;

  List detailImages = [];

  List<ProductMaterialEntity> materialSet = [];

  late int skuId = 0;

  ///sku
  List<ProductSkuEntity> skus = [];

  List<ProductSpecEntity> specs = [];

  double get doorWidthM => doorWidth / 100;

  double get flowerSizeM => flowerSize / 100;

  double? length;

  double? width;

  double? height;

  ///高度阈值
  late double thresholdHeight = 270;

  late bool like = false;

  ///规格信息
  String specTip = "去填写";

  int measureId = -1;

  ///型材id
  int craftId = -1;

  double totalPrice = 0;

  Map args = {};

  late CurtainAttributeEntity attribute = CurtainAttributeEntity();

  late bool initialzed = false;

  ProductDetailEntity();

  // String get abbrSpec {

  //   if (productType is SectionbarProductType) {
  //     return "用料：$length米  x$count";
  //   }
  //   if(productType is FinishedProductType){
  //     return
  //   }
  // }

  ProductDetailEntity.fromCartEntity(CartEntity cart) {
    id = cart.productId;
    skuId = cart.skuId;
    length = cart.length;
    count = cart.count;
    price = cart.unitPrice;
    isCustomSize = cart.isCustomSize;
    isFixedHeight = cart.isFixedHeight;
    isFixedWidth = cart.isFixedWidth;
    doorWidth = cart.doorWidth;
    flowerSize = cart.flowerSize;
    thresholdHeight = cart.thresholdHeight;
    attribute.measureData =
        cart.measureData ?? CurtainMeasureDataAttributeEntity();
    measureId = cart.measureId;
  }
  ProductDetailEntity.fromSceneProduct(SceneProductEntity product) {
    id = product.id;
    skuId = product.skuId;
    count = product.count;
    name = product.name;
    type = product.typeCode;
    price = product.price;
    description = product.description;
    unit = product.unit;
    isFixedHeight = product.isFixedHeight;
    isFixedWidth = product.isFixedWidth;
    isCustomSize = product.isCustomSize;

    ///后台数据以cm为单位
    doorWidth = product.doorWidth;
    flowerSize = product.flowerSize;
    hasFlower = product.hasFlower;
    thresholdHeight = product.thresholdHeight;
  }
  ProductDetailEntity.fromJson(Map json) {
    id = json["goods_id"];
    name = json["goods_name"];
    type = json["goods_type"];
    price = JsonKit.asDouble(json["price"]);
    marketPrice = JsonKit.asDouble(json["market_price"]);
    promotionPrice = JsonKit.asDouble(json["promotion_price"]);
    description = json["description"];
    unit = json["goods_unit"];
    stock = json["stock"];
    maxPurchase = json["max_buy"];
    minPurchase = json["min_buy"];
    saleCount = json["sales"];

    isFixedHeight = json['fixed_height'] == 1;
    isFixedWidth = json['fixed_height'] == 2;
    isCustomSize = json['fixed_height'] == 3;
    like = JsonKit.asBool(json["is_collect"]);

    ///后台数据以cm为单位
    doorWidth = JsonKit.asDouble(json['larghezza_size']);
    flowerSize = JsonKit.asDouble(json['flower_distance']);

    hasFlower = json['is_flower'] == 1;

    specs = JsonKit.asList(json["spec_list"])
        .map((e) => ProductSpecEntity.fromJson(e))
        .toList();
    skus = JsonKit.asList(json["sku_list"])
        .map((e) => ProductSkuEntity.fromJson(e))
        .toList();
    detailImages = JsonKit.asList(json["new_description"])
        .map((e) => JsonKit.asWebUrl(e))
        .toList();
    materialSet = JsonKit.asList(json["goods_attribute_list"])
        .map((e) => ProductMaterialEntity.fromJson(e))
        .toList();
    images = JsonKit.asList(json["goods_img_list"])
        .map((e) => PictureEntity.fromJson(e))
        .toList();

    skuId = JsonKit.asInt(json["sku_id"]);

    thresholdHeight = JsonKit.asDouble(json["super_height"]);

    if (productType is RollingCurtainProductType) {
      specTip = "请填写测装数据";
    } else if (productType is FabricCurtainProductType) {
      specTip = "去填写";
    } else if (productType is FinishedProductType) {
      specTip = "请选择商品规格";
    }

    initialzed = true;
  }

  ProductDetailEntity prototype(ProductDetailEntity proto) {
    id = proto.id;
    name = proto.name;
    type = proto.type;
    price = proto.price;
    marketPrice = proto.marketPrice;
    promotionPrice = proto.promotionPrice;
    description = proto.description;
    unit = proto.unit;
    stock = proto.stock;
    maxPurchase = proto.maxPurchase;
    minPurchase = proto.minPurchase;
    saleCount = proto.saleCount;
    isFixedHeight = proto.isFixedHeight;
    isFixedHeight = proto.isFixedHeight;
    isFixedWidth = proto.isFixedWidth;
    isCustomSize = proto.isCustomSize;
    like = proto.like;

    ///后台数据以cm为单位
    doorWidth = proto.doorWidth;
    flowerSize = proto.flowerSize;

    hasFlower = proto.hasFlower;

    specs = proto.specs;
    skus = proto.skus;
    detailImages = proto.detailImages;
    materialSet = proto.materialSet;
    images = proto.images;

    skuId = proto.skuId;

    thresholdHeight = proto.thresholdHeight;

    specTip = proto.specTip;

    initialzed = proto.initialzed;
    count = proto.count;
    attribute = proto.attribute;
    return proto;
  }

  BaseProductType get productType => getProductType(type);

  String get currentSpecName {
    if (specs.isEmpty) return "";
    String name = specs.map((e) => e.selected?.name).join(" ");
    return name;
  }

  ProductSkuEntity? get currentSku {
    if (skus.isEmpty) return null;
    for (int i = 0; i < skus.length; i++) {
      ProductSkuEntity item = skus[i];
      if (currentSpecName == item.name) return item;
    }
    return null;
  }

  ProductAdaptorEntity adapt(
      {List<CurtainAttributeKeyValuePairEntity>? attributes}) {
    return ProductAdaptorEntity.fromProductWithAttribute(this, attributes);
  }
}

extension ProductDetailEntityKit on ProductDetailEntity {
  void saveMeasureId(int id) {
    measureId = id;
    args = {
      "wc_attr": jsonEncode({
        "craft_id": [attribute.matchingSet.craft.selectedOption?.id ?? 0],
        "gauze_id": [attribute.matchingSet.gauze.selectedOption?.id ?? 0],
        "parts_id": [
          attribute.matchingSet.sectionalbar.selectedOption?.id ?? 0
        ],
        "curtain_id": [attribute.matchingSet.valance.selectedOption?.id ?? 0],
        "lining_id": [attribute.matchingSet.riboux.selectedOption?.id ?? 0],
      })
    };
    specTip =
        "【${attribute.measureData.room.selectedOption?.name}】【${attribute.measureData.facade.value}】【${attribute.measureData.installMode.selectedOption?.name ?? ''}】【${attribute.measureData.openModeDescription}】【宽: ${attribute.measureData.size.widthM}m 高 ${attribute.measureData.size.heightM}m 离地距离: ${attribute.measureData.groundClearance.value}cm】";
  }
}
