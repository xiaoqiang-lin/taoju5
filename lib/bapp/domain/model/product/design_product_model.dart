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

  String tag;
  String room;
  String style;
  List<ProductModel> productlist;

  DesignProductModel.fromJson(Map json) {
    id = json["scenes_id"];
    name = json["scenes_name"];
    tag = json["name"];

    image = JsonKit.asWebUrl(json["image"]);
    productlist = JsonKit.asList(json["goods_list"])
        .map((e) => ProductModel.fromJson(e))
        .cast<ProductModel>()
        .toList();
  }
}

extension DesignProductModelKit on DesignProductModel {
  double get totalPrice =>
      productlist.map((e) => e.price).reduce((a, b) => a + b);

  double get marketPrice =>
      productlist.map((e) => e.marketPrice).reduce((a, b) => a + b);

  String get fullName =>
      productlist.map((e) => e.name).reduce((a, b) => "$a+" + b);
}
