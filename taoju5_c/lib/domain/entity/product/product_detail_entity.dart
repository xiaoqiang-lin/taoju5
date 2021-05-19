/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 14:11:33
 * @LastEditTime: 2021-05-12 15:40:49
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_sku_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_spec_entity.dart';

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

  ///高度阈值
  late double thresholdHeight;

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

    skuId = json["sku_id"];

    thresholdHeight = JsonKit.asDouble(json["super_height"]);
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
}
