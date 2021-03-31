/*
 * @Description: 软装方案,场景推荐 设计类商品数据模型
 * @Author: iamsmiling
 * @Date: 2021-01-09 19:05:08
 * @LastEditTime: 2021-01-26 10:16:07
 */

import 'package:taoju5/utils/json_kit.dart';

import 'product_mixin_model.dart';
import 'package:get/get.dart';

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
  int productId;
  List<ProductMixinModel> productList;

  DesignProductModel.fromJson(Map json) {
    id = json["scenes_id"];
    productId = json["goods_id"];
    name = json["scenes_name"];
    tag = json["name"];

    defaultWidth = json["default_width"] ?? "350";
    defaultHeight = json["default_height"] ?? "265";
    width = json["width"] ?? defaultWidth;
    height = json["height"] ?? defaultHeight;
    style = json["style"];
    room = json["space"];
    image = JsonKit.asWebUrl(json["image"]);
    productList = JsonKit.asList(json["goods_list"])
        .map((e) => ProductMixinModel.fromJson(e))
        .cast<ProductMixinModel>()
        .toList();
  }
}

extension DesignProductModelKit on DesignProductModel {
  double get totalPrice {
    if (GetUtils.isNullOrBlank(productList)) {
      return 0.0;
    }
    return productList.map((e) => e.price).reduce((a, b) => a + b);
  }

  double get marketPrice {
    if (GetUtils.isNullOrBlank(productList)) {
      return 0.0;
    }
    return productList.map((e) => e.marketPrice).reduce((a, b) => a + b);
  }

  String get fullName {
    if (GetUtils.isNullOrBlank(productList)) {
      return "";
    }
    return productList.map((e) => e.name).reduce((a, b) => "$a+" + b);
  }
}
