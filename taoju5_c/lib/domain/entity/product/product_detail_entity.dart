/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 14:11:33
 * @LastEditTime: 2021-06-08 17:41:59
 */
// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_sku_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';

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
class FabricScreenProductType extends CustomProductType {}

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

class ProductDetailEntity {
  late int id;
  late String name;
  late int type;
  late double marketPrice;
  late double promotionPrice;
  late double price;
  late String description;
  late String unit;
  late int stock;
  late int maxPurchase;
  late int minPurchase;
  late String saleCount;

  late bool isFixedHeight; // 窗帘是否定高
  late bool isFixedWidth; //窗帘是否定宽
  late bool isCustomSize; //自定义宽高

  late double doorWidth; //门幅
  late double flowerSize; //花距
  late bool hasFlower; // 窗帘是否有拼花
  late List<PictureEntity> images;

  late int count = 1;

  late List<String>? detailImages;

  late int skuId;

  ///sku
  late List<ProductSkuEntity> skus;

  late List<ProductSpecEntity> specs;

  double get doorWidthM => doorWidth / 100;

  double get flowerSizeM => flowerSize / 100;

  double? length;

  double? width;

  double? height;

  ///高度阈值
  late double thresholdHeight;

  late bool like;

  String attributeDesc = "";

  ///规格信息
  String specTip = "去填写";

  int measureId = -1;

  ///型材id
  int craftId = -1;

  Map args = {};

  ProductDetailEntity();

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
    isFixedHeight = JsonKit.asBool(json["fixed_height"]);
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
    // detailImages = JsonKit.asList(JsonKit.asWebUrl(json["new_description"]))
    //     .toList()
    //     .cast<String>();
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
      if (currentSpecName == item.name || skuId == item.id) return item;
    }
    return null;
  }

  double get totalPrice {
    if (currentSku == null) return 0;
    return (currentSku?.price ?? 0) * count;
  }

  ProductAdaptorEntity adapt(
      List<CurtainAttributeKeyValuePairEntity> attributes) {
    return ProductAdaptorEntity.fromProductWithAttribute(this, attributes);
  }
}
