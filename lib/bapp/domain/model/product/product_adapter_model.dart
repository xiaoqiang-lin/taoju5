/*
 * @Description: 预提交订单的商品
 * @Author: iamsmiling
 * @Date: 2020-12-30 17:17:51
 * @LastEditTime: 2021-01-16 19:28:34
 */

import 'product_attr_model.dart';
import 'product_type.dart';

class ProductAdapterModel {
  int id;
  String skuId;
  String room;
  String name;
  double unitPrcie;
  String description;
  String unit;
  double totalPrice;
  List<ProductAttrAdapterModel> attrList;
  String image;
  int type;
  String measureId;
  int count;
  String length;
  String cartId;
  String attribute;
  ProductAdapterModel();
  ProductAdapterModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    room = json["room"];
    unitPrcie = json["price"];
    description = json["description"];
    attrList = json["attr_list"];
    image = json["image"];
    totalPrice = json["total_price"];
    measureId = json["measure_id"];
    skuId = "${json["sku_id"]}";
    attribute = json["attribute"];
  }
}

extension ProductAdapterModelKit on ProductAdapterModel {
  BaseProductType get productType => getProductType(type);
}
