/*
 * @Description: 商品库存
 * @Author: iamsmiling
 * @Date: 2021-04-25 14:54:49
 * @LastEditTime: 2021-04-25 15:45:48
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';

class ProductSkuEntity {
  late int id;
  late String name;
  late double marketPrice;
  late double promotionPrice;
  late int stock;

  late PictureEntity picture;

  ProductSkuEntity.fromJson(Map json) {
    id = json["sku_id"];
    name = json["sku_name"];
    marketPrice = JsonKit.asDouble(json["market_price"]);
    promotionPrice = JsonKit.asDouble(json["promote_price"]);
    stock = json["stock"];
    picture = PictureEntity.fromJson(json["sku_img_main"]);
  }
}
