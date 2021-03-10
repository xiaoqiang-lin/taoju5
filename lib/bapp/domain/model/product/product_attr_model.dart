/*
 * @Description:商品属性
 * @Author: iamsmiling
 * @Date: 2020-12-31 14:25:23
 * @LastEditTime: 2021-01-04 13:27:02
 */

import 'package:taoju5/utils/json_kit.dart';

class ProductAttrAdapterModel {
  int type;
  String key;
  String value;
  double totalPrice;

  ProductAttrAdapterModel.fromJson(Map json) {
    type = json["type"];
    key = json["attr_category"];
    value = json["attr_name"];
    totalPrice = JsonKit.asDouble(json["sub_total"]);
  }
}
