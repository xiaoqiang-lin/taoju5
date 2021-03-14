/*
 * @Description: 软装方案,场景推荐 设计类商品数据模型
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:05:08
 * @LastEditTime: 2021-01-26 10:16:07
 */

import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/utils/json_kit.dart';

class DesignProductModel {
  int id;
  String name;
  String image;

  String width;

  String height;

  String tag;
  String room;
  String style;
  String defaultWidth;
  String defaultHeight;
  List<ProductModel> productList;

  DesignProductModel.fromJson(Map json) {
    id = json["scenes_id"];
    name = json["scenes_name"];
    tag = json["name"];

    defaultWidth = json["default_width"] ?? "3.5";
    defaultHeight = json["default_height"] ?? "2.65";
    width = json["width"] ?? defaultWidth;
    height = json["height"] ?? defaultHeight;
    image = JsonKit.asWebUrl(json["image"]);
    productList = JsonKit.asList(json["goods_list"])
        .map((e) => ProductModel.fromJson(e))
        .cast<ProductModel>()
        .toList();
  }
}

extension DesignProductModelKit on DesignProductModel {
  double get totalPrice =>
      productList.map((e) => e.price).reduce((a, b) => a + b);

  double get marketPrice =>
      productList.map((e) => e.marketPrice).reduce((a, b) => a + b);

  String get fullName =>
      productList.map((e) => e.name).reduce((a, b) => "$a+" + b);
}
