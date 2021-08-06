/*
 * @Description:  场景商品
 * @Author: iamsmiling
 * @Date: 2021-07-22 10:09:36
 * @LastEditTime: 2021-08-05 09:51:28
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

class SceneProductEntity {
  late int id;
  late String name;
  late double price;
  late double marketPrice;
  late String material;
  late String unit;
  late int typeCode;
  late bool isFixedHeight; // 窗帘是否定高
  late bool isFixedWidth; //窗帘是否定宽
  late bool isCustomSize; //自定义宽高

  late double doorWidth; //门幅
  late double flowerSize; //花距
  late bool hasFlower; // 窗帘是否有拼花
  late double thresholdHeight;

  ///高度限制

  late bool selected = true;

  late String image;

  late int skuId;
  late String skuName;

  late double width;
  late double height;
  late double length;

  late double subtotal;

  late int count;

  late String description;
  late int measureId = -1;

  late List<CurtainAttributeKeyValuePairEntity> pairs;

  late CurtainMeasureDataAttributeEntity measureData;

  late Map wcAttr;
  late int craftId;

  BaseProductType get productType => getProductType(typeCode);

  SceneProductEntity reAssign(SceneProductEntity p) {
    image = p.image;
    description = p.description;
    name = p.name;
    price = p.price;
    subtotal = p.subtotal;
    count = p.count;
    pairs = p.pairs;
    measureData = p.measureData;
    wcAttr = p.wcAttr;
    skuId = p.skuId;
    skuName = p.skuName;
    craftId = p.craftId;
    return this;
  }

  SceneProductEntity.fromJson(Map json) {
    id = json["goods_id"];
    name = json["goods_name"];
    price = JsonKit.asDouble(json["price"]);
    marketPrice = JsonKit.asDouble(json["market_price"]);
    material = json["material_name"];
    unit = json["goods_unit"];
    typeCode = json["goods_type"];
    isFixedHeight = JsonKit.asBool(json["fixed_height"]);
    isFixedHeight = json['fixed_height'] == 1;
    isFixedWidth = json['fixed_height'] == 2;
    isCustomSize = json['fixed_height'] == 3;

    ///后台数据以cm为单位
    doorWidth = JsonKit.asDouble(json['larghezza_size']);
    flowerSize = JsonKit.asDouble(json['flower_distance']);

    hasFlower = json['is_flower'] == 1;

    image = JsonKit.asWebUrl(json["image"]);

    skuId = json["sku_id"];

    skuName = json["sku_name"];

    width = JsonKit.asDouble(json["width"]);

    height = JsonKit.asDouble(json["height"]);

    count = JsonKit.asInt(json["num"]);

    subtotal = JsonKit.asDouble(json["subtotal_money"]);

    description = json["goods_attr_str"];

    pairs = JsonKit.asList(json["goods_accessory"])
        .map((e) => CurtainAttributeKeyValuePairEntity.fromJson(e))
        .toList();

    measureData = CurtainMeasureDataAttributeEntity.fromSceneProductJson(json);

    craftId = JsonKit.asInt(json["craft_id"] ?? json["process_method"]);

    wcAttr = JsonKit.asMap(json["wc_attr"]);

    length = JsonKit.asDouble(json["length"]);

    thresholdHeight = JsonKit.asDouble(json["super_height"]);
  }

  double get totalPrice => subtotal * count;

  Map get params {
    return {
      "craft_id": craftId,
      "wc_attr": {...wcAttr},
      "length": length,
      "estimated_price": totalPrice,
      "num": count,
      "process_method": craftId,
      "sku_id": skuId,
      "measure_data": {...measureData.params},
    };
  }

  ProductAdaptorEntity adapt() {
    return ProductAdaptorEntity.fromSceneProduct(this);
  }
}
