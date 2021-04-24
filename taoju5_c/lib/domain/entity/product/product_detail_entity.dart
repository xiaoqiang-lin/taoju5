/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 14:11:33
 * @LastEditTime: 2021-04-23 17:09:33
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';

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
  late bool isFixedHeight;
  late List<PictureEntity> images;

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
    images = JsonKit.asList(json["goods_img_list"])
        .map((e) => PictureEntity.fromJson(e))
        .toList();
  }

  BaseProductType get productType => getProductType(type);
}
